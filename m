Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F59E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 20:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2A7B407F1;
	Mon,  6 Jan 2025 20:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GhdigeO2-iNu; Mon,  6 Jan 2025 20:21:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8DCE407FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8DCE407FD;
	Mon,  6 Jan 2025 20:21:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A8086B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 20:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 884DA81373
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 20:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 14J7ON-O03xA for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 20:21:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B28E981372
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B28E981372
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B28E981372
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 20:21:19 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so153037735e9.0
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 12:21:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736194877; x=1736799677;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WBimyKQWdycCkAj6UHFsKDqdoU+hds4WwHt1iXDqLT0=;
 b=cMLZ/bk+ydO9I3+18Klv89t92rzVnXuPa3lYHM719I8f+/hwGNGnPK7R0iEDE9i4DD
 s4OjjQHFJ4rwEPeio0jaFhr+BCsXBD58hUZ4S6uwNOO04wjRZO6ZOZFGVSMCx1Mrx/jj
 mthJ26CpNfgr/qhWY5nnKDy871HCC/t5TBxWG65dnMUaZNMJxNHDxNR67mAAk1Dv3xcw
 /9/sK+rc7P/gO9AdrZ9lIpu5EXWaEDnU08cASyYW20SIOc/JQdkhRyPhgxLxx9JaT4bS
 5DgEzEfcMH8IIxWFvIwHsVt31MaV4czgEGEsZTtDfRj6hSs4/oOJloZap7G60zTT+0JC
 FEOQ==
X-Gm-Message-State: AOJu0Yx5qyhOUGwQEVZm/CasoDw+s7Z3UZrAM5q3OxPERA+k4k3yyf/B
 +LkP/civbDaYOfejnF01tVdWwXKeAs36edzj8EiQ9oifZZLTTQaHBgSmmg==
X-Gm-Gg: ASbGncuZ3508KedwlL3sW21vRMJhb1GFHRnsgFaymzN62nJXTaVkTmBo2Ev0XpNgfRP
 5PQJ761HeyeCXi8kTZhi+J/NCFn1QJtxRKG+dBOz8cl+dFgMHct34WjYFf6bg8QG2hjolQg5HQ3
 fDTQH/wjdDVyacEH7LA8BjNH78b93QxEY0Av72mkB2vcb+4VCzSFurezNKWLFRf3S6XnYsS2Rbk
 PazdADQuM8EDrQdnGvDN1N91d82zNMZX21Aes0XznAxo7RSLRwAwU43oQvJ/zudHFM=
X-Google-Smtp-Source: AGHT+IFQWpoqzL6qBKgRFuTh9lvTOKYkb4a94b9KF162GLRtM+Hy60OLQgj3vVVhqjQpLdK5lPBJlA==
X-Received: by 2002:a05:600c:4f50:b0:434:fbe2:4f with SMTP id
 5b1f17b1804b1-43668a3a33fmr461132575e9.23.1736194877313; 
 Mon, 06 Jan 2025 12:21:17 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436724169afsm527020625e9.25.2025.01.06.12.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 12:21:16 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon,  6 Jan 2025 21:21:16 +0100
Message-ID: <20250106202116.3135771-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736194877; x=1736799677; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=WBimyKQWdycCkAj6UHFsKDqdoU+hds4WwHt1iXDqLT0=;
 b=k354b/hr2dZjpiLYlbGsmJQwOJV1vK4TDSmTnDcUYZIUimT2MH1CgfG9yUKCExZ7QV
 iWHsQYgSjAbHCb3Fg0mFspxE6sMXUNqW+XLfJN+lnlikXIq4UpAv7LdSScYp/tgLKnW7
 gY8H80qUm8SzIZ0pRjE9RlWNSX+n3dBK0gp2j06K4bJ/96DI2jHJ6eSWN6NpJo8c9dVS
 nCZ6fJNwPMDd5fNUm5Ne7B3jH2ZtSoVzavZnZEEmYxmRHnQo4f5C5HfCaRFXThfghNvX
 +OpBGFS3AnH5pzLt/TrgSIE8otSxTcoIJQwzDmGJEKg+cFinbZRnpPsta7ZZmh/MJ4EM
 6aWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=k354b/hr
Subject: [Buildroot] [PATCH] support/dependencies: remove confusing comment
 about host system python
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

Since commit 9c0c7846cdb6 (support/dependencies: don't check for python
on the host), we no longer check for a host python interpreter installed
on the system.

Drop the comment in support/dependencies/check-host-python3.sh, as it is
now confusing.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Note:
the script already contains a few shellcheck issues, and since no actual
code is changed in this commit, those issues were willingly not addressed.
---
 support/dependencies/check-host-python3.sh | 2 --
 1 file changed, 2 deletions(-)

diff --git a/support/dependencies/check-host-python3.sh b/support/dependencies/check-host-python3.sh
index 17cafd2883..380b19ccf7 100755
--- a/support/dependencies/check-host-python3.sh
+++ b/support/dependencies/check-host-python3.sh
@@ -7,8 +7,6 @@ version_min="$(echo ${1} | awk '{ split($1, v, "."); print v[1] v[2] }')"
 
 shift
 
-# The host python interpreter is already checked by dependencies.sh but
-# it only check if the version is at least 2.7.
 # We want to check the version number of the python3 interpreter even
 # if Buildroot is able to use any version but some packages may require
 # a more recent version.
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
