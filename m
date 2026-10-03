Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562AFCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 261CC40FCF;
	Sat,  3 Oct 2026 07:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i52mrjyJbvbF; Sat,  3 Oct 2026 07:16:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3453640FD1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011776;
	b=jl6vEiWWDMh2AlSoVBbGsEHTS9OvWp4f789+eKHnKTpaIKGVumRCOEdFGf/naXBEAeo2
	 J4ycsumddyxcb62qj0NC85hDWl1iftVwCtvgpVLohG+7nTyUM3k9TzwOxVYRc1m/3Ta3l
	 Zqfddpt0twWlIyrmPXfslJUokPpIh2sTBwKaD/32lk/4TYT/DopcWKuvSGDmjbOnbG3sf
	 RbLF1nQY+PVGOvyvoGfsjkuNvA/rAk0SkirPk9gIg729ijrtJQfJJiptNIYQIpEhxGhPC
	 qFfN9/L8xK8V/te7z+4iirOOpyp3lo4UCP8ZqQ60G14k5o0BNkfetpOv+3A0HAD+hQw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011776;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3Hvpc2r/Qwc4GBvMxyGa+wsZnK0ogyvukaNzN5d7w44=;
	b=BN+EfGdRYDH3ZnHUOYL2LrOqTKtKVHlfCzy8NchS2kw5OCVKjl5q//POaH7y0gHMlGPL
	 Ayj6fhUUdGrNvA96tMXGMs/ZMno5GojhHapnG5fnxyRZKSaLnlQG5w0LQ+u9vtDSZMOoN
	 Eltlt72jOsqxIall5mxyyTm1HA/wjFyvdUi0uHnMyD7oV4V4sw1OWi81HkGDYdUQ7B7LY
	 kMiYkjDHEciP/qKbF7ChYu0ywtwRIGZow0khOhkLrUimZGDUvmO3/SIL0pb5WqqXDmHim
	 REYKRIoE7ZT0isUFrq98g9mzDHMRLqSfUb42UXzVbfP43jomktu2hS7OkX+PkytmKmg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=p0BXNxMh;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011776;
	bh=3Hvpc2r/Qwc4GBvMxyGa+wsZnK0ogyvukaNzN5d7w44=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BAeoMZx2aWU2ml79DgXS7IZecmkKG0byH2fHNMz4rNAPdt7gLx+aEGFXRhpLviclR
	 yw1edk5oP/iwOi2PcKa1FzOvnkIaoszl0il9lMLhO924ARWaPPFfMkeX32Uy82JO18
	 uUMbzN/Nei3K67krgBzWEM2eCcLOOc1C2YF0wEMAo4CocJAIKSRAX5WcWVbXi1laHR
	 wPIAbUxUj8AQZ1qjYD7TegXEIQsLMo2bcJWNbqyEpcfPvMfPKQTtXujpCwVhmu3iMx
	 eSdBRRAsxJDAWycOt0AewUYz5q8e8CHkdDrxgsEa2XwpDkBW6am+9rncztgbIwez/s
	 KreVgu6ZXdecg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3453640FD1;
	Sat,  3 Oct 2026 07:16:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B65331D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B37C740FCF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dnrd6vb2CUQk for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:16:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AEA5040FD1
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011773;
 b=GqqnHDBKBBXbDNGWTAIVYr0R+TBt7esw5m98qB/Oe79taaSZJicAim5kIMEHA8tsP67J
 Wu3ztiTQFnbeBl0Y0sJoAbzYO58MeDhIQsD28oUKDhNNGqyMhst4oYMSM6zdjMhL43sC/
 vb1f+ObjPf/xseyqLgRZSg/mwiNaKU1dgZKHr545RnM0T1rpDwBDedN+8DRDZb4xgtcKA
 hbpbIkptIGnSwM2lMcBJqC0dz/JDZdhMr+8GC7SI1STV+3OHsayUGo2kxqvRv7HM6owGo
 FkAQtFxRoVzQKv7VeAA8ev3rf6wMb1IDPWUUH9K75JV6zDb7VrXxUk2SDDFKgxdeHBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011773;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=QPPe1LyZonegIwPTQvi6jOypQyOvn0BMR3mLoD9QRDY=;
 b=LT0xyMbB0xCSVTsaMUsnjiVgMI5cSbmkHtLlcnQWW4O0bkP9/966hxcKnplnIvXsvP07
 lNY7pD0pugIvtME2kw7VANqmJGhuRo/Gwtv3oj5Dog9W5eBqZajCS12Obj8V9Cg5njUKN
 UWfRi9dLOkAXobZ0hC8duIiKFD15pFzv3LtT9K778Rdlr/lYjbix78/97yN4uG6KL8QSf
 ECe9wk704rn6ToWedVt1IWJ10wM29afEKADCATOFDHQmGTQAIw5yn1BsshQ/Z3zVupUCd
 KPtUuiLaYGeVT12eJ3HAr6soa4Xh5+fIuElNWieE9eWGch+2SOI9bjtlVmpGrCEnRpA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=p0BXNxMh; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=p0BXNxMh
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AEA5040FD1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010935;
 bh=QPPe1LyZonegIwPTQvi6jOypQyOvn0BMR3mLoD9QRDY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=p0BXNxMhMGaTaxZQjUmvu2Jau9Zp1qCTb74ivjJr4X8zDu5gxpslArdTR8E0BwuKH
 wUOX4hVT+gR1nPrzwZ/56TgRfwi9CKjpjWQoyR4xXmrZa7AkYbZAlZoGCH46yMyfiS
 TJEmSHU7QqYMHNEoIuLNqEKuHRobEkanMv5K2OKwMDoIxr3VqQJOivf/6Uh88Lm9kk
 pSr9VSSZgDL2koTzBVpA+ZWrqmwNKbsVpnqCniQiijDuq0wWv54mlwx/nRTS9Cwnkj
 BcwXsTGfU/b7yk59U5NRMR90aRnLfOZotVww8EwY4C8KmBaXTa6hegGnXuHoFc6HC8
 3qz4KdhX0eMzA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 m4Hp5pXxc/7aYp96bRv9Ukni5dCBt9417kIWfxHpqj1cjJCvNxvQVZlCvmhor7SuXB3QLFVxYVG
 HyGMrNlYGgxTdg48HcOUq/Joy++SGCgP0URoZa7AQdwGbMfVgFWYzVVIyLKhCqPhNwvdiU+lEyc
 PS3Pjhe1QMDQCVp5QKLdBYX5ikyi5K7+OySVsT+u33KklngS+W5VXrJ8zS42q/MzRXrdQ8xqms5
 0+UDiVBPxQBUT5DcqUzudS4yNbbCdpQVpz6bSwajcg+rtZbNYaV1Sp+i2GbgSO+BH5VZvNH7MPT
 xMutrBeL2eyxoP99+HE1yXIc7DTB9RdAa3ZW0mtZ4H3t+m5NSlAM8wfDsyMJWWfc6Xj6rf7hEBf
 pbDSrg3ksjNwlNlRTS+WeZDn96EhQK1UZm/fnRIj/q0U1gLcspT+ELJH8UHW3hoMpk4xPe/n53n
 h7E/KjGrQtJ+6tbPHu3bZB7bcQ/P7nUnVQ1JJErRSAtaq/GovYeae7NvPZ3h+JH9HAVXjfXY1rs
 nfhFnl/0223+wjTBM69TJxtJO2MieVXCOFfffVy1KvNwk6GMAnhJV1nyfa7If6jUlWizcJkpS23
 bg0P3m6MJ1kpUodDKbFlg60nGunmUsKngyDfL8f+1GbN7H9a9v5rybJjsOlYamxo
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2F7B3A4C544F;
 Sat,  3 Oct 2026 09:02:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkb-000000007Zo-44Er;
 Sat, 03 Oct 2026 07:01:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:44 +0200
