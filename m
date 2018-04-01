From: Charles Hardin <charles.hardin@storagecraft.com>
Date: Sun, 1 Apr 2018 23:05:11 +0000
Subject: [Buildroot] [PATCH 1/1] rust: make sure the cxx compiler is
 also set for the target
In-Reply-To: <1B48158D-B250-46BC-A4B8-7A2816D2573A@storagecraft.com>
References: <20180228173852.66069-1-charles.hardin@storagecraft.com>
 <20180402004857.7e7e46c1@windsurf>
 <F8479AD1-B731-4235-A6C6-A517165DD553@storagecraft.com>
 <20180402005738.1d603538@windsurf>
 <1B48158D-B250-46BC-A4B8-7A2816D2573A@storagecraft.com>
Message-ID: <7E1DAB3C-F973-4E41-8E6F-E603021DCFF9@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oh, I think I might remember the problem on TARGET - HOST, notice the core_avx2
is our target and our buildslaves don?t have avx2 and rust has some stage where it
built a local tool and it didn?t run on the buildslave because it used the cross compiler
again because it doesn?t distinguish the buildroot targets from generic targets.

The cxx thing is all that most people will care about getting in upstream.

On Apr 1, 2018, at 4:00 PM, Charles Hardin <charles.hardin at storagecraft.com<mailto:charles.hardin@storagecraft.com>> wrote:

Yeah - for ?upstream? drop the HOST - TARGET thing that is a problem for
us - I think?

The def config was basically this? but, it doesn?t show an error - i just read
the logs of the build.

BR2_x86_64=y
BR2_x86_core_avx2=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9=y
BR2_GCC_VERSION_7_X=y
BR2_GCC_ENABLE_LTO=y
BR2_GCC_ENABLE_LIBMUDFLAP=y
BR2_ENABLE_LOCALE_PURGE=y
BR2_LINUX_KERNEL=n
BR2_KERNEL_HEADERS_4_9=y
BR2_INIT_NONE=y
BR2_PACKAGE_HOST_GO=y
BR2_PACKAGE_HOST_RUST=y
BR2_PACKAGE_HOST_RUSTC=y
BR2_PACKAGE_HOST_CARGO=y

To basically just build a toolchain.

On Apr 1, 2018, at 3:57 PM, Thomas Petazzoni <thomas.petazzoni at bootlin.com<mailto:thomas.petazzoni@bootlin.com>> wrote:

Hello,

Thanks for the quick feedback!

On Sun, 1 Apr 2018 22:52:42 +0000, Charles Hardin wrote:
We have a problem where we build on a HOST with x86_64 and RUST
doesn?t realize the difference between the host tool chain and the buildroot
toolchain.

In the old days - we had to patch rust to make a ?x86_64-buildroot-linux-gnu?
target that would be recognized, but the latest patches removed that around
rust 1.9 or so.

This was literally just looking at the logs and seeing the ?cc? was the buildroot
cc and the the cxx was ?c++?, so it is just what we hacked together to get
things to work.

But - definitely need to set ?cxx? in some appropriate fashion for rust to get
compiled correctly.

Setting cxx looks definitely OK in your patch. It's the
RUSTC_HOST_NAME != RUSTC_TARGET_NAME that looks wrong.

Could you provide some specific examples (with defconfigs to reproduce)
for the two problems:

- Lack of cxx variable

- Case of RUSTC_HOST_NAME == RUSTC_TARGET_NAME

Thanks!

Thomas
--
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com<https://bootlin.com/>



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180401/f1e22795/attachment.html>
