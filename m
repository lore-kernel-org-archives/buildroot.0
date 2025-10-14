Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38333CCD190
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E282883DE4;
	Tue, 14 Oct 2025 18:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rOGhtb6xBfxA; Tue, 14 Oct 2025 18:37:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5531C83D8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5531C83D8A;
	Tue, 14 Oct 2025 18:37:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DA7ABC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 047F283D8A
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4MmDWgRp987v for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:37:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E0A6983B6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0A6983B6D
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0A6983B6D
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:37:05 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b90so3258563f8f.0
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 11:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760467023; x=1761071823;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QxYOEqx83wSqRP6yVVisZ28yXOud81wEXoRgwO9BOvU=;
 b=gm4O4oNL6ALWVgwM9U7fi5KOQJG9t0kaF27J78Fdo9DNhbFx8WVwihfPv7m61QqULD
 w87Jy/CSj8aOqjhIiay/Kend69q+m9+iJTBwBtN2aKvzAJ2UDbYhU00ql2q6Ku925jBj
 kUGw1lff2trP7ml1jQ3pyt4CIdA8II8TSi01nYn8W8OKiB0JSk1QavQUyKQfK+lePjph
 SdUrv23cvwU/OW1u7rqQ32AjWo9Ih+t0J/PoxUjXbwcK+r3OV8WpfPMLxNTd6/yRbYaA
 5LTkscVhLmDL7vlbq2lBHukY3DPXbGfzBzlMcbxjnnAu1SoV8x4qnzG95YqmLcDjWd3h
 pX9Q==
X-Gm-Message-State: AOJu0YxlaZ/OT5NnoDpZrLZSzMJ6Mu14VR7U/EVW/A6kZOddlx0oVvoN
 GXhSJjlh3JxwHf3ATCWoyIAcr+sqLMIDoefvPi4HTiUdRrya+/oY8ykMUNkE1C0yljbA9WkwJZI
 zUFhA/6M=
X-Gm-Gg: ASbGncts3zaWirecYUSMw63b2BHt3mQxDDVTAgdFrv4W5D3vfJ79nWkIbm8W/hWaffX
 h7Tc/C9/DSOUy/iSkYQyZjJcOtrYBWSRrBzUuEzehcavP4WwJjAQl3rixyIcVjn9YGiFrRjnP5x
 CncPNQZzfuvO1eN8gG88kOMPjApCHSNkpM+DLZaEmdlQkG8xQ11arrwbc9V4cvFAyHw+s66rryq
 IX6gXzKA6c6R7KirAvL2mdctDKi4STtSHqvovDaFPqy7fODDvalRfq89ioClMCwnicVDs0cq/cF
 S4MhIM+g9lOJKOcqnPMMJeQJFL9Gj9ls4AerTsaITzxTXvEhPmizrw36qO5DU337m0KoQIo8qn9
 CLThPzk8bl5TNk++/Otirg/EvNNN5FdSYnYOU7V6cT2kzzq3sCxzqg+WPHVpLhThkTQNKL4Sxjt
 vfQvxMiSOeaKZJ5w==
X-Google-Smtp-Source: AGHT+IF/C0Ra+PltDr/7CvMkDLEemkt61fdRBIYdvqmII9P8WzZUa8U1ii62FEMC55IB8yCJ7dL1iw==
X-Received: by 2002:a5d:64c5:0:b0:3d2:9cbf:5b73 with SMTP id
 ffacd0b85a97d-42666ab9929mr13429029f8f.6.1760467023517; 
 Tue, 14 Oct 2025 11:37:03 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.97])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e8141sm24735037f8f.48.2025.10.14.11.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 11:37:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 14 Oct 2025 20:36:58 +0200
Message-ID: <20251014183658.646665-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760467023; x=1761071823;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QxYOEqx83wSqRP6yVVisZ28yXOud81wEXoRgwO9BOvU=;
 b=fgWd7fThn8Tp5UYs6uuiD4QAwuWJA4evaSo10VlEwUqlF22E+HpBuAtjGo9yYmznvj
 +Ds0CML7c+NuvhLoZDJXFEPOJOBidOkq+VEpHfMM7aIY5k7UvNBDE0A6NARDxB3nzqxr
 IXG6NwEEF2lREj+gPw9ACzY3+TR2u+SAphXVA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=fgWd7fTh
Subject: [Buildroot] [PATCH 1/1] package/ipset: bump to version 7.24
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
https://ipset.netfilter.org/changelog.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/ipset/ipset.hash | 4 ++--
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index 7be4b368c244..e5b91b2d80b9 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,4 +1,4 @@
-# From https://ipset.netfilter.org/ipset-7.23.tar.bz2.sha512sum.txt
-sha512  5a43c790abf157a55db5a9a22cb5f28a225f5c7969beda81566a2259aa82c9d852979eb805b11b4347f47c6a0c2cc4de6f14e4733bee5b562844422a45fb9dab  ipset-7.23.tar.bz2
+# From https://ipset.netfilter.org/ipset-7.24.tar.bz2.sha512sum.txt
+sha512  18ccb49bd38083f0556b11e1d17f43791c52a2b094c9a500b6f770796b17e8e70c3860a628eac2252eb672b1fc9de734d3a0e0823d61dd9be7b4188adc6dd214  ipset-7.24.tar.bz2
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index ba53c1f8bdd4..861a8684f47c 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 7.23
+IPSET_VERSION = 7.24
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
