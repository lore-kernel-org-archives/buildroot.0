Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC07CCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 18:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E2474070E;
	Sun, 18 Oct 2026 18:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQl7Zr8Sngsy; Sun, 18 Oct 2026 18:25:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B5B8C40702
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792347938;
	b=fTZx9UW52C2i0rCIF4vz/kPm1GAz5FghdXOIkNu9XXi0AWeduaUzBdUoPktgLKUzytHB
	 6QHETjimOmBl0e7is5IUV/KAD48o0ZyHhrhxZn8xoYhvfHYaq17nyWuViQHnoOV88zupX
	 ZkXBmLLn5lzyw4cKb4V4j1jXPHQ6qMiAXqv+FIkQKDOO2tDcTfplZ1BfBWKobHBI/57wQ
	 jdMAh1mV8x+zvwCQMmWcYizYYwThfPHvzWHvp4FnRxqiVSjXRkq4qTt/Al7tUwnUjptRG
	 mIQ0PXS5L8aobK2ADA/pTWusHUQidTgRav23iLC3jn9p3cAKoM4YeJVTBdXK5t6CxiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792347938;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+Ird6xkPJSnY2hUEUjACWDzd549M80i3+IYGv1y5aQQ=;
	b=Ijkj3jdyWeXdbgnooXAlyO3J0Ge1N7P0St1iszZfSjXqtQStMNbAMtHzcIvqgBqBRyPG
	 vbsG523Lh/vGXAJGeWILXaqcEx09sMxpY1qBIidZnX7gZTcuxFE/rv7hFRrU1VNq47nOi
	 UjPnTIkSMrjJknSX8b6CdgFfWMOgcxPUyZJavSlUYCY8KvESLsuJLNYmp2puAOKiNV7Dn
	 T2ISlcO52cZfapySXuRe/b/x4RsO9BQ2UWNOfQ9JL/gWM20lyPiDvtBhBbmcjQLgZRGl6
	 6IeN9UGZbZEXLIgOkn7N69a+YoeyYZrNzcE8YlRgvGqBCe/CGs3PGByxf6x8LPPvndg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Tzvrbnf4;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792347938;
	bh=+Ird6xkPJSnY2hUEUjACWDzd549M80i3+IYGv1y5aQQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=SLo0gK41YbL04RqkbKyC797U6fEpFo7RachVvNMw7fLMm/ScDTtv5XeYmbFu70YJk
	 H19Ss6g0b+jCTqB81xCUBwIDbRA4z+TrfEmUBoHmvVMZhMIY/zroUdnBoNvVS0+MdL
	 J9bbsU9jzyZyH7THSm8k5cJBSu4KSsfaYsKPf0Bq9DoTyW7xDmq7HQ6H7bsKZcHEVn
	 hvNqI9nTneSUH9rHHG6uwVh1ukSp+JsksF1cl39Y+LNniLdN2c1PyhcYaTdL4xxIPZ
	 oavylc/d1nXC1m8E7brLULgmLKZmrGjTamuE62bEalfLndowXuUVaOKfxrKQOYScSP
	 7rMH130YOaxOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5B8C40702;
	Sun, 18 Oct 2026 18:25:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D612661
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6F1C40737
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id out5144U9lXi for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 18:25:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CD9AB40712
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792347934;
 b=OuYMvAgTVcRhi9R4O4YQXRo85a/lbWLGbiaIwaqzl/rL1kllNG6+r1JVTQ44WnxiDcQ5
 Iigo9i6Im8nnBGfbcdGVPHby/MIUbD++evPdEX/wjLZI0YZ3S1jvhB+k/kaXyAeLcNiHM
 BcqtXG6HT/2pcpC5hgCJMAe9iX0aKUTy12GqaLCRdIQ1+2DJ492+eV11tW8aDGcyNbp9N
 N3I5XRZ4VLcXzcB9PTegdgiBhnbV0cXl8UtZspY99zC+4ZNX6plKVHFclGiiAM+F5hwhp
 7naijMAwD4An5R1FsYkRC3QrHXnI2b97Qe58P6NPmumd6l5phM39UMjc+Ae9Cb2s/XA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792347934;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=uWjszcuachpMd1CTH5jw4TIrOtBhqGUqUPsOrZDkMak=;
 b=dzbeNcElEC7m5sBq8kLmubES93vlvcsAfhSc142W98KJDNai6TiUMkKtgPcixUcxZayJ
 uJX/9EuDCFGwPb1dwb7sQ/eOVR+6GmDP49fJl9i6un9jgJOPzvTvJPgtl4ok7R991oRNh
 q8MtZ8+XrpZdXUhEDsYGfOWOd8R5ujAKHtusYm1V1Dp+tATscih1QEU0TWoxoPjIT+OZQ
 bt4Ms7BakEHVFODgEhF11hd/v/oWxc4Ihp4w6G2IRVfoJRSFS7Zu+RAU/kXoRCBsiTSC8
 QtFBVwZuqgNdGqmTdmrDaHK4pkqGcFoep1QD2MZKOX/uNCad8VvVhFuA9EDWZ5GliIg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Tzvrbnf4; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22b; helo=mail-oi1-x22b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Tzvrbnf4
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD9AB40712
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:33 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-4f699fe49b3so1120286b6e.3
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 11:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792347932; x=1792952732; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=uWjszcuachpMd1CTH5jw4TIrOtBhqGUqUPsOrZDkMak=;
 b=Tzvrbnf4F8DJiDGKS89PLM8uQv4L/NQaayn1/J2u4cpkUq9BMyaSAUlaAvNrpvPbtu
 8YVqgpo41TwatLRNDKkZpifhOvXnywsZTou7PtG5uz+paCze3BVG0x/KB3zi6bGpYrNX
 pcluocS4ZqjKXhyEP35MVJsTmO5Zoof2K3XnLAtSvSZ+2JhRV+ppwbWIgA5JQkmWFtWd
 9sPPEo4WKPMCE/NBOfOJhx89pU3rDiYrkO2dM0McgLOdfMoK+SldoevaBB/3OSqnxS6A
 /+mL7Jn8WUdMwOaLJzr+HI3UgYPUBamXBxzNDeIeSGRwxict6U85Wriutmg/F9G2j5OD
 EENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792347932; x=1792952732;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uWjszcuachpMd1CTH5jw4TIrOtBhqGUqUPsOrZDkMak=;
 b=fgWXXqZb3meYJ830G1kUGhSbLxf/HXE3EeDzsJ8iPM0bDJzaS1+a7lYHw42uUfyshd
 j8I+W/6Y8XxSKfqcmXVRCV908XEQHdWSnrQiha7goJ6XiyQWuyxWELVsVqoUBHMi51Re
 guFl0PZfUn/Gsn61YgB1dxzAs3fBGdiaQ9cjCoXwKujRw8SVHYBIFkpFJS/+vpgHZ5Pp
 NIp1rYQO/6kuvBZ3N/+SLD91LYw+VhwUtxIYjZNuCBPdW/ZZxrtIqSHVCPGoN8fk9OtY
 diWijitIX6MOp8XAqHwOGyXFqHBuTUqlj7+zN0A0VEWChbM7v/Tmpm43CsbIdRDdpMFI
 jldg==
