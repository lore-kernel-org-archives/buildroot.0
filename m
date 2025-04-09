Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB69C369A5
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9405161778;
	Wed,  9 Apr 2025 20:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UpFEVfidyDg5; Wed,  9 Apr 2025 20:03:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2A3E61079
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2A3E61079;
	Wed,  9 Apr 2025 20:03:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ADA5201
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 466F540A05
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UcoJNSkPlyh5 for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 72977402CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72977402CE
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72977402CE
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:48 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39c14016868so6454962f8f.1
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229026; x=1744833826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mgt+jof90VzHPy6kw5jLtt0Iigi7y5PmPHVExKdnbcU=;
 b=cX+3xjYrAtZeaogm+UC2jGEok0qeLv/k1XjwH4Sg02TM0N0jjf9zKxFWCSibZneBfi
 /xclUUo8hnt1fmPIjP3zrAe+phPOIgw38/Ut4GUsoGEnJjRzu6OWJ9dZEJA5/9Zv6dmw
 L0htJg981oBwYctjmwDMeUgHoreaBKInROGVAULIBeK1jS2ACdt1+uQmYAcofq8Mh77Y
 +xKvoWOZ/B4CtcWHfKL30J+cp2Sz/lSwgbLtM6KulWU2uS5JidniMvUUvQiBPEfPVs0G
 sFYTS2YIZS7qIO3RuAtYr8MWselzkq2yskZOxqPCPHGK2atm1ZgjuL0+ju9PxqwEPQkO
 wx6w==
X-Gm-Message-State: AOJu0Yzdy1OxgBOC2BeRrJXDF6Dmk9Ybb5Wrdmq5xoLMcKYA9+udqn4P
 oLKe+eI4JEwZca9zD/hASf/i07CZnrRgsIqHeC0JrPmbYm3ZxqyYEv34xg==
X-Gm-Gg: ASbGncsjQxKjK9CzM94veXTU0K1Yk49eFmSR2TB3XkzQMk1sF1ZNZgppGzrz2eYaKE9
 hd5TBMHaMYf+22gxnNJdIQg22fqsI8hiPbJ1SvMnG+y1GKgSnx0KHd7nY24eEtVFPAbrioszSNR
 F644L6GrQX4Qcr3JZEI1RaqNM2aZqXk2sYVmRDIGsHsCrC60IYcLFjZ0cR1wUzJdLa0KMDJWzdW
 sE8FBIUG6YUZ915VrDw5gVYfFZWx/ofIPUMjcyFr3dg8tzXFhMCWqcgREJBznhK47ih52M+vHlO
 tJYlDu53t58xm+zgbiW+QIZEApQD6z3/VSfhSF0sP9m3y2mgUjM=
X-Google-Smtp-Source: AGHT+IFep3mHl7OruNrF4peFY/uNBwUoCECwPUa1XJseLxpnS8CkTrpKCY9X6ZWxOixD+BnN9dVdGw==
X-Received: by 2002:a5d:588f:0:b0:391:12a5:3c95 with SMTP id
 ffacd0b85a97d-39d8f469982mr66620f8f.22.1744229026180; 
 Wed, 09 Apr 2025 13:03:46 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:45 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed,  9 Apr 2025 22:03:18 +0200
Message-ID: <2555fcb808361d46ba3921f470fae37527ce9fb1.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229026; x=1744833826; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mgt+jof90VzHPy6kw5jLtt0Iigi7y5PmPHVExKdnbcU=;
 b=QKqSn5yaEeyRnkdz6Ee8045aipgBYg41FqkY4sPcOiYmfkIeMYqqxDUIlnS5Dyvayi
 Qh1vBcw78afnxc7B/lVXyGAdgHAwj+XCtUton3iTR8Szfcr3LH+6cT5cPjDRWermIylG
 MlSCPgzbpKFBx2Zh8SjjXNA+uzjOL2k+oehk0Hq11vybhsNBXxG9JyDUGGmZqKZ2/WdL
 CiARglzG+2BvVT8zPR5tPpzhJ/t+iC+svXQ4N6ZtgyS3o4pd+r1/gVZSpJTfhGYaw5B/
 mmQjFtpUh6dz5qGVcoeSF0onoWwSRogtvSJmmUISY/4QNGguAGY6+Gik8926s7Hw6SO3
 2Rmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QKqSn5ya
Subject: [Buildroot] [PATCH 03/29 v2] package/dejavu: ensure at least one
 typeface is installed
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

It is curently possible to enable dejavu, but disable all the typefaces
it would install, which does not make much sense.

Ensure that, when dejavu is enabled, at least one typeface is installed.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dejavu/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/dejavu/Config.in b/package/dejavu/Config.in
index ca549d30e4..771ec38514 100644
--- a/package/dejavu/Config.in
+++ b/package/dejavu/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DEJAVU
 	bool "DejaVu fonts"
+	select BR2_PACKAGE_DEJAVU_MONO if !BR2_PACKAGE_DEJAVU_HAS_FONT
 	help
 	  The DejaVu fonts are a font family based on the Vera Fonts.
 	  Its purpose is to provide a wider range of characters while
@@ -10,6 +11,9 @@ config BR2_PACKAGE_DEJAVU
 
 if BR2_PACKAGE_DEJAVU
 
+config BR2_PACKAGE_DEJAVU_HAS_FONT
+	bool
+
 config BR2_PACKAGE_DEJAVU_MONO
 	bool "mono fonts"
 	default y
@@ -17,17 +21,21 @@ config BR2_PACKAGE_DEJAVU_MONO
 config BR2_PACKAGE_DEJAVU_SANS
 	bool "sans fonts"
 	default y
+	select BR2_PACKAGE_DEJAVU_HAS_FONT
 
 config BR2_PACKAGE_DEJAVU_SERIF
 	bool "serif fonts"
 	default y
+	select BR2_PACKAGE_DEJAVU_HAS_FONT
 
 config BR2_PACKAGE_DEJAVU_SANS_CONDENSED
 	bool "sans condensed fonts"
 	default y
+	select BR2_PACKAGE_DEJAVU_HAS_FONT
 
 config BR2_PACKAGE_DEJAVU_SERIF_CONDENSED
 	bool "serif condensed fonts"
 	default y
+	select BR2_PACKAGE_DEJAVU_HAS_FONT
 
 endif
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
