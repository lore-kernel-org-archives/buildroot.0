Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5839EC25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 18:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1232140025;
	Sun,  2 Jun 2024 18:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2ACt8JVIfyN; Sun,  2 Jun 2024 18:23:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4877400B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4877400B9;
	Sun,  2 Jun 2024 18:23:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 841781BF4DA
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 18:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 715B3605D2
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 18:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GR8UjijkbAR0 for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 18:23:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D1359600D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1359600D4
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1359600D4
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 18:23:09 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so20351415e9.1
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 11:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717352587; x=1717957387;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UWBzi7Q18A2qRUJoIQkjwZhWSqxxT0cWqQFB6lNzkD0=;
 b=ubnKTqM8mVl1/zeiQ8mivXdzgJkE8WQs8eHYQ4fK5TV3n9DdjUpo1CjTqXfUClRnRF
 I1zeefrA09vexzGwlZeI8/fWZy9RlQoGy8Qz5JKI2o9OlqezJIJWtcO3CF2IDeHRoDsM
 wbWShINsRArmmoLpNxrX7Ax2LJMgLHqyYvC6Nx0be9e63wasN0fAElJUbcDlIWzBi3PA
 iYgeivgT0/E87WMfH+vrXaJ8gaLHS+0KjpTPb3Rj2+9gx5ZKJFQvfWwkqmuiH6JEGBMo
 fXXUai1ZHKEHtW2AwJUzoK+o4CN8WM3wfbka8vM8jDzJfBFDTNwzQvRrR/vRqnvEkyZE
 ZC0Q==
X-Gm-Message-State: AOJu0Yz6M4HdLZmj/xbUaSCEC3f1ICj5ac16mGR5rOXMaZEO1zYPqKad
 39FEcjjcBtjGMEpKDb+Es4kndY0e7nXnuDdNcPZY3KlHkmBBqe6boxzruA==
X-Google-Smtp-Source: AGHT+IHzQ8VUWLyPUF+srAdNCVfTexqdtNjj0EschijhtMhL46dsi1PeUaa1W9X8E9XrjuGeaZMKGA==
X-Received: by 2002:a05:600c:45c9:b0:421:1b8d:2df0 with SMTP id
 5b1f17b1804b1-4212dd519ddmr58120955e9.7.1717352587243; 
 Sun, 02 Jun 2024 11:23:07 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4212b8b39aesm89101525e9.46.2024.06.02.11.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 11:23:07 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 20:23:06 +0200
Message-ID: <cover.1717352584.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717352587; x=1717957387; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=UWBzi7Q18A2qRUJoIQkjwZhWSqxxT0cWqQFB6lNzkD0=;
 b=XMXDsPdxaBTAf7GmuwGL4L1zE3D5l5TxQXAQ9Hj3+LF9iZyMPIrt4m+arxzGzQiWCM
 6lojVZ+UGeE+xIQxC7WbjpvD/jLYc/c/qqfJ7IrhFyipkc/4oN37sg0xgYnKBpJ8SCHt
 MWcjUKZcx1VUYmtxJpsi/2DBqkRca4mUvTS22zR4d1ljh0/1Cc5ffR8pXl32gMLuTanR
 mOlDPiDLNuupS4AoQzaFegHO67x0Wz5KN+KHwJ/D3cgNI0tcePxQojo1nBJe/2GMqnVB
 vK2QmK+CItSbsXXM17BNUrFaEWmCR2w/PSZTPf9PYgId+uG8P2FqkXoCxv86RGP+WHoW
 oE+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XMXDsPdx
Subject: [Buildroot] [PATCH 0/2 v2] support/download: fix running on hosts
 with wget2 (branch yem/dl-curl)
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

Changes v1 -> v2:
  - drop --passive-ftp from BR2_WGET

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (2):
      support/download: introduce curl backend for FTP transfers
      utils/genrandconfig: do not check certificates with curl

 Config.in                     |  6 +++++-
 docs/manual/prerequisite.adoc |  1 +
 package/pkg-download.mk       |  1 +
 package/pkg-generic.mk        |  2 ++
 support/download/curl         | 45 +++++++++++++++++++++++++++++++++++++++++++
 support/download/dl-wrapper   |  1 +
 utils/genrandconfig           |  3 ++-
 7 files changed, 57 insertions(+), 2 deletions(-)
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
