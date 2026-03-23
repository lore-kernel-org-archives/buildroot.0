Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D07FC72CA
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 07:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A00A340A90;
	Mon, 23 Mar 2026 07:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9bpw-cT3m-4p; Mon, 23 Mar 2026 07:43:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE4B840A1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774251780;
	bh=71jKctNm5E9slmmHp8uVW0a2T4Bd84rrPTmIZPB6stM=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XV8RWGBhiszskbmNoGQ2P5nTmAmIJ8dsgANWu49ik8v7WsXH+VEWGVUSUPyCiRhPT
	 yuNWVGs2v6iTjItHhYoaB+K5EByiLWVg8UPt2xUWbSTPUEH4F0QglYrisp3TBlArx+
	 lxBZPTuEHj9XOrWFYqAn6iPn+beJbkndxY2lOgScKRRHS78RG+ApWL/xutmGEZ6Lgs
	 iOgxPSpoKbmrpnbvOUex+J1KYjJpmH14bzP1o+JMHW7dhL/7qlW/T25sD/YDHFWqvR
	 U3MQprdFBQTq04SiB5JEtBvJbiipylO8VVIouOFQT8UC0m6SjF2jKlvj0jdjVmL7/3
	 uYc+gfPNAl7Iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE4B840A1A;
	Mon, 23 Mar 2026 07:43:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DD146353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 07:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDCA7606F4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 07:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zFQEBikDJ0qU for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 07:42:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BEF34606D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEF34606D4
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEF34606D4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 07:42:58 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id ECE8431E0CAF; Mon, 23 Mar 2026 08:42:55 +0100 (CET)
Date: Mon, 23 Mar 2026 08:42:55 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <acDu_6w5SkzNa7rN@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1774251775; bh=Whwgave3qsCpYgVYErImS1lQQGsaKffF7h5ZiY9haOA=;
 h=Date:From:To:Subject:From;
 b=oULTS88ritj+0BqJ7pKsv9OpPvHOnkgbsdpt1KzzjfMLtOvZab7DZOZSj+dnWqQax
 gfoajAbSPef03G70S0Z65MCLTeDD3+zX76sdahNnytafHeji35yiBX61xUmtV5V/dd
 eTYaCBQHVYN6GhjapXCcqvkw78dy/2+wCfN/hkDNYm4l+ZrCwXAWa1y3xJEsjHDzHF
 7ycPCorA7gLMbjWyRo7F4H1HnQxI59m/mnk8Y+LBJHYEKMYLaZh13hog8eee1wS4m4
 cNz2WxzFvyE439AYhw6Lb7cummpX2qrmex+edCSMqt18OsRHZ+vdqdblf9KqfB4zpQ
 /WXTAoJ4FHkFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/asterisk: security bump to 22.8.2
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

See here for detailed changelog:
https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.8.2.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index f1573f6575..3a8274b458 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  4f30af0695a0131fc091d85e7b91e22504609434b3fbd263898c7354d41959c9  asterisk-22.8.1.tar.gz
+sha256  6669a8d2e50481a3b70c6099a21a100ab7d7ae9ac00e2182eabb94c68c94bcc9  asterisk-22.8.2.tar.gz
 
 # Locally computed
 sha256  58bb83cec4d431f48d006e455d821668450f8cf6b6c95f090def47062fa3a60c  pjproject-2.15.1.tar.bz2
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index b59f2bf5aa..e2fdb189fa 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 22.8.1
+ASTERISK_VERSION = 22.8.2
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
