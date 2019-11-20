From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 20 Nov 2019 14:34:41 -0600
Subject: [Buildroot] [External] Re: [next] package/rpcbind: add systemd
 dependency when cfg for systemd
In-Reply-To: <20191120211636.606fa121@windsurf.home>
References: <20191120150015.54771-1-matthew.weber@rockwellcollins.com>
 <20191120175923.1fe3f67a@windsurf.home>
 <CANQCQpYebv2PrZOtt9RjKuzvvXJ_Vf8T_xfx2ZwEuzweDPmsZA@mail.gmail.com>
 <20191120211636.606fa121@windsurf.home>
Message-ID: <CANQCQpYyO7QQupw38ij4dT1fCRFELnDH1m_=4xfr4VqhprOAVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Nov 20, 2019 at 2:16 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Wed, 20 Nov 2019 11:13:11 -0600
> Matthew Weber <matthew.weber@collins.com> wrote:
>
> > > The commit log is too short. Does it fix a build issue? Why does it
> > > need to have systemd built before? Is it using a library provided by
> > > systemd?
> >
> > When building using top level parallel build and the init system is
> > set to systemd, it is possible for the rpcbind package to build before
> > systemd.  This is an issue as rpcbind sets a library dependency
> > conditionally on systemd when "RPCBIND_CONF_OPTS +=
> > --with-systemdsystemunitdir=/usr/lib/systemd/system" is set.
>
> So, this is really a bug, and should be fixed in master, and not in
> next. Do you agree?

Good point, I setup the following build now to test.

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_SYSTEMD=y

$ make rpc-bind

checking pkg-config is at least version 0.9.0... yes
checking for SYSTEMD... no
checking for SYSTEMD... no
configure: error: libsystemd support requested but found
package/pkg-generic.mk:228: recipe for target
'/accts/mlweber1/tmp.BwI6Sa4k2G-buildroot/output/build/rpcbind-1.2.5/.stamp_configured'
failed
make[1]: *** [/accts/mlweber1/tmp.BwI6Sa4k2G-buildroot/output/build/rpcbind-1.2.5/.stamp_configured]
Error 1
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

Looks like it should go on master as  bugfix.

Regards,
Matt
