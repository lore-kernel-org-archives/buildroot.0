Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459F9CAC599
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 00:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DDA760DBE;
	Tue, 16 Sep 2025 00:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Fyo85piKICI; Tue, 16 Sep 2025 00:38:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E877860BA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E877860BA8;
	Tue, 16 Sep 2025 00:38:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E918022F
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6AA34030F
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id krE6ho-q7j85 for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 00:38:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2F6E840010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F6E840010
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F6E840010
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:38:30 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-423fe622487so29047335ab.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 17:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757983110; x=1758587910;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OPWmmGrjEy7b6Q/JY2OTFL7xG3hFHKeV4m4v5Tc6VuA=;
 b=PU3WGCecaaiDO95Jv5aC0g4iNrVeh+tIOei9q5+0sd4foUVwyT6bORoBv/W984xzYS
 vtWdjukeC0Y+6+C1JqXwuCtUtkzMYo8rF0BaAFCuMqUtC8/m7LHf+NBYBxe1LrpApgXb
 Bv/YtvYSzQK7Hwt6l/Q4U6qQGkcGNtP4yCt491AIttHsWuQc31UalxBZPipb0Yyo97iY
 /7Yu17iCU4ZT+Q81T13/qVNHb9JTEyEUW/Bdt5oO2xWTmHG5tdXMFBKy8Z86GZR8sTVC
 2gPkWO+ENxhY6Gu5gBPffEL+nTSbgP6I1yZbijfFRBQoBtlS5qC2D0rqPvTcxQtI9wQF
 FMYA==
X-Gm-Message-State: AOJu0YwQRTCVJEcG1pML8L4y6xp1fuo6vYf4Dmv5xMm0sZgutjd9RuT/
 zM49ZAZh5xO0YeNbn3O2NPOhZEh01Zzm/X1USeAW26lpIdeDbaESJTzOd2JY5A==
X-Gm-Gg: ASbGnctYRL6fTJxpZVFcXV6TPLnUxc0VOnMhOhK/ImymL/f6+ooGg04YIp3s2TSia2R
 ej6OgvI5bUP5awMlzAIS79sZH0UeZH3/Do8rJPrt/G6sFeKyDOMRJNWt01plYpllf9TdlGqWWCa
 hdnlld4N2lknBneadrlQrjOJRDqafCN0RU6jex20wKAEvgCi3ti45EmCl4Xl3IZzfmRpv7uUteq
 /ZxFlb5hhnhOmIW8zX3WSxD+0X0hupplGH9AEv2JRqsGcdXDwryko8Uz8O6v80rprteBpy0L/Gg
 PEgZ/DY1o8EUiIy8Ciac1WhE9X9md/5ED7T5L5GSNHCYBbtviloOeJQaMzxE2T7FrdqRFKig/Lv
 BadNcvaFxm/qzG54xGFTvJ67eBfMhkOpdVrlfCTXUB93FTBNV587R2w9cUu3amcOO5rwWFLCPp9
 vH
X-Google-Smtp-Source: AGHT+IGqdikWWyvr3D+T76QvPbnlgi6jeIcm63NQOE0tpKOBPfbuR5zEZSCQ5s0uAD6cuZhrO8aVlw==
X-Received: by 2002:a05:6e02:18c8:b0:424:6a3:bf5c with SMTP id
 e9e14a558f8ab-42406a3c1e0mr46952065ab.30.1757983109823; 
 Mon, 15 Sep 2025 17:38:29 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-511f2f39863sm5290925173.22.2025.09.15.17.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 17:38:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 18:38:17 -0600
Message-ID: <20250916003817.2517058-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757983110; x=1758587910; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OPWmmGrjEy7b6Q/JY2OTFL7xG3hFHKeV4m4v5Tc6VuA=;
 b=H6aFUOSRNgothWE58OoFblvD3sNH4myXmbbf7VjREWjkhvVkpI01bAQJCpBIXqXsRy
 5mEekTjs5+tHNpNVzBeXWZ9jDxxq0ZvkNK3vbe39J+6jZopn8x+T9yW5qa3H26QefnGT
 x2eVKO6MrzptyITqiB7tldmnFSoui+cazfJD6HRUg5feYSW8fdWbLozsOxNmdMpo9avX
 edEwbal3Ygn/L++6FlJY3TS0Wf/PMRjRajsAfv2DOaZvG7ycIzVRoBI34lvlFxP2EOSO
 VJWeZcHTvo6njCFet8Vad1uRdENvzmtWuPJbIUjWtV8disiF+yjEAg8w24gHQX3P249B
 GUsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=H6aFUOSR
Subject: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to version
 3.11.2
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
Cc: Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to year update:
https://github.com/pymodbus-dev/pymodbus/commit/c1e7f3b70648585b865524f3a7468e3e3239c35f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pymodbus/python-pymodbus.hash | 6 +++---
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 38d921229b..f6f712d6b4 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  af760b61450c670a280c098e3484635d  pymodbus-3.8.6.tar.gz
-sha256  7689b56cc3ad05a594e1486e772abb9d9646c01737935df492db04455680baf6  pymodbus-3.8.6.tar.gz
+md5  658112be7a0ca2c9d85789a64751ece0  pymodbus-3.11.2.tar.gz
+sha256  132712baf79cae339aac694739b14551bab69b2a078570cb1350b1db0cccdba7  pymodbus-3.11.2.tar.gz
 # Locally computed sha256 checksums
-sha256  47f904249172e795a6b32de91f471073297befffd74e17cafc288d348a55972e  LICENSE
+sha256  572a4d6fa7541553f70cc6d494fbcbee7eb7d3f2fbd16080d39b20cccda26f0b  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index ff5a8eb725..383979ebf4 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.8.6
+PYTHON_PYMODBUS_VERSION = 3.11.2
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/47/3a/a6958507d6f9c0c50f11cd299b056161c10f3cef7c227b44bc183a7e7854
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/d1/28/34f667085cb162ac68be849e4ea1ced4c54d97b7d8099c11b27ec1cf2fa1
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
