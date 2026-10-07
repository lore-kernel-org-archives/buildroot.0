Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47503CA6004
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 21:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E63A81109;
	Wed,  7 Oct 2026 21:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kHqBm6iW7HeU; Wed,  7 Oct 2026 21:22:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A6289810D4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791408128;
	b=cDLQGC4ymFoRdXxcxxjnQAmv8RJ2FmRw1bYsF/GP9DRGVtzHRStEwIqpBm98TCOZ9bve
	 iVWL2LzUNnbPL/MAnElqswg1J9xKzcsW5gH2wu2466mjj8C8DPPa+jOscYT4v+Dlgy7ho
	 9S62EsegnWaysk1NT2T0+NVJD8Mk2nEw/QtbJYjtsKIkUN0IqTA028pI4xGpMW/PJz6Uq
	 H7sHtvFYfM+Haxu/rC3RXzIA0dIXJF1S1pPmUcjcBF8aqpyxYptXoQLz/Cs7bG/7pyHl+
	 bdIW5p4FHdJQ3+16Mh5XizK0jvxkkkY6N6ewUfzr6wcIuVZ6MRh6AhdNxU2l2CerrOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791408128;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RXbUdmD9ceG4Ty6AbeHZXVQjgRURkJiAMIbjLmvU1zI=;
	b=W9eYSQ/+ikaGOSZWIfGw12WTrANpqMQtPCVDcsGZSvvAaVlb8DFwpYRhBauwourePRMQ
	 uVDUEQmN0GIBNXW9nmm26TUpLpfG6Bz2tE2lOikEy80QIblg81u++35MiZoM4GBUgwrhv
	 LVrqlGq8U1c0tgJDSfBQbUq5ri5uLpkQWuh18ARdSh6db6kAj4F4+5wwEG+wAesWLUSDB
	 AaqfTXFkr2STWHCHu9GjIk9SI1jwdHOYwiw2dbz0+5chwwJn2WZ0XU1Cu4vvlNRCemKYb
	 dzzOsZEy8S/yItAk/58Q4lioEkAWJW1rQ7gNfQNStF+N76NYXQ53VQCNoJUsQPwob0g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=mw6rxEVp;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791408128;
	bh=RXbUdmD9ceG4Ty6AbeHZXVQjgRURkJiAMIbjLmvU1zI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KnmYwCVjn9v+vgSO1StsBfQHLIGSCDSt2qtBrapJdHJE6ZT+BejcFq+pCcgf2DXvh
	 Z11Ia1cPcgfx2ICzbDpon+5eFVLrBlSuP8XSefg/t3L+vQkLIkN2kO7t7029aAa8vW
	 4oQBGJg0kp0qpJRLIoPL3eUQ8l5MODrthe7Of2NYy4EnqSl9iEm1YPWAMh/GH1pz8u
	 k4CXAX99cELYUs0fV7H8Oj0omGAMPtiGhWR/j3YOg/FIBDXSS/ikxdzmdmAdgS+kV1
	 UEWytk0EI88hj5z8CsoxoIFtfGU3eEJfNInBmQDVyO4lSQ1zB6FJHOjKG6r04jZ+Qe
	 37LGo9gcbYisA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6289810D4;
	Wed,  7 Oct 2026 21:22:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 36B13338
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 20:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 287B081193
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 20:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ahEqXkrtbO8x for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 20:11:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EF8C581154
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791403870;
 b=mxBONs2oavxkxgOFuOy668HHMeDqv4JNuH+/FXe+FTXtBi2fnU+YkY+7Nw5VzB1qcPYQ
 mbHuTvZI6Myfw0mmcCBzSkr/11pf//z4vmvIPaTDob4mAVV3PqH8eM1neYPOxtopKfgoO
 lYId6KUdeiaYFqSe42KU6dAQ0i9UrnOpaz7XmKlC5M97NW8BPjVDhyW55RNdM9ujwlmkg
 nGtxJd0d+DBEKZKFcTZlfYM9zRKv1+7XHRcjfTB3Xblby0w/dag/QO+hPFM9cjXV1dm9A
 EH9GF3DsEBZmyFyn3h3nmxzWIPLxwlHFyGTApgxFKczw/c/Sc4BLoh/4uod09SIyILA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791403870;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=T3fBFFB0MW2qiB/+/casqhdLvgQPmo2k0zC0kC84DKQ=;
 b=QE4Z//98+AbKpebYkitLskquiNB4wxGYplyhrAoFU0I+V7TJ/nsyVZgn9OP92UHSQqof
 32ijuugyo6BcfP0gfSEczRJeEGgTSHCy8VMLSRCCBHQHunPYjNjhbKM2GltygBIhdAr0F
 Xcsumv7SNR01Ky/ULx+7ZQORyCVPD2hMqfrbZ+X/aiGUQS5auiVAYCLmEKH/JAwARotMo
 nCMxtFk4xVj5auEEQDMYKMKxJ5mv+fho7MhB0Z57pPQtu+iyzICC6Uuj0pA9y164T7AxB
 6Irf+4gyOtzOl+DVga7ZVTU7LRuDCx6AeKRR/JkmDFJTURYIKaP48HsxUnewjORovpg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mw6rxEVp; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mw6rxEVp
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF8C581154
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 20:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791403867;
 bh=T3fBFFB0MW2qiB/+/casqhdLvgQPmo2k0zC0kC84DKQ=;
 h=From:To:Cc:Subject:Date:From;
 b=mw6rxEVpXC8GNWTnKtMhNcPSpMde8Dq0AQS1dArihefqYltUoIjJ7mEP7cZiXFu0o
 ZmhMi+ySW0mKsoBxU0l4LChv1M2DDbvrxGxDJ51nJ3SkzlxOuejAG/WIK5QOCpyBhq
 D7yYLCoYewJAPBKU2ppENDPpgJovZHCyVEnUmLCe0inB/FC9Cysdvfs/KeDyIPuLmQ
 hK6Q5CBih1GodMuG/CLDGRv7/QR5Wn+43Q4K1widd9wDA/VZnemLxgou1uPsxDRYle
 Z6SwSpeIYkb8I1vzRU2+gxSuLywBR4HfVfJHkevoe4Ka+pBX2dOn1EoAZGH3Xa1XJe
 QTheU4rnMQESg==
