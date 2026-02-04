Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36A1EA7943
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 19:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B43783806;
	Wed,  4 Feb 2026 19:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kxOmQGda-_m4; Wed,  4 Feb 2026 19:52:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAF37838B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770234733;
	bh=gWtq5Np6ZMOr4J+gntYXYEBR66NdPXdf2/YXZfjWwRA=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UFSqkEzRHIwI2+FzklsrqvLnA15Sufmgwc4sFiyn6e9Zby3cEN5/wcOT6tFoebtSS
	 eHjyKp2QOADqJszpWBAx4kKof5K/kGNTsrha7we497Gd2kDQEGHv2MWDorCTTjalsI
	 kaDEfkNqhzI5ymMO2NQblVkh7dsgCCKU63bqUBhbDEMFb1K7kAwRWC8f1FKkIEuRLn
	 aVkyEzsFc383uSyBPnfL7/Y0lPB0mrCmNhlyaOQ1LoNtUeeRLAK3mweSYvJTSlABmN
	 eza4MxK36fNkDt0na4jBIXkK7SeNvbQo2qaNrgHHUMhSPNy/vFJZpvyNWlMI1F5QBB
	 clxN9Ubu6AMpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAF37838B6;
	Wed,  4 Feb 2026 19:52:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 54D5017A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4052B838B6
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0JbxXgAJiqJ for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 19:52:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED16983806
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED16983806
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED16983806
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:52:10 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id B6CFE31E0C0A; Wed, 04 Feb 2026 19:05:58 +0100 (CET)
Date: Wed, 4 Feb 2026 19:05:58 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aYOKhsGmWtZsI5Xy@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1770228358; bh=rAC+6jkZdtRU/q3UPx6MCWUUTDx7sB4vw5r2TXUdNHQ=;
 h=Date:From:To:Subject:From;
 b=rSluBbRuH7bcHDADsEyQE9TVg0IQwjOtBrxMruOjtJV5jSwKd/Me3dOE3LabijvPf
 w3+kI5DKoMOJ+nNY28mriKgD0QIC2S0ZOKkyBeLbehXFcxwbQl5kdXIPYFdfjNByF+
 V3VwHQ2qnlEU6KJRnTyHqu4ttnoXvn+LKskO/t29Pf3WDLceOj02Y1y9053en2CqwM
 ruNxvYc3D9ozSqQBO80P/tWdDw7QvR56mR9pckyj9C7kwpri5WxPzRe5P4PGpPq65v
 xTagFJgZVvx/sFwWXh2BcIRKI4cm9c10vyGNTqQk0mmH7nPx0onhQZv0cFSV0FR+7V
 ETztTIev/RyqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/asterisk: bump to 22.8.1
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
https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.8.1.html
https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.8.0.html
https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.7.0.html
https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.6.0.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 26175667c3..f1573f6575 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  8a94650b6f348af1f1c9cce7ed3585d280f3a31b0d3820084a42b03712df95d5  asterisk-22.5.2.tar.gz
+sha256  4f30af0695a0131fc091d85e7b91e22504609434b3fbd263898c7354d41959c9  asterisk-22.8.1.tar.gz
 
 # Locally computed
 sha256  58bb83cec4d431f48d006e455d821668450f8cf6b6c95f090def47062fa3a60c  pjproject-2.15.1.tar.bz2
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 9a071fb8e0..b59f2bf5aa 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 22.5.2
+ASTERISK_VERSION = 22.8.1
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
