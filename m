Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6A8CA5FE4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0250D40E0B;
	Fri,  2 Oct 2026 19:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5JHTUr4F8v8U; Fri,  2 Oct 2026 19:27:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BA98940DF0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790969219;
	b=pQKz7t2IWdT9CW59s/DtjnqvLk0kW6GIIWAPawmVVDFM4rOu0tPY31TiomB2+N0PTbv3
	 9Rdu92blLPAqeFs8eaDSeYK9g4Bvz5UJ5SDPK55HHNotM21ymjSVWnIm76WlJYgpQ90SO
	 PMJmVFVl83ZUzh4ehIdNUuDsIFph7xUhri232J2+rk62a4ZKlt8BgE4tJRGo65w9ap5JB
	 6BS2EHB/1GV51bU46e3IvRCy2oHKhqQ3tBcP3Fo1Wzm9Ufc/3alEfM2bo9PQSPpV3jv4G
	 DefIAFZ7OVsJ/AYGRNdAnerf3sKJYnl0kkrkCBIzNpgvQCyyDtK+J59U67MzBY/XjsQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790969219;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=s86bafXgDUuE8aIy17y/6bRo88GaY+x9Z1ZRg0d1GIU=;
	b=TUGWed93TJ13e3FI5Q1MoQIQB843gSHrmjrvF2uKDPoyYtDp3UD7cJvQzbzWh6HxJL2C
	 ELV3Qofx2i71H3SHyEhdlawZSK1vSTj7WXQHYkdohHwJPAORQMrckPyfrj3KuCZdAEHTO
	 KDAHJev+k+U/WcWMKhllZqy3gFpSGzoDG8bZMEy1bcdmESxhyKuZEiXgwUzm3f6b8pGRS
	 BGP2uTfDDZFrH43+OSZOxMbxYExKaQhLIBUSQwr3ibrnNtn0gY+ZU9yHwnNrp4w9Vut0c
	 /ez7KKxT3AoIbkQcj69KgOxrqlVrz6IOchnZ0lQmZf3LjFyc8hAYq1yg/PlDFBFYD1g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VILuTqhq;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790969219;
	bh=s86bafXgDUuE8aIy17y/6bRo88GaY+x9Z1ZRg0d1GIU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BfHUhIkwqdaxsSLKVlTjV9ut2YiP8FkcMlloz0IOiDlloTkQhuMocOfLNdhhXcxS9
	 KFV0Lv/DUj3ZhRNlY6436NFrS103TN0IZ4KZ4nTZh+lHXIiXInnEbwX/bExmUsf7O1
	 E2VUKbRQ9B+sOBe13WS2prsK0DyQOqj4fy07svpsGpDsPGIXGdMrC+4iCRnW9cLhd4
	 v5t3x/KAPJrQxYxSyBpM3U5tx2wbsp6Nt1XqWcQOu9tmWXquY0KNcgiajsZlX4r8Yb
	 oCnZCzxucOT6iTwOwRcqkmtwmMiGJ+qMyubFj2l2sOliarR8I1cjztyYD3fLe5Sn84
	 0FkfNK7WEt7Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA98940DF0;
	Fri,  2 Oct 2026 19:26:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CE1351D2
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C017440DC6
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vGmvfIsgHsWD for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:26:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E6D1040DC3
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:32::e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790969216;
 b=fLxyEw2RxMa9WEyMhVqNRLuu5lEcP1XKUTY/1TNJ8krM1L5KmSv6C4U53lVULFBsV2q5
 h/vc9+9av0hKH0AaQT857xp+uDBJu5Y63C/u/TRwMh6hhEDwIVejnWIaYIUa3w/FrYdyQ
 fymsOEKOeghWk8RIquE8p3sZzUh8pRs56oHEm514LGRDtse2MITn2vNTIdytSbx9h17cj
 eoT2RyN9NNGF3KHs3QpopNdzY4v/Reu3Wa37HgcKRJbYbqKNPp4qrYlDKfBAhwrkNg2fs
 KeU6cCCg72RUKfTbjjixHiArtQJwCnU8l/RTXzMQc/D67Z8VbUa6yruBoRsmXZufscw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790969216;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=9zU0/wppWlLRwPUWJh7OtPYomD+E2aERcpRCpMW4rxI=;
 b=iLYY/uX7GkAVL4x3rR5pgGJlXMh1N+t2aJwe4C/H6IcbuQMbnUuxZ9zT2JNSjv5q7/UG
 BvvoAjQcE5Bk9D1zet7py0jFDec/kuK1lcUYW9lrrIq+ZUZncSZAq0otXDG3aS+g1CvSZ
 FFs4TqxKi1vl/q0uYgVVs4DWacs6WpvtaQ6qIy8b3pdD9Sg7ceK59vqXAt2TVJKPFFIbi
 6SGNP2oMu9eMju/kn2PQJMbmKkt9U3RUIT1i0sp1pFCOjd1v8TfzYlJPkTyWk7+dxQNUA
 NBq8G+sPnAfOlMOhYEaN2rMqRdJHlNea/r4u1QRhya+Tua+tmDjAeo7j3e9jlsq62xw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=VILuTqhq; 
 arc=none smtp.remote-ip="2607:f8b0:4864:32::e"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:32::e;
 helo=mail-oi2-x0e.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=VILuTqhq