Message-ID: <20261003070128.1295458-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 012/114] package/python-colorlog: bump version
 to 6.12.0
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
Cc: Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Joris Offouga <offougajoris@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-colorlog/python-colorlog.hash | 4 ++--
 package/python-colorlog/python-colorlog.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-colorlog/python-colorlog.hash b/package/python-colorlog/python-colorlog.hash
index 9dd7dd9354..44de81fe3a 100644
--- a/package/python-colorlog/python-colorlog.hash
+++ b/package/python-colorlog/python-colorlog.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/colorlog/json
-md5  177e72715015e36226abdcac193dc82a  colorlog-6.10.1.tar.gz
-sha256  eb4ae5cb65fe7fec7773c2306061a8e63e02efc2c72eba9d27b0fa23c94f1321  colorlog-6.10.1.tar.gz
+md5  92c333a72d5d328d3c62a99d40d858c3  colorlog-6.12.0.tar.gz
+sha256  2a7924c1dadf18b22a0eb8b06d1c7b01d5341707ec1641eb6fcc4fde0c3e8e5f  colorlog-6.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b1d9082bc483623fd59fc7279b457f0e40d942a76426cde257239e04dfe4125a  LICENSE
diff --git a/package/python-colorlog/python-colorlog.mk b/package/python-colorlog/python-colorlog.mk
index 1b03c3eb19..5c5f621a0d 100644
--- a/package/python-colorlog/python-colorlog.mk
+++ b/package/python-colorlog/python-colorlog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_COLORLOG_VERSION = 6.10.1
+PYTHON_COLORLOG_VERSION = 6.12.0
 PYTHON_COLORLOG_SOURCE = colorlog-$(PYTHON_COLORLOG_VERSION).tar.gz
-PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/a2/61/f083b5ac52e505dfc1c624eafbf8c7589a0d7f32daa398d2e7590efa5fda
+PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/8c/55/ba79756cb90c8d69d599d57785398ac87bba7b19c80e87f4e8a562197c93
 PYTHON_COLORLOG_SETUP_TYPE = setuptools
 PYTHON_COLORLOG_LICENSE = MIT
 PYTHON_COLORLOG_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
