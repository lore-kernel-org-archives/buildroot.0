Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4F7C636B6
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 20:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B9C760B1B;
	Sun, 22 Feb 2026 20:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NG97uYFoazVL; Sun, 22 Feb 2026 20:46:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79BCB60EB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771793174;
	bh=fVjMSlIU67tRYuDVhdHYTEWik4NHHHQdNb0yKviIzQ8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Bp/44zjUIqbdhvFTaFMhpm2D+I+34GXEDnAZGti8h1vJgicK/UqUIAiKHicDDdRTM
	 gDpRuZYOt/nJloCF1VwEeu3DrmIvc/zn5wQpc+xFhMmRRl/V1+EKOf6YhsMSJrK6a1
	 X1mEERPEw+lugq/4b/F14YEQUy6E8ZIh8NJdhWeVFJVBChycwZwBa/jWT7c+M2oC2t
	 Qm1tnUZjUd7JPxvtOYAsvjWYTg5ttFJ/VRc0Y5DAAbloz7cMODP3mTB7lfj2CXQJNi
	 CU7VJUfjvgMbP32ZpOkXhMEFFUv1mkB3n8gw9iXeJRa5CcC6petxCQHecXqxc1BSLr
	 LNyCLiTthhu/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79BCB60EB8;
	Sun, 22 Feb 2026 20:46:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 251CE1CE
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 20:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1645B83DA8
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 20:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PuB1MHffc4sp for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 20:46:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 44F2183D9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44F2183D9F
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44F2183D9F
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 20:46:10 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4375d4fb4d4so2303996f8f.0
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 12:46:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771793169; x=1772397969;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IbdeSZhC9cC5zY+VVgw2gk8LOYBIghe15g8Z5BECuy4=;
 b=wL2rwphuHDN6N6N6ZzkIdkNeA3r6UySRlXS3gRQjSaGquTNEaCY/v1gFUk01dq/DHK
 LmN0A3Sk6GmJa8sNO0ILliDx2QaWEL8dHuLSu2E3TD8urTa6jKTZ7qUijU28h6/TYkaN
 fYTgkVIOb0h6+ikSzGDNVUU2y8pa7hyy21JssFDAZO1ILiwt87ikGBbrAEwtfH3S4WEv
 nJJlSd+THAgDHDkJmO/pvZAv5oYeWu5IMwtCHsDW6sS98eCwyUSsUqOtla/TMAxCCeyZ
 n5dHcv1s2bn8h2eDCYg3ootMibz3AsVNbNBQAnL9akRfIuw3Wzpjk2ytIA3HyXuLuphA
 s0RA==
X-Gm-Message-State: AOJu0YzRcNwC3lG3cZ1FBG87Afg46mDNIAxYSU9nnJD6YnZJZ7HRC6pD
 vurDjBXuKvagQLprzpVy3qflWmo12s9GEc8SK2cPxo6zVGUY+XF+05JjNA78v0drTKc/HUDqO5t
 wMgrc
X-Gm-Gg: AZuq6aLRVBzXIec1yp4fq5eIYR9QNknsyxUMKMcHompUl4n1tcTeBajlEcAhc8C0jGP
 Ltk22WaiqQlIIPnCrFC1H2NqlCEjYzUtHM/1D9bstMcZ1mmL4ULbKTHkA7Vofi8yShHlCKbT2i2
 Q5M55NdNMbsJATPZUH5OBnUYYH0Ff42Gfty30r6/XAp/Vqwpm1XNj3bbB6LpSP0FGbfGLwNjk2t
 C9Ua7P2OSZnQFKt3GcYBl77GXpdWpBuDDyuEDMkHrwaQ4BCkSPmeDUIHUjIu+Q+5Ig21/Frmrcn
 CQyHqJyn6T3g0o0t1JVF1exablyp7UrVRWV4TufAqr203yqJlZX9P0OOF+5Iq/w58qtjooyHXoO
 fexzMsW+Ss7r0YESaY8BfWGUFYT8py4MFQnimRL8U69z2AzOOr1ITmxDHRryV0fT/Rvmn+2+1Sc
 3ak6ZHWTPG2udbmsiJwmXWcUyc8g==
X-Received: by 2002:a5d:588b:0:b0:439:5027:a2f7 with SMTP id
 ffacd0b85a97d-4396f15ad95mr12028559f8f.18.1771793168100; 
 Sun, 22 Feb 2026 12:46:08 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d3fff9sm14534190f8f.18.2026.02.22.12.46.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Feb 2026 12:46:07 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 22 Feb 2026 21:46:07 +0100
Message-ID: <20260222204607.292238-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771793169; x=1772397969; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=IbdeSZhC9cC5zY+VVgw2gk8LOYBIghe15g8Z5BECuy4=;
 b=OQlET8uzXDPWC+FexLIXXETbRm7+epYS0g1Fv8FVdySCAbWf45EZ3R1tlpSJluyapa
 AJ3R8ZJalxB0ASwIiR2xqzvI0POqzB1ynpugBOX0mDL1WtgflU3POOrCakwPHnYoJwhx
 VTuPICT5IrPOtaD7+pDaS2PlQLj/MA4MfKKh/LxFOv0K+39gAHWp+CwP4azIScyDuhsH
 2qVBwGS13ABSmaOEj08eolPPxz9jBz9/alvmg8Qu2M2hnGfN1k+x0phbXxBXKLtja/1H
 yDJQhC7EVSkWwJa+6pltLEcd1QjiWfbOtil19mR7usDLnr9eTLwLKMjLuEdZnk71SF7w
 GIEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OQlET8uz
Subject: [Buildroot] [PATCH] package/c-ares: security bump to v1.34.6
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

For more information about the release, see:
  - https://github.com/c-ares/c-ares/releases/tag/v1.34.6

Fixes the following vulnerability:

- CVE-2025-62408:
    c-ares is an asynchronous resolver library. Versions 1.32.3 through
    1.34.5  terminate a query after maximum attempts when using
    read_answer() and process_answer(), which can cause a Denial of
    Service. This issue is fixed in version 1.34.6.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-62408
  - https://github.com/c-ares/c-ares/commit/714bf5675c541bd1e668a8db8e67ce012651e618

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index 1c28d91e97..7bf4163e55 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  7d935790e9af081c25c495fd13c2cfcda4792983418e96358ef6e7320ee06346  c-ares-1.34.5.tar.gz
+sha256  912dd7cc3b3e8a79c52fd7fb9c0f4ecf0aaa73e45efda880266a2d6e26b84ef5  c-ares-1.34.6.tar.gz
 
 # Hash for license file
 sha256  460f5e768fda3752ca2169a95df062578a10fb126bfd65f3b9b1a1bed2f84807  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 090147d0e9..1653b16c28 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.34.5
+C_ARES_VERSION = 1.34.6
 C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/v$(C_ARES_VERSION)
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