X-Gm-Message-State: AFq9FYKowQG4NRxuE6dGjZtUeORT078mQdcV6hNmFxQm7iXKk5Rsgffc
 OU64lHigPHvDNdL1y+iCCmGZB/LAQnxeY1AQnLBshpcMekU8wlJwU11QnJ24SA==
X-Gm-Gg: AYBFou0Y2NJMdgPv1/LAL2F2a+RaGHH1CGx6gFAsV2y6cdXMoNYH5Rd1GAtV9QjLuUT
 qbqajeOtrR0SSEVIVgefReWmTy16jgxHlGs+lO87OvmCyN15P/EbyRSg3m4h1yZMXhB1GAflc22
 xiBv9Pxp65Q8fZ+wuVjWAOvmRN8tUXfzBOQptYIVNsfux5VYp5u8psNzvFM+WF2MAQEOPDXwun5
 xNcgteJDXpSobgWbPmoWFm8tmsrsDthksDGrxQ3mTobfyIwA4zrg16DgRnO0FF5nSQz8aTT2xoP
 UiTtDT6FuCLtuXGdHGj82mJD0fvV38V3W6+CgreRKuG2lAhXjhf8B4LItcxhes7Lr3hXbVoCWLa
 a4H//tlpGOOkPhl03uyFiTi8CKOICS2+QubbPZWtjn9tK+zGj7OZldI4Elqo9cY0H5a4h7p7MhN
 zIRQAhQT9+ccEIaNLXlyYp+inMwYv+IPyhjIDihfEBIuYa+Y8h2GHQY0Da1Od0U3jFJvnLNBD5Y
 +HRo0LrefkrGgFnerwyFk/znLaBv3FdBuRiZBqdRB3EW6KqS9dit517f0k3ltc0rDG5xmGO48wI
 UQUpIioST9SfEyEsLRTS3G3ugvlv/ZT8ry9ugBBwIDx8J1++uMyCDJia0lRouyuHzATBXqL27Ld
 Oy/Ik4bJ1uO+p5Yszye6YZp13NrtjEZxLDR0AkaYph6U=
