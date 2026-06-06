Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124F1CD8C90
	for <buildroot@archiver.kernel.org>; Sat,  6 Jun 2026 18:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22EAB80A9B;
	Sat,  6 Jun 2026 18:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Td0keHfZ_Bls; Sat,  6 Jun 2026 18:21:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25C9A80713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780770070;
	bh=LIFKd/ALCwMuDcbDbWvSwd4QG8lR3l2NJh7GlxyFd7w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=roI9sUmZTd2/tnG3LpYkLwd2JlDAd2BcBny1z1eGe4ARfh8bBO2BwGqYQIpu8Ldnc
	 0vQoJLrGrvqrJoxYJaXkbvPhXwYSEd8BfHnquw+nEw12Qx6dbHz76rZYlDy4c4zJt1
	 h7/s9gV3InpLbUh9R2C/moNbXyITj87lCD927r534OJsRnbU1MdJATMR/oODwsOHNU
	 0T1paqQ9lnVQKHWLd507VhzGBR+J81Xoi7I9NeJJ2wegFXxMMwj5m0HsWRC+MCXcq2
	 HPClYmama6JkCIYJOFEuPtQEgRWouPJbKCIMtHnI9dJB6lGZY/xaFsZ1djCeJmGnyP
	 +34zsbjbZzGCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25C9A80713;
	Sat,  6 Jun 2026 18:21:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 20C732EF
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 18:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1177640076
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 18:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TEc9tFNHXRJz for <buildroot@buildroot.org>;
 Sat,  6 Jun 2026 18:21:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A33DB40067
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A33DB40067
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A33DB40067
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 18:21:04 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7sDg-1wativ0fxa-003LCd; Sat, 06
 Jun 2026 20:21:03 +0200
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>, Fiona Klute <fiona.klute@gmx.de>,
 Joachim Wiberg <troglobit@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Sat,  6 Jun 2026 20:20:32 +0200
Message-ID: <20260606182032.3803327-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606182032.3803327-1-fiona.klute@gmx.de>
References: <20260606182032.3803327-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:xjY9qPslJPWUZiJ8WklcmOI3leHScHGggqpQEG1kabZelqe+2Yy
 +96CUz7kAsq7hRfn1Jp1cGyG7aJGCqnMmRDTcosoxa9xFNom3tVddUTHHtvT4lrPe+g6Kc0
 YqJQJkaWvV14YnwpfX8YSCgp+w/m8JYlhiH7SEF/f5Wk9Bnhd1r+nqi1Z4rimTRnj6jpt2a
 SREv2jFAPauOBtHPAzqWA==
UI-OutboundReport: notjunk:1;M01:P0:wZUQsROzfPE=;9F/kLynOwarPLG0wPWqH9BtjmMd
 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
 tjiOzg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1780770063; x=1781374863; i=fiona.klute@gmx.de;
 bh=h8Ew7RT1fjgSKJPSiYTXE1pSCrwuHV3qxOCnIrXobkA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=KDAp1epYhYNXWYwVLclj6MNvN0tWh9OtJ6Y+dL6mDmf/+dqOMX34B5J8XhqsezeP
 /irGbMLravFIv8NN08rFcA0I/NS/slq+MF4tFy4UJbZk4N3ai4Tk3xzQ+TBetqhw+
 wKm3D+MkSAeXmnD9+ySb5V9BmCJKifwjBheu//Th8AffIOBCUHdUeN2J7/UlcgJx9
 SkyXMG+MNXv6jlhzMrXTeyCoVI1S4nBXktoqNzu14gOzQ1Xv4COL5EMDRznzwg2uV
 ZSZNIFRCa0mTaKYjrJr5z8kVoV1AMV5ARrW/6Y+ZRn+MP+v+arc3GbRi7VaHr4Lby
 HkqCmB33kLxw6HSTzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=KDAp1epY
Subject: [Buildroot] [PATCH 4/4] package/openrc/sysv-rcs: fix shellcheck
 0.10 warnings
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

* Explicitly set shell type. Shellcheck doesn't know OpenRC, but the
  script as such is POSIX shell.
* Override warnings not applicable in context.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/openrc/sysv-rcs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/openrc/sysv-rcs b/package/openrc/sysv-rcs
index 1564cbe603..1b24cc3e1a 100755
--- a/package/openrc/sysv-rcs
+++ b/package/openrc/sysv-rcs
@@ -1,5 +1,7 @@
 #!/sbin/openrc-run
+# shellcheck shell=sh
 
+# shellcheck disable=SC2034 # definition for OpenRC
 description="start or stop sysv rc[S,K] scripts"
 
 depend() {
@@ -17,6 +19,8 @@ start() {
 }
 
 stop() {
+    # we need to reverse the order here, sort -r would be no less fragile
+    # shellcheck disable=SC2045
     for i in $(ls -r /etc/init.d/S??*); do
         # Ignore dangling symlinks (if any).
         [ -e "$i" ] || continue
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
