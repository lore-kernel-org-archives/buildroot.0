Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09B3C369BD
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 19:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6BDF835DF;
	Tue, 15 Apr 2025 19:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ciuHFl2P-qVm; Tue, 15 Apr 2025 19:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE1BA83716
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE1BA83716;
	Tue, 15 Apr 2025 19:56:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51D05109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF4356115A
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbz9kfCEZwPS for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 19:56:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CCE2E60BCD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCE2E60BCD
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCE2E60BCD
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:14 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39c0e0bc733so5187293f8f.1
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 12:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744746973; x=1745351773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pFs99oSRf6yCtHPq7ExCCrVTMBYi+/F55S6z0VMvvAQ=;
 b=j0F/fxBm3IDensrmZnfpKSjwvo+GOjzmnrrjcXQ7syevkoKhBAdNYZ6K2HWqj6X/QF
 QxrZeXC/he5qs3jbVPZFFNA1EaQF+VjnPO44yKj0N3bm4FsaNwsvnJdt3VJJpqkx8bo4
 NdsUaJP/r63bHm0PcVo6Btdiuz1/J/lL5FB1Mn5xnlJAUb6iZVMj56HYtjfEH989DmFF
 WJ//oyi9W/ohKZq0/QVDviZaBZTYAt5ftAnUTItHwCaql0QNxb7eQLA8AqzmHOCAyosl
 W6W1xdDDcrTSdDrHt/DZJuE4E6Uv3lpHDvTyCc5fLa9DlNYiOE2DNd8fhGdQ26dKC2I9
 +F8Q==
X-Gm-Message-State: AOJu0YzSISaRO0yREDD6URhc7mbKHd9PqoONmQUEh0K/LKSgdF6EsMF8
 15ckRAqVIk6j+KkrNO5IrGpv/lORhOcXzS7pFFTKx8LUNTQ5lUueevOdXJiaYWo9DqVnvg/tr+a
 g
X-Gm-Gg: ASbGncvZ9TkJem1SiuvlAGEHXcPt8TDN3pz7vuVb+R3EpWx44/2XkXUWOhK7RjXa8tw
 udrzFhPosJjz4LGcIzTnrzyyiVrXiSAT4u5FBzJSqWVJrxcou2nB24K2yNZdB6refC6t/GnCdF6
 RnPA1Y0hzatgF0ARCdaCZam0biTZ0BO1rynT8rAU+mv16yem3vHMnhKIKJEglW+jBNNmCt0xgJp
 /rASlHqjiBeDthj7Vc9p/hDyFRo9gxVbTfOY/wjWzZugBGHfRWoB03hd3sL+0kdF081GmDqNss1
 7qWq+XTsFSFegMPtV0tSE/ChKke8Dp7xeWmUr499+1rgHBawJU0/buI=
X-Google-Smtp-Source: AGHT+IEAw3VKp5gPzo8B/Jdt5O8B5Pl5K74KhBvvbR0d3oBDVfyMtXlZlFVOCFdMlTNvN0M/gCq7NQ==
X-Received: by 2002:a05:6000:144a:b0:39c:266c:400a with SMTP id
 ffacd0b85a97d-39ee2769306mr554088f8f.50.1744746972711; 
 Tue, 15 Apr 2025 12:56:12 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf447777sm14957366f8f.100.2025.04.15.12.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 12:56:12 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 21:55:36 +0200
Message-ID: <20250415195547.199428-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415195547.199428-1-thomas.perale@mind.be>
References: <20250415195547.199428-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744746973; x=1745351773; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pFs99oSRf6yCtHPq7ExCCrVTMBYi+/F55S6z0VMvvAQ=;
 b=V2CeiJBL3zurLDVjoFcZhsoRS2JSyWB2uvbziDVFZMcK+RWWredviAL5w4CJcT0Lt5
 iTeR4Fmf05zbatnp/Y1Qg2kvh/mFK6e7DD3Gt1zF7NVorRyVreWlJnxjE8f8VjJzVTlI
 mLB/5LYWwa8PNIStYhLe6+AT7sbifMHoql8fg5YB/ToxaLdJxz1j8bZMVlIabDTRA3bq
 iarj17Bq70QBCkZXwYTXD2ZFFF/Q2fyZEjLNIeL5PjxDwVw/8bgMkjvUSallZGQEJsoj
 ieE2oQgciCdrn6/lUklBrk3x8oyBNtDFV8is9HPOcrq7hwOYh+ePcMadn13Fee8/3KOU
 AY5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=V2CeiJBL
Subject: [Buildroot] [PATCH 2/7] package/pkg-download: add repository macro
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>,
 Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch introduces the 'repository' macro that retrieve the repository
part of an URL.

This macro works for repositories that share the URL scheme of website
such as Github or Gitlab:

```
https://{github|gitlab}.com/<owner>/<name>
```

The macro will retrieve the '{github|gitlab}.com/<owner>/<name>' part of
the url.
This macro will works as well for the `<pkg>_SITE` variable made with
the `github` & `gitlab` macros.

For example with the 'mender' package version '3.5.3'. The `MENDER_SITE`
variable value is the following.

```
MENDER_SITE=https://github.com/mendersoftware/mender/archive/3.5.3
```

Calling the 'repository' macro will retrieve the following.

```
$(call repository,$(MENDER_SITE)) # github.com/mendersoftware/mender
```

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-download.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index cf5959ea95..4a2561cf86 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -49,6 +49,9 @@ notdomain = $(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$
 #
 # default domainseparator is /, specify alternative value as first argument
 domainseparator = $(if $(1),$(1),/)
+# Retrieve the repository from an url
+# repository: {github,gitlab}.com/<owner>/<name>
+repository = $(call domain,$(1))/$(word 1,$(subst /, ,$(call notdomain,$(1))))/$(word 2,$(subst /, ,$(call notdomain,$(1))))
 
 # github(user,package,version): returns site of GitHub repository
 github = https://github.com/$(1)/$(2)/archive/$(3)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
