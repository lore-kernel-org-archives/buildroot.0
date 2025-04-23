Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0D1C369D1
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 13:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76FC18305A;
	Wed, 23 Apr 2025 13:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F8IVSZSaoIHp; Wed, 23 Apr 2025 13:57:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D82F83122
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D82F83122;
	Wed, 23 Apr 2025 13:57:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EEC9019F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 13:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D475540C33
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 13:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rR-dk8FG7Lna for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 13:57:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=josephzik@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EFF0E40C2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFF0E40C2A
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFF0E40C2A
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 13:57:39 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e6dfe6d4fa8so781762276.2
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 06:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745416658; x=1746021458;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WCXNDUVbCCe+IfWPTAuKP+MPZ7JELuuoMrSjwaNxeXc=;
 b=c+OJsZAVFZqBijr7wQKXEJjhCgS+42Hopr8V8nHOvtqKZx93opythIxojwCHDCc63b
 MKkMQJvy3fjnsjXPxN0bkH2+x/FhALyiyFVx6x0nB+CKiMb7xPuVs1qfIHb6rphv6cad
 fdvIlK7sDsjJ+sF5xSkG5zfElev0J5LcIHivShuURWm9xnu1ljzq1VWaLGAlKazrgdDe
 ALR8YGkLf3cXDOkxC9qHJmTdTy7Cle50BqbjH11HIdINYRSy7bbCU5GFGXBBB0iXxFTP
 83sm1DOM1sGIaTeKG6H8Bc9ySUV5DRDQ5s0Rq9ykmMDw5zOZaRk/ypCKB5YFYOpskE34
 7ICQ==
X-Gm-Message-State: AOJu0Yz3YyPfgZfQVMXVHt37kRVUEjdfV4Uc7XRgS3hiUkOJZRuFnqmv
 mvXTLZMUIYBXmHkFEgEp8YHnJb19zIwc9niZxn7UXewHLgZtfVStWH+qTik8fdIgxxjVx5NhcKS
 5VuzPjduGiwEeQm+wA7p9sF3TGCWxVtErFY4=
X-Gm-Gg: ASbGncuA2dkJORcR0CggbK6tgRDFxkdpnCJdUc6sDXY5o3HOxPm16tDQnvenAeVab2Q
 Nhv7vlQlurHs+pJ56N46Y/QkHozsnW3Q0bBK/vm7Pf2WSyIEkfIIw3ISM5JrfEVcxn7846r32BF
 ubbKHNKJqECiCe0dt8fjyc
X-Google-Smtp-Source: AGHT+IF5OInzIA/2jXaoIueAVDYZIt3iCtiApnY27tSC5ozY0FKcmZJODEKJ/tBOlBt/8p8BiPhOtHHsH4LRisg3o6Y=
X-Received: by 2002:a05:6902:15c7:b0:e6b:723f:a59 with SMTP id
 3f1490d57ef6-e72ebff9104mr2115480276.1.1745416658562; Wed, 23 Apr 2025
 06:57:38 -0700 (PDT)
MIME-Version: 1.0
From: Joseph Zikusooka <josephzik@gmail.com>
Date: Wed, 23 Apr 2025 16:57:27 +0300
X-Gm-Features: ATxdqUFgWCMAh6a-D8ndM9yf9wghpScEbJWsQdpNJK92djB_8w1xIIsRS4Tt8KU
Message-ID: <CAPWx8vtV-2c5d-rHmeRXMOCohm8vBwDmkD2OGk=Fhnuh49Lbsw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745416658; x=1746021458; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WCXNDUVbCCe+IfWPTAuKP+MPZ7JELuuoMrSjwaNxeXc=;
 b=FsXOWnwLhoMEN+r1LKA6tuIn1UlRqIcSySDjCrcfHD/xLb2SZPFmpdcXe7VsYBdTBB
 tRECZABBaO9FhZccMEKp0ae1bwUhrp0Z06Hul6neZaQLPrtOOc1cLK4b/E5ILp7f3OF3
 Zh8IgsSZsJKPGao21Jew6aiKsxxkBFFyv6rpzf6fnQ4zqrXfn9fBV1Q4z4fjEdjhCZP1
 YnwlCSzOuGvBRTpODfi79hfvN7RbAMsu3yGYLXgwMaCOpWzn6RadhEBsyvRyb8Gmj7DE
 +PYhQfaiLMgHE+VAf9MrtY2zP9OQq1v2HDZDZFUOp1SnC55n0MtewJvqoqPToBGzOB5S
 kQKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FsXOWnwL
Subject: [Buildroot] [PATCH] package/m4: fix build failure with gcc 15
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

From 08d03e3ac14325a05942a632c8cf7b2a7c06d880 Mon Sep 17 00:00:00 2001
From: "Joseph Zikusooka (ZIK)" <zik@jambula.net>
Date: Wed, 23 Apr 2025 15:53:56 +0300
Subject: [PATCH] package/m4: fix build failure with gcc 15

This is a temporary workaround to address build issues with host-m4
when using GCC 15, as encountered on
the recently released Fedora 42. The issue stems from stricter
compiler behavior introduced in recent
bersions of GCC.

A proper fix has already been committed upstream and will be included
in the next release of GNU m4:
https://git.savannah.gnu.org/cgit/m4.git/commit/?h=branch-1.4&id=a22c9802dd7e724eaefb21dc21d84ac2d3a49c89

Until that version is available in buildroot, this patch ensures
continued compatibility and successful
builds.

More context:
https://lists.buildroot.org/pipermail/buildroot/2025-April/776922.html

Signed-off-by: Joseph Zikusooka (ZIK) <zik@jambula.net>
---
 package/m4/m4.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 39ad898b10..ab8e194b06 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -10,4 +10,6 @@ M4_SITE = $(BR2_GNU_MIRROR)/m4
 M4_LICENSE = GPL-3.0+
 M4_LICENSE_FILES = COPYING

+HOST_M4_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=gnu17"
+
 $(eval $(host-autotools-package))
-- 
2.49.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
