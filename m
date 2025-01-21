Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DA8C02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 09:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E321E849CA;
	Tue, 21 Jan 2025 09:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3VRIfaQB2k9P; Tue, 21 Jan 2025 09:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FD22849D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FD22849D4;
	Tue, 21 Jan 2025 09:20:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2567169
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 09:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1343D400E0
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 09:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IXaBZ-3yOa3O for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 09:20:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB1FA409EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB1FA409EC
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB1FA409EC
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 09:20:05 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-21631789fcdso76835955ad.1
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 01:20:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737451205; x=1738056005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/QyKXeXBDtz4vGh2/Eol1sNEVtp4swke7s7taem9ta8=;
 b=wQpQu6LSOiEU+41O50X8U7XGE9bQ8FBPWioVQShEyb3NktEHUxLid3vM3+Fo42LhU0
 DPMW+oT4UCVUQk97Xf+peQFhfPkaxuvOXi0i78DoEXGr/iBX1Bgm8zDWmYdl9IJ3iX8R
 5uO1RNAGXCavA3Pd6+hck0sVCQli8qNRtHF7l20mv3QxClbu7EC3LEhr1LOixriQEDU8
 6x4mwr3ksKJIIzKSdbYB5OtDeNnz+MYG+SDlPCQHysME1eoCQvWgP+l7WOvpXq1F75Pm
 iNs5xSV8eeNPcE/9dGNLAIOlt80hmz/EWWg8d2ZGMGrKcEV1K/vW7iC8sHL1k6fqnLpR
 hAPw==
X-Gm-Message-State: AOJu0YwX3rM9L50+ExQAYgstB3sA1BZlI5WvD81A5cCHaMgEUDCc2QDl
 YWhTN8LGNCBAMM9HnSI7c48PdVZjiYnXZ99mIKAUr+Axo7mgVaGgwEfqplAs
X-Gm-Gg: ASbGncunQNVzNiakkOpTM9J48tbw+MRbZEvZv6mi0qNZQj7RrEDouxmZI6mmxx21xym
 QfJtyRWsQGgbRnLtq7EtWDeiVRqVPBzCILsQFCAyF5AUO/KYFX7rpHwbERvSqbrxAofnhLQd4SR
 pPxL8uEbUS+VG6Dh5Po5Qf30+CgbPak4KojVJHnClK9nygMQ1kuRdEo4FHC0JU32AudUuskuvtR
 19T0gkQdBSuRL/s6lY86yvoveNoYXxkFNWvmVFWf3gqKIqr+5vOtbFI1q2Xu8JwfUW3fu5pPaqv
 lx+6dM0OmYUGP+OClmrTIbqE9+n+Ui3VmWwQW6UHIIAI8DRwhoF0wQ==
X-Google-Smtp-Source: AGHT+IG/fkLiUK1YoCTjHXdJp1iayqpbcdJo1y8GAQJaSA7yj2vfWUrPxt0TFVOw+XPqRPnbXZ0mEA==
X-Received: by 2002:a05:6a20:2453:b0:1e0:d3e9:1f8 with SMTP id
 adf61e73a8af0-1eb216294admr22513318637.10.1737451204857; 
 Tue, 21 Jan 2025 01:20:04 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72daba536casm8553053b3a.154.2025.01.21.01.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 01:20:04 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Tue, 21 Jan 2025 01:20:02 -0800
Message-Id: <20250121092002.19476-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737451205; x=1738056005; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/QyKXeXBDtz4vGh2/Eol1sNEVtp4swke7s7taem9ta8=;
 b=hnKXTcSBMntz+rjr5Lhg41J8mrGLe6taZLDu/JNf8l/4i3OsVdyml8z5LoiOGcVsrE
 v/sdmUGGGvdDdumQZD8CR+D+yYYbRTHcWrWu2RpbXH4JMu+w2XLlejZ1esCvKKWmDBqX
 L5QuRD5calM9eMogiqpg+o+F9FRpAUEHxULv51phySqdjhQkTwfe3bKc0f/3H1EDoDeC
 vmtXyBpp049tWaUftzjxoxSJcvwC9VaeSTdCpPLaRTmkVv6zuxcGrBzUyQXFODSzdXkW
 YvtxkRH57eRoA0+AI5skpGCJWgKE6bdz2O4cQYHEKe1NOCDpvHnLDtQuPQZxOmT4JaEq
 oQeA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hnKXTcSB
Subject: [Buildroot] [PATCH 1/1] package/mtools: bump version to 4.0.47
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

Release notes:
https://lists.gnu.org/archive/html/info-mtools/2025-01/msg00004.html

Changelog:
https://svn.savannah.gnu.org/viewvc/mtools/tags/4.0.47/NEWS?view=markup

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/mtools/mtools.hash | 2 +-
 package/mtools/mtools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtools/mtools.hash b/package/mtools/mtools.hash
index 1a10afdbeb..bce1951224 100644
--- a/package/mtools/mtools.hash
+++ b/package/mtools/mtools.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  8241b370d2337968c1d1314cbdbd5d5d188ddc905f2eb1198373a2bd90c70fab  mtools-4.0.46.tar.lz
+sha256  2709cd2f42d65500829b056cb0630edd515d7060b4865bad31277f0da9f9e9d5  mtools-4.0.47.tar.lz
 
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 1e98880058..45b4b8d49b 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTOOLS_VERSION = 4.0.46
+MTOOLS_VERSION = 4.0.47
 MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.lz
 MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools
 MTOOLS_LICENSE = GPL-3.0+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
