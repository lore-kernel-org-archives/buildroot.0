Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A65EE644A
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 22:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76746608B0;
	Wed, 31 Dec 2025 22:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rxmuMuRPN_Nq; Wed, 31 Dec 2025 22:08:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A63AE60867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767218934;
	bh=Yix9TsgpXcze260MsxuVWt604Hvs+5ooIMtlFG9RzDw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=PZE9i00LGtz/lMqLx2NeI/6mqbyjajj1OB/EOdy9VkVJDGsnR+o4/+XK+CnKruWrH
	 eRpLTUtuMFQtGhJG1B0iXQAxx5FNhJASp23ODBzq1fLyhehLO19NQWXoHwDFDkPH/u
	 LJvpWzhxPyw2t/moneMpxTMXL9TG68MSHJTJG5IljYN9YW8S+IIcwv7/9Z1hS5L99q
	 OLmxtM/2qjkm9Yq596Kf/GeXsaPVYVzTXu8KpGMD1AAQPzUl7brvPr/2V1URfhhbxU
	 PsYqgmGP+815O50OoniuNY0H/hAyQP1pNOnsBRVo9KJkhWj5XPsMrHcoA5VSWYOVvP
	 fG5IUUw1UOrZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A63AE60867;
	Wed, 31 Dec 2025 22:08:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22AE7277
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 22:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1517F40447
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 22:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IeXLDNlrH_Pt for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 22:08:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 655AA4003D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 655AA4003D
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 655AA4003D
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 22:08:52 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-45391956bfcso8840588b6e.3
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 14:08:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767218931; x=1767823731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xhXXbRhRGIB6u/mMHGbvIm0ygCYVPvV+tCFUHaDj8Kc=;
 b=kXxGnFTrCHsmTxm9uBL63GDouKG/gnPasBbst8qvA8qodQ39sb31EWG9PDEdKt1Ge9
 aHcY+cbtZn0iwHtbcXPlwCm1koyzEwbR5ARkjN00Y47DPM+0wVsbvC5Y1kTnVwJEzf04
 8HJ4noZoLgKANkQVYhtx0txEUAcRFPpO9iXlF2agFD4ycNOQ0KfGjde4auVybwdGyETD
 jWtOURZiP1DmhfHPG8Lby4f0whWz9JMrsS3P5b69waeV/irCmVV1+zy0KPczhAnwwKnz
 4M9Xoo2EzbHLEjkF/ynIp4eJCCAwYjnjNB7ikp1IUAeO53RZgpb4CAqWD+er8WnF84OM
 Yu9Q==
X-Gm-Message-State: AOJu0Yw9HcYNSLrOiIajt6Ciuf0xW5PXMcJSCBANFnVYMEkJVrld/ZoQ
 WJVG8CsEYG1P5ohZ+AHQAximoKf2p5DNWvvk2/JL3FrZEKN+psS68m0/iEswhbb8++k=
X-Gm-Gg: AY/fxX7pwg7YGGBkVyu8p/0iSRuS9iM1BQ/FIyLrlOcMzPhYtxIEsaDOeQZRwB+Y2A5
 cUu4yk3YjM8YjsTTJkSukzxRBw9vivBAvCfty2LpEK9WTb7l0DH1kYp4J1GH30AMfsXdxVPolAa
 9EWldsie5pVP4g7r1QkAj4TtaFHWkSOJhqYsgFMrtcgPX7m1Qrux0ub/Jo+fuNNLJDpzKvuFQd7
 qA7BDvlplW3w4S1ZmJwVySnN8NRBJWNnRkiAfc/kO2eirUZk+IPRXKVIj0LF5hXfSDmZjhwi6Gb
 +vzJTPaC+qY2C+RYJQgPMNeGq9kdE4hKJtV284IGi9cPZ3A8vPrWR36S1tjNrsJUbXnlNHMHolh
 ZZbKku4NtW4ccIiKcgrkGWYrLc3gpUSfnJVj7jYxvfnIoJYzRJLkSjOpv0HMaqiLVdxosyMJaLB
 chxNVq5Eq/Qx5U6HuC/jaKSNmtsrQ+rbOL3aOiulpCIIJQAgndL/DlyagKRRAZSu4sQFVIJ16Wv
 00+9Wy7CwgbCCE56WHiYe/kXNaX1HhuEcppOiz95pEcMtdiXMiatSk=
X-Google-Smtp-Source: AGHT+IEKIsY+zpQASpwexZeyxfaBtrrnB/yG0dLlfvV/Q9ltzqA/e1f8Cb2g03m+EgVAgHCX6oWIcA==
X-Received: by 2002:a05:6808:1882:b0:450:c776:876f with SMTP id
 5614622812f47-457b22410ccmr15677745b6e.54.1767218931069; 
 Wed, 31 Dec 2025 14:08:51 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-457b4c463e5sm18227254b6e.4.2025.12.31.14.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 14:08:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 15:08:47 -0700
Message-ID: <20251231220847.250630-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767218931; x=1767823731; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xhXXbRhRGIB6u/mMHGbvIm0ygCYVPvV+tCFUHaDj8Kc=;
 b=eQoaFwNxEku0/4avLlTVydRiaff7uL4RG4ca2diUK9h8HiMNlDh+AlTKia8bc5WbUL
 69k49/xuwR/Z8wHXMHDymhNyHCt4d/ccb9Is+UME2/TM5+wE9I9lYaX8et45X3J55jtd
 7jxfPY0R3gMtPus43PfGUIgtNmyaRFXOnjngfhizJ1EgnlMRFNSWpL3IB1NwOEDdN68p
 cPNN1WMIoLXzwtoNH0vbjqsj/xRpK7OaZ0Qp5qhB9l/OA44Yaw5+iWN6Dt2kc9uowRFu
 JDKD3nHMiYKOEXMPmTcRmN4Z+p1rySG2IosMeKH9yJmTVAHHGnOnoVcdJU2MQp0U8P1n
 nxMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eQoaFwNx
Subject: [Buildroot] [PATCH 1/1] package/python-pybind: bump to version 3.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pybind/python-pybind.hash | 2 +-
 package/python-pybind/python-pybind.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
index a046181a9b..1a54a89da0 100644
--- a/package/python-pybind/python-pybind.hash
+++ b/package/python-pybind/python-pybind.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  e08cb87f4773da97fa7b5f035de8763abc656d87d5773e62f6da0587d1f0ec20  python-pybind-2.13.6.tar.gz
+sha256  741633da746b7c738bb71f1854f957b9da660bcd2dce68d71949037f0969d0ca  python-pybind-3.0.1.tar.gz
 # License files, locally calculated
 sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index 8d815ac38f..7282c058f6 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYBIND_VERSION = 2.13.6
+PYTHON_PYBIND_VERSION = 3.0.1
 PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
