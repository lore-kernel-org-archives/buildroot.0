Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C912FE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 06:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9590260D9C;
	Sat, 11 Jan 2025 06:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sz09SDgC_mHx; Sat, 11 Jan 2025 06:38:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8398960E35
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8398960E35;
	Sat, 11 Jan 2025 06:38:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 234BA940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1162C40967
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:38:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qlg9hUE55cCe for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 06:38:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 700BE408E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 700BE408E3
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 700BE408E3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:38:07 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-21675fd60feso62677665ad.2
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 22:38:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736577486; x=1737182286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MwlawhEj3UeEjHyPEMc/XvHvps268Lfb0LGvxnTweFI=;
 b=H7naSWxrmgOnPmnFeQ8Dfe7vWblg+2nSdpVtkfMl6Frj8Rc7mB2kOuTGjT9zHZPwd7
 Dm4elSlEWkx26+4Y2z1HZ3adEcxVB2juOLwI/XAzn1LJMTId1FOPdjJWlio86r33gQfM
 pT00Hd10FQBO9NlfsoKTyasiWxgrgs+KXs4zAU1Rb+/09sMts+dMjXZsq36mxj9LRbaL
 VtDw9OdhkvfCwmoZtpZwThsW8yOA67yqjs4GOSMZ44q32rSWOirKVK6yus/s6TlskJZG
 NW52zbpa2d0rDksjS9jMLyWSjgEhpC4eW41+NKlwem0sWA4NQMULfOMilqcwedx6jkPA
 qabA==
X-Gm-Message-State: AOJu0YwSyZX+efm/AiABS5ffz3qHlWrPRl4XKetNlhhKEYzWf6du6sso
 45YCDRjSC1reOxqyng6G4pQvR0AGdRhhWHwhTz1Yb+z7H6dqDsWtYfCSF3Rw
X-Gm-Gg: ASbGnctjFJs2G9RuffSZktwO4rfV5Q8QoOlseV16cp8GlV1zp86vIZnoM1gRFc3khGW
 d1UDhmphVngSx+ZRjTgGt8AEQilSSTo1m2hEVTm9WQ6uN+fZi2TIpyJgrPmSFPNNRSbm5jdTp7k
 eVagnmnw2KZalDJCHjSwwI/FpKsWtgpkIqi9hDZWyvA5J0riZdgNspZhZqmrL8CmF39Xwqjef/P
 Sg3PjVKrirRPw0Agt8ZQBbFq+1fmjnFAiYVN3Whvd3w6PSuVGqnGKAPm77mlRMOqMwek5byBmta
 q3LeYSj78oKF5JfSmCGeIWYenGJC8OUr3plUICCN
X-Google-Smtp-Source: AGHT+IGkZ5UDCaBuFXGsqQnJ/Fu/yfc1T1nWiaxnIKufvGFoWdSvNN7GtnldgQReiYsc7yccLaMqkQ==
X-Received: by 2002:a05:6a00:92a3:b0:725:eb85:f7ef with SMTP id
 d2e1a72fcca58-72d21f5066dmr19618994b3a.14.1736577484923; 
 Fri, 10 Jan 2025 22:38:04 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d406a9433sm2477488b3a.176.2025.01.10.22.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 22:38:04 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <brandon.maier@collins.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Fri, 10 Jan 2025 22:37:52 -0800
Message-Id: <20250111063753.769689-4-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250111063753.769689-1-nemaakhilesh@gmail.com>
References: <20250111063753.769689-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736577486; x=1737182286; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MwlawhEj3UeEjHyPEMc/XvHvps268Lfb0LGvxnTweFI=;
 b=kf2B/HpmRYGSJNjsMmTTa8JcszouR9ce5kGNr+z8zTxLAC8wMM06KOtuxTIKVNH9z+
 N/JusGkNtKQOWhhaw1uJrfFE7aWuddU+SAa/Yd4LKEoZQGHpr/BFqHfZavYh2Pl3S2lq
 ArgRXSUjyIpeKg2845/myDrMfKF/G/3bUkOXaqqpKMFZKOIlsUq/WlM9Q+b2vp19vf9u
 I3gxVo/tI0RhTWP/wbu9UsEf+vw2jx6VTGGyEUpxE33g0x+u6NKtbjtY85iP2Fxklr9I
 W62DtIXPDRxj4tXDKVlShZi3Eb0Bmj/hQpXKIbcpk5o7SS3gPiGgvpBZeH6AOcFrQML3
 RbSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kf2B/Hpm
Subject: [Buildroot] [PATCH 4/5] package/fmc: bump version to lf-6.6.52-2.2.0
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

- The license file was renamed from COPYING to LICENSE.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/fmc/fmc.hash | 4 ++--
 package/fmc/fmc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fmc/fmc.hash b/package/fmc/fmc.hash
index 961ce18ac7..8f59c94e6a 100644
--- a/package/fmc/fmc.hash
+++ b/package/fmc/fmc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a58514816108a16d07307f924ebceb67c7d61709e4449978763fc44ed6e1fc44  fmc-LSDK-21.08.tar.gz
-sha256  f92862ceb95db5492f50a59d7c799c9395b714db88db92d11891dc0233e2ac42  COPYING
+sha256  13a5e327ef1d727946187fbd021513194981e42681c73e56933109af8a5889e7  fmc-lf-6.6.52-2.2.0.tar.gz
+sha256  f92862ceb95db5492f50a59d7c799c9395b714db88db92d11891dc0233e2ac42  LICENSE
diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index 4f25545ffd..c6d36f14a0 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-FMC_VERSION = LSDK-21.08
+FMC_VERSION = lf-6.6.52-2.2.0
 FMC_SITE = $(call github,nxp-qoriq,fmc,$(FMC_VERSION))
 FMC_LICENSE = MIT
-FMC_LICENSE_FILES = COPYING
+FMC_LICENSE_FILES = LICENSE
 FMC_DEPENDENCIES = libxml2 tclap fmlib
 
 FMC_MAKE_OPTS = \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
