Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD59C433FE
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29B08400CF;
	Mon,  6 Dec 2021 18:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hUGx_5rRaBdA; Mon,  6 Dec 2021 18:15:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 242A34017A;
	Mon,  6 Dec 2021 18:15:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 082DD1BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEB204048C
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U4xWpsT6BNlx for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFA6B4017A
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 462AB81468; Mon,  6 Dec 2021 18:07:37 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 18:02:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9185c6ba38430a017ed996c4180e141881ba570
X-Git-Newrev: 345087ee5137a1aa28f1d0f54e914b9cc186c3f8
X-Patchwork-Hint: ignore
Message-Id: <20211206180737.462AB81468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/smcroute: bump version to v2.5.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=345087ee5137a1aa28f1d0f54e914b9cc186c3f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop backported patch, included in new release
 - https://github.com/troglobit/smcroute/releases/tag/2.5.4

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-Avoid-trying-to-delete-inactive-VIFs.patch | 51 ----------------------
 package/smcroute/smcroute.hash                     |  3 +-
 package/smcroute/smcroute.mk                       |  2 +-
 3 files changed, 2 insertions(+), 54 deletions(-)

diff --git a/package/smcroute/0001-Avoid-trying-to-delete-inactive-VIFs.patch b/package/smcroute/0001-Avoid-trying-to-delete-inactive-VIFs.patch
deleted file mode 100644
index 07f49dffcf..0000000000
--- a/package/smcroute/0001-Avoid-trying-to-delete-inactive-VIFs.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 8ce1d117a31e35d97fb955b82edf13514267eaab Mon Sep 17 00:00:00 2001
-From: Joachim Wiberg <troglobit@gmail.com>
-Date: Tue, 28 Sep 2021 11:09:47 +0200
-Subject: [PATCH] Avoid trying to delete inactive VIFs
-Organization: Westermo Network Technologies AB
-
-When probing interfaces at startup, there's a check for IFF_MULTICAST,
-if this flag is not set we try to delete its corresponding VIF/MIF.
-This is for hanlding .conf reload scenarios where an interface has had
-its MULTICAST flag dropped.
-
-However, when starting up on Linux systems, the loopback interface has
-no MULTICAST flag set.  This leads to the following bogus warning:
-
-   Failed deleting VIF for iface lo: Resource temporarily unavailable
-
-This patch makes sure to check if we have a registered kernel VIF/MIF
-for an interface before attempting to delete it.
-
-Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
----
- src/mroute.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/mroute.c b/src/mroute.c
-index 291e9c4..6a80a47 100644
---- a/src/mroute.c
-+++ b/src/mroute.c
-@@ -298,6 +298,9 @@ static int mroute4_del_vif(struct iface *iface)
- 	if (iface->mrdisc)
- 		rc = mrdisc_deregister(iface->vif);
- 
-+	if (iface->vif == ALL_VIFS)
-+		return 0;
-+
- 	if (kern_vif_del(iface)) {
- 		switch (errno) {
- 		case ENOENT:
-@@ -910,6 +913,9 @@ static int mroute6_del_mif(struct iface *iface)
- {
- 	int rc = 0;
- 
-+	if (iface->mif == ALL_VIFS)
-+		return 0;
-+
- 	if (kern_mif_del(iface) && errno != ENOENT) {
- 		switch (errno) {
- 		case ENOENT:
--- 
-2.25.1
-
diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
index 26d55adf88..ddc38eddd2 100644
--- a/package/smcroute/smcroute.hash
+++ b/package/smcroute/smcroute.hash
@@ -1,6 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256	4342b95c99e410cab75e9ee80f20480e0170d8b07b8e31553ba1bec3e377fc56  smcroute-2.5.3.tar.gz
+sha256	96b890fd6fbf8553010f62beda991742f7b4e7e8aea3e75335fb6048b15869da  smcroute-2.5.4.tar.gz
 
 # Locally generated
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
-sha256  d260ea4b9d4b01317568850c3271e3923b546ea4ad57c899e79434f1cc8bcf0b  0001-Avoid-trying-to-delete-inactive-VIFs.patch
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 913647e7bf..81f540088a 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMCROUTE_VERSION = 2.5.3
+SMCROUTE_VERSION = 2.5.4
 SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
 SMCROUTE_LICENSE = GPL-2.0+
 SMCROUTE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
