Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B67ACA0FF2
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 13:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B4844214A;
	Wed,  3 Sep 2025 13:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yTL8BSwLOwXt; Wed,  3 Sep 2025 13:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4887A42148
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4887A42148;
	Wed,  3 Sep 2025 13:25:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12A68439
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 13:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0154B615C6
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 13:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LaKj82DroBhX for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 13:25:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D4DC3615AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4DC3615AC
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4DC3615AC
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 13:25:40 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-45b84367affso38410235e9.3
 for <buildroot@buildroot.org>; Wed, 03 Sep 2025 06:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756905939; x=1757510739;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N6d8TlcJVPr7e+Ty4/ejgXM0EU3vXzJgezmpbKBk3Og=;
 b=IzuWbj3KGEDyO3nfgEJ9E5sBhadASi/23W5UwthsJsjgW6zhdtNCJ7Y2jXqMvg1IfS
 GdZN2fuhFokvORKMvSvuBQe47NiFpGE8XoyykxkTEqthlSA1K/tzEixJc8qLRZWu9SPT
 iKjdMou5zAskUGhAIqwdf/rfQStJ/SeLGLTT19peTUpbBEAT9soAivoL6m7DfUniQ+b4
 16DcL2Lq22ScQ1114hl5gFvxA6pxW+mc7ebrKU99Xaw15qpvgxzLAKxmYpztfC6qvOGv
 dbT1bb3fwsEhPdQpgv6cRW6jVwW4W5mm1140NQjn0PDyOqn//+Gc264Au1ovpN/hmCfb
 hF+w==
X-Gm-Message-State: AOJu0YwjrL5vh0+76Xhqr0CIBlFhsC2dZPmSI5NgzCs8poND+LdQhcUw
 dXcfkLvcgnQXe4C9FBw8K4PkVPB8mYPL2aY26GyxpUAJclFxOiU4wz9dq2EMItIZ6iXssyhqp8l
 eYqL0WGoeztYQ
X-Gm-Gg: ASbGncveItLxIjh1zCthtWoHceodJfN5g1jKSHZ/5VRDQ0Dc9/V6ZGmWEDgPhhKaT9b
 +3vWVLAuAZUAeNnQpH/fSoz5rlPn4QSCZe7sRfrrgGSwV2Ph41lxBr9fINwz7qJ8NROKP0gwIzu
 ZHPIjFzzBVxYzeNGOdwyyGzzFdnSJ1LpRY5iwzUqKVk8wjZ+PEiSfxfGQXe3jRKN5J311cuvDM4
 PmVGznciNJtxvRvcF5TdcRKCm0RqbIyFDUGgtC0SjUUDSb6aRT3uabIDQT7WO9bJqnecLpInpbe
 2LXZx+5EYjy1yeCQkM96HkyKPCdSGtwNX6+gV6LUa+1Id1ISqAA9+uJQmTNilYAW3hMl4qzP/NJ
 cOjDpMEXTK/Htw5zGnXUlk9ZmtkNfAryqDlLEtG5btf7JvQE=
X-Google-Smtp-Source: AGHT+IFjC9pKfER11wuyCO7a5WtrKpwfxcDUHByzZXMWjgVfL60TzapV9FZiyIu7HYodSdC83sDt2A==
X-Received: by 2002:a05:600c:4ed3:b0:45c:b549:2241 with SMTP id
 5b1f17b1804b1-45cb54923d6mr19076615e9.27.1756905938635; 
 Wed, 03 Sep 2025 06:25:38 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:49b1:76d4:3e52:5347])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e92a42asm237710095e9.20.2025.09.03.06.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 06:25:38 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 Sep 2025 15:25:21 +0200
Message-ID: <20250903132521.13551-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756905939; x=1757510739; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N6d8TlcJVPr7e+Ty4/ejgXM0EU3vXzJgezmpbKBk3Og=;
 b=fgMLd371EOPsf3AjkQqLHjUzRKReQ9rWpTRJtAlfjEZJCKDXvUmFKGi2ogPE0ejh4h
 zOoVMjLHEhtbAXv591fe48mMRlZ3Y4BEWcxiW0Pk43TaUJ/OOm04Nv5mP6KKlZ7zNmh7
 FRsceNyyTLVmAjkGVXTUvPth17Ld8Z3PdTy/2lZMNy7WwQ+lJJ2sRLma1b8+KmXm/A0v
 7YqOHRnM300ypV6uaYr/6mAlNOAGzT7AxUsTDq+71XPjjUY+36BLCe9nbdGLAZJbk9mq
 7lqC0swinNXIHZ/lncQQDddm90BJric6V5S15XMW3P4YsoxDN203MHC3ItlyyjJKcSuM
 5Blg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fgMLd371
