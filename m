Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E72CCF9E3
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 22:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B3E9408AA;
	Mon, 10 Nov 2025 22:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NrWXi3iSCUBa; Mon, 10 Nov 2025 22:39:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A56AC408AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A56AC408AC;
	Mon, 10 Nov 2025 22:39:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B684B31C
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 22:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C0FB408AC
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 22:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B8Um86VVrkhL for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 22:39:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC56D408AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC56D408AA
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC56D408AA
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 22:39:56 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-295247a814bso46061985ad.0
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 14:39:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762814396; x=1763419196;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aykGqIVzTpkUQqYd0tKHluiCk36CD5W7oqHlKsBMmgk=;
 b=AsTC4z/z/FRU/JPy+4eDeshhKh6VADTlMCIxNnSa3MrdWW0+XrHZvOxhAtHSQ+z/oA
 zZmlHz8wT6FSFkfEG1DbAnG4V99Mgy/u5kymWc3BCkJ1IfOhPplQijgo3CEN/qqZxgYt
 j1AloVi7x/NGmD9rwYz58dDm1rMpBUT69oVX11deDic2L7ISsqn/7DwY/aQYvZwOsTm5
 3VIxJgVrew/avlYpjI7VlTGOMucub+HKtLQLrufuPNAfWTo9+ihvIbGH8iV7uQav7vSg
 I3rqDCzCSpjSZYQA4ZKfLntYcSRS9OQ+xwzGj63V/ZdDWp6ZakP1LzqHUM3u/n4/Ggql
 29UQ==
X-Gm-Message-State: AOJu0YyhQCPzRtgSVAFJnU003duQVaAEHLnOj5ZRd2pQAwEJNBx5tiLs
 PGHaTHzIUq/quq7s+roIOzxGi2HvVG4QtiTK8nXtNFCCRGla67uMoa1Ed2u//TM4
X-Gm-Gg: ASbGnctOn7ilIetqSeqP8daekZZ4SMxIQm6zf7f63Kths1JtWf5GuJeXj9uTWGbXtK6
 gBYDwS+8cs5u/3dJgGiIW8v0/vCCArIQrfG8Be/vTVZ6M0CFxreQKKTXgV6kZYD9nm5b6I9F3/O
 E1yVo5OFVnaNnNkxr0TR4An+yta4QOBcUNfm9juppzKkCj9eHT3PHsCrHwWFYvxYFFJ+MpQGP/l
 Tl1yuHuFsIqzPjYWXtxsMoDYTY304Mk32LSes0U1vgj/PSY3R6cInN059b3HeUVj+72iXXH0PDO
 qf3NfTnIZfuZF6/k71q1PWn9nfthoHvMpWhhAm4l6zr1t9FjNZigHzrMJxPWORKsdbYHHo0yYmn
 WQMgEUtZYJMDgyNqDB7paHFXZoBDEzZl3qJAytCNUYWauHrOdX2Su/R2s/fhpYqdYloTnFSv97u
 +f8uOV5EXEoKPtml8MiLKHgsJlMiLPp6ELRVOrhjSh2lnKxrA7G8zA4/mc2aKgBzTKRVmUn+Jw7
 PKoFclB
X-Google-Smtp-Source: AGHT+IHqQE/nY+sa1+ZLejZo3NSprLXIyJJJFLGW3u+uYLFRKzn3w1nkzr1+/HbwwSyTN681uulQpw==
X-Received: by 2002:a17:902:e545:b0:26a:8171:dafa with SMTP id
 d9443c01a7336-297e564cef9mr145228415ad.21.1762814395800; 
 Mon, 10 Nov 2025 14:39:55 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-296509682b4sm156289535ad.12.2025.11.10.14.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 14:39:55 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 10 Nov 2025 14:39:52 -0800
Message-Id: <20251110223952.42095-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762814396; x=1763419196; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aykGqIVzTpkUQqYd0tKHluiCk36CD5W7oqHlKsBMmgk=;
 b=XAb6BJJ5buQNaZ8sKb0pRtvdWht3o9ndDS9YwWEOqsrosCAy/ZoRtDgKa3SFg0BGGi
 plCgPJVtXIfHfNjwTPJvWunIMFwGophR9Oc+gCgcSfFUj1Q4amA641zptN1oUrA692Tj
 BNLj8C4+MkrR6rs99k4b80h9+xb1YmDi7md0SkCMB8qmkVuoHxs6/hSbtPBkhwql7XXd
 fwgVPObBTy61zpBX9ozmVwTJw+imI5rmFHsXnarfmfpFfGmqF5STBe8Vz4xZT7KX2GWh
 51MrI/u6PD7Fa4BE8G5Lw4xD00blgU2W17gNXkgsYuiPv7VX4crCoF2O79sM4PGWG1Vr
 6zlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XAb6BJJ5
Subject: [Buildroot] [PATCH 1/1] package/valgrind: bump to version 3.26.0
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

The license has been updated to the GNU General Public License, version 3.
(see https://sourceware.org/git/?p=valgrind.git;a=commit;h=3392155359822c0d4e8bb371862e92425054d02a)

Release notes:
https://sourceware.org/git/?p=valgrind.git;a=blob;f=NEWS;h=fdeebfaead9050b9fd43b6e7ba55d0d674367cb3;hb=218cee2feb2556b6b4b8991cf0977256b801e3e5

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/valgrind/valgrind.hash | 6 +++---
 package/valgrind/valgrind.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index 848421f091..8e62256b9c 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,8 +1,8 @@
 # From https://valgrind.org/downloads/current.html
-sha1  4d2cc4d527213f81af573bca4d2cb93ccac7f274  valgrind-3.25.1.tar.bz2
+sha1  c32f135761724db05f018fff67e06c4edf328770  valgrind-3.26.0.tar.bz2
 # locally computed
-sha256  61deb8d0727b45c268efdc1b3b6c9e679cd97cbf5ee4b28d1dead7c8b7a271af  valgrind-3.25.1.tar.bz2
+sha256  8d54c717029106f1644aadaf802ab9692e53d93dd015cbd19e74190eba616bd7  valgrind-3.26.0.tar.bz2
 
 # License files
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
 sha256  56976e64523fa1e68db4e6f464f5b2cb89d7d08f54b1d012e317b8db286b3faf  COPYING.DOCS
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 73568932a0..dc8d73b943 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.25.1
+VALGRIND_VERSION = 3.26.0
 VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
-VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
+VALGRIND_LICENSE = GPL-3.0+, GFDL-1.2
 VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
 VALGRIND_CPE_ID_VENDOR = valgrind
 VALGRIND_CONF_OPTS = \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
