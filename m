From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jan 2018 14:53:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: needs readline
In-Reply-To: <20180114053204.qzh6l3xgqywgcmyr@sapphire.tkos.co.il>
References: <20180113224532.2715-1-bernd.kuhls@t-online.de>
 <20180114053204.qzh6l3xgqywgcmyr@sapphire.tkos.co.il>
Message-ID: <20180114145324.2d13fdf6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 Jan 2018 07:32:04 +0200, Baruch Siach wrote:
> Hi Bernd,
> 
> On Sat, Jan 13, 2018 at 11:45:32PM +0100, Bernd Kuhls wrote:
> > Upstream commit
> > https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=bee3796113196da1b3f56da42fcae4d9bae6695e
> > 
> > moved code depending on readline from the client tool to the shared
> > library, readline is therefore not an optional dependency anymore.
> > 
> > Fixes
> > http://autobuild.buildroot.net/results/019/0197ee0036e129b736c1dc0e83722236fb656618/
> > 
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > ---
> >  package/bluez5_utils/Config.in       | 1 +
> >  package/bluez5_utils/bluez5_utils.mk | 3 +--
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
> > index 55831e9b61..bb0a2905c5 100644
> > --- a/package/bluez5_utils/Config.in
> > +++ b/package/bluez5_utils/Config.in
> > @@ -9,6 +9,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS
> >  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> >  	select BR2_PACKAGE_DBUS
> >  	select BR2_PACKAGE_LIBGLIB2
> > +	select BR2_PACKAGE_READLINE  
> 
> I don't think that this is the correct fix. The bluez README file says:
> 
>         --disable-client
> 
>                 Disable support for the command line client
> 
>                 By default the command line client is enabled and uses the
>                 readline library. For specific systems where BlueZ is
>                 configured by other means, the command line client can be
>                 disabled and the dependency on readline is removed.
> 
> So this does not look like a decision to make readline a mandatory dependency, 
> but a bug that needs to be fixed upstream.

I agree it would be nice to check with upstream. They seem to have
intentionally added shell.c to the shared library, and this file
clearly unconditionally uses readline.

Perhaps it's their README file that is now incorrect.

Bernd, could you check with the upstream developers what they say about
this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
