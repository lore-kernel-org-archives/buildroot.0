Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E67FC4332F
	for <buildroot@archiver.kernel.org>; Thu, 10 Nov 2022 08:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C60240291;
	Thu, 10 Nov 2022 08:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C60240291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cyBOqTUfo-pZ; Thu, 10 Nov 2022 08:38:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7609D401C2;
	Thu, 10 Nov 2022 08:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7609D401C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35A141BF3C5
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 08:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E4F74019E
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 08:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E4F74019E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0teS91JLpCUK for <buildroot@lists.busybox.net>;
 Thu, 10 Nov 2022 08:38:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C83B40291
Received: from mailproxy05.manitu.net (mailproxy05.manitu.net [217.11.48.69])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C83B40291
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 08:38:06 +0000 (UTC)
Received: from [IPV6:2003:c4:d718:4800:13e4:5f80:9e24:9265]
 (p200300c4d718480013e45f809e249265.dip0.t-ipconnect.de
 [IPv6:2003:c4:d718:4800:13e4:5f80:9e24:9265])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: wg@grandegger.com)
 by mailproxy05.manitu.net (Postfix) with ESMTPSA id E2A621B6013F;
 Thu, 10 Nov 2022 09:38:01 +0100 (CET)
Message-ID: <3b6d0a97-f4d9-9f03-7d25-e769e27bb57c@grandegger.com>
Date: Thu, 10 Nov 2022 09:38:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: buildroot@buildroot.org
From: Wolfgang Grandegger <wg@grandegger.com>
Subject: [Buildroot] [PATCH v3] package/udisks: add config option to support
 mounting in /media
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Support mounting in /media instead of /run/media for compatibility
with the Filesystem Hierarchy Standard (FHS). This is also required
for backward compatibility with udisks1.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>

---
Changes since v1:
- explicitly disable the option if not selected

Changes since v2:
- fix typo in subject

  package/udisks/Config.in | 10 ++++++++++
  package/udisks/udisks.mk |  7 ++++++-
  2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 4804c0eba0..480d988857 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -49,3 +49,13 @@ comment "udisks needs a toolchain with dynamic library, locale, wchar, threads,
  
  comment "udisks can't be built with Optimize for fast"
  	depends on BR2_OPTIMIZE_FAST
+
+if BR2_PACKAGE_UDISKS
+
+config BR2_PACKAGE_UDISKS_FHS_MEDIA
+	bool "Mount devices in /media instead of /run/media"
+	help
+	  Support mounting in /media for compatibility with the
+	  Filesystem Hierarchy Standard (FHS)
+
+endif
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 2bf519a2cc..db5a76105f 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -28,7 +28,6 @@ UDISKS_CONF_OPTS = \
  	--disable-acl \
  	--disable-bcache \
  	--disable-btrfs \
-	--disable-fhs-media \
  	--disable-introspection \
  	--disable-iscsi \
  	--disable-lsm \
@@ -39,4 +38,10 @@ UDISKS_CONF_OPTS = \
  	--disable-vdo \
  	--disable-zram
  
+ifeq ($(BR2_PACKAGE_UDISKS_FHS_MEDIA),y)
+UDISKS_CONF_OPTS += --enable-fhs-media
+else
+UDISKS_CONF_OPTS += --disable-fhs-media
+endif
+
  $(eval $(autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
