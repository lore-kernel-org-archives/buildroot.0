Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CEEC25B74
	for <buildroot@archiver.kernel.org>; Sat, 18 May 2024 20:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85E8460642;
	Sat, 18 May 2024 20:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D88KlAW2xvIz; Sat, 18 May 2024 20:25:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A9D960676
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A9D960676;
	Sat, 18 May 2024 20:25:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A176E1BF3F0
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 20:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E0AF40186
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 20:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6Li1DrkNNXw for <buildroot@lists.busybox.net>;
 Sat, 18 May 2024 20:25:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 06D9B4012F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06D9B4012F
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06D9B4012F
 for <buildroot@buildroot.org>; Sat, 18 May 2024 20:25:09 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-34d7d04808bso866627f8f.0
 for <buildroot@buildroot.org>; Sat, 18 May 2024 13:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716063908; x=1716668708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7IFnDfYBdYuzWna3dRs27WWuURWVZb571iti/d5j3Wo=;
 b=dIfYIm52asOdh5x8+PjJg/GH02v6LBsDm9oXus51V5F5BE5xXcv9EZy/ucMkABxpux
 j3w9RXvcMPy9bCzWb4SKBjaOcvdPvzTyT9df+i64pcuifcnqoSk6tZDKTEQTQfb7+SWr
 N16DiuqwKZaIzUi6ymJoPwyNxt+TTj6XanaZyP397qOviWQICWv/u43UZHWA8gutqMfa
 zqk9KVPigJjh0OBqQoQ/Pru9P+3LBaLtClH0JF7UDt0LexEFqLGzYjsY/ttvVQAB+jo+
 yBBZycL8ppWBpcUnHHk3e2fIuF2//B2SikIcmwAEMShRQC2y/aNUOJc+Fps7PC67tbWm
 af0g==
X-Gm-Message-State: AOJu0Yz2UO/MffNdU3TUZIdNqioJWX8+a7ZResB491vvZiV4Q+JYOCdu
 NbI2VH3crRx6mjbJcYNJD64K4fU4W7P1pT8qlBIktgFD3Eh2SdkNvCPXTA==
X-Google-Smtp-Source: AGHT+IHujWsqiRRiUnvndruFkTfWZTssbGJ0Oz16l/63CuJHfjm2mXNzvQOjU+KZmp/q/jNIRZ0gpw==
X-Received: by 2002:adf:ef4c:0:b0:349:bccc:a1e7 with SMTP id
 ffacd0b85a97d-3504a6310c6mr25818567f8f.19.1716063907457; 
 Sat, 18 May 2024 13:25:07 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbbde1sm25028683f8f.97.2024.05.18.13.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 13:25:06 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 May 2024 22:25:06 +0200
Message-ID: <cover.1716063903.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716063908; x=1716668708; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=7IFnDfYBdYuzWna3dRs27WWuURWVZb571iti/d5j3Wo=;
 b=XxRLcAoerSZXVazedryTHer4ROpmd9YtPpF6FkKbcrfRQMwqePC11Vl5+kzzHPuXS1
 bmBrLKYaDgwnv8bDRSKwvPnSrdXxMIBK2mcnhElZb+bjDsZyOupG7PL3VdgrdpFsHle3
 MEsVJkMpA+f3wLZQBqXkPTfoFu8qAyx6ykL0HnMsS9YzZmct/F7C/59KBdSAG5P4qpla
 vWRnUfV50Q7vWj4bBO71ftQ2xJkHISxOzGrCWZvzA+OolKSUwa9wFgKEe5xPQIeA9dco
 y9bNF3vqkq0+Tk0rxCbYBT5OkUnSwLhHBmbmkUZXkrQRbsKI2g2YzT5sqhNE7+clcaQK
 dRdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XxRLcAoe
Subject: [Buildroot] [PATCH 0/2] support/download: fix running on hosts with
 wget2 (branch yem/dl-curl)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

Recently, Fedora 40 was released, which uses wget2 instead of the
"original" wget (aka wget1). wget2 is almost a drop-in replacement
for wget1, except it no longer supports FTP and WARC. While WARC was
unused in Buildroot, FTP is still used by a few packges, some of
which only available via FTP.

Switch to using curl for FTP downloads.

We could have switched to curl for http/s downlads too, but it is
possible that existing packages (esp. in br2-external trees) use
wget1 options, like we used to in the now-dropped amd-catalyst
package for example. So we decided to only convert FTP downloads
over to curl, and keep the rest unchanged, to minise the impact.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (2):
      support/download: introduce curl backend for FTP transfers
      utils/genrandconfig: do not check certificates with curl

 Config.in                     |  4 ++++
 docs/manual/prerequisite.adoc |  1 +
 package/pkg-download.mk       |  1 +
 package/pkg-generic.mk        |  2 ++
 support/download/curl         | 45 +++++++++++++++++++++++++++++++++++++++++++
 support/download/dl-wrapper   |  1 +
 utils/genrandconfig           |  1 +
 7 files changed, 55 insertions(+)
 create mode 100755 support/download/curl

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
