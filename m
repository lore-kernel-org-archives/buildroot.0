From: Michael D <me@md-5.net>
Date: Mon, 03 Mar 2014 20:48:47 +1100
Subject: [Buildroot] Addition of packages: libvirt & qemu (target)
Message-ID: <53144FFF.10702@md-5.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

First up, thanks for buildroot, its a really cool tool, and I've enjoyed 
using it thus far. After some discussion on IRC with y_morin, I'd like 
to put forward that the libvirt package is added, and that qemu is 
adapted to support being installed on the target as well. libvirt is a 
fairly standard autotools package, and shouldn't require much work, 
although I did notice ./configure checked for some host qemu binaries.

You can see Yann's work on libvirt and target-qemu here:
https://gitorious.org/buildroot/buildroot/source/e09cf6e8d412cfd6163358fc7f58c83f44cc0a38:package/libvirt
https://gitorious.org/buildroot/buildroot/source/14ac053363188981cf7fb78b589a9e27fb464483:package/qemu

and my inexperienced, hackjob work over here, updates the packages to 
their latest versions and removes unneeded depends:
https://github.com/md-5/Multiplicity/tree/master/package

libvirt requires the following depends to work:

host-pkgconf lvm2 libnl libxml2 yajl

In order for the configure script to detect yajl properly, it needs a 
(e)glibc toolchain. This is due to yajl requiring -lm, which is not 
linked into the test binary. A better solution than requiring (e)glibc 
would be to patch libvirt's ./configure to link in -lm for the yajl 
test. Yann's work on libvirt also depends on

libgcrypt and gnutls

which I assume add extra features. Ideally libvirt's depend section 
should be updated if these (and any other feature enhancing) packages 
are selected.

Building Qemu for the target on the other hand is quite a bit more 
complex due to the sheer number of configuration options available. In 
particular it depends on a x86 based toolchain with threads, and

host-pkgconf host-python libglib2 pixman

I'm reasonably sure Qemu can compile and run on other arches, however 
Yann has not included support for this. Ideally the final package in 
buildroot would only require these 4 libraries to build, additional 
depends and features should be added with their necessary options and 
installed if desired (util-linux, some sound libraries, and a lot of 
graphics libraries for jpg/png manipulation).

Anyway, enough of me talking, it would be great to see these two 
packages become properly integrated into buildroot, and I am hoping 
someone can manage it.

If it helps sweeten the deal, I'll be more than happy to donate some 
beer money to the successful contributors, or donate to the buildroot 
project. I'll also be more than happy to make sure these packages stay 
updated and working.

Thanks
Michael Dardis
