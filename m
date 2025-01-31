Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BF4C02190
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 05:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5A4E60B07;
	Fri, 31 Jan 2025 05:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Zs7CjK1MoFA; Fri, 31 Jan 2025 05:40:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E16D960B0C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E16D960B0C;
	Fri, 31 Jan 2025 05:40:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ECD816E
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 05:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F128360A65
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 05:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OQqCz3FTDzB9 for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 05:40:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3033060740
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3033060740
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3033060740
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 05:40:48 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2f13acbe29bso4236248a91.1
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 21:40:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738302047; x=1738906847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fdh4QJ+wEYQd/lxHlKo7CvWmH1lYRfro3O8v/AwWBMc=;
 b=kTnuKuxcqGEEJa7QvL45lCb5wo8bArkW+UWd5F8mRRB/hGRRF3yzH1ywU55KB1KUbI
 IRw5TWbZwKIxeNQ55/4660EPUKO8nUe+6iZaAVbnkMaolE2HoydZO9xrVKrcvNHkDFyV
 Z3HicL8lVnc4DCdc4rlXR/NUYatatiNrpvig7Kh7kzE8i7SU1/25TB8yexbxKkwRdNMQ
 Kac0+QzBm9AER0uGVgSP+fHX4uvh+nFQb4QB193gxTUX22uHphpjfskeukzgJF8Jwbjq
 47gQJFkgl3kejGwrAtaEPybnMz4ZLaw7bdlVR0dy8MN/dSsCTlhl0R9wkc8JGgHFYVY7
 YF1A==
X-Gm-Message-State: AOJu0Yz+CODC1egRodEZ+9TgDJ+LY/o56WzjHGvtSij4JKpuZ9grbvMi
 7esAL704S3ZwXPKgyKYm0NnIwGvBmujWvdMVHoYzf2GyDm6CTOJDeBkNGFvTbobtTS/CkmKGB7j
 p
X-Gm-Gg: ASbGncsHulq0kdVuGU1UiwnsOBKhZeBeWIwY+dveKA0oXMz4lApL402dnYhTpgeFASh
 RvOYv3VVat6vtBwEREvTFDofFuLQSHDRBiwhduYn3SWBEEmNSpz/UZayw314a0jTDgYQRJRQB9o
 gYsmBGKH1Vnzocd2Sd/mbhC4VRZ/R9weC1IcORk9HHsZMsa++eW0rMX5xO5VIhkj70gL4jR4bfB
 w8EWTgqPkz+ZAwwX4063V2q7CKDlhvFZbGQvhoEFNsWqLGfeVi5GxIsGwYMgFHPtL2JOOK9WTg4
 2+p5beBiRmtAt1aecVFzilR/YcnNt44WIfRWU+BiOBRNtlcsM5KuZoPAfEuGYTe+U7Rrx37T5Mg
 Uz+Y=
X-Google-Smtp-Source: AGHT+IG1jhqUn1k3gKGI4Imd3sAz12Rq04nMRjTylKX/IwVF7AynhetPYSmZmBB+OAqR4+KlzEGm7A==
X-Received: by 2002:a17:90b:1f8e:b0:2ef:ad48:7175 with SMTP id
 98e67ed59e1d1-2f994f638ebmr3512442a91.15.1738302047321; 
 Thu, 30 Jan 2025 21:40:47 -0800 (PST)
Received: from localhost.localdomain (c-73-35-224-251.hsd1.wa.comcast.net.
 [73.35.224.251]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f83bf93c23sm4986372a91.39.2025.01.30.21.40.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Jan 2025 21:40:47 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 30 Jan 2025 21:40:36 -0800
Message-ID: <20250131054036.74707-2-christian@aperture.us>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131054036.74707-1-christian@aperture.us>
References: <20250131054036.74707-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738302047; x=1738906847; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fdh4QJ+wEYQd/lxHlKo7CvWmH1lYRfro3O8v/AwWBMc=;
 b=AMEzB4IST/86Sk6vq+dU/50YZgCwlOKlqbKZ1uS0uBwCVEjzZ4o6hS9kRvIgd2Vp6E
 Du+VkXV/VlaMroMj+peH9Vl6xXwVsgbf4EPxCNpzOkGR/wGjLUpfFf7Kt/DkCY4L+pXd
 JJmfkvEYKd7oOAq25C039xbxxBQoukogskIHZVjOAmpYMAFUFP58+tkU3+caJyc9dXmx
 9E7Hn8lcHLxd6YT//5EYyOWlsHmxM8BfybdDRmBFsMgCnahvJ5ANaaASwBeIm7Rbei4S
 SJQiuGtdBGdP4M7hJI/ItV8rlU7ApSFX9DhlweiL/X/PD31Ehm0hRGXXC9aDvGF2S+7a
 stqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=AMEzB4IS
Subject: [Buildroot] [PATCH v1 2/2] package/docker-cli: bump version to
 v27.5.1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Joachim Wiberg <troglobit@gmail.com>, Tian Yuanhao <tianyuanhao3@163.com>,
 Christian Stewart <christian@aperture.us>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/moby/moby/releases/tag/v27.5.1

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index c70d274f96..154063d89a 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  df7d44387166d90954e290dfbe0a278649bf71d0e89933615bdc0757580b68e4  docker-cli-27.3.1-go2.tar.gz
+sha256  abd16e3911bc7bbd00596ebe4f58baf3d577160d99eefd749a908507ddfc587b  docker-cli-27.5.1-go2.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 39e1367908..e118481838 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 27.3.1
+DOCKER_CLI_VERSION = 27.5.1
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
