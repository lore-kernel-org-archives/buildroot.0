Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751E5FC6166
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 01:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47B7181E58;
	Sat,  3 Jan 2026 01:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1O4uGgqFkiC6; Sat,  3 Jan 2026 01:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6049B81E5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767403927;
	bh=WuCJHCes3608X/k8Z7mq3rFuhWY8LZq35CGeeRB9lO4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Wb3AtzftOmy2FPMAVwATiT2ZcovLKetK/x1HGMbDWfh2yZ3NDn1Xbjil8aFz3Hgpj
	 ZlV0ozH98GwTt5wNK0eUZLvES8iw7YVFV0XsQGbzBzTgz/p3Jvx7P64h6zUpdOuyx7
	 WysUVsX8BabPGAwsbOiqaRJHai3I7VJcCQnGWgyR6nwliVlzM09/C5k/6GJ/PgczHt
	 vUV5RaeT1mRiWi07EzMAidixVAGBGlowwY5Q188jX1WPknZQ8VtVHKGld0m0cVBduB
	 +SpWtgQ/gQhJKKBxGbl55GpEr+1W2EpI7rvKLGE1t24h6mkcIMxczDQbJ9PYe6avmk
	 ooSp7Z9McwUDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6049B81E5C;
	Sat,  3 Jan 2026 01:32:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 55CDC440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 484C240809
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Boe4Y2_-O4r9 for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 01:32:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::34; helo=mail-oa1-x34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5469C40784
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5469C40784
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5469C40784
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:32:04 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-3f0d1a39cabso8084629fac.3
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 17:32:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767403923; x=1768008723;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/9jb2EEhe6+wZKpTs7q0uLUzUEiI4K0lGRUtAtDkALA=;
 b=A2AZSe9S1s8kEu3BEkBlPCkgGDM6x6aBPtx85bgJ9sSKnZf/tWFENhQThw0/sdCfSq
 B712Ou3W6VHe3PAOx+IhS3r5QZ0cv2eaNcv5cxOAesh5fvJl1u3cR6GDU5FQ3lnGWDUY
 80NYubNK/Nc+nEDHO4xOHuvpHnIB86pETe7bP9HPZsApA/t8TTnWz9UnT09je+EAQykA
 Y3tuCmEz8FGYnVPk5GELxrIwWHhppOLmUx4Eck6kYp7PRgH74TvbYRyLj6fNrQ244is+
 y2H/QvBiksKQtN3WeEvfmucZEsYxhxn7aQ0lISoyG6ItHNEeutmi7VAFv5Mprt5Y3OPM
 3j7w==
X-Gm-Message-State: AOJu0YyXJZBs4MdOjtvSVthQjRrJ3kWudQMJz+PtLh8q1Sq04olF2imO
 PhHnj88uv/lxwPDEPoYkwxqqb0fe9ENVKg3zeQXTKOBnEpM5McnIKYuSoUTyL7dvlLE=
X-Gm-Gg: AY/fxX4F4QVkGOCz3uGPJteGHU4iEetBm5FZQx204qqMMvRxjHMt6I0IGxxhzTxZdvj
 ObgtuneP91wB8pnrosM3CfiiBbRJ1WDOC15h6SyejEMXMn82PowjJmZE3kq5DSwhUO1cNLDvJ+D
 4pC2gRm2OWUOTMdmp/KZAVX2TSNQEEX/QZFZBZ1bkhBQp/mcliA1JuxQmIdGr5Q9jfcC4pWhLod
 /OE65ph87m2ktVgoMmcO8VWujyYot/ZUB2BFDtuJ9OK/BKmKwzQOY5F4Q3UGvZv1NkSBlo1Bywz
 an+/gbRIBzBJ3HCzMDiZS+hk1AdVxI5/9YpWmRl8sMP+89zb3SEDVYzdeoHhHDsEiTlGEZwq/H7
 yIPuMqX6uL6xQbsm8IloihcXtbpAtnPMOYGgMdXnSgPsa1iBZ0BpHmLMKB3iFEv2YPxoAbpSbLS
 Cg4/aCSMJhdITaUvAm6X4GWEDE3PWQfN7Uw2vwC/z5aQ1ZR7bmEMycATxjqoNIeCJY0JIfn+jHT
 jJ/yCthmsnGfrndxnwyvDec2951AzmO5NlSrqwOCxWKryCIjQWzaU4=
X-Google-Smtp-Source: AGHT+IEF8vDdqvGTK+Ri2Xsjl73Fyr57znisvEWd3dyGkZwI+/iyF6uNDofQm1oUtt7KmBrRH0J2RQ==
X-Received: by 2002:a05:6870:9a1b:b0:3ec:60f1:c7ff with SMTP id
 586e51a60fabf-3fda51edaa4mr24293429fac.11.1767403922936; 
 Fri, 02 Jan 2026 17:32:02 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaa931b0esm26995986fac.8.2026.01.02.17.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 17:32:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 18:31:59 -0700
Message-ID: <20260103013159.773935-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767403923; x=1768008723; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/9jb2EEhe6+wZKpTs7q0uLUzUEiI4K0lGRUtAtDkALA=;
 b=kf63fYdRf9p4oKaHXWDeEMhokL9HlnO9g1OlTKay6EPE49yLJ9UHxgv6MySTgWAPow
 cijbt2GdoyAFLsFJV30xCA0ASh9wjtkgfKU5rCmyr2oEa0ZBLQaqxII2ZhDHWCWHTLV4
 MjXcuXmZUfLW3iZyVR9yfaEN+hTHBW7+X+rLsBRY8eVvmmcCXozUcshPS6YEb3JaRX7U
 oP1LPDYFlDXkOPs2xXBc7rG8Z+ntzTG7HXb9oEc9dpOJAoK6gfTl/5MW6NCBhJnKNP4O
 b8XMq4F76p/YT76ovM9i0XY5SwBahZoq/bJtpE5RwdgWUIqfoWG0yRNvPorikYjI1MyE
 Wwzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kf63fYdR
Subject: [Buildroot] [PATCH 1/1] package/python-bleak: bump to version 2.1.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bleak/python-bleak.hash | 4 ++--
 package/python-bleak/python-bleak.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
index b3388d1917..c9af5ebfb7 100644
--- a/package/python-bleak/python-bleak.hash
+++ b/package/python-bleak/python-bleak.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bleak/json
-md5  e2a443b2d5f9671ff33ef632051b8c8a  bleak-2.0.0.tar.gz
-sha256  a8043fc0f3af1a00a84963824195463ca39789ae4f6804d3d7b1423e6083254a  bleak-2.0.0.tar.gz
+md5  e757918dbfcba6bdfcb69e82048fc3a9  bleak-2.1.1.tar.gz
+sha256  4600cc5852f2392ce886547e127623f188e689489c5946d422172adf80635cf9  bleak-2.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index 4aee0e95f4..abb556e348 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLEAK_VERSION = 2.0.0
+PYTHON_BLEAK_VERSION = 2.1.1
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
-PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/ce/cb/20f3dd0498a820278c7078dce786676d18342721a3723591d5853323b363
+PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/45/8a/5acbd4da6a5a301fab56ff6d6e9e6b6945e6e4a2d1d213898c21b1d3a19b
 PYTHON_BLEAK_SETUP_TYPE = poetry
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
