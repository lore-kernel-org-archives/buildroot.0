Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39BAC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 14:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BAD560F7C;
	Mon, 19 May 2025 14:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9Qpom3La_G0; Mon, 19 May 2025 14:51:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09A7D60F01
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09A7D60F01;
	Mon, 19 May 2025 14:51:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E8F58D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 14:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D999F40E13
 for <buildroot@buildroot.org>; Mon, 19 May 2025 14:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z2sg3L3vihP4 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 14:51:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AAA7D40E2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAA7D40E2E
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AAA7D40E2E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 14:51:42 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6011407431cso4780870a12.3
 for <buildroot@buildroot.org>; Mon, 19 May 2025 07:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747666300; x=1748271100;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6LeNezR1T8WLVmLddUxemYhfz+zBmLIHjdd04ybKfe4=;
 b=gdFwFtfTSJbD5VTdSr45VMHfH3OfO2nSR/8Rd7rbARJQMVD3EL/uftYo68EcDDWjmm
 T11mP3l0MZvDiuL6lImThAzS4ydiiz40SEYb4Q8KTOtsuJ5fK7kSqki6Y+swf0RyKQ7E
 DHJ+kEIOHBd9QFYp1dxC3W+1dORF/C71GFPM/rGkokSqRey248cTTayR/COyrNDeRB0W
 DMaxKG4sYn9s+FsMDQFvQnWt7xC/pu++rplDndHbOItl81gyUa890UkKdmZuAcwG8niU
 BEWQfhrBhyzk2gd6cwyCU0nlq5/LpXDR/6fGxghs1+a1jVU7GxyibSrRdbo/HnPrbgJH
 BctA==
X-Gm-Message-State: AOJu0Yyq1Js9MHcDu+t06YNBIxUuCAhprL/QEVJ9r2T1zDJEKe8mZPwc
 8htPnD5YC/JNiQVWCjE7433sAsVLQwwoB4eumO/ekyCDamsmJ4P7rpyHNayXsEePIc9pMsPTXgS
 RzcvRVa4=
X-Gm-Gg: ASbGncsJ6DoDUHqf+MbeVusNYVH0Ju5QD659hoa/A/sRegB23KgtQhMjDpI9Q7+82YG
 wKqyz97yTsyww6y7hu5WrOAD4vv2fJxdLoisrGp0pDJp2iO2ECMrvRhv6RhWUuR7Lx8Wb7Dj84w
 VbScTgjowgTLJfW7Krmw5cy98ehkckmlNYa28VgBVyJc0t2L5U8wnZc5TIUKY7ZNypLSFMM6er/
 APIaFaEOfFWh2jMPf7qSdE0BKw5GQBayX9s4OvZisONVusXfXTtWgPbQbPVJGDdz+x0l6BNGou/
 cyL8oFHYGtvLGM7BqcK7c1IBTD+OZ9eE55r+CXX727+FS31dDUj1KPZvDpdgg8o6b8PQ56KeCj8
 EwXiJ2S0=
X-Google-Smtp-Source: AGHT+IE3jI1VN4B2yUJ86yD3mcYZLggucobLFBhhbjaXtwZET3X1npWcWT7fYWRfFNGVtIiRTa37YQ==
X-Received: by 2002:a17:907:2d1f:b0:ad2:532e:abde with SMTP id
 a640c23a62f3a-ad536b572dfmr1166254466b.1.1747666300056; 
 Mon, 19 May 2025 07:51:40 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ae39175sm5880375a12.69.2025.05.19.07.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 07:51:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 16:51:26 +0200
Message-ID: <20250519145126.4114666-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1747666300; x=1748271100; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6LeNezR1T8WLVmLddUxemYhfz+zBmLIHjdd04ybKfe4=;
 b=UAV9qQDEnPxoeU+OsB7UjM3bRBMAyK97vL2af95SRtOnIt7aRRdvbNXt8uEy8owsw6
 VKo55S7yIoPnBHl6Y8VSVLUDztfu4i8NyXYUXWS2sbx2r/QcrufdloCcFJSRy8XpadaH
 +mAJCcum4JZClHjvTX1RodsANih6rHizKrvkTM0dUG0mWU99TmIQSZfcjynTvfwOHhOl
 hvhoXAuzR3U0EAaF+pPsXT1NeUO+vQJTXe24tRwaXX9Wmfh+zKwwu7R3pFMGoT1tzVTU
 Rix+ktgrWcO5UpwoozVHUG5Wtq1Nd1SY/O58nOc28iGqbGmiUsrxn8+bp9oi9QR41Rdg
 s+SQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UAV9qQDE
Subject: [Buildroot] [PATCH] package/python-tornado: bump to version 6.5
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>, thomas.perale@mind.be
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Among other things, this fixes the following CVE:
- CVE-2025-47287: When Tornado's ``multipart/form-data`` parser encounters
                  certain errors, it logs a warning but continues trying to
                  parse the remainder of the data. This allows remote
                  attackers to generate an extremely high volume of logs,
                  constituting a DoS attack.

Read the full changelog:
https://github.com/tornadoweb/tornado/releases/tag/v6.5.0

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-tornado/python-tornado.hash | 4 ++--
 package/python-tornado/python-tornado.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index a7ba8f899f..cf52729bb3 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tornado/json
-md5  c3a490d9cea9360ecd0805e4c2d1e87e  tornado-6.4.2.tar.gz
-sha256  92bad5b4746e9879fd7bf1eb21dce4e3fc5128d71601f80005afa39237ad620b  tornado-6.4.2.tar.gz
+md5  a14a7d70e304fcf96f06ccc2db98b98d  tornado-6.5.tar.gz
+sha256  c70c0a26d5b2d85440e4debd14a8d0b463a0cf35d92d3af05f5f1ffa8675c826  tornado-6.5.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index 45883b844d..b6a668e09e 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 6.4.2
+PYTHON_TORNADO_VERSION = 6.5
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/59/45/a0daf161f7d6f36c3ea5fc0c2de619746cc3dd4c76402e9db545bd920f63
+PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/63/c4/bb3bd68b1b3cd30abc6411469875e6d32004397ccc4a3230479f86f86a73
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
