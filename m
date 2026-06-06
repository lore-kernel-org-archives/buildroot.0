Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD9ECD8C88
	for <buildroot@archiver.kernel.org>; Sat,  6 Jun 2026 18:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3625F40980;
	Sat,  6 Jun 2026 18:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5mtfkYfh8afL; Sat,  6 Jun 2026 18:21:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23B94405D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780770069;
	bh=cWWBtNWlYpFG4w/tS1TWKRWVQTqglaJQ3WKGgaXq9vQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DYvmf7DYzDNQ6xXw/xZ7f8va8ffKITQCrZMFH10x8T0RYlKLytUAkJZEyq/PcgGkw
	 o/WgD9EC45mtrT22B5t6jQJsW9jXCznCrbq7MGgo6mMVGF+718Wlt1CMEfFsg/6yD3
	 zJFcn6ykKRG1C8ASyX1obLgDJstGeiHzJYXqWTOBXFRCywlYqIirMhDHJwuvZR3Gci
	 q32sHgyc9KgfVQNOYo3arSqDCpVmbaMWMpV1N/BTDWUok43ee0bQT636C++YUeDNrE
	 kjYZmY5q9h6Rdmen9hZnEqW2iUbYjLQb8fsXFajeymm88sHwErquRdGnIazrTLOirG
	 OcyUbBxg/uCzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23B94405D1;
	Sat,  6 Jun 2026 18:21:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C7802187
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 18:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8CF880713
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 18:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmjrlX96KZb8 for <buildroot@buildroot.org>;
 Sat,  6 Jun 2026 18:21:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A3494806F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3494806F6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3494806F6
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 18:21:04 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7i8O-1xIvjk2p98-0136q3; Sat, 06
 Jun 2026 20:20:58 +0200
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>, Fiona Klute <fiona.klute@gmx.de>,
 Joachim Wiberg <troglobit@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Sat,  6 Jun 2026 20:20:30 +0200
Message-ID: <20260606182032.3803327-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606182032.3803327-1-fiona.klute@gmx.de>
References: <20260606182032.3803327-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:rhW5WR2Q2yu7qKPpoo7YtWhg8KRbnD1DLTUvedWnwxDC1euzXMH
 hzItJrLJGprNoZMlnj/GHUnH6tNmzorunhQXqbqtNPQA5Yok+Bh0HSSKjFOR8sN+lGi4MhI
 uoBi4gyL5HiSdAkJ46OTNH57fJChp0j+56XI+C5tywhMm4DMzTAfEYmjkrsK3I1dnoX20ad
 9/k1AbY2+NLNJw/Z3L8rA==
UI-OutboundReport: notjunk:1;M01:P0:HSiBvXl1RpM=;p+yzr/dMV8H7IpRNC2uTKPknzTI
 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
 HmBQHzAZyfXDO84XSvSHci+L/rw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1780770058; x=1781374858; i=fiona.klute@gmx.de;
 bh=2HwnAMvromTbI3c3TxzyLNYyfP6KW/qEGfAccJd1RSE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=n9TpG8cgmzfvAtHmv9REvmwrSfUxK6N2UPkszvE3ZVCilD5AnuFXoFFgGmztFTAC
 JmgUjELowy4ojZSyxEzU6mkwKihweckBGB4ETm+b0CJJJhYqHlYekOUBe2dWUlMZi
 IEFm1IYm2C3ni5tvDqBiOA85R8zwf04yCW+/J7S2HEo3JmDoPe97JXnC6prF0z+LN
 PRakKALvi2EApeQ+a8wOuzdO/uTZvu63fG8viE7EtKFeuUDpLaLOiiFiwr2+06gEu
 6jKT2Cc6eY6RrbFdcj0j8ZjDxPCzfbe/E8L28dka8K5kizf3MJTy9r9XqgQWpy6aK
 655nfcrBW4+FJy0jYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=n9TpG8cg
Subject: [Buildroot] [PATCH 2/4] package/mpd/S95mpd: do not wait for exit if
 sending stop failed
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

If sending the stop signal failed for whatever reason, waiting for an
existing PID file to disappear is likely to block indefinitely.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/mpd/S95mpd | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpd/S95mpd b/package/mpd/S95mpd
index e33654a501..485747e96e 100644
--- a/package/mpd/S95mpd
+++ b/package/mpd/S95mpd
@@ -31,6 +31,7 @@ stop() {
 		echo "OK"
 	else
 		echo "FAIL"
+		return "$status"
 	fi
 	# $DAEMON deletes its PID file on exit, wait for it to be gone
 	while [ -f "$PIDFILE" ]; do
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
