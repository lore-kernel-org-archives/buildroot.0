Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00D3CD3436
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 12:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 697AB41B62;
	Fri,  8 May 2026 12:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AkVF_70Szo1B; Fri,  8 May 2026 12:31:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 951CB41B78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778243470;
	bh=HK/kM4eyg7eIqWfYJv/gR790HUM8ntGsi3dzDo2Mm5E=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dGqegn90RzSy/nkdRGHr6vLZru/V+BDLeztFumD/tFg+cI+vKvslRpTf1+NwT/PYL
	 0LEeRmOJ2R7qb1qn4XfjtPcQ+80K941SVHjBmQhgWanzNc/GSJivA6cFF2A6lEGm5F
	 E9+i/hc1b007ACJvCFfV8onl+sukbHlQSSaPjk48lIVicsVdc1nssSfuzjsfBAAdCB
	 s1kUaxB+li0TWrIERCn1fPoO1kDEem35P0lwb9uGxZrXtwj33akZIaA5M3V46Htfnn
	 CiOKoth8yZBJZAAFGKdfWWn3kXyhMHfjRQLuVWnGc4I0vdBL6Dwv6UZg15dvFcGrLa
	 zAzNUCvfZIBmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 951CB41B78;
	Fri,  8 May 2026 12:31:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E98B3358
 for <buildroot@buildroot.org>; Fri,  8 May 2026 12:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF0DB8411E
 for <buildroot@buildroot.org>; Fri,  8 May 2026 12:31:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hypCE4oLUuIi for <buildroot@buildroot.org>;
 Fri,  8 May 2026 12:31:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0897D8410B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0897D8410B
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0897D8410B
 for <buildroot@buildroot.org>; Fri,  8 May 2026 12:31:07 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2ad9f316d68so9359475ad.2
 for <buildroot@buildroot.org>; Fri, 08 May 2026 05:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778243467; x=1778848267;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mry7iqNRskKCBskDqInmOXg5CgawQARHVf0+hcnB214=;
 b=n/7q7oCnmAsZU9EOHVxB8b6K/5tt9Fqi2AYzkZX7nhw/YpshzSr/4nHW58EmaZ89xc
 +LRYJvpgJIy0c3YLs36OopQEQD/BILrjEij9dS6TvrcAlRqFmsTmuF+sChxc8JwSOOUC
 3HjORtjPCXI2MKHfPUQgSIejO6EGNXbDZz3fw0051mVBjwJvbd5VJsDR8qpCzc27wjou
 14gpMnsd3nDeAgq8PZv2ydZjKlHmy/Jv9C0hZEGP3L4reEpsxpJHOsthulYmPqzxflQu
 njxjLbJrWDhV0VBeWtlzDCZ0iZYd72YMKkXk4j72Z72oice08qJwoxiCOlKgTToIhq5t
 4Y+g==
X-Gm-Message-State: AOJu0YzTULuwGc4eDAzM61IPHuRG09JIo7EMHU3l/KJ58HGfQG20gERe
 39Fca5r8WreqlGvPVwKogLcC3J8lgrrMiAtFlvZJgBLA8QJfP29ETHRvkLEfcgmb
X-Gm-Gg: Acq92OH6P19iyRKvAW4zvtHjiuXaZZ4J4glkAgWwGroNodHUK8QK7CpfKbzOpv2DrcU
 EnsN7FG+ouDaZMPTeT8KK+M9D/t0i6G0wKdgiQdCTusWghzXjcDG/ZSSj36KkXILv8kGBnZmumD
 hBeA1CsQSk2PgccslMujdcCLbtrd8KZ28d+faHeVCTmG0i62gi9f5vd6fNNmlYi83IBecypDesl
 wx4Lv/WlcVY+n6dke1lV9JZbVzQSvTVuS/JagEcnzcjx/ly2XbtWhLLAEpgjVz6soqBMfxHKX3l
 XEQAFpJCZl6p0Z2HrWIXxkFyl11udTGcE/+9XIm/4FoECnOAiOnJjPsoyNFxno6EmkYn5yS4ar9
 zl4taLokr9szCR3qfxBJ0R3loX/EuUsr6ca2ewy8D9A9a3tbnz/dKHidi1bPPTgUSCCQ/dts+iJ
 +IUuaHNy3xQGWxbf0rgrxUy6drJzEXpCGCdGGw6uicYioqbPWCie25/hxYcTU=
X-Received: by 2002:a17:902:d58d:b0:2b0:5795:9ead with SMTP id
 d9443c01a7336-2ba78815137mr119901765ad.0.1778243466684; 
 Fri, 08 May 2026 05:31:06 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:116d:5714:b897:b3fc:b3f:3166])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1ead90asm20317865ad.72.2026.05.08.05.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 05:31:06 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri,  8 May 2026 18:00:53 +0530
Message-ID: <20260508123054.12450-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778243467; x=1778848267; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mry7iqNRskKCBskDqInmOXg5CgawQARHVf0+hcnB214=;
 b=XFZ2FOwIxFQEfb3/XomnDoBidMVaHPlC6UhPH/Wq/WCJs9DOCtEY4680KasTZ5CPMC
 STu8d2SnPLzgNxN4p2xZIT3rkUUVMdtyPabNet4dpipCTjgWhXbgsMpMDyB7wqAYs1h9
 vlli+LvngwJrfan3Qkf+qt4QNAXQ5XA2xT7Em7uAY31FnNaCCWgXWlA1saDp3vfATdPH
 gpMZmxVKyxRir0aHpmQkLkr43eqtfHJPTtY850su/x6e07jdYv37CNqN12IGSKfKHjFo
 rGN+khz+7vOl6/ZdtFlxq+ZqPmJ4BzR24GnFvmR6gwdVxyYUVVrGZBnDTDWPovjDJcZw
 aleg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=XFZ2FOwI
Subject: [Buildroot] [PATCH] package/libtool: bump to version 2.5.4
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

- Fix incorrect use of workarounds designed for Darwin versions that
  don't have -single_module support.
- Support additional flang-based compilers, 'f18' and 'f95'.
- Fix bug where the constructed rpath omit directories, instead of
  appending them to the end.
- Fix configure error for when variable 'multlib' is unset.
- Fix searching for -L in link paths being over-greedy and incorrectly
  handling paths with -L in them.

Release notes:
https://lists.gnu.org/archive/html/autotools-announce/2024-11/msg00000.html

Builds Tested Using:
- utils/test-pkg -a -p libtool

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/libtool/libtool.hash | 6 +++---
 package/libtool/libtool.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libtool/libtool.hash b/package/libtool/libtool.hash
index 8deaf4fbf6..72281eb465 100644
--- a/package/libtool/libtool.hash
+++ b/package/libtool/libtool.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  7c87a8c2c8c0fc9cd5019e402bed4292462d00a718a7cd5f11218153bf28b26f  libtool-2.4.6.tar.xz
+sha256  f81f5860666b0bc7d84baddefa60d1cb9fa6fceb2398cc3baca6afaa60266675  libtool-2.5.4.tar.xz
 # License files, locally calculated
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  libltdl/COPYING.LIB
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  libltdl/COPYING.LIB
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 6342e70a39..0b9eb35108 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTOOL_VERSION = 2.4.6
+LIBTOOL_VERSION = 2.5.4
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.xz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 LIBTOOL_CPE_ID_VENDOR = gnu
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