X-Received: by 2002:a05:6808:2445:b0:4d6:90f4:48b7 with SMTP id
 5614622812f47-53cd1cb3973mr3886413b6e.57.1792347932580; 
 Sun, 18 Oct 2026 11:25:32 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5388a5572b4sm5715659b6e.6.2026.10.18.11.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 11:25:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 12:24:53 -0600
Message-ID: <20261018182507.536698-13-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-texttable: bump to version 1.7.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-texttable/python-texttable.hash | 4 ++--
 package/python-texttable/python-texttable.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-texttable/python-texttable.hash b/package/python-texttable/python-texttable.hash
index 628bf4bea2..880cc725d8 100644
--- a/package/python-texttable/python-texttable.hash
+++ b/package/python-texttable/python-texttable.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/texttable/json
-md5  fb024678d892bd42fec4a3907089d036  texttable-1.7.1.tar.gz
-sha256  ce71fc5928ede6cd7a60dbe3cb2845e6df8f5598fe435252ea1b31722415fda7  texttable-1.7.1.tar.gz
+md5  898e42e1a4bce44f9aaba321e6099725  texttable-1.7.2.tar.gz
+sha256  dc16ea6b35fbf5291ba6ef79d79e37d9b3ca6acd7bae3ca3450488d7c2e19c99  texttable-1.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4ba7bdab54504a3bc44eb33ecca873a26a63ab902822101a87bb46235da63594  LICENSE
diff --git a/package/python-texttable/python-texttable.mk b/package/python-texttable/python-texttable.mk
index 5bb5b91684..221fa4fc7c 100644
--- a/package/python-texttable/python-texttable.mk
+++ b/package/python-texttable/python-texttable.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEXTTABLE_VERSION = 1.7.1
+PYTHON_TEXTTABLE_VERSION = 1.7.2
 PYTHON_TEXTTABLE_SOURCE = texttable-$(PYTHON_TEXTTABLE_VERSION).tar.gz
-PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/72/c8/c926b35a849405ae0cb21956f8d7bd5e4f2c277c211784ed7d441df1b807
+PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/03/19/9590fd39a668ea0a0869493441fe65852246a3ec67616877baad98bcb039
 PYTHON_TEXTTABLE_SETUP_TYPE = setuptools
 PYTHON_TEXTTABLE_LICENSE = MIT
 PYTHON_TEXTTABLE_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
