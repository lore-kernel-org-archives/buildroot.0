From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 14 Sep 2020 19:18:17 +0300
Subject: [Buildroot] [PATCH 1/1] package/dhcp: specify host-gawk path
 for dhcp build environment
In-Reply-To: <20200913152504.4738cf0c@windsurf.home>
References: <20200623073918.3415-1-geomatsi@gmail.com>
 <20200912145843.05493b9c@windsurf.home>
 <20200912200114.GA763352@curiosity>
 <20200913152504.4738cf0c@windsurf.home>
Message-ID: <20200914161817.GA8847@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> Hello Sergey,
> 
> On Sat, 12 Sep 2020 23:01:14 +0300
> Sergey Matyukevich <geomatsi@gmail.com> wrote:
> 
> > But what were the files installed in your tests? Did you see dhcpd and
> > dhclient amount installed files in output/target ?
> 
> Yes, both dhcpd and dhclient are installed in output/target. I'm
> attaching to this e-mail the list of files that were installed when
> building with awk==mawk and awk==gawk.
> 
> > I still can reproduce the issue. The procedure is similar to yours. I
> > enable both client and server for isc-dhcp in the board config. Finally,
> > I do not have both dhcpd and dhclient in output/target if I do not have
> > gawk installed on my build server. Moreover, in this case the following
> > warnings appear in the end of dhcp build log:
> > 
> > bin/sh: line 19: gawk: command not found
> > 
> > Such warning are emitted by DHCP_INSTALL_SERVER and DHCP_INSTALL_CLIENT
> > commands from dhcp.mk. The same result can be reproduced manually:
> > 
> > $ make -C /home/matsi/devel/code/buildroot/buildroot-release/output/build/dhcp-4.4.1/server DESTDIR=/home/matsi/devel/code/buildroot/buildroot-release/output/target install-sbinPROGRAMS         
> > make: Entering directory '/home/matsi/devel/code/buildroot/buildroot-release/output/build/dhcp-4.4.1/server'
> >  /usr/bin/mkdir -p  '/home/matsi/devel/code/buildroot/buildroot-release/output/target/usr/sbin'
> > /bin/sh: line 19: gawk: command not found
> > make: Leaving directory '/home/matsi/devel/code/buildroot/buildroot-release/output/build/dhcp-4.4.1/server'
> > 
> > What exactly goes on can be figured out using '-n' make option.
> > Makefiles for isc-dhcp components use $(AWK) which is properly
> > detected by configure script. It can any of gawk, mawk, nawk, awk.
> > However in generated Makefiles that tool is used without specific 
> > path. As a result, *awk tool can be available in buildroot build
> > environment, but missing on the build server.
> 
> I've posted at https://paste.ack.tf/52f197 at raw the full build of my
> Buildroot configuration, which has just BR2_PACKAGE_DHCP=y + client +
> server. awk is really mawk:
> 
> checking for gawk... no
> checking for mawk... mawk
> 
> Both dhpcd and dhclient are installed:
> 
> $ find target/ -name 'dhcpd' -o -name 'dhclient'
> target/usr/sbin/dhcpd
> target/sbin/dhclient
> 
> I have this version of mawk installed:
> 
> ii  mawk                       1.3.3-17+b3                    amd64        a pattern scanning and text processing language

Let me clarify a possible root cause. IIUC, the problem occurs when
buildroot configuration and build host environment provide _different_
flavors of awk. For instance, mawk is available on host and  gawk is
available in buildroot output/host. In this case isc-dhcp configure
script detects gawk in output/host and generates Makefiles specifying
gawk without explicit path. Finally, during Buildroot installation
phase, those Makefiles are used to install dhcp binaries. They attempt
to use gawk without specific path, but host does not provide gawk.

Could you please take another look at your tests and check whether you
have different awk flavors in buildroot config and on build host ?
If yes, then my understanding is not correct. In this case I would
suggest to mark this patch as rejected for the time being.

Regards,
Sergey
