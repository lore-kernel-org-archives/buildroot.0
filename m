Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871FCEEB571
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 22:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A99A8608BA;
	Wed, 31 Dec 2025 22:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i0M__90yxvjb; Wed, 31 Dec 2025 22:18:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC7B960871
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767219521;
	bh=F/Bh3SdXi0WADpIjvP5QM7U3Q3Y/rPpH8dHjGpkopis=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=DiYRS7rzm9rHmb/TCCi1j2x/RK4Y+D2z7VSzEPxeJDLssoQ+ReB7DxCwLqNFdco2q
	 2q9GRszm069FYA+a6KYwZHifo46c7cg4nDPp+ePUzkKM/IGWWuACt8fk5bml25r3oC
	 YSgd5lvtk8/9bZUFwwtprQn5lkxZHES0J3v5cJ55xF2NcfAsxREzaUPp0AKFZaHXJY
	 XYUeYj5LUf4bYgmFzoKQTnw4oQkPvfr+xlVVBD1sd6wHx4Fqsr7kqrkuExNKu2Bmj6
	 ulizynOP9ovmB5din6zkeT2nzyXz6wVpZW2H4yiamyPLzVuQogLYRjyNOEZna6wJHd
	 sl+EkpzmYzpLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC7B960871;
	Wed, 31 Dec 2025 22:18:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B1ADBD8
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 22:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2E3260871
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 22:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KqX2hi6zo-Sy for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 22:18:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2b; helo=mail-oa1-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A82C86086B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A82C86086B
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A82C86086B
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 22:18:38 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-3fa139e5d90so3786224fac.3
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 14:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767219517; x=1767824317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HOteebmH1j8Ysb5aNj7RR4mnWW52D2Gi7SBfUY0ZnZY=;
 b=Y3KZSBmSwvD5BiRlUfsoPQwomFvZFKo9w/ixOVJ/5rv1dH9xI8VhO4DpDoTlHm/NUk
 ybZiRjECNT33CImtxTqORn9W/O0ynOxvaiIozgWipdNYXGAJX/KGwUTAt1HSFhn4RMV8
 vFYiqNqFv0FWOR40KTej5Hjr+1IWIxfcOhbpT1kvyjtvzTR7+RigTThDchHAbd9erxQB
 IMD35ye+DDHrdrKVvhOF+2bhLKb2l3sHHlkkDnWGuBgtGNhoz/7DRHCW2cV/lLLRngP2
 SteKK+p0x9pgMMWCCFP3Z/TwHq5ux/pbYNvttuGFOH60nOLgEXxBfeq5ZMx9tWXpGgW+
 KC4Q==
X-Gm-Message-State: AOJu0YyEUDX4PDdCF6JoRr8dvWewP5/EIMoNlWX5xE18o5w8oP0wbY4O
 sIfcSHYKuxNYUn+DF1S7AE+dCR0NysnezRev9JKnYDNcbSKVKy33lrI4JDh+kQrZqIE=
X-Gm-Gg: AY/fxX6HVXY5FIBUtl+T11wC5u2I+pdyXJBHtqOrkNS46HciP2WbspLcneOZJQTlTTf
 Co0pG/jq09GK4cuhCQPAhacSWN/bFz1Nj81vrRaCrgS1c0QYoAJum8zQYqJH6UnZpn3xEspUgoP
 eKK7tgrubFBO088v/c+UW2TVtcixsigAria7ftcoBsbVBrdivZXJ2609psbVRaxZ8Cw6Jo+dtAS
 65Le2wMtPQvveOThJy0K+ZTNoXtRHuu8XFVjFTJyYL9MbxwxKLLq/pKFQj2yzRWjglPDwAjRCw3
 jA06KujzWujCLAviK0zpbMR8ctHSdbGO6BbwFsrSlth8mro9q8PGKunkPdIImS99x3K0tUQ0zQP
 n7cbp3kzAgEoQfhkqHGT1MZ6t8uXKjb2F6iXm9Wt9L5eWwaTEJ+50TuuVzQClL6A8O7d+88Rtpw
 p/+yRh7haYA5G8/XwvnECJlBwTzM26ycJOyykUydfiWmi+lVIk9PJ4cmvPC1HJsCW8iNK+TxgxL
 34hTAKObb+OHXoH+kOA90tHFgWu/UYKIafb94gSuV54GsQ/X4kLrLR4C49qjn2mqA==
