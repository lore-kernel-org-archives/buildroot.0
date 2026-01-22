Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380A1D6CFA6
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 22:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DB298316F;
	Thu, 22 Jan 2026 22:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZuV5tEHRxJCf; Thu, 22 Jan 2026 22:22:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4556083148
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769120547;
	bh=dJ3WDi9s+pqGuv1yNp4Cd5Q32ZVOXY7gkOb1ons7LHY=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eHXP2wztwg90zBHVJxqFNYk5xX2up5JTIV5MbZ0A33pqaRUNZPEg/SBvCPUpRnIBh
	 kRy59aiXnNXYjcGxwkn6JYN8tjWpuNsiMi7O/5/oogPi6/xp5E5LeW19bEeRuAOws+
	 1Ix+nFez0TG1DmmGBNBTPRCtr6eEW1oyhWNwCidEj7bo4UNp0AjE+aDcWjpMMdB7Sl
	 F7vTzwAW6QWfiii8xDkG2HgmilwsqS0Txr6jahBTH9Ug+AFdKxbnDdXrs541+zVEF2
	 CmUlLTPky9pEMJvb4Fhnvmf8O7vck3XTIWuzofLT9xUTWNmWjphnnRyXxSm8pugb50
	 lFSSiM9K1Zkzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4556083148;
	Thu, 22 Jan 2026 22:22:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5456A4DF
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 22:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37EEF4024D
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 22:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r8AGSq6bpCg6 for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 22:22:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 628534023C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 628534023C
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 628534023C
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 22:22:23 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0FB4431E0B24; Thu, 22 Jan 2026 23:22:19 +0100 (CET)
Date: Thu, 22 Jan 2026 23:22:19 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aXKjG3hQRwysfYz1@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1769120540; bh=f6fL4TtFKeG78HjB/rhaDv++tn5Ye/Ii4x4ibIssg9w=;
 h=Date:From:To:Subject:From;
 b=u8biz4B3oPXnLI1T2rs+3VTp9yAqZS/9fmjSUcJwnVLDa3BnJJ5xb9EkdyS+jXgHY
 ULYKqf4sI2B6SoO1Ra5IKosoG3OOiE1h7TQk3xH/hCP1HK85n7S5cr7BIymnqscbVu
 PH1lxn2rIAWyERINHLsgLOSupCJkRHsWdbiCw5QVQLNxcipdHZ+Pa7Hxw/kbKUE5Fu
 UpwaOlGw8X8dTCp6mKCcy1tRyZ4rKSTnJ3POUVmch2CdJZ5wgjhnMZIQKhmL51cEAy
 9ZKcOD4DAdBLJt7bkoiIcMm3jxA6S7tOOv2iuBrnf11WXJYcKRnwcuEVjPHc/vUfjF
 ibVWkvmlPFEyQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=u8biz4B3
Subject: [Buildroot] [PATCH] package/strongswan: bump to 6.0.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for Changes:
https://github.com/strongswan/strongswan/releases/tag/6.0.4

Enable minimal required kernel config options.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/strongswan/strongswan.hash |  6 +++---
 package/strongswan/strongswan.mk   | 13 ++++++++++++-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index f6b16fc8a2..7a6939b979 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,7 +1,7 @@
-# From http://download.strongswan.org/strongswan-5.9.14.tar.bz2.md5
-md5  21ca3fc7c18456405d03b77266ba630a  strongswan-5.9.14.tar.bz2
+# From http://download.strongswan.org/strongswan-6.0.4.tar.bz2.md5
+md5  f6b78a99e95179b6a65df218d75da7ca  strongswan-6.0.4.tar.bz2
 # Calculated based on the hash above
-sha256  728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678  strongswan-5.9.14.tar.bz2
+sha256  79576bb61b9a406cea9eb73d0c565cc6254a6b6d2e7198f44758d2d7c61a7aec  strongswan-6.0.4.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 9719242327..ef5a3fc42f 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.9.14
+STRONGSWAN_VERSION = 6.0.4
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
@@ -112,4 +112,15 @@ STRONGSWAN_CONF_OPTS += \
 	--disable-connmark \
 	--disable-forecast
 
+define STRONGSWAN_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETLINK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET_AH)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET_ESP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_XFRM)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_XFRM_USER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_XFRM_INTERFACE)
+endef
+
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