X-KAS-Sym: v3:f51bdf72230551df:l83EQHqCoL26zRq1gg0iqkfEInB87gnyJ8nPTVn2A3HZH
 GfyTWUtefovNF7CgMtkQziMUme2OzBGTnI6jqSrrFue2tFTDc/8LTG7rWIK9EmKdqa7MY4OyrJt
 f31fyTlWl01rSpMIvDUy8dgv9+wknygBxvAZF3bYgD5VQ5Rwebbb0HwseM0tRG6IIXLkEIm1PE/
 kx8K3WjGncpplc66Aj2kR0MnK0K7F3JLNvhKh8HO3qV+t/IieDbpwsq5ZmQAJn5KhwIA3gn5JVE
 qHVcFl90779+byDw5QvwtvZUUih8LJjEgZCcJste5zWxRRfxCDLW0ELe4ObfOQ5uV3k8GKww==:
 VR7AHHXUWPH45lX5zP6jnA5ECazFStiaa3FLXKlHhb+tsNxzhpa745uqScAxx2B3o9ajTN5Juzc
 tFTKTH6NbBxgjxCI/ra6pxvDwn4rRND9Uq1ZEXuqcoOYhuWrUjNkIPqOvv6l8twFLJl5tgSMn9j
 lRz+JrgWxh6WkkD2dZZXaYiEGAlS3lHyrzc25xDY58Nek8Rxd5ykQoBdLBh4SyGTzgKXd0dWD0n
 cI97mWJXj3Awu1IUS66By0HBctB7zb3SeljMx5172r3lg4/rmM431c7GF4u8EPccAXsyRbO7D/b
 Qao5OPM5Grp2aw1CMzJoXxqWTWCunMxdRROHQaGdjon3mngDSsaCwYzspMWzdLrXN+D1udB6OKs
 UMr6zc5RaL3ZdtYcsm7QNlyTVElG56eknzGXIrsZwghwEbURGa+niGklpdNJYXb3V2Dz9ms7dMp
 ImptMlNchBpgc0UZ9UKyyeRHUO2thYchbssa/5IbLuSjkvv0s+qS3Qx17V6qMyWdRA0jLNV3T9N
 zZfC7cIYdC2c9kzJvsoBzHxGsD9yiP6NdHt35amk2VoH39uwGiGWGj4SgzmunSeiyQ2Vzz9qALH
 /AlP
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 65644A4C4F96;
 Wed,  7 Oct 2026 22:11:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60254)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xEXyl-000000000Dm-1QtM;
 Wed, 07 Oct 2026 20:11:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Paul Elder <paul.elder@ideasonboard.com>
Date: Wed,  7 Oct 2026 22:11:07 +0200
Message-ID: <20261007201107.1693337-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/kmsxx: python bindings need
 python-pybind
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

Fixes configure error

Run-time dependency python3 found: YES 3.14
pybind11-config found: NO
Found CMake: /usr/bin/cmake (4.3.4)
Run-time dependency pybind11 found: NO  (tried pkg-config, config-tool and cmake)
Looking for a fallback subproject for the dependency pybind11
ERROR: Subproject pybind11 is buildable: NO

using this defconfig

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_INIT_NONE=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_KMSXX=y
BR2_PACKAGE_KMSXX_PYKMS=y

Fixes: 0710da403def5df6219c2b6a3f4cdfa5930b2a89

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kmsxx/kmsxx.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index 0678b50540..f52a104701 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -20,6 +20,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_KMSXX_PYKMS),y)
 KMSXX_CONF_OPTS += -Dpykms=enabled
+KMSXX_DEPENDENCIES += python3 python-pybind
 else
 KMSXX_CONF_OPTS += -Dpykms=disabled
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
