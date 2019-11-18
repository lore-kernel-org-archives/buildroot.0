From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 18 Nov 2019 16:09:54 +0000
Subject: [Buildroot] [Bug 12321] host-generic-package: PKG_DL_OPTS not used
 for host package
In-Reply-To: <bug-12321-163@https.bugs.busybox.net/>
References: <bug-12321-163@https.bugs.busybox.net/>
Message-ID: <bug-12321-163-HqViwNO1VA@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12321

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks Matthias for your bug report, and good catch!

As you suggested, could you try applying a change like the below patch, and see
if it helps? If it does, it would be nice if you could submit the patch on the
Buildroot mailing list (if you don't want to do it, let us know, and we'll
handle that). Thanks!

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 7d6fa08418..7b3294a09a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -541,6 +541,12 @@ ifndef $(2)_SITE_METHOD
  endif
 endif

+ifndef $(2)_DL_OPTS
+ ifdef $(3)_DL_OPTS
+  $(2)_DL_OPTS = $$($(3)_DL_OPTS)
+ endif
+endif
+
 ifneq ($$(filter bzr cvs hg svn,$$($(2)_SITE_METHOD)),)
 BR_NO_CHECK_HASH_FOR += $$($(2)_SOURCE)
 endif

-- 
You are receiving this mail because:
You are on the CC list for the bug.
