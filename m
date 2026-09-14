Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B25C88E64
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 08:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DEF480D29;
	Mon, 14 Sep 2026 08:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Av329otly3B3; Mon, 14 Sep 2026 08:40:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 818D480CCC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789375246;
	b=rcVgkRx6K9E1d5e1KYIG+pKBcflS7mBWtotAEQ8zO9yi9Ic9K30dWEunOkP+7Fq4u0e2
	 xkmOa9zs9BUQEurePPhFuFU6zlYSExBCPjqThG1HvSv5eCcnrxc4LjlzZs0Hb4A4TnoHa
	 jc6JuBJaHWefZPNEKtn+C72KeTAFuyDoQPgTWn+5O358w6UDQZRj/QgK4+waPK90VapsT
	 qhgCx6dwzlbo+kcwc5V0quguv4LsOzXkq5JcpV0o0X2nJq1NCtw1AM3ZW8Yry995D7Yho
	 bUF+YpPeO1T+T0+S/GEc8FMvxL5+j7XNWdPR20G1zVxyvFUgk93w1HzKuJB1MNhK0+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789375246;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9JazJIarDkKkO89Dljn2dS/ApVzxA+E/Rkcppt27Jp4=;
	b=DkXrosSVX1qy0YLuG7iolLvx1STfL1ElkTlxXF2IqAv4j1mJBlbXvOaTNl7gnuQLdJuz
	 sBAe3w40lvNXwS5PmmTDIXHm9sNfjqI3+tIp/Gt8LwcUqjLaoU0OffjS21hUDHMZXyQDy
	 gyS74HzC+v6fm93gdmGVdfN0FyR9y234iXc1x1Munw0ReA9YaclhyFQWHWqEFWNUCFAD5
	 6uO5FmVNgap5cnCdurtSn+ohNYpYu2EwWQ+HD5ClIu4Wi4kADaXhR1LKjvCCoqy6yLrnY
	 sHWLDzord0GZjBS+ux0t9Z/eYKInTdPbSR7TKErV3uQkdY0ijfzQNBe6AQNMP+V4qXA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789375246;
	bh=9JazJIarDkKkO89Dljn2dS/ApVzxA+E/Rkcppt27Jp4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fP6g7mtstjanbjpk7pZUS69Z0+xfWBfMupU5WxWCeqK5p9canua5BNqG8k6LXdE/P
	 MdGGKk1eTnEzq7sREPsVlHRV0A4SdH/L2ejWRABhsoI1kHg2XB9D9TDWKf3a4eO25k
	 w56qY0zczpyDy0tAXKKTlBvNY673CWPMjO1alZtF/rqMN73v9RfySvaAb91DTP50k5
	 kMJBoYvj+9L+njf8hpK0sKPb8nQ8kOkTh78F2ZLvW157NzGpq1EjnuJRKVPlKmobXT
	 IB+QdmBECZQpqTeZva1VSSIUtL8uy0Z7fZ+6579AHzURoemjxx3hifsAG9eqKjEhRj
	 nLNQ9PGVxwENQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 818D480CCC;
	Mon, 14 Sep 2026 08:40:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD9D4362
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1FEF40537
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SCqb0cUk0LLV for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 08:40:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 774A340526
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789375243;
 b=HmRPhe5T4nopSZ2jAfrCM78AcHU8HIupnyJ3yzqC4SQLJ8Fp4sJnMWhff2XmQcR3VZ+j
 OXupK/wvSWytDsYiC5SIF6iR8AsngL7BDNCjrJNJwNt4Qhe29bhvAHFkSGmuUj7fiEeam
 uS7LF/Cgn8axeRF1z7Bs+rmIPBW2/i1ESz1N0YgL8CY1qa+1UyrsUXL+g/Kp5dllfKiQw
 lS0DDlGtCQcAGhzcizwK0mvTqQnjMdDXjX6LPucOywdceAOHuiPAQ/JAznVKGGDW50K2p
 4nrpT24sIzKYcZqhHnf3E30ud3v8hUG6OGsI3FX+CrdeNjIHr+AsaWF3whQjiB5Kq5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789375243;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=j/tllh7qjUEHbtncQwYNskeIT8JZjR8VUTy+WgzjMw0=;
 b=DP2LdFf9Y2MooQT19g+DOzo/SQKJXuTDu7SRP4kmh+LkbZqLs0/9SpfkYJ5Fa828vPrh
 ERGMcH0kGB85dx9DXl300Maqv1XHEk0988i5cemB71hjulR+IQFeDrJ8hmHaybQMV6raS
 LYQN3InBIVmViHoXFRSXS0fT9nbrPu12kW1GeJfbvrSFLFhfdDg/jE2RbqnMfwS7hwoRh
 CkytPmG95hG4aBiMJ7e5XypFu4R/IYbcHNkuK+Utaw+mPBsDqACASBC2ldfP32+fg07XC
 5QdDbNtCsn3GEQ5c5q0Zf+MEIyytS2n04CLEJPpmLg9Mxh6lSDleHnWmqBApORu6o0Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=OEPPj+It; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 774A340526
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:40:43 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c299e81e0e4so125069366b.1
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 01:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789375241; x=1789980041;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=j/tllh7qjUEHbtncQwYNskeIT8JZjR8VUTy+WgzjMw0=;
 b=tSh6bAYbxNFM6CG3JOz4ia51asNbnkCgsBh+y/4Rymnil9oX6vF+Th8za74pbig/rP
 kB9RF6XEs3ApnOtL958d6qLNsTvC4YrjC/U+dKf+6IU5qQWWtlVVMJsAFnN9jZ0ALHIZ
 ABMV0UvHjGtWmJh+0VulVtPmUWbd4szRJ9Y9mDOElTWzRcY4xiKNm5caQgdYHhlXez+n
 QbfimEyRQl/sGiDxa6vQFekUSCsPLGB1uxspbx7Zt0VlO2Zp8jsTwm3rv1Q/EPYmLe/L
 VK8+3Q1lJXlrOaViuHbcst7t7dMYC7iprhTsGbn8fwb+IjflYQG5yW2tmmYKNDb3LYKS
 KzMw==
