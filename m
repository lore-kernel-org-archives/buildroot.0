Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A131C7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 15:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D9A0611D1;
	Tue,  1 Jul 2025 15:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zr42wsUPqlV; Tue,  1 Jul 2025 15:03:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CF5A611DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CF5A611DC;
	Tue,  1 Jul 2025 15:03:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BEAB197
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 15:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 528C341962
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 15:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6aowVmRQZRa for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 15:03:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 61E4D4098D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61E4D4098D
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61E4D4098D
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 15:03:39 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a582e09144so2568703f8f.1
 for <buildroot@buildroot.org>; Tue, 01 Jul 2025 08:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751382217; x=1751987017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MmZFr7v33RMv0RJsKyudXlsf0Wpgwt9aj/SJukIfO/Q=;
 b=fu/O8ObtC+3msEVjSMGKOesuSttpYTbIWP6ylmOczobf+TFRK6taKsxW7ain37bws3
 7yw9zonM91a92sBSO6sTKTiSdv6JTq+uCnB9cUuWyBIyzTK2PpZV3Ape1AeAgUhJZqOV
 DiBcnUtdXxHd+uya4SuOhI8NPyTLcM1kECBw/qijjia0OACdnPMMCSPbbbqti8Cxwzeu
 EF/o6ABvO4yVk6uhGNBiTTmaqa6UYunYa0fkRZ5EiXwp5nHm7DTPTIgmLrk/ZCFW9GXB
 qT76fkDMvu9jXftPPDpPJaaB4d8BEbdZ3RIwcn6p/ERIvz5btn1GmlZqu5roO6n7pqvp
 ZgUg==
X-Gm-Message-State: AOJu0YyNWBo3cM3AMTRL6EZ89DPHVwt41EBLZbEgxHObqriqlwCpzqI+
 ZflNLCVLRsuCDrAv6K/ZLCJtkI2mZ6akDfiAduRQx7YTNpLBFpQ1Rv9bzrI7esWP/vOp6U2w93L
 ZXo5z
X-Gm-Gg: ASbGncsQrAmw/TeGCXPeNbhmFtjob71FFL4ztoZXzCrhoZco9cV7tTfFE0UToqzhTZl
 pY25oPyYSiJDWrP5O0WCD/BkfoYalbxeCcTF8Sz0tXwfiT9233RxMc/lNbZbHDzeyqu+xDRKugP
 Olr5faUDZR/MEhLn2k0TAzrcG8siJGycNGTVTegKMzVFDJxQkUQgoaGg5tLlzw4mMKdvhwUeQ4s
 EGDkF0+IEmvLFZbMjODEif+So7zWw0hkLFY0nKPPAledzIy6oFfXOV6Ptu0qFiakClBw6NbqQ9b
 he20v3V3uAfXleEGKSm0aiyXpvGo9un7egsECNfFzojWUDRzCCZuYEuS22Y69CAruZh9KeDqJ4i
 FylBXPbnI+g==
X-Google-Smtp-Source: AGHT+IHmOsT1OfJ/00Pzcq4Vcq6LdFGEn2s4RrHIecvls1zp6ROhBwcQczmr0DpvkahlTAvsLCmi9A==
X-Received: by 2002:adf:9dd2:0:b0:3a6:d255:7eda with SMTP id
 ffacd0b85a97d-3a8ff51fd29mr14302955f8f.28.1751382216346; 
 Tue, 01 Jul 2025 08:03:36 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e59884sm13207836f8f.80.2025.07.01.08.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 08:03:34 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Tue,  1 Jul 2025 17:03:31 +0200
Message-ID: <20250701150331.530854-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250701150331.530854-1-thomas.perale@mind.be>
References: <20250701150331.530854-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751382217; x=1751987017; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MmZFr7v33RMv0RJsKyudXlsf0Wpgwt9aj/SJukIfO/Q=;
 b=g0XtUB0zeA/ygU3hxqtfh92GR6JnGDef0XqXOmQMYgTDaPb340RdTwlp/Kbn1z2sWC
 yJEPCZz86tX1Qa/GFURvbKNHxYBA4BcxBldJcymGFlPvjTeKPrG9eYVUG5qhqIJ6nMjh
 0MwnPbAzm2D1iENgMvbUO+jV1PTrqK9IpFpJQfrU5ZXO6Zv+23KtAS41xSM3uQGO9Pi1
 2R60cclrEfHmcOx2FkTTZ3UzmOdon/D6D8PLhCBmzYLy7JWUPNJ4I89FShzhoaRm812e
 Ap1nV0zieVPpDvBxLXBF6NP0xPIOmt5xbjmkQj7c4cmjRInVAxil9SahWi1roWfKZv5a
 oRzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=g0XtUB0z
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xwayland: security bump to
 version 24.1.8
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

