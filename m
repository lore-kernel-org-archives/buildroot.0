Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C13C02183
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 18:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0A2180CBF;
	Mon, 13 Jan 2025 18:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4CyK74-P4srK; Mon, 13 Jan 2025 18:39:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC04780FAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC04780FAE;
	Mon, 13 Jan 2025 18:39:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 54ED4942
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34AEC606D6
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q2al3nar2De5 for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 18:39:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4B960607CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B960607CF
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B960607CF
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:39:12 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a817ee9936so14086205ab.2
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 10:39:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736793551; x=1737398351;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ssQ4anpNMYYbbWFY/gp+DSBGTTIYjkDF36hwTeamG/4=;
 b=FdJUT8lTSk6c7KbDKMj7w12452u1jt2KNdo3hF6L7b6O0QxALoXcyuKzAVmO99Dpf3
 a2jbka90hASA61LfWSc9DxBCDK8oHJNw6zdGP70A4SyWNWT/c25PR4l3OrbcFga+qHWS
 PitnWiOdWcpnRJSFuRkQtetGKwrjXj6ZFGgRATWYE0fkMIo+W6msQxH2kuWoB0ja3v6Z
 I7MzCCWUjP7PmPIke+HfAdjMpTKj0gPkVllr/71ZqmTsLyuYGnL2ovkrvxXiW384BNtV
 55S7IpqKsZ0XFq2n6mjZJvt10AMQQfoYPNf2ccfCkh6+EVfCLTF0EvUlTrF4VF6nnHyJ
 8w4g==
X-Gm-Message-State: AOJu0YxtrIfybD4WzNzgPF7NeGRpXjQtFn19rWgrb2V4BiFMc3M5fr85
 5u1sDL/ES4jNHHeku4bQu9/+QHgBxY2pz0KMpngX7vjl/YNK7SuucAnvhIHRrrM=
X-Gm-Gg: ASbGncvwG5AVaum1Le2KUHvevwbLweJGUGPm3CKsC+CZBB7ddn2K4MXVE1B2gfxc7Wa
 bFeKPmMpkd1QaI6IHwBitRxDWxU+7to9LmjM3gqrjsgywHV0LEDaDQGnm92hQSOJvBPbZDGi/CP
 11NfbvhvEEvM/EjQklXdQochNaYdVbUmgTsboZ3YGkffMX8nqCm7Pt1Czb0Cb6/adLyqGBNcYcM
 fa41nBx3HDjmkzLfSm3rDAL71dkzj6Guj/7kZ+PUJS3/78aeMXF5P9MYeQoYC6UcknOaovDCAon
 Q8X7XUb6Qg9nM8XFY1sUK2RYY9YQKOI=
X-Google-Smtp-Source: AGHT+IEuFj7AAvv7XwIhL3750UK5htrlITommDOtc3N6RkEjed4ieuMxpj1JTdCaIb8wY00aEv/FEg==
X-Received: by 2002:a05:6e02:1fe1:b0:3a7:e7a9:8a78 with SMTP id
 e9e14a558f8ab-3ce3a9c1918mr141500905ab.17.1736793551012; 
 Mon, 13 Jan 2025 10:39:11 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b5fa1efsm2884641173.26.2025.01.13.10.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 10:39:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jan 2025 11:39:09 -0700
Message-Id: <20250113183909.3014170-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736793551; x=1737398351; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ssQ4anpNMYYbbWFY/gp+DSBGTTIYjkDF36hwTeamG/4=;
 b=MuhilMcjepiglEvSZ/1I/aueN82G7qx7ZA1zzYI7pbqPApwrRknFoEdxA4Fy2VBUpE
 3ul2kB5V5JJCMavJgqhmEaBrMXW4dBxpAyISFOQd3omRal9OwIb0uCA+/UkOC4LxljkF
 sWtyobqJRj+4srS+tPZenkrfAj8fwsAX/tI8iK9RBrDN3u489eBYWXEv+BerzW8nU+kW
 vpVps2Z7RotvdTrmLBMdjfnwuoLnl0j3i+Z1Z954POJmV8pFaZBeqqpyKGez4S66Jnn3
 TC3IIpI29mXN31PSh11iSSy/mmMNle8HjiMRqzjTZIKc2RvnzhWPyNG357SGf8NvIChk
 yyxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MuhilMcj
Subject: [Buildroot] [PATCH 1/1] package/python-marshmallow: bump to version
 3.25.1
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-marshmallow/python-marshmallow.hash | 4 ++--
 package/python-marshmallow/python-marshmallow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-marshmallow/python-marshmallow.hash b/package/python-marshmallow/python-marshmallow.hash
index f7a158a830..9fbd379211 100644
--- a/package/python-marshmallow/python-marshmallow.hash
+++ b/package/python-marshmallow/python-marshmallow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow/json
-md5  881654a8819a7f8ae8f91563cf378b7d  marshmallow-3.25.0.tar.gz
-sha256  5ba94a4eb68894ad6761a505eb225daf7e5cb7b4c32af62d4a45e9d42665bc31  marshmallow-3.25.0.tar.gz
+md5  0714da7f00520766aeb55fedc384b7e2  marshmallow-3.25.1.tar.gz
+sha256  f4debda3bb11153d81ac34b0d582bf23053055ee11e791b54b4b35493468040a  marshmallow-3.25.1.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
 sha256  f982e6fd97ba00973e94605b972ff04894b22c4fa937b868828b32ae8f0a7c2e  docs/license.rst
diff --git a/package/python-marshmallow/python-marshmallow.mk b/package/python-marshmallow/python-marshmallow.mk
index d6a91bae72..d226ea66f6 100644
--- a/package/python-marshmallow/python-marshmallow.mk
+++ b/package/python-marshmallow/python-marshmallow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_VERSION = 3.25.0
+PYTHON_MARSHMALLOW_VERSION = 3.25.1
 PYTHON_MARSHMALLOW_SOURCE = marshmallow-$(PYTHON_MARSHMALLOW_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/bd/5c/cbfa41491d6c83b36471f2a2f75602349d20a8f88afd94f83c1e68bbc298
+PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/b8/85/43b8e95251312e8d0d3389263e87e368a5a015db475e140d5dd8cb8dcb47
 PYTHON_MARSHMALLOW_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_LICENSE = MIT
 PYTHON_MARSHMALLOW_LICENSE_FILES = LICENSE docs/license.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
