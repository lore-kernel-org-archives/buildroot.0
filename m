Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E026CAC5BB
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 13:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51244608DF;
	Sun,  5 Oct 2025 13:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97P_9WOeq6Eq; Sun,  5 Oct 2025 13:25:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D07D60DFF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D07D60DFF;
	Sun,  5 Oct 2025 13:25:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ECE2226
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00C96608DF
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:24:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2D4aIAHISOv9 for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 13:24:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2DC8F60DF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DC8F60DF9
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DC8F60DF9
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:24:58 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3f0ae439bc3so1941866f8f.1
 for <buildroot@buildroot.org>; Sun, 05 Oct 2025 06:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759670696; x=1760275496;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e6GFB9sJ39uGMzgI9ZZOjuQlhJaANMfkp9szhGfwG6w=;
 b=YpWgM75Lv3qFm6OAW1cZMitS6u7GGOAw+DRoSabthHNb1hfLtcGGDCu2AdW1Mp6QAo
 Vk/nEPSl43aNghdb/cQXvcDlwpBxlwHJ95s+ZvDVjPGhr+5vfAZE72BlnKCeiXzPny2t
 eiFLMZiy7jn9f8qNjxQgmDRFwALp11H3qkhC6ysQAtD/DTlT5RRvSl78Wq+CNBwGJi/X
 TKhw8sTn110Aab1uthVcHvA0MceN5SRfP3lMp3puLV3hhy6drJxsjrxG/3nHPBVocooI
 qXQ8gdDmJK/RUpGINkovtBwpwNyc3+85GndFGTMDT7YMCRINs1CRRpicN9pTJIsQNXGZ
 F8KA==
X-Gm-Message-State: AOJu0YwANBkpwQjcPgDDY+9iPiWxzEPeTB+UidvSUvEcNEq1McjAsBBV
 CGioZJiBpas4vI67K9F2XP0EBM6dnTAGo5Bh3GOOUAA0dd0L5Ppg/iogIAJ65A==
X-Gm-Gg: ASbGncshMPgfBbaj9K1wLzH0+o/xctUbbjdtRkJpMC1FCcpam7G1CNhA7EVY+eqhph1
 kZfneie2/xR9OXR3uv1rjMldxsN43yNub6iyj4xKNp8zVvy6Y9c/srnZil64iB57EoBD7PYZ5cA
 JxS4NUcJ3HubTvQUNAljOSR4D7cHZPvfRCy3c7x93iN0uLsc0A1ZLp2LdYDZAZAxRFRmmSQqyLA
 I/4FagzZdf7RhvwZ1C97O3CJ7la2P5LPQgpdA1K5Zv+IUL0RGAtWEhUtbGGu6ltsCZWYLjPNrO9
 bzLvLU0ajUzLIeRqk4DrmG1LxA5t5aMezxADSa/zu4jFYsd44W9GFNaBn1mrwkk0VR8NEkUcGCZ
 9qGmnmJ4yUMQ5ZRW4z1ctJ/OD/A93b5mR8mdyf+A0Dq5GsuVSg00K8Knc9ZU=
X-Google-Smtp-Source: AGHT+IEzYd6eoUmNwne+NQEFZT0bQBZqyzFcCPhbXMHpd+C8mYQ36dpX3s2FMnG+SC3W5bcbZ39gAg==
X-Received: by 2002:a05:6000:2c11:b0:3ee:1296:d9e8 with SMTP id
 ffacd0b85a97d-4256714ca6cmr5180544f8f.17.1759670695762; 
 Sun, 05 Oct 2025 06:24:55 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:2acd:89a8:83d9:4be5])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-4255d8f017esm16882567f8f.47.2025.10.05.06.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 06:24:55 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 05 Oct 2025 15:24:41 +0200
Message-Id: <20251005-waffle-v1-0-4aab4f497a8a@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJpx4mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwNT3fLEtLScVF1jIzPT1MTElBTTVAMloOKCotS0zAqwQdGxtbUAk6C
 /hlgAAAA=
