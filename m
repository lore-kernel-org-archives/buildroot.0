From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 12 Sep 2020 23:01:14 +0300
Subject: [Buildroot] [PATCH 1/1] package/dhcp: specify host-gawk path
 for dhcp build environment
In-Reply-To: <20200912145843.05493b9c@windsurf.home>
References: <20200623073918.3415-1-geomatsi@gmail.com>
 <20200912145843.05493b9c@windsurf.home>
Message-ID: <20200912200114.GA763352@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas and all,

> Hello Sergey,
> 
> On Tue, 23 Jun 2020 10:39:18 +0300
> Sergey Matyukevich <geomatsi@gmail.com> wrote:
> 
> > DHCP package silently fails to install its binaries if gawk tool
> > is not installed on build server. This is still the case even
> > if host-gawk package is already available: dhcp Makefiles detect
> > its presence but still attempt to use gawk from host system.
> > 
> > Add host-gawk to the list of dependencies for dhcp and explicitely
> > specify host-gawk location.
> > 
> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> 
> Thanks for the patch. However, could you be more specific about what's
> missing on the target?
> 
> Indeed, I just did two builds of the DHCP package, will all sub-options
> enabled, one inside a Docker container that only has the "mawk"
> implementation of awk, and another on my machine, which as "gawk"
> installed as awk.
> 
> And in both cases, the set of files installed to target/ was exactly
> identical.
> 
> Could you provide more details ?

But what were the files installed in your tests? Did you see dhcpd and
dhclient amount installed files in output/target ?

I still can reproduce the issue. The procedure is similar to yours. I
enable both client and server for isc-dhcp in the board config. Finally,
I do not have both dhcpd and dhclient in output/target if I do not have
gawk installed on my build server. Moreover, in this case the following
warnings appear in the end of dhcp build log:

bin/sh: line 19: gawk: command not found

Such warning are emitted by DHCP_INSTALL_SERVER and DHCP_INSTALL_CLIENT
commands from dhcp.mk. The same result can be reproduced manually:

$ make -C /home/matsi/devel/code/buildroot/buildroot-release/output/build/dhcp-4.4.1/server DESTDIR=/home/matsi/devel/code/buildroot/buildroot-release/output/target install-sbinPROGRAMS         
make: Entering directory '/home/matsi/devel/code/buildroot/buildroot-release/output/build/dhcp-4.4.1/server'
 /usr/bin/mkdir -p  '/home/matsi/devel/code/buildroot/buildroot-release/output/target/usr/sbin'
/bin/sh: line 19: gawk: command not found
make: Leaving directory '/home/matsi/devel/code/buildroot/buildroot-release/output/build/dhcp-4.4.1/server'

What exactly goes on can be figured out using '-n' make option.
Makefiles for isc-dhcp components use $(AWK) which is properly
detected by configure script. It can any of gawk, mawk, nawk, awk.
However in generated Makefiles that tool is used without specific 
path. As a result, *awk tool can be available in buildroot build
environment, but missing on the build server.

Regards,
Sergey
