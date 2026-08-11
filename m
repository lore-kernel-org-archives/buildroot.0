Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74722C5CFCF
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 11:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 074B581004;
	Tue, 11 Aug 2026 11:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kA51p4dqGlLl; Tue, 11 Aug 2026 11:35:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5E0280FEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786448108;
	bh=Ze5BQJBipKwvNwvaH+7tC2tS4Flr/0e+Cx2h1iEb0Y4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I7uSHamwUFQdEbdTTDKzNpzeqXcbeBCQLVdbja5WllehxmgMzpR2js9S2rXA1seZF
	 KuTN0x4C2FOCfM7pxG5T1o9Xy/tyUKHIXFIutIFaVufns+7L/BSJtaVIssh14zYvls
	 T1q4L9DWTYdgay5g+LUX4FK8jADMLYa1L+wiS4GvalUDxuoQG+rIA3DvRhoT6ZqwPH
	 jFs5nLhkJxlWxyYpLImrhanVNL/T9DInbGxg4FsltAuBrkrWzv2p0pKzCCV4b26o8e
	 GldHlW6RYhpHm6oiMmBO9lJNZM/ZCvNUFbuVvAtIoUmKy/meWCjeM5o2MBUZkzaHeE
	 Y9A889iqeaYeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5E0280FEF;
	Tue, 11 Aug 2026 11:35:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D5FD259
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FA90400C1
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UTXwl5ntQds3 for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 11:35:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1C5E340063
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C5E340063
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C5E340063
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:35:05 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so23024595e9.1
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 04:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786448103; x=1787052903;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=yA/z8E1AZGZs4OGs9DeGOV9rVn+Xd6RJjo/8nFXIpE0=;
 b=ZylN/N6fJlx/oFlb9p5LoFmfMqWAho5oI+bCFVw0FGoV8HMcEK/1V4e4y0NviC9TRK
 Z52X140kl0FYdFIeTaunYxmSa+NaQgshdcbaoVtmb1EJ+UJ8GzC54Y3IYg469OXB01jv
 bb/iqHUyVjjev1dLDAG0erJOAuchl7nxW4nh/hfsoLKm4YyW6SK9/aI3EGF51g4jiYVP
 ONUvFruOq8NtH945TjvyW8UTOpYQifYvDHy9eRriiuxpk6aL2/b0EkjRS+sVJbUG19nO
 RQSVBNeLg3X5Vx9BCgQ3dq5AcD9m1+vOto3OBN0Y73hjWLtB+3G55XNZJjgopfBorfOt
 ylNg==
X-Gm-Message-State: AOJu0Yy6t5P5EzKEf4bby2kchof8JCVSdmCWzVQRB9JaxslZholUxgz8
 ySwCkTpEzfS0gJhOP88+eoh7yh9BIlGueRP3bl3Ldc1/DB83eYQUvuRnC64iuNgyUGhwEuuNqxh
 YVNiO
X-Gm-Gg: AR+sD120WFOdCkC8jANQ114HYyj2+5o3HRMXws3RZCUGJjnc9UIFPY/oSahNr6sOD45
 gxDzHxqVG7skHAmbvFFBWYWeL/8r+UjFSYPaVcg4k7gut6EIDAWPhQB7ftghcjAMGpFDe5JJNaz
 hYbZdXqTAX+jd56D0YpFMpniRWriUXAiioGeIpGlkUI6v/WVGxzMMbiYu/3vR2OdF9FxN3kDXFj
 MGmSbwL58P/2lWbLL+qnl298r77VGHnSLy9VT7SB/CsnhnQtEyFOS7ghcDw5B8yj14tsiHE1oaL
 xgbRp/C/McCw90Z+OscFHRZddhulPiPhEwdrIv1fP7bDGTF3ZwideLFKbG8Nd3GOJTNxoXHRi0h
 fYCbTPPTEn3Z0GajHdMyhcFQaciPgAOh6boMKU7Yw4WkeOPF+2Y4DnAfclc67uDmmOk3+A70WjT
 sM5fgTZ57KHQvbKKcXgovwaXRoRA5CZGdSedk3gJEzi8U8L5uu4XzuTw==
X-Received: by 2002:a05:600c:34d3:b0:499:6eac:36d2 with SMTP id
 5b1f17b1804b1-4997846d9c5mr45866075e9.17.1786448103280; 
 Tue, 11 Aug 2026 04:35:03 -0700 (PDT)
Received: from arch ([213.211.149.70]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499788f11b8sm43981595e9.10.2026.08.11.04.35.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 04:35:02 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 11 Aug 2026 13:35:01 +0200
Message-ID: <20260811113502.106639-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786448103; x=1787052903; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=yA/z8E1AZGZs4OGs9DeGOV9rVn+Xd6RJjo/8nFXIpE0=;
 b=esiYn/CPALNSCV+ivq1wjTUXw+Ye6jzhS0KzRni11cqzCE+mwYkuUpU9Y31wPWdGIU
 AT3UpjfmJ8lR3b5pFBV+1NDnZ3hKHh9TD+AHEqJactSfNBB5Lgw1BPXAK+mCVVzpKs+P
 dAIdtD5yOAfJeaXnxDBm7GpjtwfVMMgpxN7GgFuhRTixrJvw0ryn/X59/hPnDV1ZKKUs
 B5+C3jzCKh+VePy3LskYtuTAA9TnBEqhBbvyLnDjVpXisIefDfBSecJhavt/ULwXnkkx
 sAhBBppaGwkchMiV3qNFJlAlZxwrXs5C9haxRSoX3p3SbEXXxFVo5LB4QKtijo16gM1C
 NTnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=esiYn/CP
Subject: [Buildroot] [PATCH RESEND 1/2] package/busybox: re-introduce
 IGNORE_CVES for CVE-2023-42366
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch `0008-awk.c-fix-CVE-2023-42366-bug-15874.patch` was introduced
in [1]. The IGNORE_CVES entry was removed while the patch is still
present in [2].

Re-introduce this IGNORE_CVES entry.

[1] 75c594d446 package/busybox: fix pending CVEs
[2] f88537c46b package/busybox: drop stale IGNORE_CVES entries

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
Hi,

I'm resending, because I'm waiting for this series to apply to fix the
busybox CVEs on the LTS branch.

The same patch is applied in debian and yocto busybox 1.38.

PERALE Thomas
---
 package/busybox/busybox.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 32a765c6a4..c938782590 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -15,6 +15,10 @@ BUSYBOX_CPE_ID_VENDOR = busybox
 # 0004-nslookup-sanitize-all-printed-strings-with-printable.patch
 BUSYBOX_IGNORE_CVES += CVE-2022-28391
 
+# This is not stale, NVD entry mentions up to version 1.36.1.
+# 0008-awk.c-fix-CVE-2023-42366-bug-15874.patch
+BUSYBOX_IGNORE_CVES += CVE-2023-42366
+
 # 0010-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
 BUSYBOX_IGNORE_CVES += CVE-2025-46394
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
