From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 16:53:32 +0200
Subject: [Buildroot] [PATCH 0/3] toolchain: Add support for Sourcery
 Codebench Standard
In-Reply-To: <1405277160-4686-1-git-send-email-romain.naour@openwide.fr>
References: <1405277160-4686-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141012165332.07ee1277@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 13 Jul 2014 20:45:57 +0200, Romain Naour wrote:

> The purpose of this series is to provide support for Sourcery Codebench
> Standard (licenced) edition in Buildroot.
> 
> Since these toolchain can't be downloaded, we need to use the custom toolchain
> backend to import them into Buildroot.

Thanks for this patch series. As we discussed today during the meeting,
the currently proposed implementation is a bit fragile because:

 * SYSROOT_DIR is empty/invalid in your situation, while most of the
   code assumes SYSROOT_DIR exists. While your patches make sure every
   time SYSROOT_DIR is used, we fallback to ARCH_SYSROOT_DIR if
   SYSROOT_DIR doesn't exist, this may break in the future, especially
   as we don't have access to this proprietary Sourcery Codebench
   toolchain to test and check that future changes will keep this
   toolchain working.

 * the dance with faking a SYSROOT_DIR being different from
   ARCH_SYSROOT_DIR by one path component is really highly specific to
   this toolchain, and will not work in other situations.

Consequently, the proposal is to:

 * Change the SYSROOT_DIR/ARCH_SYSROOT_DIR detection logic so that if
   SYSROOT_DIR is empty/bogus, then the same value as ARCH_SYSROOT_DIR
   is used. This ensures that both SYSROOT_DIR and ARCH_SYSROOT_DIR
   point to valid directories (which would the same in the case of this
   toolchain, which brings us back to the non-multilib toolchain case).

 * Adjust the symlink logic to handle a new case: when SYSROOT_DIR ==
   ARCH_SYSROOT_DIR, look again at the real sysroot directory, and if
   it's bogus, then it means we in fact have a multilib toolchain that
   may need a symbolic link. If that's the case, then using
   -print-sysroot with no flags, -print-sysroot with flags, and
   computing the common part of both paths, we get the "base sysroot".

Thinking about it, we might also think of using the strategy described
above to find the "base sysroot" and use this value in SYSROOT_DIR, no?

In the mean time, I'll mark the three patches as Changes Requested in
patchwork.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
