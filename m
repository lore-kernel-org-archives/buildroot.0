Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA0AC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 21:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDA7181400;
	Sat,  1 Jan 2022 21:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vsw4p8LI1I5o; Sat,  1 Jan 2022 21:10:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EC9C813F4;
	Sat,  1 Jan 2022 21:09:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BC981BF376
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 21:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AAF340207
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 21:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8xUcf-2HrdKs for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 21:09:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD43140200
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 21:09:55 +0000 (UTC)
Received: from localhost.localdomain ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 3ldRnw8Weq3qK3ldRnX73K; Sat, 01 Jan 2022 22:09:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1641071393; bh=LoY4qRi5Tgpj1OGLLIl4zCYe+D5PGqNHtLulqJxUTLU=;
 h=From:To:Subject:Date:MIME-Version;
 b=eojBsOtuJ/WXzjCqJpib+XOE4RNZKDY7FXKKKrByQh9VSFHiOYRTRqY4OqTVV1F3x
 XTuh6EEyu1Bc7kc5xXmF4XwEppxmV43GvC0r0G9PM1a8nhUobJygQhsnTQ2lSeIbkV
 oRtRgTxe6KAjAzIvaBcqb3woI3fHTW4tDvQvL3fyrwccCzXOpaSUM38F85U1FfI1rr
 /BtCzROvjzMFFJtE6etjfdPyx6AL4h1xb2z+breOiG93XEeC1hu9ToeuyMXOSzTsur
 LFU43wDV3s0TE0aEyXccfIfAkbjJbKdL/YQ+QkcmtKqKYgRFMZNCgdMdg374NnwUjf
 BnCFkzNvgBy4w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 22:09:52 +0100
Message-Id: <20220101210952.2148256-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKjkF7ca8zgnwAefgSg1gbYssC4gMlGN9l0s+H2oVIJAnB0V4stLStn4/jQSuMzWtA9la1Y4DUjRVZnkdZYXfFgHIDi5NfcSrn31Zhl3RmolBr2Z4rEb
 BbmNojl1kTnEyaYEym30J+VCcpHAavg76yDUW5+8APwnGav8ZwhWE5Rz7+KQvh5MzAdLnxVOZvb7LtA5R0vhun4NWX+2q7QNLnebGhXq9imWpd7CdQgrOjiq
 LwEU3yFC9WZINP4QzB+vkplpY5d8KkWXj2HvWOenumaJKcsVCx7GMX/guC17FepX6zKbsZK8iG2KcUdxgz/bsMbCv+cExbkmxA8JtRsUomM=
Subject: [Buildroot] [PATCH] package/libnss: fix build failure with make
 version 4.3
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Make 4.3 is buggy and when parallel building host-libnss/libnss we end up
with a failure thrown by make itself. So let's work-around this by don't
parallel build the package if Make version is 4.3.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.mk | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index e2f7521b47..b6279fa921 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -15,6 +15,13 @@ LIBNSS_LICENSE_FILES = nss/COPYING
 LIBNSS_CPE_ID_VENDOR = mozilla
 LIBNSS_CPE_ID_PRODUCT = nss
 
+# Don't parallel build if make version = 4.3
+ifneq ($(filter $(RUNNING_MAKE_VERSION),4.3),)
+LIBNSS_MAKE = $(MAKE1)
+else
+LIBNSS_MAKE = $(MAKE)
+endif
+
 LIBNSS_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85862),y)
@@ -71,12 +78,12 @@ endif
 endif
 
 define LIBNSS_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss coreconf \
+	$(TARGET_CONFIGURE_OPTS) $(LIBNSS_MAKE) -C $(@D)/nss coreconf \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
 		$(LIBNSS_BUILD_VARS)
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss lib/dbm all \
+	$(TARGET_CONFIGURE_OPTS) $(LIBNSS_MAKE) -C $(@D)/nss lib/dbm all \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
@@ -131,12 +138,12 @@ HOST_LIBNSS_BUILD_VARS += USE_64=1
 endif
 
 define HOST_LIBNSS_BUILD_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss coreconf \
+	$(HOST_CONFIGURE_OPTS) $(LIBNSS_MAKE) -C $(@D)/nss coreconf \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
 		$(HOST_LIBNSS_BUILD_VARS)
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss lib/dbm all \
+	$(HOST_CONFIGURE_OPTS) $(LIBNSS_MAKE) -C $(@D)/nss lib/dbm all \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