X-Gm-Message-State: AFuF++mJTHfibElo+iXkk2n9g6HZtnwqwfoG0h8LdQqZ/5NTkMw/Ohf5
 NY5QBk7/mcq/+zok8GCTtcatCyambNvMfE0v44CUnbyuRBvAw2SZzM4NHMbi3w==
X-Gm-Gg: AYBFou3zgKMQFeguL0DQ9i1su3NW9YICok4ZYHwCHZ2qo1TH6TGroQqo9gibnDfBGLV
 Fcn4EQGAF6KVJqRABpt4ngCYlf7VjJ+XF9qDybs+SZVgdTzx5xCnVu3eFlne/BswBWW3JSUIPbC
 +vVNmR+RW0NJCnn2gAKpnr5lph2t8+QyYstzOgR61dBJcccdGIWnntNQCIJzfqbfvsDQlp6DFgB
 3ZTRK4oRvOrPhYtH3R0Sy73C6MadNtapUYP5qN2UoKp6UvtlloZBQ3yfGfOwFn4ZYDzlq37SfB+
 wwz3ID68oh4z+xy7cIv8Dn4HLAhRmtVLXTYqdfWWHvR29QlnAeIIj6YNxzYeZcdg+WB5iwDbQQW
 ARukByIKlVCXNYnWuyAcZq1GssM0etTTOCQ2WaIF1DshYbcPo8X9uoF0jWCz6/xjErJQaT+wfVK
 lNN5lvEbflqtK2rDDnUBNG/LqKUwzZZB944VS1Q0oLEPJaIguiEzfyuNGXYq/mwgazQLtx2uCTD
 bq+xibCOlXfsbts9l3p+F7F4NbaKLfxCNuxOPvtmaUH1YA=
