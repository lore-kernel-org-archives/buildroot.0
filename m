Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E27CC021B2
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 08:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1F3A60BC2;
	Sat, 22 Feb 2025 08:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Al60ID_U6n34; Sat, 22 Feb 2025 08:17:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A11560BBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A11560BBC;
	Sat, 22 Feb 2025 08:17:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D5006B
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 08:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61763410C8
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 08:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQvgNMNKkapA for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 08:17:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B8A1240EBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8A1240EBE
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8A1240EBE
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 08:17:10 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 6C45335207C6; Sat, 22 Feb 2025 09:17:07 +0100 (CET)
Date: Sat, 22 Feb 2025 09:17:07 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Z7mIA7MNvH7QS1Cu@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-33-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1740212227; bh=EFJB2fwLoTtAsk2XL1XP9OEbSoy2zdaRLWgmA90E7EA=;
 h=Date:From:To:Subject:From;
 b=lzyQxntbcYz2eK/lTRAtLc5DtTsR70j9VflqK/q006q7heopGJXsNcUVNT9Y+TshZ
 Bwj5KYjVwSH8QqMemozDeR8MXk8xLtTVoYx+//irT/4AEbU6zmFKxRz4eoLRSkftM/
 //sWbr3o4QiWScJjroanREogb0C9QkDs4aU2X8EHJkk7RagpteeMeTG3Yk2E8u+xtA
 yqT3uPPkMQQmhX8Uty2LWSZnPkDLWBZFp9Nici9uv5VDAky2XKxH1cMR9zbaPiTLph
 /n+HbR/i7prneZ1gG19qV5/cp4FKbmngPATsgaj3nVtk/iIn9UqM/xLSg5kuf16DjM
 4Jj/EXC0dlO/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=lzyQxntb
Subject: [Buildroot] [PATCH] package/zabbix: update to 7.2.3
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

See here for a changelog:
https://www.zabbix.com/rn/rn7.2.3

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/zabbix/zabbix.hash | 2 +-
 package/zabbix/zabbix.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
index b4b71db5c8..fa229af00e 100644
--- a/package/zabbix/zabbix.hash
+++ b/package/zabbix/zabbix.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  215301b6e089a685a2fabcca17fc65e5766d42d2079174b65a1bf28df7679692  zabbix-7.0.5.tar.gz
+sha256  fa957c533f042ef9b37710b00ada9c8e4c8063819d87c80212103abd53ed10b5  zabbix-7.2.3.tar.gz
 sha256  0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0  COPYING
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index 318030214c..affadef365 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ZABBIX_VERSION_MAJOR = 7.0
-ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).5
+ZABBIX_VERSION_MAJOR = 7.2
+ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).3
 ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJOR)
 ZABBIX_SELINUX_MODULES = zabbix
 ZABBIX_LICENSE = AGPL-3.0
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
