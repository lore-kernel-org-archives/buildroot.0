Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882F9D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 21:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AF1B81CC3;
	Sun,  7 Dec 2025 21:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kzx3KePCn8Np; Sun,  7 Dec 2025 21:49:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71EC981CDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765144154;
	bh=uSOiIjbVkCu/f7yikuZU7G9QWXvXlq3uzWTkE/BMaws=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=j13jiPQxlLBPf1sPcv7uIeyLIUaVAgIy6KPXHiY1stnaaRq5st+LhGxLd9k68Ctsl
	 gF+i5ZziWkEEEh8fwwxB0q3+7ZZ0HU8DCAaHwq2gyEvwp76Gfyj1hG/rAD9mguLTUg
	 HPsooplbPFNxISoc1WlGzDGyEOhGNfDx8cQWr1cow1uf5PQbIGLVsnljwInMavrARO
	 W4wD4CKlG1/I2w6OsdSPY+lOYuBDYpAlTpzybwd5cw9K1j/6V/UZuaN3I1fn3Di3G0
	 C2R1yXfDaPw7qz1IivBBEv+6pM654QyUJqGgJKPlrpJMyVkfA8Tq5OhY0ec7jL4OUY
	 Emwxl7VjKx+UA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71EC981CDC;
	Sun,  7 Dec 2025 21:49:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 59965E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48AEB4059F
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:49:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B3Rb88-Gy0iq for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 21:49:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9670840514
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9670840514
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9670840514
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:49:09 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.102.30]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKKUv-1vlGvM2DTb-00RFmt; Sun, 07
 Dec 2025 22:49:07 +0100
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Sun,  7 Dec 2025 22:48:47 +0100
Message-ID: <20251207214849.757334-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:6Jd32VpNY0bAVMcrdlP/eNoEOJj0lboO9ZSbZo+TcU5J3Gg9n7x
 uOJW8rVGkJHCJ/a07RbcsVLGOXyHaWy/fWVL+1zEd3NDw491GS+FoK7930W+bGKWQhq/0oA
 q+0UY/2FPv4n4vDepQe0p0uO/KGZkVaVFkNO9pYa90JhranhU5d9SgDZ6HzjoUjI34w9eIL
 o/oN+h9v4gTG5bGAeOtzw==
UI-OutboundReport: notjunk:1;M01:P0:jXEcKIH3irw=;BVoV+W6AHuxwPS+E3a8Sy0poCh1
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1765144147; x=1765748947; i=fiona.klute@gmx.de;
 bh=J71SMF3jLNVekiEGEu1WUEPINWE+so6gqWUKXqBgPV8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=cEomjnYRrc4TkTyvNQ2K2F+D485IOU5TrcZJoZcLq6YeE6WWyZ8b6LshOsCPzN2I
 y/dpd0Eo+J2PX0bTsPl/13ZRkkqUX+UsyS/QkpcEr44E74+2w9gxIVGUrCggy/FMK
 4nPCFeRDFDTZE1Ylx+VltqQWs8ukVQYlQDkR/6MEDn8gc7DHKad29tfKV3antlg2p
 p9DxXa0LqXwfZFZTV3NcohduGajP3OyaoJyPqz3RQFCDqnFUrVFeDrA9LsH5fHgcq
 SwZVm39Cxq21eSdljg5A6E4yoinKXXDQoTdSBkwNMoD8OjzNNy87jR6pjPWbRYCnk
 X7jV9SUK4BBAybpHpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=cEomjnYR
Subject: [Buildroot] [PATCH 1/2] package/apache: add config option to enable
 mod_md
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

mod_md allows Apache httpd to automatically provision certificates for
HTTPS via the ACME protocol (e.g. from Let's Encrypt), if configured
to do so. The additional dependencies are non-obvious, so add a config
option instead of only enabling the module if dependencies are met.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/apache/Config.in | 12 ++++++++++++
 package/apache/apache.mk |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/apache/Config.in b/package/apache/Config.in
index 270296bce4..6b21428c2c 100644
--- a/package/apache/Config.in
+++ b/package/apache/Config.in
@@ -41,6 +41,18 @@ config BR2_PACKAGE_APACHE_MPM_WORKER
 
 endchoice
 
+config BR2_PACKAGE_APACHE_MOD_MD
+	bool "mod_md"
+	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBCURL_FORCE_TLS
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Enable mod_md, which handles TLS certificate provisioning
+	  via the ACME protocol, and OCSP stapling.
+
+	  https://httpd.apache.org/docs/current/mod/mod_md.html
+
 endif
 
 comment "apache needs a toolchain w/ dynamic library, threads"
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 06f964b083..3b1574cb78 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -91,6 +91,15 @@ else
 APACHE_CONF_OPTS += --disable-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_APACHE_MOD_MD),y)
+APACHE_CONF_OPTS += --enable-md
+# BR2_PACKAGE_APACHE_MOD_MD selects BR2_PACKAGE_OPENSSL, so openssl is
+# added above
+APACHE_DEPENDENCIES += jansson libcurl
+else
+APACHE_CONF_OPTS += --disable-md
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 APACHE_DEPENDENCIES += zlib
 APACHE_CONF_OPTS += \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