X-Change-ID: 20251005-waffle-3265eaadd5e0
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=0vn+Bty1SeOCBbK8CHFghsJztGfrmXPNcIj7r9OBeNo=; 
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBo4nGbxM1ejM4+N4Z2rMCoR7R9byPQUu3VDF9Pc
 fwMLlQCTi6JAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaOJxmwAKCRDnIYpo1BLC
 tVQGEACSlj9ASI5I3RwUQKbg6nVAbBauxJ/1ETkW1TfPJDuwUqjo4EYdRDCJ4hWHOmS5CXnMB0N
 TkpLHEKLBRSKkVm85pGNKEHdpW/WGn1/ypjew6GJ8j0RmrxORxIJL3Ma0YvNXTsWA1Lu80XzP70
 pNdeHt5C7Q+WvpVRmWIn/9ab2oYFVGm9NuAtCnMwG2gJyv00t95E/5wnJ1U2eMggqdV6Jbob5LQ
 2xuwdgoCENyfCi3k+/eNHJwJ7Rg6JeS9DM4nxA8Xjn1Dafnv/b6wq4M7tYit5nDtz2SjWqTLEnU
 7etaQbfC50Dp4iErtF3WuuC/tEVNF++KlPpchGQ5OpVCnfI269hsEu8k/7+pa7Pl5f7tXnpSW+1
 L1FcZRuGTrM747o1Hfngll7+cmoc7cTBFeW1VJBII2ReVvQ6sCAFH12XyxYdLbZ22/ys49CoojJ
 O4Q5Rg0pdBcSv42i+JKAWi7KbjbnTiJbX9getiKWhs/cLoAG0qPwa5qq6kRrBgOi/Y/6TemunCJ
 QDau+YEJsoV/bUK2x0YHImGG1SWChNbjRUASElnxfIk4EyFxNqd0emEhBdIi04+ULk4a/ADlEYX
 OFiFxmwWhIWzjA3YguYyVSb20/4r639gpAXXd0yO7KGFEjmJD2c97N7KVuuKdsuSR/iS3IEtC8F
 U947N5TEjIzvlzA==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759670696; x=1760275496; darn=buildroot.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e6GFB9sJ39uGMzgI9ZZOjuQlhJaANMfkp9szhGfwG6w=;
 b=F0Mm+GbO/BjwZTvUq2nnUeKfx9maclvy9byQMJv5/F6WrRIAEoa09AmwaUmn5PcRgk
 EfTuTbbd1qq0All6UWqN7HCEvZLqYpBR9fKA/N4r3mU4L8OdPNLlzE55E+YQS+AEBh+u
 zKe2vkb0PKAB+krd4tBgFKSHSmU3S3DVRdXJSyN4bTiaUpCt3+tu1JVRXH1d5fkNaLIu
 R7xPyvXsqDJsEIBGSfgAyoT9it6z8segL0sb8oKYaMlIMTV7gQlKbj+He8dtbwZMMOxK
 DmD9ftoGmUoQ/r2OE+xDoCKxXgPJG3dk/gtzhI0FMnXnLUTBmnarDisfErNYqKZgseyd
 BKTQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=F0Mm+GbO
Subject: [Buildroot] [PATCH 0/4] Update for package/waffle
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

Several commit for a single package update:

  * Website has changed
  * Waffle has moved from cmake to meson
  * Bump to latest version since old reference was over 4y old
    (project isn't too lively, latest change is from a year ago)
  * Use git download method since latest change isn't an official 
  * Remove deprecated or already merged patches
  * Fix default breaking pkg_config_path

It is my first time updating a package, please to not hesitate to
comment.  I initially thought about squashing all commits together, but
since this is a pretty complexe update I preferred sending a series in
order to ease readability and code review.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Raphael Gallais-Pou (4):
      package/waffle: fix website reference
      package/waffle: bump to 5f1f48287e806544d745e9a8f5aed47234c61292
      package/waffle: remove patches
      package/waffle: fix pkg_config_path value

 ...rd-cflags-from-.pc-files-to-waffle-cflags.patch | 42 ---------------
 ...02-wayland-fix-build-against-version-1-20.patch | 59 ----------------------
 package/waffle/0003-drop-C-dependency.patch        | 46 -----------------
 package/waffle/Config.in                           |  2 +-
 package/waffle/waffle.hash                         |  4 +-
 package/waffle/waffle.mk                           | 39 +++++++-------
 6 files changed, 22 insertions(+), 170 deletions(-)
---
base-commit: 7bbc66a39e6e18d5298564167b42e56b82c9360a
change-id: 20251005-waffle-3265eaadd5e0

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
