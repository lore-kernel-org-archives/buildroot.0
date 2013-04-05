From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  5 Apr 2013 22:34:47 +0000 (UTC)
Subject: [Buildroot] [Bug 4327] I use the i686-linux-gcc-4.6.1 compiled
 grub-0.97 does not work
In-Reply-To: <bug-4327-163@https.bugs.busybox.net/>
References: <bug-4327-163@https.bugs.busybox.net/>
Message-ID: <20130405223448.04BFD8E03C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4327

--- Comment #6 from Aleksandar <aleksandar.zivkovic@gmail.com> 2013-04-05 22:35:31 UTC ---
(In reply to comment #4)
> Could you test the patch applied on the Ubuntu package, as discussed at
> https://bugs.launchpad.net/ubuntu/+source/grub/+bug/837815 ?

Ubuntu package approach works at my side but not in the way given in Comment 4.
Seems that configuration logic doesn't work or it is overriden with debian
patch. Now, I'm aware that my way is hardcoding and not final solution to
problem but at least it can be used until more systematic solution is added.
Patch given here is executed after debian patch is applied. Logic to determine
gcc version is missing in my approach. Also patch after debian patch is not in
Buildroot spirit. 

1) patch file: boot/grub/grub.500-gcc4_6_3.patch.after_debian_patch
diff -Naur a/configure b/configure
--- a/configure 2013-04-06 00:10:40.998698398 +0200
+++ b/configure 2013-04-06 00:26:40.610662350 +0200
@@ -3532,7 +3532,7 @@
     fi
   fi
 fi
-
+STAGE2_CFLAGS="$STAGE2_CFLAGS -fno-reorder-functions"



2) update of boot/grub/grub.mk
@@ -46,6 +46,7 @@
        (cd $(@D) ; for f in `cat debian/patches/00list | grep -v ^#` ; do \
                cat debian/patches/$$f | patch -g0 -p1 ; \
        done)
+       patch -d $(@D) -p1 <
boot/grub/grub.500-gcc4_6_3.patch.after_debian_patch
 endef

 GRUB_POST_PATCH_HOOKS += GRUB_DEBIAN_PATCHES

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
