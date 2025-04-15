Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A5CC369C1
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 19:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 443F8411C4;
	Tue, 15 Apr 2025 19:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6w2H4zmkKh7; Tue, 15 Apr 2025 19:56:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6714541123
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6714541123;
	Tue, 15 Apr 2025 19:56:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 239E4108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8CC860B0A
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lo2e7OxwrI-V for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 19:56:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A3B05610F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3B05610F2
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3B05610F2
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:13 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso7798036f8f.0
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 12:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744746971; x=1745351771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vhb2bvi5lZU5UuR+LvNrQL4ysVGj9jJayYQOp+JIEr4=;
 b=uuX1mmiMO+BlJc0BB7uAPJA6wOxGaS35wO+HbMqlefFI51sVbTN0DehidAmRfYVncP
 WpmUGCuhDKpu3EXAurwg9GY4nt/e1GvqgNiKisvabcC7FsT2E0nBrtKX/js0wme/FnvN
 rwisjiVffbrvRmSfdVL3IMfKFOxAO4RXGGT7uhN3nDSCKDhSIWWF+nTafjoVvejzfjaM
 ZH8VpuxAe+Q6aFl5R+n7qjTZWYkmgiHRErBYaJq+xtVG+TGNNlS0SgI3JTbtztziI34s
 2OKfSi7x9b/6SaHcb8Lw/OlrobQ+wCqAKYz60Xgw1KW5OOVstlJM//T0hcxF/OnlaFs/
 RqEA==
X-Gm-Message-State: AOJu0YzFw6jcLa6SxL2INPgtjG9luL1hVzw5ULUsikcMpk76QUqKOgLc
 FaWnCNhY21T/3jD+x8/TeDIpNymDJ16PbEodFAR4h5uPsCM2DTAGO+AxxUTJnyWSNSSv1PgB5qS
 Z
X-Gm-Gg: ASbGncvtt3XHYA/Pg47cHvMUu3y24deNzNeBlnP9+ImJ822+MUK3gb9wDftbe4cI/+S
 k3ce/fgz3RJsmfBGigSv/N0aVgJRFGvAkk5QVa8lcNIm/l8F1p4Vd4IPpe4g0ZrWbJCvo04CtDx
 Xx5wO3d/wlviVkUQTat+0suWiYGxgPrHJ1bG/yAq0DxKi+nQns2Zq3fo9DqnJm6YxYoi3Yht2PE
 JD0TyjFaL3Qe1xq0+Y209CO8UhPVXiwoZfiYNCiIb8NDPK6P1SL3MlcBtlqqBZyK2IHAbjWuhIs
 dqNNdRYPMf3HGbUFHnfXBuL5IOOV+DAgm8HTrkcR4fp5qVKyYfmyaCE=
X-Google-Smtp-Source: AGHT+IG3CGZ7rAcwR2l8UR0fz3GyFhowkNbZr/H2QP4J7wkImqqKGykaW7EaTyjG8EFFb+1+DZF+Yg==
X-Received: by 2002:a5d:59af:0:b0:399:6d53:68d9 with SMTP id
 ffacd0b85a97d-39ee276329emr631651f8f.38.1744746971394; 
 Tue, 15 Apr 2025 12:56:11 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf447777sm14957366f8f.100.2025.04.15.12.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 12:56:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 21:55:35 +0200
Message-ID: <20250415195547.199428-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415195547.199428-1-thomas.perale@mind.be>
References: <20250415195547.199428-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744746971; x=1745351771; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vhb2bvi5lZU5UuR+LvNrQL4ysVGj9jJayYQOp+JIEr4=;
 b=TrCWqoiBxv8XtKkUSIqeLtrQDuxNsY58ebWaiYvtIRWAOz/9B3NZa5sf2rEhzVn+YA
 tip+VkLyLZ/ZyC8FlGiqXxepIftpToprX0JCzF5+C1YsZin/0nV36M5Urgen9WWEcG4t
 tp/TqkZUbdk3Q9HyI6UP73foiV9ZwDpMlj67ZJlvf9neZBoPnTpW+GYmZh9c04wmjyM7
 YcHdkf85nhi0xg1y2wgNeJ/WmspQsYK34yQNsVaLZHBk30lQGaWbiDwYTSEJUN3cdgd5
 jsUZbNPHXqcVmdVrmDRYiM8ZzfjYXzCvVQ+sTE6eA5yJo3p7XGlSWtH7AmMlBElWlZVC
 eNBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TrCWqoiB
Subject: [Buildroot] [PATCH 2/7] package/pkg-download: add 'owner' macro
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

This patch introduces the 'owner' macro that retrieve the repository
owner part of an URL.

This macro works for repositories that share the URL scheme of website
such as Github or Gitlab:

```
https://{github|gitlab}.com/<owner>/<name>/....
```

The macro will retrieve the 'owner' part of
the url.

For example with the 'mender' package version '3.5.3'. The `MENDER_SITE`
variable value is the following.

```
MENDER_SITE=https://github.com/mendersoftware/mender/archive/3.5.3
```

Calling the 'owner' macro will retrieve the following.

```
$(call owner,$(MENDER_SITE)) # mendersoftware
```

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-download.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index cf5959ea95..3c946a3f69 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -49,6 +49,9 @@ notdomain = $(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$
 #
 # default domainseparator is /, specify alternative value as first argument
 domainseparator = $(if $(1),$(1),/)
+# Retrieve the repository owner from an url
+# owner: {github,gitlab}.com/<owner>/...
+owner = $(firstword $(subst /, ,$(call notdomain,$(1))))
 
 # github(user,package,version): returns site of GitHub repository
 github = https://github.com/$(1)/$(2)/archive/$(3)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
