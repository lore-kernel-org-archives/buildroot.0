Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3E9CD6E4A
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 15:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C3B1851DC;
	Thu,  4 Jun 2026 15:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XHSv0KQnOY6H; Thu,  4 Jun 2026 15:54:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 523CD8519B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780588496;
	bh=2wLDgYx1QJIHzWwrC0He3G6uZDa8Mja6Qcn/YfN3Krs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=qaGCyqgFAvNXtp6MDmOCeeTmq0Plml8Xw7HUPbGOM2Oq6llWH6OL1xZCcSoPK/+e/
	 yVS25OiS88CB22wb3xqPw9y4yTLV/ip7I48ZWwcaTATICQ3i/xKiajsz/WKHxzFwXQ
	 fJqQYGA6zRogw0DH6BR47OGL35WBF2QSo0dRgePGd5FRj7fpcIcAtT4VP6hNORZ4iZ
	 nw2WsR7O89dDrIHa90YLTIGjdBdstz90lrWFE42o5R+YilhpiT410PQZRKZ5Z8NTI9
	 Btn2rocAuVV1g/GeWlv49znAz71ysuKP7Xmkhp74zc72+WWhL7IkgGkH9Z+z62BV+a
	 1U4bcAgSjvVew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 523CD8519B;
	Thu,  4 Jun 2026 15:54:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BA1F192
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 15:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 714846F6E0
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 15:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8VJAaxcUyUI for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 15:54:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 40E006F6CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40E006F6CE
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40E006F6CE
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 15:54:52 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrhQC-1x0wKk3Jpc-00bEFF; Thu, 04
 Jun 2026 17:54:50 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Thu,  4 Jun 2026 17:54:30 +0200
Message-ID: <20260604155431.886607-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:0aL8xClowqSgDlIZ6eoqS20h9Rm2eXXHDynTfuh1/HPDzmfquCM
 kS52MSdg2PyVRLa/kC7YGz6whlaoG+4ZHDFotq/r0dMXwGG+pOkzxLtrm4InDhDxTAjUP3S
 k5vJDe1+ImQ4n4KdI65HLF8wyAePHcKcydbmBRMTTtLYbed+bX8+z52S9CPt7pbH5w9g7ZG
 WeKs+DidDYnchtBjhw9Fg==
UI-OutboundReport: notjunk:1;M01:P0:RR2HBMRHEGo=;4BBhy6b1oJL1WG/dxIt9n1sGtaa
 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
 9te+kq6pFQRgC4ieB9ET2Q3EwEhM063rM37FDcW
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1780588491; x=1781193291; i=fiona.klute@gmx.de;
 bh=yFagiJ44Mob/JS+DjJvMD7lucbz2tpz8GkxjDdEywz8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=gt41QbnyK2rlXGyZoEDQsEnQXiRRJqJcMKt03Y51WlwnFyIfo0Kv4bPkFoqHpuN+
 jr9Ve8EhUxuC2EzfWKJOR79mGRdIvfKWUuqeJuOs2AMro48uAt+Lo+ajbFcWMmeki
 iZUbaT+vzjkmDcqzLZQUpTP+zmXBgmcAu+PU+07aitv2hVhy+EMsm3+bAWLD4zPs8
 OTcMBVWTjEOi5+3Qt+gLYJo5/HtI52LsTuzDpLUaPGHxa06YhHiYOI9b5zO+1kVGP
 bzZiyWSNVi0T2LVteggcDP14gus8DT+0qtWSSWUN9u0/0YSiREDZFmJBnbqyjh9mb
 cb7ZqKhNBj90fv5ruA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=gt41Qbny
Subject: [Buildroot] [PATCH next 1/2] package/iwd: install upstream main.conf
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Note this changes EnableNetworkConfiguration from true to false
according to the upstream default, users who want a standalone iwd
setup which handles DHCP will need to adjust the config. Adjusting
NameResolvingService according to selected packages is unlikely to
have unexpected effects, so keep that.

This makes iwd work as a drop-in replacement for wpa_supplicant with
NetworkManager.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Initially I considered setting EnableNetworkConfiguration the same way
as NameResolvingService, with ifeq ($(BR2_PACKAGE_NETWORK_MANAGER),y),
but I think that adds complexity for no real gain: It's unlikely
anyone wants to use iwd in standalone mode together with NM, but there
are enough other plausible scenarios where someone might want to use
iwd and let something else handle DHCP or whatever other IP & DNS
config.

So we can't reliably guess what users want (like for
NameResolvingService: if someone installs systemd-resolved, they
probably want to use it, likewise for openresolv), which means either
way *someone* will have to adjust their configs, and in that case
defaulting to the upstream config seems both the least confusing and
easiest to maintain, and as a bonus it includes comments explaining
the available options.

I still have the "ifeq ($(BR2_PACKAGE_NETWORK_MANAGER),y)" patch
variant, so if that's preferred I can send it.

 package/iwd/iwd.mk    | 4 ++--
 package/iwd/main.conf | 5 -----
 2 files changed, 2 insertions(+), 7 deletions(-)
 delete mode 100644 package/iwd/main.conf

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index caecb62d64..76cc00fd22 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -51,8 +51,8 @@ IWD_CONF_OPTS += --disable-monitor
 endif
 
 define IWD_INSTALL_CONFIG_FILE
-	$(INSTALL) -D -m 644 package/iwd/main.conf $(TARGET_DIR)/etc/iwd/main.conf
-	$(SED) 's,__RESOLV_SERVICE__,$(IWD_RESOLV_SERVICE),' $(TARGET_DIR)/etc/iwd/main.conf
+	$(INSTALL) -D -m 644 $(@D)/doc/main.conf $(TARGET_DIR)/etc/iwd/main.conf
+	$(SED) 's,#\?\(NameResolvingService\)=.*,\1=$(IWD_RESOLV_SERVICE),' $(TARGET_DIR)/etc/iwd/main.conf
 endef
 
 IWD_POST_INSTALL_TARGET_HOOKS += IWD_INSTALL_CONFIG_FILE
diff --git a/package/iwd/main.conf b/package/iwd/main.conf
deleted file mode 100644
index 22c1cd7339..0000000000
--- a/package/iwd/main.conf
+++ /dev/null
@@ -1,5 +0,0 @@
-# use built-in dhcp client
-[General]
-EnableNetworkConfiguration=true
-[Network]
-NameResolvingService=__RESOLV_SERVICE__
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
