Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6330CFC6166
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 01:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC42A40868;
	Sat,  3 Jan 2026 01:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_rOklMtHFAZ; Sat,  3 Jan 2026 01:23:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E6DA40838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767403428;
	bh=071DV3cif1l7ukaxl8Hi1HQwHBfaIiLH0gqyvpRxYN0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=sSo9pKK9qb2LTS04WnUoqTAO/u7TImXBa5aIV7kycNjaPkswDWk0yFDNVD50kY2Wk
	 9rRGEDjP0CdbWTHEs7h+ZJz9JtNH6rHm1UjaTnJl9ox46xX/ceQsnwOqfP5uxvvikU
	 PQWDsInQplhSnaYp1kH+uLsG3oc0Q5YRO3Dev+cfM60vQf+/4R+fw2gMyEiwpwAjrj
	 kucO21Xzn2WDq2+5l2zy7724wCfPdI6AnMQFpW2g9XFzVLubWujybN4yJ8OVworDys
	 vi84B7wHxeMZeT73u/k/LKwlSWLlJ9Cf4UfThmVWcWuHX9SiYV+msGoLQw0iM8ohP5
	 Y0sICCG+KW0Fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E6DA40838;
	Sat,  3 Jan 2026 01:23:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77516351
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DFF1402CE
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JpNW87BIoapc for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 01:23:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3932640024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3932640024
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3932640024
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:23:42 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-4507605e19aso8403240b6e.2
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 17:23:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767403422; x=1768008222;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PXrILU4igaNTMkBr3uLwZhkNdARhV0ByDPnjqg2M3H4=;
 b=jNk19xWKO+9DeFO+IOkbDPFKhOdW6YQiJXoKLtLWOSfnFyXPOsWFiPQWoW4kHneiLL
 q7hMAFY0iTgSdwXI3GOkCm6YU9db6/n/TM0UjxfBXvv6qeT2jctpnGpNVvcCC7IBAMF1
 QJzpQtBgWJWD143xNMj/k3tGlEn9kYOiQBBf3focbAm1/yrsUzEl1iW4BTROMnUWOxyt
 ZB07XRzagIlMCM171bcXTWMTfMpqs51+OUl0n3IkjucmdXlH/FH+N+RtnaPW0vZuM5+F
 Lfsi8rGTs6Q0wj6KFrvzfc8x0wmjiPF6ZU3HtxmghlfndQ9v0GwsJ4aPbc2N4hKv1u9C
 xNsg==
X-Gm-Message-State: AOJu0YxZC27xODMIGGliTBD0u7RYCIUBd20NwhntgkWcnj4/MaBYAzyQ
 XKBJdq/2VmqGy2+PWo+3W+eLykAaY7t/K2OIoUEyke/0hxXZVQEqDFqlUW0krWy3WdA=
X-Gm-Gg: AY/fxX57/2Ee+QglVKI63sIvERZTT1ea8LFbpDzNlKbqQKk26eapqxMvwtqQPlw+p2a
 HxorhtBTJandTXGJ6Wz/hwjbyTSCR+nA4hclGnbKQ4n4VCKBpdY0AF+g87JTfV7B2f9HOnTRYx8
 ivZW7abOoQe7g9A6XXAwGGCdR7hOJvHPM0AhxETE797Pa4QKmpGAKK+cSF4a+fMn6J/pA9XBnBr
 pOrmMeJYpqt/qk4qFSLzzU/B71pTUyvasCz+7KoiCFgy1WpOR7D/gjmCfEv8t2DZ/Ue6xf5oi02
 NjgnM6MRaB5mTF+jkJivbcysfefMBh05cvM/DPSYWm5Zv1o/BsvNjkWNnp6JxTgNUIWnLbeRsF4
 1k9CvqbNtJ2kbI0mZ4pwVrhkrW8P8l+uEk8sN0pm2kvGX5iXpzZXhhHq8Fs3IlLnmmcApCi2uA/
 PGkvXDRMemAV8BxDVUsupl1JIcrDvb6MN5ybJpq8ySBBw1eNQVrjHD6r3z71FMLvptO+pFKB3UN
 v0bVN3dKoDV+PM/E42Mf5B7vj9O4M830Xc1dxiZLNENr6fB97xQvXc=
X-Google-Smtp-Source: AGHT+IGOKm8kk7s89VlqBodZ/JADxAw1C2Muiim9XHrIutPsnaxq4vUpKKsQ1vljVjoac+nm6KLZIw==
X-Received: by 2002:a05:6808:1991:b0:43f:7dee:4693 with SMTP id
 5614622812f47-457b1fc1e9amr18603046b6e.14.1767403421878; 
 Fri, 02 Jan 2026 17:23:41 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaab5d61bsm27047349fac.12.2026.01.02.17.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 17:23:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 18:23:39 -0700
Message-ID: <20260103012339.750123-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767403422; x=1768008222; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PXrILU4igaNTMkBr3uLwZhkNdARhV0ByDPnjqg2M3H4=;
 b=coNqhBpa36eRnCiF2TetiZwQqN0lq4mJv0gxGiH7TG1T9kkF8sTuNBRbMFpHLHJ0g/
 35OVvgbbE3uTjENAp25b+oV8izvgwNlX4v42zOcIDYMhRffBjkD6jd1gQl2nEDq4vUOn
 rf91pIC2wirCo535tULtfYrLunxDXZ84H3Vjom4/FegSc3IDgNL4ufhoLHMHsZtsEP+e
 VK2yJHZCNZKz7odi79JBrHzGHpQYr4yifFLME8RKX05beAAKF0GgSLCYvEYIHuthdQX9
 BfLkCkqlrEXiirN6RkZiZW+NVN3ygX4QqE2BEfTrQl7Ud6zn5/vzjSMohfe9wpAfWRiP
 AbKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=coNqhBpa
Subject: [Buildroot] [PATCH 1/1] package/python-bottle: bump to version
 0.13.4
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
 package/python-bottle/python-bottle.hash | 4 ++--
 package/python-bottle/python-bottle.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bottle/python-bottle.hash b/package/python-bottle/python-bottle.hash
index 3ea1f71ca6..722eccba94 100644
--- a/package/python-bottle/python-bottle.hash
+++ b/package/python-bottle/python-bottle.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bottle/json
-md5  3564bf7c5e348d6dee6dd13a89dd9330  bottle-0.13.2.tar.gz
-sha256  e53803b9d298c7d343d00ba7d27b0059415f04b9f6f40b8d58b5bf914ba9d348  bottle-0.13.2.tar.gz
+md5  a8dd2700b477b86a38510a2a31d07c78  bottle-0.13.4.tar.gz
+sha256  787e78327e12b227938de02248333d788cfe45987edca735f8f88e03472c3f47  bottle-0.13.4.tar.gz
 # Locally computed sha256 checksums
 sha256  af150257b1f7cce92b6207854f2e8f90ea9ae52d7cac758d13a47bd12e2a2443  LICENSE
diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index d6469b11d0..01a73514ad 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTTLE_VERSION = 0.13.2
+PYTHON_BOTTLE_VERSION = 0.13.4
 PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
-PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/1b/fb/97839b95c2a2ea1ca91877a846988f90f4ca16ee42c0bb79e079171c0c06
+PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/7a/71/cca6167c06d00c81375fd668719df245864076d284f7cb46a694cbeb5454
 PYTHON_BOTTLE_LICENSE = MIT
 PYTHON_BOTTLE_LICENSE_FILES = LICENSE
 PYTHON_BOTTLE_CPE_ID_VENDOR = bottlepy
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
