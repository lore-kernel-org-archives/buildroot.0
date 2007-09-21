From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 21 Sep 2007 17:33:40 +0200
Subject: [Buildroot] using PROJECTs with buildroot
In-Reply-To: <20070918171028.GB14096@aon.at>
References: <20070918163008.GA14096@aon.at> <20070918171028.GB14096@aon.at>
Message-ID: <20070921153339.GG5788@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'd like to ask how that project thing is supposed to be used and how it
could be fixed (assuming that i'm not doing something wrong, which could
easily be).

Suppose i want to create two images (or BSP's like some call those).

To keep things simple, let's assume that i'm using the same version of
binutils and gcc for all.


BR2_PROJECT=imageA: kernel 2.6.22.6 with LFS support on
BR2_PROJECT=imageB: kernel 2.6.22.1 without LFS

0) I 'rm -rf *_i386 binar*'
1) I configure and build imageA. So far so good.
2) I configure and build imageB. The resulting image looks like this:
$ tar -tvf binaries/imageB/rootfs.i386-20070919.tar | grep "2.6.22../$"
drwxr-xr-x root/root         0 2007-09-19 19:05 ./lib/modules/2.6.22.6/
$ egrep "(2_6_22|PROJECT)" .config
BR2_PROJECT="imageB"
BR2_KERNEL_HEADERS_2_6_22_1=y
# BR2_KERNEL_HEADERS_2_6_22 is not set

Not exactly what i'd have expected.
Perhaps i made a mistake? If so please explain how that would work
properly?



A more general question that i already raised is what the
project_build_arch dir is supposed to be good for. I didn't get an
answer on this question, i think.

I'm questioning it's usefulness because if done properly, nearly all
packages would have to be built there, leaving the "good old" build_arch
directory completely empty.

Your reasoning seems to be along the lines of:
"A package that is customized on a per project basis has to be built in
project_build_arch".

While this may be true, customization that qualifies for building in
project_build_arch dir includes these toggles:

1) LFS on/off
2a) locale on/off
2b) wchar on/off
3) IPv6 on/off

These alone would lead to the build_arch dir to be nearly empty, but
let's assume that it would still contain 25% of the packages since those
would be locale+wchar+IPv6+LFS agnostic, fine.

If you now take into account that there is a potential
4) TARGET_CFLAGS
then suddenly project_build_arch dir would be the exact same thing
build_arch was before, leaving build_arch empty (the exact same thing we
had before that project thing, just back then the project_dir was the
empty -- non-existing one -- and build_arch was populated).

It would be very kind if you would share your thoughts on these issues.

regards,
Bernhard
