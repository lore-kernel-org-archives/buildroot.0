From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun,  5 Jul 2015 16:52:25 -0400
Subject: [Buildroot] [PATCH 1/1] ntp: drop uselss patch fixup which
	sometimes breaks rebuild
Message-ID: <1436129545-3540-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop sed line which no longer changes anything.  Worse, it bumps each
ntpd/*.c file's modification time, which sometimes triggers a strange
dependency path causing the makefile to attempt to run the ntpd keyword-gen
app, which fails, because it's been cross-compiled.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

The deleted sed line is the reason why the keyword-gen source dependency
was being unexpectedly triggered, which prompted my initial patch back
in July 2014, which Thomas P. did not really like as the real reason
for why the initial ntp rebuild works, but the second fails, was not
understood.  (See http://patchwork.ozlabs.org/patch/371305/).

While its true that this patch still does not explore why things sometimes
work differently in subsequent ntp rebuilds, the whole issue can be avoided
by not touching the source unnecessarily.

Interestingly, someone on one of the ntp mailing lists also encountered
this same issue.  (See http://lists.ntp.org/pipermail/questions/2009-October/024669.html)
It doesn't appear that anything came of it.  In fact, the fellow
who answered said that if you don't change the source file, then
the derived file delivered with the tarball should be up to date.

So lets not touch the source unless we have to, especially if we're
not even changing anything.
---
 package/ntp/ntp.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 5f05508..93cefa1 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -42,7 +42,6 @@ endif
 
 define NTP_PATCH_FIXUPS
 	$(SED) "s,^#if.*__GLIBC__.*_BSD_SOURCE.*$$,#if 0," $(@D)/ntpd/refclock_pcf.c
-	$(SED) '/[[:space:](]rindex[[:space:]]*(/s/[[:space:]]*rindex[[:space:]]*(/ strrchr(/g' $(@D)/ntpd/*.c
 endef
 
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTP_KEYGEN) += util/ntp-keygen
-- 
1.9.1
