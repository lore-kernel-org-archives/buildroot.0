Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B12C4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 17:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EFA381551;
	Tue,  8 Nov 2022 17:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EFA381551
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YQXmYviybh48; Tue,  8 Nov 2022 17:22:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A07748149E;
	Tue,  8 Nov 2022 17:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A07748149E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 56E7C1BF84C
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 17:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3130B40A07
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 17:22:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3130B40A07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MpKGKpS5WqKy for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 17:22:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 387B840A0D
Received: from mailproxy08.manitu.net (mailproxy08.manitu.net [217.11.48.31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 387B840A0D
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 17:22:06 +0000 (UTC)
Received: from [IPV6:2001:a61:3540:8301:a8c6:cd8c:c16e:5e60] (unknown
 [IPv6:2001:a61:3540:8301:a8c6:cd8c:c16e:5e60])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: wg@grandegger.com)
 by mailproxy08.manitu.net (Postfix) with ESMTPSA id B31511B2005E;
 Tue,  8 Nov 2022 18:22:03 +0100 (CET)
Message-ID: <b1bafa9c-393e-b9aa-0a3e-0a3e67c5fd42@grandegger.com>
Date: Tue, 8 Nov 2022 18:22:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: buildroot@buildroot.org
From: Wolfgang Grandegger <wg@grandegger.com>
Subject: [Buildroot] [PATCH] package/udisks: add config option to support
 mounting in, /media
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
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Support mounting in /media instead of /run/media for compatibility
with the Filesystem Hierarchy Standard (FHS). This is also required
for backward compatibility with udisks1.
---
  package/udisks/Config.in | 10 ++++++++++
  package/udisks/udisks.mk |  4 ++++
  2 files changed, 14 insertions(+)

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
index 2bf519a2cc..91328effba 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -39,4 +39,8 @@ UDISKS_CONF_OPTS = \
  	--disable-vdo \
  	--disable-zram
  
+ifeq ($(BR2_PACKAGE_UDISKS_FHS_MEDIA),y)
+UDISKS_CONF_OPTS += --enable-fhs-media
+endif
+
  $(eval $(autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
