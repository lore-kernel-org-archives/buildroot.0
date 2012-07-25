From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 Jul 2012 13:40:41 +0000 (UTC)
Subject: [Buildroot] [Bug 4327] I use the i686-linux-gcc-4.6.1 compiled
 grub-0.97 does not work
In-Reply-To: <bug-4327-163@https.bugs.busybox.net/>
References: <bug-4327-163@https.bugs.busybox.net/>
Message-ID: <20120725134041.D346696E4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4327

--- Comment #5 from Jonathan Liu <net147@gmail.com> 2012-07-25 13:40:41 UTC ---
(In reply to comment #4)
> Could you test the patch applied on the Ubuntu package, as discussed at
> https://bugs.launchpad.net/ubuntu/+source/grub/+bug/837815 ?
> 
> Something like:
> 
> --- grub-0.97.orig/debian/patches/no-reorder-functions.diff
> +++ grub-0.97/debian/patches/no-reorder-functions.diff
> @@ -0,0 +1,27 @@
> +Index: b/configure.ac
> +===================================================================
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -113,6 +113,22 @@
> +     if test "x$no_stack_protector_flag" = xyes; then
> +       STAGE2_CFLAGS="$STAGE2_CFLAGS -fno-stack-protector"
> +     fi
> ++    # GCC >= 3.3 supports -fno-reorder-functions; this defends us against
> ++    # unlikely-to-be-executed functions being linked before _start with GCC
> ++    # >= 4.6.
> ++    AC_CACHE_CHECK([whether gcc has -fno-reorder-functions],
> ++           no_reorder_functions_flag, [
> ++      saved_CFLAGS=$CFLAGS
> ++      CFLAGS="-fno-reorder-functions"
> ++      AC_TRY_COMPILE(,
> ++             ,
> ++             no_reorder_functions_flag=yes,
> ++             no_reorder_functions_flag=no)
> ++      CFLAGS=$saved_CFLAGS
> ++    ])
> ++    if test "x$no_reorder_functions_flag" = xyes; then
> ++      STAGE2_CFLAGS="$STAGE2_CFLAGS -fno-reorder-functions"
> ++    fi
> +   fi
> + fi
> +

The patch does not work for me. Even after configure is regenerated,
STAGE2_CFLAGS is empty. However, the patch from
https://dev.openwrt.org/browser/trunk/package/grub/patches/030-add-stage2-ldscripts.patch
works for me.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