X-Google-Smtp-Source: AGHT+IEeLOne1ohL8oymydz2lQl185TcAUM2svMP8X3RK9gXnpWUAHRUW32fQlEujpVB+FFwfbyGhA==
X-Received: by 2002:a05:6820:f028:b0:659:9a49:8dd5 with SMTP id
 006d021491bc7-65d0ea47292mr16233660eaf.23.1767219517258; 
 Wed, 31 Dec 2025 14:18:37 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-65d0f3f8807sm22831692eaf.3.2025.12.31.14.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 14:18:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 15:18:34 -0700
Message-ID: <20251231221834.347467-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767219517; x=1767824317; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HOteebmH1j8Ysb5aNj7RR4mnWW52D2Gi7SBfUY0ZnZY=;
 b=V8mi6P6hElmRDTrXOro7MypwqfQWYgYWLmIrLjxwsuRa/ePeSjMTcrCE/hpJh4KuEc
 0uvic9WaqP4I7dyO3KnrnQ9Dr7jPRVSgyi74uoQDBYEF9bkZoUTZVfyRYk//7XWsLVT2
 o5I+hxex7F0+cgAxG+o7MurG/pIH+Ru8Fpo59mFlgbTl0lYqOOVHAA3/1ESUPF38UvON
 JIJ1irCP0vDH70s27Mhkr2kpQ7U1ol2UR0x2JRGk/AawIz2gLKtvAjuomUpTlYHlTOun
 hPqUfMZoqewfkdZfvYpn1pSMEnpsJ6sCZu7PFlm3ih7ztAo7a/7vn2LBIMPSO/Z8rWzA
 2XOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V8mi6P6h
Subject: [Buildroot] [PATCH 1/1] package/python-pyalsa: bump to version
 1.2.14
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyalsa/python-pyalsa.hash | 4 ++--
 package/python-pyalsa/python-pyalsa.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pyalsa/python-pyalsa.hash b/package/python-pyalsa/python-pyalsa.hash
index 206107d29a..89e50bda7f 100644
--- a/package/python-pyalsa/python-pyalsa.hash
+++ b/package/python-pyalsa/python-pyalsa.hash
@@ -1,4 +1,4 @@
 # Locally computed, after checking pgp signature from:
-# https://www.alsa-project.org/files/pub/pyalsa/pyalsa-1.2.12.tar.bz2.sig
+# https://www.alsa-project.org/files/pub/pyalsa/pyalsa-1.2.14.tar.bz2.sig
 # with key F04DF50737AC1A884C4B3D718380596DA6E59C91
-sha256  8abeaf41e5f48f617a52d1078932da89ab303d4a1d8f9919f947bdb1b7d03f50  pyalsa-1.2.12.tar.bz2
+sha256  4603736f40648684196fb826c97704c93ca80b32ec17d066b3276a9ed1a30939  pyalsa-1.2.14.tar.bz2
diff --git a/package/python-pyalsa/python-pyalsa.mk b/package/python-pyalsa/python-pyalsa.mk
index 19d2c91d23..4128ca089d 100644
--- a/package/python-pyalsa/python-pyalsa.mk
+++ b/package/python-pyalsa/python-pyalsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYALSA_VERSION = 1.2.12
+PYTHON_PYALSA_VERSION = 1.2.14
 PYTHON_PYALSA_SOURCE = pyalsa-$(PYTHON_PYALSA_VERSION).tar.bz2
 PYTHON_PYALSA_SITE = https://www.alsa-project.org/files/pub/pyalsa
 PYTHON_PYALSA_SETUP_TYPE = setuptools
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
