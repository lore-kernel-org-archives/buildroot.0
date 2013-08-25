From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Aug 2013 11:11:44 +0200
Subject: [Buildroot] [PATCH] eglibc: defaults to SSP
In-Reply-To: <5217BDD2.1020806@zacarias.com.ar>
References: <1374935524-5259-1-git-send-email-gustavo@zacarias.com.ar>
 <20130823210931.4f2323fc@skate> <5217BDD2.1020806@zacarias.com.ar>
Message-ID: <20130825111144.052f703c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 23 Aug 2013 16:53:54 -0300, Gustavo Zacarias wrote:

> This patch was never applied since it's wrong (hence i ditched it from
> patchwork).
> We need to build with -fstack-protector-all even for eglibc.
> Eglibc (at least the version we ship for internal toolchain) defaults to
> support/build stack protection support on so the option is valid.
> We don't have glibc support (yet - pending on your patches) but AFAIK
> for modern-ish versions of glibc that's also the case.
> For external toolchains, well, there's varying support i take it
> depeding on toolchain component versions.
> libssp wouldn't normally be necessary for modern toolchains except for
> MAYBE compatibility reasons which i don't think we should care about
> (old blobby apps linked against libssp) or if the toolchain has old
> components so libssp shouldn't necessarily be copied, at least not as a
> default.
> Doing the nasty trick with sourcery 2013.05 ARM (qemu_arm_versatile)
> with BR2_TARGET_OPTIMIZATION="-fstack-protector-all" works fine for
> example without the need for tweaks.

Ok, so if we try to summarize this:

 * The option to enable SSP should be in "Build options" and not in the
   "Toolchain" menu, because what it mainly does is adjust the
   CFLAGS/CXXFLAGS for all packages.

 * In the case of the internal toolchain backend, it would make sure
   that the SSP support in the C library in enabled. I.e, nothing for
   eglibc/glibc, and enable SSP for uClibc.

 * In the case of the external toolchain backend, we would need to have
   an option like "Toolchain supports SSP?" that the user must fill in.
   But this would mean the "Use SSP" option in "Build options" would
   have to depend on the "Toolchain supports SSP?" option.

Something like that?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
