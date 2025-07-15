Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C00C83F22
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 20:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEFF383B64;
	Tue, 15 Jul 2025 20:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0n-H-Lkbb3Es; Tue, 15 Jul 2025 20:20:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3406383B5D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3406383B5D;
	Tue, 15 Jul 2025 20:20:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 50EBADCA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 20:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36D0D4067F
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 20:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TOfENfGEa-42 for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 20:20:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D8CB140627
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8CB140627
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8CB140627
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 20:20:15 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3df30d542caso25804575ab.1
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 13:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752610815; x=1753215615;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WDkk9tktou8DskSXFfcZARo40VKbSoBWdoPUHFrd7Wg=;
 b=IuwYJEuaePsBWWDDmk04GH0/aP1ehGAFvfY1gr/I+NV1eu1SblTgiFoH99KvB3BUIA
 Ry1bLiAHPEiQD1dYWOC8DDDIcGuAX7aDG5MfjWd7fyWyxxi0b/ljVGX48DXJQqaklCtr
 fo8VwGgyyIKoitUkoJ2D0J5yDKl9ZeXT6Gef7bJj6UK9b4PNkUKRG/aGNiCLd5uKrCj8
 /IKb7BLvcrPN1bVRnf1tV0Yt9fhfuDKFc0xOv4V6Yc1Wh/Z4koHs88tzBkS39brp1a0d
 BU3b1vMIkDvY4wfWAMi4twpNVT9iAjpucQnIIEd7kqtEbfRiPwIqrq0dRIoM77rAlhNx
 ajhA==
X-Gm-Message-State: AOJu0YyyPn0heHjUkStaYeO+xV/HOcEumvGF36uavDhXvkLVegAw29Z6
 a5LEASFbsh3IuksVrBF1VKvqNVvOA0L6WjItHPIoaklCbY3GJ7xbcFtmlVUV/kClTR4=
X-Gm-Gg: ASbGncsHKyNsanKapMdNLDqS7zDLFUFZYcv5EFPWvQVt/pVplW/1Vwm+tDvQ1VtbyJj
 yJJKoAbePvVSzkUM39MTMZqCD+eShkEYcpaDf5yUobe09BUv14sNlgypBYPwESDPuHmbYdFvq5Q
 xBh7Ztg+fOMOiW08vjA56RvOpwe0jn1ZWV770d1G6fS891bqbxtApzexsS/NuGMElEz+/eUkuYa
 P9kqTToXhAhMaJKp2EWBiT5Gs/ixqLw7hze+dRv877mQhIxXA8+wQbSIWY8dCo3dHQM6c+CQxr9
 VCAjVRUVnyfj7JO9+l4twXu8v/1tdD0gq22KwfMOXdLEXc1ZfDn6G2LvsDFj2xS0f7ai37fmCKK
 BOAaq8KqM2zddtaWPkN9ibuhmlJn7bsHbOSDxiNBkp6Tj2TYPa2BzXWtsUNIp9Ey9ckvFGiCpkJ
 SbfApkAS4=
X-Google-Smtp-Source: AGHT+IHgFjkiG5Vyd4kSY9KHK4WIyP6gHKmliA5c1pWwxofzZ9y8Z6Fu9aUo0M6wkks7QcNE4Y98gQ==
X-Received: by 2002:a05:6e02:12ed:b0:3dd:f4d5:1c1a with SMTP id
 e9e14a558f8ab-3e282ecd791mr1293465ab.17.1752610814569; 
 Tue, 15 Jul 2025 13:20:14 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-236-108.hlrn.qwest.net.
 [71.218.236.108]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3e24625c59dsm39572965ab.65.2025.07.15.13.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 13:20:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Jul 2025 14:20:12 -0600
Message-Id: <20250715202012.385593-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752610815; x=1753215615; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WDkk9tktou8DskSXFfcZARo40VKbSoBWdoPUHFrd7Wg=;
 b=kRpSQqY4DiQa4413Zg3mMZ/wRYkhyoWIs46HkyCE1v6wWDxuIA9gzpsyO/T1bZsAub
 37/wKyKHOrEFcEnYzRu1ChxN/yjQ18DuGqlSQDE6BZy+gr03WuI7mHR3Pq4U63YDW710
 w0tMT2U8mSyOc83AuoPIdAnFvcHK1N9o0WvqWazbjQAmftQJ9YW1qvTqXyiQ59TuHIPu
 e8Dg71pUvsCoM/ad81zJSwSdHX5cVE7XuaR+FHmMZrwJhuT/upszO5km4ux+SXgC2eri
 R2cqZvuWv7QWgOemSIR7gURnjR+l4GmZR8ZnTkg0kuOQK+aE8mLTEqADTBXGGlZX3M2I
 5iHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kRpSQqY4
Subject: [Buildroot] [PATCH 1/1] package/vala: bump to version 0.56.18
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/vala/vala.hash | 4 ++--
 package/vala/vala.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vala/vala.hash b/package/vala/vala.hash
index a16875ac6a..1babb375d7 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/vala/0.56/vala-0.56.17.sha256sum
-sha256  26100c4e4ef0049c619275f140d97cf565883d00c7543c82bcce5a426934ed6a  vala-0.56.17.tar.xz
+# From https://download.gnome.org/sources/vala/0.56/vala-0.56.18.sha256sum
+sha256  f2affe7d40ab63db8e7b9ecc3f6bdc9c2fc7e3134c84ff2d795f482fe926a382  vala-0.56.18.tar.xz
 # Locally computed
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 85f928202a..24dadeb346 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 VALA_VERSION_MAJOR = 0.56
-VALA_VERSION = $(VALA_VERSION_MAJOR).17
+VALA_VERSION = $(VALA_VERSION_MAJOR).18
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
