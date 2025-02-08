Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69715C021A0
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 14:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18CE28322E;
	Sat,  8 Feb 2025 14:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pytSXHXRxAhs; Sat,  8 Feb 2025 14:23:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A66B835ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A66B835ED;
	Sat,  8 Feb 2025 14:23:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22280CF
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 045B7417E4
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgY9Kx0XVeos for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 14:23:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED25A417ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED25A417ED
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED25A417ED
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:32 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso29070965e9.0
 for <buildroot@buildroot.org>; Sat, 08 Feb 2025 06:23:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739024610; x=1739629410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2KqD7hUrcWetkbCkOVxwY6ogeWPe+1SgvenWlO6HMEo=;
 b=O3eEVj0eT5/HkMhJUe5fXlejhdZremMIRnNYaEi+4+pSnUQ+S+c3eUGP/KPJzA+n4o
 eCcYpZvxdNegkl7O5475PtNOxGjKHjM4QYKUMP4IyxXfooPkgTql7YcnzBo+ZNhzTU7N
 jZRrtrKOb1tjuUGfQ/sOW5fkdoWFrSwT8IFuLxFer49rnaLqb3DJBkqgxB2HCyaFmCre
 uKOQ0SNLsCC/lL2yeyB1S5b/DhvtXHcCy81LqDxb0OT9xo/7//6f7CU/T/UM72YY+MtO
 Np6ZEKo3f04Md0neOO3X5Wca0HKdvh2qSPuorfN5WbLhdrlm8NdsRPyMl5/yFfyXU00F
 vMVw==
X-Gm-Message-State: AOJu0YwnaMs/OLcnUuA/xK6kjus60nKEnQbJT/OKA2QnGKWeLFTslBKb
 wjY9BRkd7WhwBTrbUfjg9G8EtMP/lOI8omNe2h30+qo1sTTd70sHYCXozbvLCC/Mrk1f9MNVat3
 R
X-Gm-Gg: ASbGncvccDoj/8WZ805ZiI6op+p1SZrse/B6xqzFHQAk1fD9cWKRMS0994WqGX3dvhN
 098ZN9sIaQ0nj0eyHDffL/uBVtjFEy+xX0uHDsTajSSTyFkJMpfNnC0H8soa52D+4iE0rN3MJCa
 mLsbYYe78BAO2F65D2oQ/1X2eMEeJsZ+VqZ+Kxkr9+FDgHVi7xxiic6ZtBi55ZfQDKalxvhbuNb
 PQc2b5uTIAtYjp731a2tBCfD28mSjZIyv2IGeVGCBH+1M4IFjtuFh1QYSG5ZVsiswuiCNy6OCW8
 3anogPKupDWbb5272zHls6WgSq+Kbr/z6jhar95y0/5PD0/FyxVNUd08WC+qGsJ+WXGw0hzJiu0
 aDi4CTKHGMc5H
X-Google-Smtp-Source: AGHT+IGAf4+EftBxb4aYcqVsZKqN/UYagjC+FMT3wSfq/fHkMf1kTBoIue0guQL0M7w91qDLYcak+w==
X-Received: by 2002:a05:600c:1f96:b0:435:1b:65ee with SMTP id
 5b1f17b1804b1-43926158833mr45336605e9.24.1739024610594; 
 Sat, 08 Feb 2025 06:23:30 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf7dbcsm124290665e9.30.2025.02.08.06.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 06:23:30 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat,  8 Feb 2025 15:23:16 +0100
Message-ID: <20250208142327.418271-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739024610; x=1739629410; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2KqD7hUrcWetkbCkOVxwY6ogeWPe+1SgvenWlO6HMEo=;
 b=WFbOTjDANiw1MKh7nkiGXvzg86Fclp0hswGYHA08tRn3VnsrbvFq9osaPmFqAhlla2
 2HfeRXpzORUnIs2SpIeoB+s3wtn6EiuVgboFXXGSQ9i1L+XvoBNnig58nzdyd+vZ19Ou
 uRIj50+oFzDRSJNXKC/g+sG93vAsUZlQlroI0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=WFbOTjDA
Subject: [Buildroot] [PATCH 00/11] flake8 and shellcheck fixes for Debian 12
 (bookworm)
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series is intended to provide fixes needed to apply Debian 12 (bookworm)
update [1] for the Docker image used for testing.

[1] https://lore.kernel.org/buildroot/20250206072321.677851-1-peter@korsgaard.com/

Romain Naour (11):
  support/docker: add flake8 command
  support/testing/tests/package: sample_python_*
  utils/checkpackagelib: fix shellcheck tests after update to shellcheck
    0.9.0
  board/terasic/de10nano_cyclone5: disable shellcheck SC2276
  package/kodi/br-kodi: fix shellcheck SC2317 & SC2329
  package/kodi/br-kodi: fix shellcheck SC2086
  support/download/{curl,cvs,git,svn}: fix shellcheck 0.9.0 errors
  support/scripts/mkusers: fix shellcheck errors
  utils/config: fix shellcheck errors
  package/mdnsd: disable shellcheck SC2317 for S50mdnsd
  package/mdnsd: fix shellcheck SC2320 for S50mdnsd

 board/terasic/de10nano_cyclone5/barebox-env/boot/mmc      | 1 +
 package/kodi/br-kodi                                      | 4 +++-
 package/mdnsd/S50mdnsd                                    | 4 +++-
 support/docker/Dockerfile                                 | 1 +
 support/download/curl                                     | 1 +
 support/download/cvs                                      | 1 +
 support/download/git                                      | 2 ++
 support/download/svn                                      | 2 ++
 support/scripts/mkusers                                   | 1 +
 support/testing/tests/package/sample_python_attrs.py      | 8 ++++----
 support/testing/tests/package/sample_python_colorzero.py  | 6 +++---
 support/testing/tests/package/sample_python_constantly.py | 6 +++---
 support/testing/tests/package/sample_python_gpiozero.py   | 2 +-
 support/testing/tests/package/sample_python_passlib.py    | 4 ++--
 support/testing/tests/package/sample_python_rpi_gpio.py   | 2 +-
 utils/checkpackagelib/test_tool.py                        | 8 ++++----
 utils/config                                              | 4 ++--
 17 files changed, 35 insertions(+), 22 deletions(-)

-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
