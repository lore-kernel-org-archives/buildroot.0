Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378F5E94120
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 08:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 065504076E;
	Tue, 30 Dec 2025 08:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wFgiUtLKaoTh; Tue, 30 Dec 2025 08:19:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33E1F40672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767082782;
	bh=Y0eo/3ojADmXUCbHdt40V1U3i9xxGEqDBEostxaiw3M=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=jrsTZaE2InJyml55d8YRmIAmI5KrwLVqXVl4R+eNbf2PwPfNWpQ0aXwGG2+HBwRD6
	 U895McvubuAA8ePTXQ+RKfhRnpaueu0Sc/QDPKjWqm+LwT44hAP8BdORhvHcKVbLrR
	 074g4bElhZvo26chajY6A0fNhtPWpC+XFThk0ieE4rLBbqSol5MGITaiZoIqv3I4BM
	 whYc3rtCuun12obidlZij4UOqgMWaYZi8awFcPT1k9HyFgEXx+EPc2Y1o23QC4fIuV
	 XUlxHu0RKuwh5Tp7gNgccc/mhCDJ6BGHGneeP+7PBrmnB9qJiyWT8xI7tuF0ZtMbqT
	 7d8eox8J39bQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33E1F40672;
	Tue, 30 Dec 2025 08:19:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 578F4D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E32160B14
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R6Prd3fuoy4a for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 08:19:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F6E860AC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F6E860AC6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F6E860AC6
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:36 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-432777da980so1910633f8f.0
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 00:19:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767082775; x=1767687575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9nHjh80G3vRxZ6gt1XG3LXgCp8ttsHHQz1JW2giDcv4=;
 b=pP62NBXKb3IyPvlQ2fmU9j/lSTYA4Gx99jQG+sT1GebZ7Js3pO+xGRPzB5M7zZWRyC
 kDiO8nAP2s2v14buuLnPiWYWqcs1M4MjR1HKbDIlKKc9/nAEBiptvry5ohhuszuj70lf
 w0QPrYCS+755isgxfK5SOiwUkCF+tJ0Rym0WOE+Lo8bWtGfJ0Fw32uMzxi68+XTaDqEr
 jnizNUu0+OYZmFHloQYUB4ZP6i84PKFQ7cIzmdrlEpSqVvn6bd1UQA6KTQmMOuB/y5l4
 GrnPjRRUWqrG/IrFQwl+gp0iUr8jN0N8JuXDdW1ObSR+YGlYw0FgBjvZNMwQNgNd8mmu
 HAzw==
X-Gm-Message-State: AOJu0YyfrWqo4GLr9QkRdATPyuAk11ebgC7l5rJBs4J6yGJlQET5LVYl
 0P8EegZheNwWXZ+fvHbuf9jqDxuNh483kKzd9SOdr7cDxuCDnj5Vo1aQiWnlW/3ctv6IF8FP9xi
 O+VCV2Kg=
X-Gm-Gg: AY/fxX4rKFHL9EH3yZGg05YNd00Gq8feUW1PWL1cY7jS5+iCuIS6g7+wxGoVy0EmvAk
 X73s0gc1J7H8ymq+nVhZa4ycVrxwAmn6UjmNifL4hBNrhmoglPxLJlNDf3j4kGjRTID1TIzvZmk
 rNHpB9qVy+xbgom4IQ7IY3+oQhGdfv2+xDCNq9tHWW4kPCcoQevYx8KnPiP3CXeuWainxhcHOsD
 9p8voWYwRVWzdKSlyt+ADTjizBsSvRLFzFvi5FbRkZOKXtH2rmg4auEazVFksZlGOFzv+Zu07RP
 0HSWn7oZKrNX8HZG8GSYQrflQ/QRXi8W52bspKu1y0j9ph8X/aR23er9e+RCRbPW1f1+f0/QPke
 InxSNJxruhAtCcATg5IqDcm5hXXfmo6nWoavEQYGyDv9LuLqWuFEEF2cZveX8eMmMpnoE5eEqv3
 QrD5A=
X-Google-Smtp-Source: AGHT+IGgYTNYDlvq7boF4HhmDq61eVpJId6zm9EZSvxZqTqVxaOa7h8aPtQmH0mDjd+SI1BwnVd48w==
X-Received: by 2002:a05:6000:1868:b0:430:fc0f:8fb9 with SMTP id
 ffacd0b85a97d-4324e4f9458mr34685300f8f.36.1767082774908; 
 Tue, 30 Dec 2025 00:19:34 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2ebfsm66328773f8f.40.2025.12.30.00.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 00:19:34 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 09:19:12 +0100
Message-ID: <20251230081917.18676-11-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-1-thomas.perale@mind.be>
References: <20251230081917.18676-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767082775; x=1767687575; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9nHjh80G3vRxZ6gt1XG3LXgCp8ttsHHQz1JW2giDcv4=;
 b=fQGxCfDgWoqjXz2JQlSzj23VWYVGpn0Ozcj9VqK9t/SKYcTXLWXl22MWFiLvizoBIC
 937yldGB/IKaQcvPdwf+URMtsQoRhAMN1Uu5Z4+mEt5rkadNeFG90seGFiXYqiOXZf3p
 r9YIg17sF82DiRLoAIbWPTVXlGIh0cYEzyZdEJk4GckPdGiHgo2qMHIDAsmZqmoZF1H2
 bBjbZXZUzHAIAu9KkeiD8wHNPkoscjvMQBWgSasrpDS1hbdxRArHbZ6TiWfuYbSHKm8T
 TNWonfPCZsoU7U40Fg6mO1eTG6hhoKJuOErvltrZdtiCmyxLPyLVXANmEx41hEZPr+wF
 sq+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fQGxCfDg
Subject: [Buildroot] [PATCH v2 10/15] boot/grub2: remove stale IGNORE_CVES
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

The IGNORE_CVES entries introduced in [2][3][4] are then no longer
matched to the grub2 package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching
[2] 2495630383 boot/grub2: ignore CVE-2024-1048
[3] e2f46ed03d boot/grub2: ignore CVE-2023-4001
[4] a490687571 boot/grub2: ignore the last 3 remaining CVEs

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 boot/grub2/grub2.mk | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index f543c53cd8..fdf274d9aa 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -15,17 +15,6 @@ HOST_GRUB2_DEPENDENCIES = host-bison host-flex host-gawk \
 	$(BR2_PYTHON3_HOST_DEPENDENCY)
 GRUB2_INSTALL_IMAGES = YES
 
-# CVE-2019-14865 is about a flaw in the grub2-set-bootflag tool, which
-# doesn't exist upstream, but is added by the Redhat/Fedora
-# packaging. Not applicable to Buildroot.
-GRUB2_IGNORE_CVES += CVE-2019-14865
-# vulnerability is specific to the Redhat distribution, affects a
-# downstream change from Redhat related to password authentication
-GRUB2_IGNORE_CVES += CVE-2023-4001
-# vulnerability is specific to the Redhat distribution, affects the
-# grub2-set-bootflag tool, which doesn't exist upstream
-GRUB2_IGNORE_CVES += CVE-2024-1048
-
 # 0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch (yes, two
 # CVEs are fixed by this patch)
 GRUB2_IGNORE_CVES += CVE-2024-45782
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
