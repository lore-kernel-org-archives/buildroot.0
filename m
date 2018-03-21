From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 21 Mar 2018 19:52:38 +0000
Subject: [Buildroot] [Bug 10846] error in compiling gnutls
In-Reply-To: <bug-10846-163@https.bugs.busybox.net/>
References: <bug-10846-163@https.bugs.busybox.net/>
Message-ID: <bug-10846-163-nfRe6lUl69@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10846

--- Comment #6 from Peter Seiderer <ps.report@gmx.net> ---
Yes, this config.log location was the real failure reason.

The hints to the solution are:

- checking how to run the C++ preprocessor... cpp
- configure:49488: result: cpp

Your toolchain is missing C++ support (and the gnutls packages is missing
the C++ dependency), the following buildroot config change fixed the
failure for me:

    $ diff -u .config.old .config
@@ -299,7 +300,7 @@
 BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
 BR2_GCC_VERSION="6.4.0"
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
-# BR2_TOOLCHAIN_BUILDROOT_CXX is not set
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
 # BR2_TOOLCHAIN_BUILDROOT_FORTRAN is not set
 # BR2_GCC_ENABLE_LTO is not set
 # BR2_GCC_ENABLE_OPENMP is not set

Regards,
Peter

-- 
You are receiving this mail because:
You are on the CC list for the bug.
