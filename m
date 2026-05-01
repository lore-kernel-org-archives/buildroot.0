Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CBCCD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 00:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1F3E6F731;
	Fri,  1 May 2026 00:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gibjc_2lyxpL; Fri,  1 May 2026 00:23:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 053396F72A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777595036;
	bh=lKfU2MwyMW6LWc2X+vb6Cp6iPjLFpxfvx11+fRoVSrs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=dw9Q9Id9d2DEyiLpkf9HINjcvE8c/J/B0IhhADp8NBKIGvA35VlveLz5NHMO2amiW
	 6cU+4+rOvewE4pEft9P1jlh8ZYpS9hiSYe0kDGbGwkFKQRTBbkqWDPjAVrBarqiGFv
	 jT/Uf0Kg7Cb1zUVqjI0Mq9tlimt+7oUaZKJcN68maO45l4n+UMN90TDnekUHg0geKb
	 Q7n3ewRxq5UMuktrvyhSWy9HNeeSXip8wBeHEEtaqtUKbWLJ+GPS7dKs1LiN3aZO0w
	 rJ75cLly4e/z94X7SG4J1SA1lfVMINFKVp+TgAOU9wiSS5g4RrIoNi8sDTaXD0v+bY
	 l4GQ/wFTSk6AQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 053396F72A;
	Fri,  1 May 2026 00:23:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FFDD204
 for <buildroot@buildroot.org>; Fri,  1 May 2026 00:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 518D542252
 for <buildroot@buildroot.org>; Fri,  1 May 2026 00:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hq7oETVUCPig for <buildroot@buildroot.org>;
 Fri,  1 May 2026 00:23:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D09794224A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D09794224A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D09794224A
 for <buildroot@buildroot.org>; Fri,  1 May 2026 00:23:51 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYeQr-1vmrXV1r2h-00OBmW; Fri, 01
 May 2026 02:23:46 +0200
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>, Joachim Wiberg <troglobit@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>
Date: Fri,  1 May 2026 02:23:18 +0200
Message-ID: <20260501002320.1761716-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:O1wLEYo6ZNdE8G0wmCKvOGLcQEvt29CigjPU4ZhmkaCjmVU74lu
 emCW3nRE+blm+gTBYoMB8kGRDx+IG928r4y95SlEMEsac3Mvme1TRsVtpObzWHEYZVoWwbv
 58s51oeyyJn+JNZZ0XBcSNsTgWjfC6H1higpNM914sV5YAPhqE0xnOhDWG2IiVOYcfmujzw
 DeAdZvmu5Er7Ac0z8c0vA==
UI-OutboundReport: notjunk:1;M01:P0:b+qpJZ61jRQ=;c3DDJ2XxyonTZMqpL1gc7HDrpyT
 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
 SexfCvdCv2khf3FnfaKW7TZdll4JGS0wVeOo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777595026; x=1778199826; i=fiona.klute@gmx.de;
 bh=Qin2CY4x8lOluz3YXoLQKtmQhYebIkVEewhFH330vhQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Bq4ILoyxE2hYMIgSu+s5aOypWmmvgm+4JtYpzg9ceMaqcBfoN6HiztCbYFj9FxM9
 0RQuJeP8X010U7SNRoxCfoGq5eXQCar+hWShezrfNNTKe6DXP6TBGRdrydV4fHAwC
 R4GBEBC9Y/cLvNQKaKHwed7Zb2Pkat/ypBgFtrS9goa+zRHmxZYbUScgcZ1dt4i7i
 bNBk4/t0M8J9QozHubK4kjtNUjofRwn2XCcQQxXr4CuRB1qqMRLh1Lo+hemZjBTpU
 ML0bf5b4z8oU241iAJW7BUf60ezdc2K/5KUEHF4O023UKiOqy+Rdwh1zuNlize6nt
 FOc20+nMIPa9Vj9oPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Bq4ILoyx
Subject: [Buildroot] [PATCH 1/3] package/openssh/S50sshd: immediately return
 if sending stop fails
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

If sending the stop signal fails but the PID file exists the following
shutdown wait turns into an endless loop. Avoid that and return the
error immediately.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/openssh/S50sshd | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index a5ff385acc..7d862db14c 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -36,6 +36,7 @@ stop() {
 		echo "OK"
 	else
 		echo "FAIL"
+		return "$status"
 	fi
 	# sshd deletes its PID file on exit, wait for it to be gone
 	while [ -f "$PIDFILE" ]; do
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
