Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CB3C83F2D
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8455419BD;
	Thu, 29 Aug 2024 14:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tl-YClrcDjZO; Thu, 29 Aug 2024 14:50:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2510041A38
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2510041A38;
	Thu, 29 Aug 2024 14:50:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 101941BF31A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F21744016D
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YltYuoQ5W08H for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D229940132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D229940132
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D229940132
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:30 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42bb8cf8a5bso3412145e9.2
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943028; x=1725547828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rPFSOnOV4pY0yeNzI2eWDCPciWSak5TVYCuWNBKlKrM=;
 b=EApvyyn2NV76oVN0QMpQgRyrcGgByE2gcLW56t11g+be5SsgCfnQeQRk8l4OSPTubH
 UxvfcdVKEqZFEwk3AA8DaC9yllzKmv49tzYSul5IP5wmMJn3WZWmlv/zS+/6WFD0gzue
 PcuVybpdgtkhojjkwFMLA1wi3c5KRMtx2rX4wO42kZWQtZk+WRgd0QYhbVuyDMhmKg6M
 8aiJwHj8zWt9aakytyAv4wM9IHxxKBE/CRQKrhN8GE7vontAA7GrX43/CSZS3whT7e1+
 0Vq2gnOF1Jb4JAIFBNm6cUlIhIJSbKgbea9FIjY8ubf5jKyxlzBkZGBk8FT0ncdMcMda
 /Vkg==
X-Gm-Message-State: AOJu0Yy6kViivwZTYT1ITVzV2VY7nYHdCY8ViImKioseytWystFGRidh
 +LbOZO5Q7wWXHd2tupYHU6POqF7QLi0lNCpn1hIDz0dZqUQqJTUMinkoww==
X-Google-Smtp-Source: AGHT+IHDkVA8WYdYdfBlOyxQ7e9FVJD7rLewtHU9ivndEocXDVTdOAvqry9/ZQGJSMIP5ZnZcZcyGA==
X-Received: by 2002:a05:600c:3b11:b0:426:5f8f:51a4 with SMTP id
 5b1f17b1804b1-42bb0258ac3mr24906595e9.12.1724943027974; 
 Thu, 29 Aug 2024 07:50:27 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:27 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:25 +0200
Message-Id: <20240829144940.209964-10-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943028; x=1725547828; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rPFSOnOV4pY0yeNzI2eWDCPciWSak5TVYCuWNBKlKrM=;
 b=BPabKVBA4540Fl3jncg/Vfy66xge41cfJmR4ROH+/AZVFzOKZZSGH7IDg/XxjIBHha
 8TfGSf+FDElcuCRnCpvuAxmqi+JST+LoZIBJHAHGQKbobzai37eFTOr2ZCYVt8JhYRSe
 maQBiBtKsBtfRiwJKkI2Fc3DN0toPHV42ZYUZ1BUWFayfckpjM5vDl7eMDW1SUy56bxK
 5iS7WaylBcXelWJe69zajx7qHvdfdzREbp17DjaEBeQOkU9N5q8Lo+FYEYDG5G3ukPPV
 eURh4ZJyTTr65/QJEpNAJEgGsdmoB7h3/rsJgsFarkEGuatGVRm7jOik/NEGKzpvxwY1
 DLHQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BPabKVBA
Subject: [Buildroot] [PATCH v2 09/23] package/erlang-p1-tls: bump version to
 1.1.21
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The license hash has changed because of a year update at the beginning
of the file.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-tls/erlang-p1-tls.hash | 4 ++--
 package/erlang-p1-tls/erlang-p1-tls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-tls/erlang-p1-tls.hash b/package/erlang-p1-tls/erlang-p1-tls.hash
index 9a14a44293..b88844b3c1 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.hash
+++ b/package/erlang-p1-tls/erlang-p1-tls.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8c38768998e8ee0aa2bf5831bc25deeb4ea2e08bd52e26b2abfd654504fbe4f9  erlang-p1-tls-1.1.16.tar.gz
-sha256  c835791cd41a32f8ef40e2255d141ab7faec2f28fab68bbd685c6110fb83be4e  LICENSE.txt
+sha256  08235a436f2222d6caf6b17e4e1471c65bf677dd2f5659d9174160dad4f51b7a  erlang-p1-tls-1.1.21.tar.gz
+sha256  823a9f2a803502343d969639e581c206d415cef3089ddcbc4f7cc02de201b8da  LICENSE.txt
diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
index c16a124068..3fa849d133 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.mk
+++ b/package/erlang-p1-tls/erlang-p1-tls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_TLS_VERSION = 1.1.16
+ERLANG_P1_TLS_VERSION = 1.1.21
 ERLANG_P1_TLS_SITE = $(call github,processone,fast_tls,$(ERLANG_P1_TLS_VERSION))
 ERLANG_P1_TLS_LICENSE = Apache-2.0
 ERLANG_P1_TLS_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
