Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDE2FED3CC
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 13:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03D49848E5;
	Fri, 24 Apr 2026 13:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wlFJcxl2pBiD; Fri, 24 Apr 2026 13:36:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E529084778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777037781;
	bh=iUZDbzKF4xjvlPCmqP/fvTgdcTioOzQM22w+nc9Ag6I=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Sp3aJ2WhiDy2NAWRX+s+yjRo9fjSkSwXWwHLEC7gcV6erl3b0GNxDs+gs6wcgUxu8
	 Gwqx15jz1lfxsSzaZ9DRpX1nhbV4tCXSQL7WPot+aKKLJ/OBjJuCDSK5MwTZ6ubfQ4
	 YhvssB16Y/IpZMk7Mmg1bRt1Rw4UlPAF7RTrp+8TQa2JQPruv+5hG9yW1hDAbmfwGQ
	 7USrvj6eINzMbMVwgopAlUmFke2PFSAYrThy8tU96x/PQ48zxktdLwhKzOsUrscQ5J
	 ocSDowcq9JpF4IDm0Y+j4IR9vDE1Est5/4ShaMCMXq2VTJ0zrIVad0+fBSrwDXN8no
	 FZdv7nui+lQOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E529084778;
	Fri, 24 Apr 2026 13:36:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 38582206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B91061AFD
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ITjp6PTnf_s for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 13:36:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7ABF361AFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ABF361AFC
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7ABF361AFC
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:05 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 98C97583502
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:23:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D3253EC2B;
 Fri, 24 Apr 2026 13:23:41 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 15:23:23 +0200
Message-Id: <20260424132326.825570-9-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTFzyjFUCDCqfqQMANVK54121/dpjJcklBDr2aY0SQnEiDGYI+sdxNosxexLF7zgvGi/0S9J3MFBLa1UMw+3lC8h+5TY+3VZcJ+Z0W0Zc6kwPhHWbSfKSRLJ3YuT0AQ+dkguxsrpXxYxGwZVQWkvhFYMbbk/kq2zmCaSGUnvH3vbroFmTLsW67TWGK/iccCe+cL18Atr0ku2+Chn2Y0HJvPg6NFXBrJuwMpsfLfP48H0ZjfPTmflDMKpBgsXVNYmHf/4w6ZaoQgaVFAwq2AEPN6/L4o9B3/zUqB7wzns9pmv361LiKwts7DgcCHSqbKV8Q6PiARPsxz/T/i4U8W5cDG+ejpLw7HNWG/+kk1jxKNsZlVqf0peDC8dfQPbo3UBjqjk6+/Q9sNrVm1no4dCJiYbofFaqHLacOW8PRKZvWczDg4TiHBrh4mIQ9TPgSovsZfxqSxtS3dayLNAhNge9YGLgAIubqkxO++MqeX2OQzpFMCIjwSke84qbi4NvEmW/eAeo04hQZQzRCku4P/8jQKKQrAoJi0vJzh9I338qsZUKiIKFWN7xy+fvOjrnV2tRGI407QO5mkxqYGPP+yxrcMcvQ4g1KuItNQckVqtI1bQnc3XZ81URFk3ljfOzbrYtYLwCErC075O0vYV4RNzt77pQraoWS4eHgvfLd09ccP9TQ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1777037022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HhQiDEguK7EW/zy4MnF/L8Dlf0FwxAQ6GVS24k3Doz0=;
 b=c3tfEatmTjq4diBwEN0MzGcrm/fJzK2hK+bxL9hesAOQ1CETRtSJ6iWZGsPrnDy9l2gREz
 u0QB5wqTCndU0PH6Wi/uK/j7XCa/CFJj7rklbHoQPVvhtQps2uXt828Uhr2Bfkp+Ej6nof
 jfiKF3BL4rTT/5RJuKLTiTsZZJLqOtAhWVWePZdjGpvJa3GKTYQPEjjdsd50F//glaAPLU
 8AafipC9gJE/CFy6HJcr17NiQJwkFmeJnKr8t/uPItir/v6+CLWYAxG1/+vRpea3xYha+7
 m1GVPFdqIhGNu3yiQZDsblrQUjULiWWvhbomBo4O7y/iC6g5vzZ/uDWRi6j4iA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=c3tfEatm
Subject: [Buildroot] [PATCH 08/11] package/ntp: Link libatomic when available
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

NTP uses 64-bit atomic operations that GCC emits as calls to
__atomic_* runtime helpers on 32-bit targets without native 64-bit
atomic instructions (e.g. m68k). Without explicit linking, the link
step fails with undefined references.

Gate on BR2_TOOLCHAIN_HAS_LIBATOMIC (same pattern as dhcp, tor,
libcurl). Keeps uClibc/uClinux toolchains happy: they do not ship
libatomic but provide the helpers in the C library.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 package/ntp/ntp.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index f481c5d79b..eb9bfff85c 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -17,6 +17,11 @@ NTP_CPE_ID_VERSION = $(NTP_VERSION_MAJOR).$(NTP_VERSION_MINOR)
 NTP_CPE_ID_UPDATE = p$(NTP_VERSION_POINT)
 NTP_SELINUX_MODULES = ntp
 NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no POSIX_SHELL=/bin/sh
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+NTP_CONF_ENV += LIBS="-latomic"
+endif
+
 NTP_CONF_OPTS = \
 	--with-shared \
 	--program-transform-name=s,,, \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