- CVE-2025-49175: A flaw was found in the X Rendering extension's
    handling of animated cursors. If a client provides no cursors, the
    server assumes at least one is present, leading to an out-of-bounds
    read and potential crash.

For more information, see:
    - https://nvd.nist.gov/vuln/detail/CVE-2025-49175
    - https://gitlab.freedesktop.org/xorg/xserver/-/commit/0885e0b2

- CVE-2025-49176: A flaw was found in the Big Requests extension. The
    request length is multiplied by 4 before checking against the maximum
    allowed size, potentially causing an integer overflow and bypassing
    the size check.

For more information, see:
    - https://nvd.nist.gov/vuln/detail/CVE-2025-49176
    - https://gitlab.freedesktop.org/xorg/xserver/-/commit/03731b32

- CVE-2025-49177: A flaw was found in the XFIXES extension. The
    XFixesSetClientDisconnectMode handler does not validate the request
    length, allowing a client to read unintended memory from previous
    requests.

For more information, see:
    - https://nvd.nist.gov/vuln/detail/CVE-2025-49177
    - https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab02fb96

- CVE-2025-49178: A flaw was found in the X server's request handling.
    Non-zero 'bytes to ignore' in a client's request can cause the server
    to skip processing another client's request, potentially leading to a
    denial of service.

For more information, see:
    - https://nvd.nist.gov/vuln/detail/CVE-2025-49178
    - https://gitlab.freedesktop.org/xorg/xserver/-/commit/d55c54ce

- CVE-2025-49179: A flaw was found in the X Record extension. The
    RecordSanityCheckRegisterClients function does not check for an
    integer overflow when computing request length, which allows a client
    to bypass length checks.

For more information, see:
    - https://nvd.nist.gov/vuln/detail/CVE-2025-49179
    - https://gitlab.freedesktop.org/xorg/xserver/-/commit/2bde9ca4

- CVE-2025-49180: A flaw was found in the RandR extension, where the
    RRChangeProviderProperty function does not properly validate input.
    This issue leads to an integer overflow when computing the total size
    to allocate.

For more information, see:
    - https://nvd.nist.gov/vuln/detail/CVE-2025-49180
    - https://gitlab.freedesktop.org/xorg/xserver/-/commit/3c3a4b76
    - https://gitlab.freedesktop.org/xorg/xserver/-/commit/0235121c

For more details on the version bump, see:
    - Security Advisory https://lists.x.org/archives/xorg/2025-June/062055.html
    - 24.1.7 https://lists.x.org/archives/xorg/2025-June/062057.html
    - 24.1.8 https://lists.x.org/archives/xorg/2025-June/062066.html

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/x11r7/xwayland/xwayland.hash | 4 ++--
 package/x11r7/xwayland/xwayland.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
index 2a23891752..6cbbea8af5 100644
--- a/package/x11r7/xwayland/xwayland.hash
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2025-February/003586.html
-sha256  737e612ca36bbdf415a911644eb7592cf9389846847b47fa46dc705bd754d2d7  xwayland-24.1.6.tar.xz
+# From https://lists.x.org/archives/xorg/2025-June/062066.html
+sha256  c8908d57c8ed9ceb8293c16ba7ad5af522efaf1ba7e51f9e4cf3c0774d199907  xwayland-24.1.8.tar.xz
 sha512  b6dcc87f5c4d880cb23216518171a704c2a501803ac2efd9d01760895d755a617cd82313c6516f27a888b0581c64d74e3f8db5c238e1ae0d13da6cc1a547c02f  xwayland-24.1.6.tar.xz
 
 # Locally calculated
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 47dc0b39e6..e3b6727c19 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XWAYLAND_VERSION = 24.1.6
+XWAYLAND_VERSION = 24.1.8
 XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
 XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XWAYLAND_LICENSE = MIT
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
