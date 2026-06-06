Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CCACD8C97
	for <buildroot@archiver.kernel.org>; Sat,  6 Jun 2026 18:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01B2B4068D;
	Sat,  6 Jun 2026 18:21:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXpwoxNsoL1g; Sat,  6 Jun 2026 18:21:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 393A84098B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780770072;
	bh=c27N8tG2NmH44s6wMfGY0EkAw2s64Yw+HAkagY9j+oM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=hLDYKHwSz3lYvocgLIAlP+dAENciBXQQwR/NpBqPks9GDsGg36oLUpBQLwpz+E54A
	 J/Xka8I1Ig9ZXR3gFPnjgprfenBaLJ9Kmj3CWjM6UWQbYE5idQo4zZ9zIPei3jc5Yj
	 saaBNpvpBRi+PoNDE0Q2V1x0Y+54ncfNCxV8dlw7rKgYAXOvgFwIEo/WYUO6zk3slK
	 aOCWCe+s833c5BAM5mV2HgfjlaYSbX6tDkkmRtd9LaWZysIbxMLUGSxMgmkGlvLPTT
	 6gcwW4OQmaj0YqABHo3Eqn+8UIY30bES5/Hkf1Lyp8JcjZzEr1U3I8WgflCQmqnMZ0
	 a+TSK25wL0wHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 393A84098B;
	Sat,  6 Jun 2026 18:21:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 398B62EF
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 18:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DA6860F07
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 18:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sejstXsnNCZ9 for <buildroot@buildroot.org>;
 Sat,  6 Jun 2026 18:21:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A3A7360EC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3A7360EC5
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3A7360EC5
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 18:21:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWAOW-1wlnqQ3tJS-00Ra9z; Sat, 06
 Jun 2026 20:20:53 +0200
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>, Fiona Klute <fiona.klute@gmx.de>,
 Joachim Wiberg <troglobit@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Sat,  6 Jun 2026 20:20:28 +0200
Message-ID: <20260606182032.3803327-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:HfS3bGkX1q5k5ANVk5a9m+prJk0PqNSGifrZgENzXd/LSaypnVR
 m0DO0LRkZBSZIT4b1pFanMz1BQQiCIVPpqqX2HepfgaGFNQMHORvFu5dffkWeedK/yHKfh+
 BAQOwqwkRTlpowXselVpoermGZyrdO1QR4bG8zhy2XtRK1or2yqm+4GrSmKJWqiieo6UQJD
 BVkdzshWZbtLsuqlQXa1Q==
UI-OutboundReport: notjunk:1;M01:P0:EFEsUPbwW6s=;MBCnewdTMt+rmVphhKEDTg0c/Qw
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1780770053; x=1781374853; i=fiona.klute@gmx.de;
 bh=SnNdXeL6J9vmpSP7xAbkyvIRISiJsI8Om3RdnhasG80=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=AzPPn/lIayFmKVqtTFTyFHFV5NjiRDIPk7NOfqzLwfDZaXAXvsBaVHcTkr88aJmd
 c44dDg07Gs8H57fAFugrtUOqTBOJwgMbbbs13lLTV/aZ6H+lUdhczVe7gcqneptfe
 KJJ6YBorAQcyHSb2ck4skmU+E74eLE9xOUlIhbyo3ZsIHSPA02obUTHfBij7EIDWn
 tugfhkgD6ScwBGqKI01MoBrv/SsDVBaJWJs5Rb0t1zIkF+oYG5PJpMCsRA7DPyrd8
 +LiU6/E7InSNHP7Tb4wiaOP53gzAwidGdL1MahpieyZxSXBWpftqP/Lsl3tVFzykQ
 c5bdrJfFKkZppB7ChQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=AzPPn/lI
Subject: [Buildroot] [PATCH 0/4] fix shellcheck 0.10 & 0.11 warnings
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

Hi everyone,

this series fixes shellcheck warnings that appear with shellcheck 0.10
(as present in Debian Trixie) and 0.11 (Sid) to prepare for updating
the CI container image to Trixie. With the current image "make
check-package" still passes with the patches applied, so they can be
applied at any point before updating the container image.

Most changes are pretty trivial (the mdnsd init script a little less),
but only OpenRC has runtime tests, so tests from people actually using
the packages would be appreciated.

Best regards,
Fiona

Fiona Klute (4):
  package/mpd/S95mpd: avoid unnecessary exit
  package/mpd/S95mpd: do not wait for exit if sending stop failed
  package/mdnsd/S50mdnsd: rewrite to match current guidelines
  package/openrc/sysv-rcs: fix shellcheck 0.10 warnings

 package/mdnsd/S50mdnsd  | 55 +++++++++++++++++++++++++++--------------
 package/mpd/S95mpd      |  4 +--
 package/openrc/sysv-rcs |  4 +++
 3 files changed, 42 insertions(+), 21 deletions(-)

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
