Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14972C77B7F
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 09:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C55F561079;
	Mon, 23 Jun 2025 09:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zyaZs_ZP3U8; Mon, 23 Jun 2025 09:13:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0A106104C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0A106104C;
	Mon, 23 Jun 2025 09:13:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ABB4112C
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 09:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DEC540430
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 09:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tzqontuNRAah for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 09:13:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=fred.lefranc.evs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C57A4041F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C57A4041F
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C57A4041F
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 09:13:10 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-607cc1a2bd8so5929577a12.2
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 02:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750669988; x=1751274788;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wSJVB/VK/IU+sjbWohbtLXdiYlYXjxAt7kMDpigPiXA=;
 b=Z3TwdUCLqOBaG8A7dGwghaWKihGZX+hyc9zBWnp82N2ZKBGCLcdoY2P9V2q1S2Hw5+
 bmR/qOhd97lkrVt37X7jUicnJ7XxJxSgyykHFU73GcYcSwkkPikmJEb+l1oxAdk9/baJ
 4TvCph8UzIXxrSM/c4b7PhX7bNhQUmht+sjDmk/13NEs7W7kvuu8xD1vhSSBWLLdthGs
 0079o5KtrDDIlWRgirA8w2AMdiu5OE/qlRItTK++MPy9/YAYjhidl8xfpmuXPdrbJHbN
 oFWyIkMPdK5DlrZiaMrUKCkcmntCapjCtKgMyoa6Qk/igaifU15KKQUcC1jOWFPgJgkq
 n0yA==
X-Gm-Message-State: AOJu0Yz5/AdvOcso+Qz8ibHVNlzlKeN9cKDqMsAI6G6ztfK8S3j3p0bD
 M3bQrtQo4BsNAWOFrJ4rnjV6O5Dap0V+CwI9pdD0wsbO+bxdyI6JJ+CYWWV/a46x8Ce1M4DLb8R
 eQ92+tGNbwoNjw4jRcxbk1/PqvbFx/IRGEBRK
X-Gm-Gg: ASbGncvS19sgRZEY5kva1QRzAIDW8iovBcQqy+Yk070669CZIGUaV+58aKz6wcCiquM
 ZCU6yGE7zqsHqdo6C1250BFonS+LbEzdY6dpzeSqStahU0A5kuc48RzG2U6X0unjiIyUBw/Ewxj
 CH0k0H/ysVfZIrtLCEPaDrUGIbnzx7i/CZb6FLIieCO/tTksPiCkSqC38=
X-Google-Smtp-Source: AGHT+IFLtZT6nk5jxfMm/8RMZMrmLh68mSJHsq6kuej+iX5UPoY/DFHdkM6TeYUnfIvC/2YCxNu+DYe8UUVsSOZS+Fg=
X-Received: by 2002:a17:907:7f17:b0:ae0:686a:870f with SMTP id
 a640c23a62f3a-ae0686a9815mr893780566b.15.1750669988253; Mon, 23 Jun 2025
 02:13:08 -0700 (PDT)
MIME-Version: 1.0
From: Fred Lefranc <fred.lefranc.evs@gmail.com>
Date: Mon, 23 Jun 2025 11:12:57 +0200
X-Gm-Features: Ac12FXwuLKig1rZ2NUkFvvC00tQETTs5p005C1KBH6E7lT2DqTmeCl519KfaoiI
Message-ID: <CAGkXw1WepD3JC0zTr7be8q2gb03E65djQRmX=khynufoPfsoCw@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Fred Lefranc <fred.lefranc+evs@gmail.com>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750669988; x=1751274788; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wSJVB/VK/IU+sjbWohbtLXdiYlYXjxAt7kMDpigPiXA=;
 b=SeQ2c4zR05fKe+8dbY2Ws8CzJ7jzIdP2L98W7AYrnO+ews0VQsL66z108EE3NmBWXv
 foqIopjLqmDo5YIzW9lNU9x4VaqTWVrhuvjIG/uGT4zvc240n8GKACCpR96vfwJkiWpk
 HTIGEVYAfRygdaseWoKy5gJBzfOKgU2tq4ToSxdckH+Ph8YX1o8nU2Bioyxr1ykt3rxK
 0v2TzweldEpGz8TVPyD5oIfmLZ3XCl+2YwwGB6Rm4mStCmNlClMmh6rio6gfnhtqUSQ7
 kTbw6Qbj6s0lk9TNq/D27t5rsWnVcIuzwIixy9RKgObhxqL9UbCvMB/K00xV0LavKtW0
 yrLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SeQ2c4zR
Subject: [Buildroot] [PATCH 2025.02.x] package/haproxy: bump version to
 2.6.22
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

Changelog: http://www.haproxy.org/download/2.6/src/CHANGELOG
Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 74390c2ff5..42f340fa80 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.15.tar.gz.sha256
-sha256  41f8e1695e92fafdffe39690a68993f1a0f5f7f06931a99e9a153f749ea39cfd
 haproxy-2.6.15.tar.gz
+# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.22.tar.gz.sha256
+sha256  4c0797f450f997dc287d2c7aafa7a0e5b7a2d71593a2cd58e664e8f3aea614fa
 haproxy-2.6.22.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28
 LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a
 doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 61a9ebebe4..77195d966b 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################

 HAPROXY_VERSION_MAJOR = 2.6
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).15
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).22
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
--
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
