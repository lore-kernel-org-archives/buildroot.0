From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Fri, 21 May 2021 00:11:06 +0300
Subject: [Buildroot] [PATCH v2 1/1] package/dhcp: add host-gawk to
 dependencies and build environment
In-Reply-To: <5ade5409-df01-2cde-7bfb-7767c04138f2@mind.be>
References: <20210214145404.2587820-1-geomatsi@gmail.com>
 <5ade5409-df01-2cde-7bfb-7767c04138f2@mind.be>
Message-ID: <YKbQauodJeCyvNih@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

> > DHCP package may silently fail to install binaries to the target image.
> > The problem occurs when buildroot configuration and build host provide
> > different flavors of awk. For instance, mawk on build host and gawk in
> > buildroot output/host. In this case isc-dhcp configure script detects
> > gawk in output/host and generates Makefiles specifying gawk without
> > absolute path. During Buildroot installation phase, those Makefiles
> > are used to install dhcp binaries. They attempt to use gawk without
> > absolute path. However build host does not have gawk.
> > 
> > To resolve the issue add host-gawk to the list of dhcp dependencies
> > and explicitely specify absolute path to host-gawk.
> > 
> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> 
>  Heiko recently posted a patch that does the same thing, and I applied that one
> because it only adds the dependency when the server is enabled (client doesn't
> need gawk).

I did some build tests in support/docker/Dockerfile image. It turns out
that the patch suggested by Heiko is not enough. It adds host-gawk to 
dependencies, but it does not set explicit path to this gawk in dhcp
configuration scripts. As a result, the same issue can be reproduced
immediately even with uclibc. The build test is as follows:
- use docker builder image described in support/docker/Dockerfile
  -- note that this image provides mawk flavor
- start from default qemu_x86_defconfig
- enable both isc-dhcp client and server

As a result, neighter dhclient nor dhcpd are installed into
output/target. Previously, before the applied patch, the issue could be
reproduced only with glibc which pulled host-gawk dependency. Besides,
unless I missed something in my tests, dhclient installation is also
impacted, so host-gawk should be added globally.

I will update my patch and send v3.

Regards,
Sergey
