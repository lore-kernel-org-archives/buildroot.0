Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B897BC433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 09:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 452E340158;
	Wed, 23 Nov 2022 09:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 452E340158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kf7UpMxAyRcc; Wed, 23 Nov 2022 09:57:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A65640BD8;
	Wed, 23 Nov 2022 09:57:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A65640BD8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E976D1BF853
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 09:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D16BB61194
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 09:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D16BB61194
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BRYDP9xXDA6d for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 09:56:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9285060A9B
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 09:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9285060A9B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 800148431A; Wed, 23 Nov 2022 09:56:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 10:50:48 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2ba9a3acdb19140d436999d888582224726877c7
X-Git-Newrev: fc961e4e1012fb453416f585028e33583ecf8ad1
X-Patchwork-Hint: ignore
Message-Id: <20221123095643.800148431A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/sysstat: security
 bump to version 12.6.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fc961e4e1012fb453416f585028e33583ecf8ad1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix CVE-2022-39377: sysstat is a set of system performance tools for the
Linux operating system. On 32 bit systems, in versions 9.1.16 and newer
but prior to 12.7.1, allocate_structures contains a size_t overflow in
sa_common.c. The allocate_structures function insufficiently checks
bounds before arithmetic multiplication, allowing for an overflow in the
size allocated for the buffer representing system activities. This issue
may lead to Remote Code Execution (RCE).

Despite what is written above in the CVE announcement, and as written in
the Changelog, the fix is also included in version 12.6.1 (12.7.1 is a
development version):
    https://github.com/sysstat/sysstat/commit/c1e631eddc50c04e4dcea169ba396bee2bd6b0ab

As a consequence, 12.6.1 is still reported as being affected. Until the
NVD is updated appropriately, we mark the CVE as ignored with a comment
that explains why.

Note: that commit is not reachable from any branch in the sysstat
repository, and Github warns about that, but the commit does belong to
the upstream repository and is reachable from the 12.6.1 tag (it looks
like sysstat only pushes tags-with-history for fix releases).

https://github.com/sysstat/sysstat/security/advisories/GHSA-q8r6-g56f-9w7x
https://github.com/sysstat/sysstat/blob/v12.6.1/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr:
  - ignore the CVE, explain why
  - explain why github warns about the fix commit
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e4ef408e8f738575841c5ffc43504be4c3f6fa56)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysstat/sysstat.hash | 4 ++--
 package/sysstat/sysstat.mk   | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
index b573f312c6..b47f000e57 100644
--- a/package/sysstat/sysstat.hash
+++ b/package/sysstat/sysstat.hash
@@ -1,5 +1,5 @@
 # From: http://sebastien.godard.pagesperso-orange.fr/download.html
-sha1  1e38bc029979def730ae1fb1e39f631bd1a3bc73  sysstat-12.4.2.tar.xz
+sha1  a730982e0c2d4964a0022c1509f3ea0a345402bc  sysstat-12.6.1.tar.xz
 # Locally calculated
-sha256  3701b2c1883d50eb384d7b95ce5b6df0a71fdcb3c23f96cb58098d1bcffa018f  sysstat-12.4.2.tar.xz
+sha256  18ff5a4e149e2568e43385637f72437fe6bafcc1322a93d13d1981e9464a0342  sysstat-12.6.1.tar.xz
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  COPYING
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 6948f6b390..eaf505dc49 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 12.4.2
+SYSSTAT_VERSION = 12.6.1
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPTS = --disable-file-attr
@@ -14,6 +14,9 @@ SYSSTAT_LICENSE_FILES = COPYING
 SYSSTAT_CPE_ID_VENDOR = sysstat_project
 SYSSTAT_SELINUX_MODULES = sysstat
 
+# NVD is not up-to-date; 12.6.1 includes c1e631eddc50, which fixes the issue
+SYSSTAT_IGNORE_CVES += CVE-2022-39377
+
 ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
 SYSSTAT_DEPENDENCIES += lm-sensors
 SYSSTAT_CONF_OPTS += --enable-sensors
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