Subject: [Buildroot] [PATCH] package/python-flask-cors: security bump to
 v6.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a major version bump, because it could break user code that depends
on the (wrong) previous logic fixed by the new release

See the release notes:
- https://github.com/corydolphin/flask-cors/releases/tag/6.0.0
- https://github.com/corydolphin/flask-cors/releases/tag/6.0.1

This fixes the following vulnerabilties:
- CVE-2024-6839:
    corydolphin/flask-cors version 4.0.1 contains an improper regex path
    matching vulnerability. The plugin prioritizes longer regex patterns
    over more specific ones when matching paths, which can lead to less
    restrictive CORS policies being applied to sensitive endpoints. This
    mismatch in regex pattern priority allows unauthorized cross-origin
    access to sensitive data or functionality, potentially exposing
    confidential information and increasing the risk of unauthorized
    actions by malicious actors.
    https://www.cve.org/CVERecord?id=CVE-2024-6839

- CVE-2024-6844:
    A vulnerability in corydolphin/flask-cors version 4.0.1 allows for
    inconsistent CORS matching due to the handling of the '+' character in
    URL paths. The request.path is passed through the unquote_plus
    function, which converts the '+' character to a space ' '. This
    behavior leads to incorrect path normalization, causing potential
    mismatches in CORS configuration. As a result, endpoints may not be
    matched correctly to their CORS settings, leading to unexpected CORS
    policy application. This can cause unauthorized cross-origin access or
    block valid requests, creating security vulnerabilities and usability
    issues.
    https://www.cve.org/CVERecord?id=CVE-2024-6844

- CVE-2024-6866:
    corydolphin/flask-cors version 4.01 contains a vulnerability where the
    request path matching is case-insensitive due to the use of the
    `try_match` function, which is originally intended for matching hosts.
    This results in a mismatch because paths in URLs are case-sensitive,
    but the regex matching treats them as case-insensitive. This
    misconfiguration can lead to significant security vulnerabilities,
    allowing unauthorized origins to access paths meant to be restricted,
    resulting in data exposure and potential data leaks.
    https://www.cve.org/CVERecord?id=CVE-2024-6866

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-flask-cors/python-flask-cors.hash | 4 ++--
 package/python-flask-cors/python-flask-cors.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-flask-cors/python-flask-cors.hash b/package/python-flask-cors/python-flask-cors.hash
index 41c232df36..7070b5462e 100644
--- a/package/python-flask-cors/python-flask-cors.hash
+++ b/package/python-flask-cors/python-flask-cors.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-cors/json
-md5  a6e8202cc008ef6f70ce75a7ae7f8d9d  flask_cors-5.0.0.tar.gz
-sha256  5aadb4b950c4e93745034594d9f3ea6591f734bb3662e16e255ffbf5e89c88ef  flask_cors-5.0.0.tar.gz
+md5  2879503d54f25a4cacb62f7060b96e14  flask_cors-6.0.1.tar.gz
+sha256  d81bcb31f07b0985be7f48406247e9243aced229b7747219160a0559edd678db  flask_cors-6.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6e1a1bdc54834c1e0740cbce5d5f6f2cae1c846fd2a7f482b11649594fafbd5d  LICENSE
diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
index 1119648370..d0923d665b 100644
--- a/package/python-flask-cors/python-flask-cors.mk
+++ b/package/python-flask-cors/python-flask-cors.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_FLASK_CORS_VERSION = 5.0.0
+PYTHON_FLASK_CORS_VERSION = 6.0.1
 PYTHON_FLASK_CORS_SOURCE = flask_cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
 PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/4f/d0/d9e52b154e603b0faccc0b7c2ad36a764d8755ef4036acbf1582a67fb86b
 PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
