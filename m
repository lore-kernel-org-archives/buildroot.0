Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0D3C02188
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 22:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94D43810A5;
	Mon, 27 Jan 2025 22:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AH6968Ii0YeS; Mon, 27 Jan 2025 22:17:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F5A1810A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F5A1810A8;
	Mon, 27 Jan 2025 22:17:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4415694A
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 22:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A24CF6068A
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 22:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRDmHBybYhP2 for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 22:16:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=patrick.oppenlander@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C96CB6069A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C96CB6069A
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C96CB6069A
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 22:16:59 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-21631789fcdso79524425ad.1
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 14:16:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738016219; x=1738621019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EoUTZLwwPZEqEnreGdvqhSXiJEIyTt1DJXAG2ToFuYA=;
 b=bvK/6SDPJJhrWwvEaRau75P7jgcwOfgW5Ze1s7iEi1AhUgeFQ583jt8t4fng3wzrhZ
 8sGQwNzHJFEFSkStoyXjFkMAx+Afkak8YaReRyXObs4Jjw2ITHcaVautgJW1d3CLbzWN
 oeCXPakTXV9hpAxsnnsef6j8BZlnymNlepNMkJkPRnYx3i4iIdh3KpXSA0g/TIdzn2CG
 CAf1a1T/r1G3QnimZPeUkBhj5WMbqDKweOCammWTVpKq0Crj9TqHk1vCtVhZLPX44EgC
 8rPPnyucTdhEmV6Y8lu8k6xfluR9O48kTVOthvjoLP1zrX8KPVJmwMgsNpIQbYrZlnle
 UDFA==
X-Gm-Message-State: AOJu0YzGaHUbgGv2y3U0gdwUiEeYAOY3xx2h+Cnk3hl+3O3UWdJ/lgwR
 uJ2RlPdU+m2msmhRHvvqUwb6i8cidwzVFsUrL+dxSRB3RHUuvfATKJrhJQ==
X-Gm-Gg: ASbGnctHuA1krJ7B3TY954109UGS7bPoFURGQIARyDaEB9G9mc218DUU+XpdyAmJlix
 PQm7P7nNPNRR6zBVlKTz/FLOs4T9HkgG2IkURgTcWsv0QOp4mkvGNHwpmHrOmk/IfO7fQFEwiq0
 54UdrgawlWZezTyPkloUnEizVZ+x3omozKZ9gyQ3+i+Wb6mjCi1/ZNDhr8iPY9cSnHi8d9aKTIs
 RqvhrCgCmfb82wwLV8++9CVoflZ/SOARCZ6qCoKjJy/A5sLzxpgI89CjWklutUqeSmtTCHyOk7k
 zO1gADdIsiVRxlFcgVJJ4vngZ7ehoA==
X-Google-Smtp-Source: AGHT+IH189SpC6HF7oZ+E/72bBrKNcb3WlkSYkj4YBcu4SgrTxEqa0MWHpCiU88on4jfInw9aWFfWg==
X-Received: by 2002:a05:6a20:a107:b0:1e1:b1b4:59b0 with SMTP id
 adf61e73a8af0-1ed6e7672b3mr1670124637.18.1738016218640; 
 Mon, 27 Jan 2025 14:16:58 -0800 (PST)
Received: from pox13.. (2403-5800-b00a--dc1.ip6.aussiebb.net.
 [2403:5800:b00a::dc1]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ac4970880c7sm6986528a12.76.2025.01.27.14.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 14:16:58 -0800 (PST)
From: patrick.oppenlander@gmail.com
To: buildroot@buildroot.org
Cc: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Date: Tue, 28 Jan 2025 09:15:35 +1100
Message-ID: <20250127221636.5746-1-patrick.oppenlander@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CAEg67GmDfqCn5w=XoNyTm7EDFgUOr0kZjgtnbk0A5ZtPHd7HXg@mail.gmail.com>
References: <CAEg67GmDfqCn5w=XoNyTm7EDFgUOr0kZjgtnbk0A5ZtPHd7HXg@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738016219; x=1738621019; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EoUTZLwwPZEqEnreGdvqhSXiJEIyTt1DJXAG2ToFuYA=;
 b=Y9V03WCayLq7L62ph/XPAkIQeKgYgfViV+zPLX6HhB+bFVEBDPVapm4f2jM+BR0vbI
 uwwkzogQmwLzPXf2iQcuS8ZehTKQo1aFR/lCBxDjyymzcnNY8viHjaLL1i47E11lsNws
 w6k81Ow5HRUNwS/McYq7NVSwwlvnlshr5CBQJl6fr26UqJXYwBx2eyl5zHfvUkZnjIPV
 Rl3qfDjbXVwXMhrUSUE/A04SXR/UcI7J4E0EctVP3KWyu37CdFieiXlyfkFAGNPaRFVH
 TlwGHnxn3BEzRNI/tB39CtTicPd1fMpZDvjHZzJxkPH+w6p7EZ9KW378wsdB1fbuG2fn
 Fn3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y9V03WCa
Subject: [Buildroot] [PATCH v2] package/minisign: bump to version 0.12
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

From: Patrick Oppenlander <patrick.oppenlander@gmail.com>

Upstream license changed to include 2025 in copyright years.

Changelog: https://github.com/jedisct1/minisign/releases/tag/0.12
Signed-off-by: Patrick Oppenlander <patrick.oppenlander@gmail.com>
---
 package/minisign/minisign.hash | 4 ++--
 package/minisign/minisign.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/minisign/minisign.hash b/package/minisign/minisign.hash
index 12cde42a43..e918891aa8 100644
--- a/package/minisign/minisign.hash
+++ b/package/minisign/minisign.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  74c2c78a1cd51a43a6c98f46a4eabefbc8668074ca9aa14115544276b663fc55  minisign-0.11.tar.gz
-sha256  d775d155cbf31638714c31c6f990f9fdc5f07998d91e42d1bf15483bd2d1706b  LICENSE
+sha256  796dce1376f9bcb1a19ece729c075c47054364355fe0c0c1ebe5104d508c7db0  minisign-0.12.tar.gz
+sha256  01aa50818d6609e85a9610b7d04da037e8b28bcf3bb5b5b4963c0c3f7abdabbd  LICENSE
diff --git a/package/minisign/minisign.mk b/package/minisign/minisign.mk
index 7cdce597f7..5cc8e14cba 100644
--- a/package/minisign/minisign.mk
+++ b/package/minisign/minisign.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINISIGN_VERSION = 0.11
+MINISIGN_VERSION = 0.12
 MINISIGN_SITE = $(call github,jedisct1,minisign,$(MINISIGN_VERSION))
 MINISIGN_LICENSE = ISC
 MINISIGN_LICENSE_FILES = LICENSE
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