X-Received: by 2002:a17:907:f497:b0:c26:19de:912c with SMTP id
 a640c23a62f3a-c29b86f1102mr86926866b.31.1789375240920; 
 Mon, 14 Sep 2026 01:40:40 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2966063a2asm386664266b.27.2026.09.14.01.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 01:40:40 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Sep 2026 10:40:38 +0200
Message-Id: <20260914084038.727312-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libuci: bump version to 74f6277
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Changelog:

 - 74f6277 cli: in batch mode, print empty line if get fails
 - ccc1719 libuci: fix extra new lines added to errorstr
 - 66127cd formal: fix workflow permissions
 - 5bea135 github: ci: add MIPS64, PowerPC64 and RISCV64
 - ebb3a01 build: install uci
 - 238963f github: ci: add powerpc arch
 - dec51f4 github: ci: add cmake build and source directories
 - 8022b2e uci: add a simple build script
 - e1ab90c github: ci: add tests
 - b65c091 github: ci: disable json-c tests
 - c1e2eee github: fix CI apt dependencies
 - 2e46a74 github: improve CI
 - 57c1e8c github: add CI build
 - 5e69eda CMakeLists: fix CMake warning for INCLUDE macro
 - 272fc13 lua: CMakeLists: drop redundant cmake_minimum_required
 - a072095 lua: CMakeLists: update cmake minimum required version to 3.10
 - 9033e8c blob: use blobmsg_parse_attr in __uci_blob_check_equal

This bump fixes the configure failure with cmake 4.x when the Lua
bindings are enabled: upstream commits a072095 and 272fc13 drop the
"cmake_minimum_required(VERSION 2.6)" statement from lua/CMakeLists.txt,
so the Lua subdirectory now inherits the top-level 3.13 minimum instead
of being rejected with "Compatibility with CMake < 3.5 has been removed
from CMake".

The license file hashes are updated as well, cli.c and libuci.c changed
but their license headers are untouched.

Fixes:
https://autobuild.buildroot.org/results/43ce08497863ff54c8acf3b0bbe7cfbdbc640d14/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
---
 package/libuci/libuci.hash | 6 +++---
 package/libuci/libuci.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libuci/libuci.hash b/package/libuci/libuci.hash
index 1e429f8160..b0a59da84b 100644
--- a/package/libuci/libuci.hash
+++ b/package/libuci/libuci.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  d3b12df54f9faa69f0ff6d2a239fdcc30d64eda5269ddc882cf97677ea8cb066  libuci-f3fc0b76040685829191debc03edf72f486ae8ae-git4.tar.gz
-sha256  5bb12361838b588bb263ade8537f5ae1a5e62d54b0a8f0640489db8cc29831d8  cli.c
-sha256  bbc34ea5f391abc3b27416dc3c96b0f71f852c44210faf1cde0990218f68b13a  libuci.c
+sha256  e2449f5ff75de32410944c850be6d3903bcfc8ffe55d450076a4216b3f7cd715  libuci-74f6277aabffc943d026f406df57c22595134c42-git4.tar.gz
+sha256  a8bb483fcaf86fc23f32b6f6a13773146250dc09fb3c0b8cd17d2ad79802dc14  cli.c
+sha256  a0a69780aaf898684d1f2eec2132eb0d565acaf870045d975920981ac4c9b48e  libuci.c
diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 3c7e12baae..a8ef14ec93 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUCI_VERSION = f3fc0b76040685829191debc03edf72f486ae8ae
+LIBUCI_VERSION = 74f6277aabffc943d026f406df57c22595134c42
 LIBUCI_SITE = https://git.openwrt.org/project/uci.git
 LIBUCI_SITE_METHOD = git
 LIBUCI_LICENSE = LGPL-2.1, GPL-2.0 (tools)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
