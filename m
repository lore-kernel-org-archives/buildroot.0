Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D74C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 16:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6908F41C98;
	Fri, 28 Jun 2024 16:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkuA-p-Q-I4S; Fri, 28 Jun 2024 16:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CFC441CA3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CFC441CA3;
	Fri, 28 Jun 2024 16:09:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D082C1BF39D
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 16:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDCB2812DE
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 16:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jw1UBWTef5Ec for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 16:09:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D3EDC812CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3EDC812CC
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3EDC812CC
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 16:09:38 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1f480624d0dso5674115ad.1
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 09:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719590978; x=1720195778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kc99TO2XAPi0tH1y56RQ8ZTeRFaxnclO22fKp3MaA/c=;
 b=QSG7vp9fjFh+U52MkIPFHXShbEfDMxadEIeH/u5vJTnpEtpx3YFSbe2XAF0TtbJfC9
 WSEUkSSwCibqS7LkZrQKC+YfUTQcK6PP22a49Yv14cYXePwQ3dAsRlQ0XyLKsQ3DMMaC
 wIvFPZTz6epL0a26dVbpoSeYhDM1RkKKo/RJup8oOwBAKMDrfx0N3Hf9LYj/Wtf1WxVT
 XlxDv/xTM6eraFb+BzN6eg4yPZre0ZovlmRusCr/mS7UcOe2Qgs6dHexgGRNie0wmOSd
 lWjmRN4zCYw631jkdmjOBVG9ikeRg3+Jjfn1/2boaaUKqRiUmqeL256wwWUXWLukplAC
 RrdQ==
X-Gm-Message-State: AOJu0YzcVUP440nw8wPqXSeeLVCH3koEvAg5HJIUEOFGvnW0wiiFBIPu
 liXfrzbPGSGqmb5tGaFN0PWk06ytxeq3SIsDAhXPvw3h6QNzwbLYhtn8tE9aUGwdwbXl1zT4Nrx
 7wwguoHlq
X-Google-Smtp-Source: AGHT+IFS6jvuQFEd/g5JqryVCAsiJ3h+uCWgs0UWyw/JQ3r9DSuEaz8Je2cPWBDapg/XvwixqvFrIA==
X-Received: by 2002:a17:902:d4ce:b0:1fa:acf0:72ab with SMTP id
 d9443c01a7336-1faacf0753emr43207135ad.16.1719590977619; 
 Fri, 28 Jun 2024 09:09:37 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1face441a1dsm10220435ad.39.2024.06.28.09.09.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 28 Jun 2024 09:09:37 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 28 Jun 2024 09:09:33 -0700
Message-ID: <20240628160933.50208-2-christian@aperture.us>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628160933.50208-1-christian@aperture.us>
References: <20240628160933.50208-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1719590978; x=1720195778; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kc99TO2XAPi0tH1y56RQ8ZTeRFaxnclO22fKp3MaA/c=;
 b=yGutBmw1z01TNk1vXMYbz3TCf9MeNKHIJodbJaKcNs33s/loikC25yXdlVSCtHHC3S
 a3XHIE2niZd9/9iVDwvPJ4Vnv2lMlyxZqlophJg3qNaj0V6QJoaoqb8XNBPP+BacL85M
 h5fkWqU+5dTceBkZpFZVVslj1SNW8Ol+T1un11TaOOb7lJX4y0aINA0G3auC5zlThwzi
 wiOhublzAEXNf17+8PZYNBx3ZJFe1qAAkIXVoI8AUTZq35/mwwAoul1mGRyWe7wGrZMm
 BHNTfEQFL4V2VAVP1OFd0WSty3BHShhEYaPhSfOpYZRXpdKMMlsBOb0uF9PrjzD7lJvk
 GdoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=yGutBmw1
Subject: [Buildroot] [PATCH v1 2/2] package/docker-cli: bump version to
 v27.0.2
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/docker/cli/releases/tag/v27.0.2

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index a2bed4aaed..af26294378 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b047e180c94452b4375f7e43997286e5a5712e66b1280574974b2e117b4e43bd  docker-cli-26.0.2-go2.tar.gz
+sha256  a2b31d4c8143c8b126e98a359639f51727fc83fc1e61670efbdeaa7dea92fd5a  docker-cli-27.0.2-go2.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 69c6f12f3c..1e29f008b6 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 26.0.2
+DOCKER_CLI_VERSION = 27.0.2
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
