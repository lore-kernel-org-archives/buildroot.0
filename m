Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FF0CCD183
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 11:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF72160D57;
	Mon, 13 Oct 2025 11:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymaksQOK_42c; Mon, 13 Oct 2025 11:19:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D95B560C24
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D95B560C24;
	Mon, 13 Oct 2025 11:19:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C542612B
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 11:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3E4581200
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 11:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HeCbZqYqSZUC for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 11:19:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0627681299
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0627681299
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0627681299
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 11:19:13 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46e6a6a5e42so17510935e9.0
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 04:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760354351; x=1760959151;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VX8578sYNeWskjoHq5otW+xJCLsnVi8WY6RzJaFp/8g=;
 b=f3zBtIgrS4vaVbbcQDP09sEtPURdergWvgy7QPkymGkdoGQa1HST68Jt41mnR5eZmN
 RPqLNtMGOxHbQubyhV1T5bDcu50/Bz09ymi+5PBPhV6qWYLRGxjxWRn752uaHBrNY/ig
 JCFaKbK2BjbLWb6sHw+FiFcxOL7hQa6AdJGtkZRz6NrpDW116BXn3Sp2u6GFVLn80h+H
 sYf6xCmWBTKyxgZu7fONFHBxyt7gKk/NWNmiaSPwbudwfySZ+ucUGpQGWwhA5oVXprlA
 l0CJq+sOcFYTcy0lDBFzRrKM5MoQ+9dHpq1c1sByuaD6kVD3cQ0GmZ2cHL57P91E27Ra
 n72Q==
X-Gm-Message-State: AOJu0YwBruZN5qtC8QORipVuYLvNfhZhUJP8i9s607OUSyTJXWGjHsyo
 224DAccO9MehdadQgMOJG/VvHIysIWLfLa6FydD0uY11tPXBv0cpPFEOHhxAX5oWgkC+3y/NEdO
 55wCm
X-Gm-Gg: ASbGncuLDXwjnIbAO2W8NkWynfN330KPKeRSXfJajlEASAQw/rMBq8RQsxMkHLIaHSb
 qiORpnxCQffFcTy61iUwKZXtNWOGLZSNcO0A/rQ5ozHWgq2lzJlrgD/mZMDrn8zsArPS4yUZNIq
 drTA3nLkaDzC6F3j9yWKFGdRGqPfs9q8jRsCH1YN2lgOyzsHzAAEPizht6M5ZiaxT0N8IsCo16+
 M3OFECV1ulxoNJT7kUQbJbr0fe7/3E2KdJSj7qqnwX7bvD/y8dFuR8UGQsV7aqnoDAg0JqKDOxx
 HoYsN++FDD1mfv3V5j2cN0vIqCG5l/697e3O2vRZcaiQkCjAQN6Hcbm9wH3JiBiepJo79e1Ub9i
 z4L10ThFGDpF6ETnZx66YNezl0ceS0s9bn21bDrmvJZU64aQO0PjGa1mUDyOBg32isbxKriuUDq
 yk
X-Google-Smtp-Source: AGHT+IHxZE2+I6tpqzqzrV3LcZD22uartGPIEWun1ZRFzHH64XLognjI3gfrBdFXhhk6FXzEiTsRQw==
X-Received: by 2002:a05:600c:3546:b0:46e:33a6:46b2 with SMTP id
 5b1f17b1804b1-46fa9a96a70mr140996285e9.12.1760354350899; 
 Mon, 13 Oct 2025 04:19:10 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426dac8691fsm9119503f8f.50.2025.10.13.04.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 04:19:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 13 Oct 2025 13:18:51 +0200
Message-ID: <20251013111851.47129-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760354351; x=1760959151; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VX8578sYNeWskjoHq5otW+xJCLsnVi8WY6RzJaFp/8g=;
 b=MPOXaXdDEgaJZynn/Me/HcVBrUehLNK93BsMkUUzwU5NZwHjqXg4PkhtxI86cWTRRu
 rOAKVSQNokiepUUbj/06Y+xQjfscbziI46+ficrdpzNrtb+L2eqCLB8UZf/fKz7FV9CJ
 zuBdf+zZPTupsRB5Ldu1H7UGP8tyQLQA+II1kxUVwvwKWvcl+uz1W3OLb3rK//7OnT9H
 XxVKbZzpLMlFpFAfGiJPz3s8bKDweCNXN/caBqW0oV2OS6Ivlzkjwv4v4Jcs9Cd3Ad+t
 4MKuHOysK/zyJ/BIgrmlYHVaItYk/e/eDhQnmybm0glcntmvbQYjAorm1vdn0cVQ3SqB
 e+cQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=MPOXaXdD
Subject: [Buildroot] [PATCH] docs/website/download.html: fix latest releases
 dates
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The website download page was updated for the latest releases of
2025.{02,05,08} in [1], but the column "Latest release date" wasn't
updated.

Moreover, indicate that 2025.05.3 is the EOL stable release.

[1] e5501d7b1a98c1e760f7569472d01491b21ffefa

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 docs/website/download.html | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 5bb7cf6987..d5b849ca9a 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -54,7 +54,7 @@
               Changelog
             </a>
           </td>
-          <td>2025-09-07</td>
+          <td>2025-10-11</td>
           <td>
             <a href="/downloads/buildroot-2025.08.1.tar.gz">
               <img src="images/zip.png" width="24" alt="">
@@ -70,7 +70,7 @@
             <a href="/downloads/buildroot-2025.08.1.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
-          <th>Stable</th>
+          <th>Stable (EOL)</th>
           <th>2025.05.x</th>
           <td>September 2025</td>
           <td>
@@ -79,7 +79,7 @@
               Changelog
             </a>
           </td>
-          <td>2025-09-09</td>
+          <td>2025-10-11</td>
           <td>
             <a href="/downloads/buildroot-2025.05.3.tar.gz">
               <img src="images/zip.png" width="24" alt="">
@@ -105,7 +105,7 @@
               Changelog
             </a>
           </td>
-          <td>2025-09-09</td>
+          <td>2025-10-11</td>
           <td>
             <a href="/downloads/buildroot-2025.02.7.tar.gz">
               <img src="images/zip.png" width="24" alt="">
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