Received: from mail-oi2-x0e.google.com (mail-oi2-x0e.google.com
 [IPv6:2607:f8b0:4864:32::e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6D1040DC3
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:26:55 +0000 (UTC)
Received: by mail-oi2-x0e.google.com with SMTP id
 5614622812f47-4e47db1adb8so119774b6e.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 12:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790969214; x=1791574014; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9zU0/wppWlLRwPUWJh7OtPYomD+E2aERcpRCpMW4rxI=;
 b=VILuTqhqeu+woIlVrYKopfFk8OPMkFIvjiIL6n5hhzMjkTxwihZNC0Y9olY7CmKpTC
 wMkN4BIEroZo3j0COpxZRbMfOIb7m+IWiufp2y32X+PrijyKJj/KZ8278JBvJdTDpySt
 999IX/wuzSshKFjjczSLRYNhQgBc8zzmlfByb/01RXPRwQs/HuTBO8fg3ywP4N3Z8NYd
 gsr0TqfoS+tfOXFjeOstLI9kMOsco/lnssnncoxQ2rGmNGkhCpCostPaY1DfSCKl4WAg
 UHTzUIKPn6JB3EUgqMlUNPTgb4IzlHbejWVAjJmf6WkmL36PIf+oRmQyuKTpUvS2y7PH
 gthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790969214; x=1791574014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9zU0/wppWlLRwPUWJh7OtPYomD+E2aERcpRCpMW4rxI=;
 b=J2NXxrBhLc2LvszEBm8vruly2hXT7YeT/c8mkQuUp2dk5Jvc4SmtRg9Pjqs8gY/xHK
 osbfvexdZAVOo8b13qec9dTTMnUSgiRVojwStYgn1GT+BOtaurPWw40TotBwokmO9g8T
 96VT2XyPXVCuUpwpJTBzCmXcza7AJO/bRFM05RKf+8vQT7wvEUqzOPuu91gFoVgHoy04
 mSyAxjoBH/cP0cNyEHMMOpLLOe5f5ablQEbEGgZieg3T1y1JoI2/JKYVpPdRN9sbcEtM
 8wVb1V1sKuGTokYA00qOn8rKgLFDavQBZvXpO5rmcz2ujt5Egbk8badlzuPNbbUOGieW
 MU6w==
X-Gm-Message-State: AFuF++lv0cJ9pr9Zj5W3oRswkfQPXr8EGmgha0vkxM20zo+3aGwI39XR
 Nbo7+gc/8rhYd9hHjAgH8ahQx4gv6i//GrZG+7G2FSnwCOGnQ/9yWpqP3bs8ow==
X-Gm-Gg: AYBFou2BORORp4N7EAZUgR6/mzTqdCnqAGyS1+pxdYAcSx71zj22XiXj5HLyc2L4sH9
 0fYLK9cEl20YRGTgxOvw1yJzAzNMvvPX4U4hoEHdA9TiQUhLmy0xx+UHg73b4534pxMXiimFG+w
 O2odO/wPGOrB+V/rLkjcBS2HfutcXP8X2E7gBKhFG1sFSGTthm9y94i9fIsxukQiB6g/IrmY5qH
 eGMXdyfY08vnfJUqhGwqtQW0MgRoL7v/dgBa2MOzzyZSnOKHR+drTYXrqt9n6ZEsaji0TOZ8Nzd
 HoIrG2NORLe65cboICP9Vx0t1SIj7b6i5I9pnfwoBQ79E2wwFGyLGnUVSPOKidjVdlByfoiuMH4
 xG0Oo6VLhddjPfQYVuFp27j18HndszB3Ijk4WbWPvWGD+8j4CZ/WqOYWFcSiUriiT7o/ejKRL3V
 dJqFh2nVup9cbNAcsyulDesafDikzGFkcrXsT3COkm+62hTxm3ynz5jluV4+nr1kZkPefKoT61e
 EWrE8h9O3vZmTYz89xJ3tan3JeNktjjwuLrxtVlpdooMLMo/Uq3i3QvLTLUC3WiX47q+KsE6bPY
 Oh/uBasRsyaN2MKAp2gaoIU/nxlBI3LR1gwBcDYQ5hhPVSiaayrlg4stLn8RxHPPr3GLOD7s4vj
 G2uV/JmAqKFYpm5t6uWNDT4fdaUjp0ARQkXlnWui5Ow==
X-Received: by 2002:a05:6808:3084:b0:4e9:6a47:be26 with SMTP id
 5614622812f47-4f5288bdacamr2182863b6e.22.1790969214380; 
 Fri, 02 Oct 2026 12:26:54 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4f5258e8f20sm3054557b6e.18.2026.10.02.12.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 12:26:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Fri,  2 Oct 2026 13:26:48 -0600
Message-ID: <20261002192648.3757582-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002192648.3757582-1-james.hilliard1@gmail.com>
References: <20261002192648.3757582-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 3/3] package/tailscale: bump to version
 1.102.5
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

LICENSE hash changed due to changing AUTHORS to contributors:
https://github.com/tailscale/tailscale/commit/3ec5be3f510f74738179c1023468343a62a7e00f

Fixes:
https://tailscale.com/security-bulletins#ts-2025-008

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v6 -> v7:
  - update tailscale to 1.102.5
Changes v5 -> v6:
  - update tailscale to 1.92.3
Changes v4 -> v5:
  - update tailscale to 1.90.9 fixing security vulnerability
Changes v3 -> v4:
  - update tailscale to 1.90.6
---
 package/tailscale/tailscale.hash | 4 ++--
 package/tailscale/tailscale.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tailscale/tailscale.hash b/package/tailscale/tailscale.hash
index e2d600f03e..5683610ef2 100644
--- a/package/tailscale/tailscale.hash
+++ b/package/tailscale/tailscale.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4830cd822a838d5d44fd5eeebd07a2aacaf0255fb3fb7d3852d57659f54e51bc  tailscale-1.78.1-go2.tar.gz
-sha256  d1ee1c7947d4b2c1963ea214d5324f1d4c89f2f1d0f0224889b4dfb868dad725  LICENSE
+sha256  a4c0e5916bb4cf5a8a46791788534e8931a622ffac32dbff5bd8f21df7272029  tailscale-1.102.5-go2.tar.gz
+sha256  a7ca6186a7963a0a60740f6047760eecd7a0234e8c38bd7e1e0bbcb324bda45b  LICENSE
diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 86039fd4b1..6979e9f28b 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAILSCALE_VERSION = 1.78.1
+TAILSCALE_VERSION = 1.102.5
 TAILSCALE_SITE = $(call github,tailscale,tailscale,v$(TAILSCALE_VERSION))
 TAILSCALE_LICENSE = BSD-3-Clause
 TAILSCALE_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
