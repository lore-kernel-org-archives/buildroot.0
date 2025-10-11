Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E1ACCD184
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 14:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52A50408A2;
	Sat, 11 Oct 2025 14:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jhtNHi0Agrs; Sat, 11 Oct 2025 14:15:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D3464086E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D3464086E;
	Sat, 11 Oct 2025 14:15:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24EF612B
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 14:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15FB960675
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 14:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRtECPTpZNJl for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 14:15:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 177FF605AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 177FF605AA
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 177FF605AA
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 14:15:54 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b463f986f80so659793766b.2
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 07:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760192153; x=1760796953;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IS1VVsO+DKvsjFZnQP+uI0dtkIf2J/Z0Dz6kanZaNQw=;
 b=H7q+7GmP4ZOOezreOmpysPvgTwONpWMUplgdbS6BEciy6YASLyldXIqOzS5RZXFqQj
 NdbLUcK2VCWJ7n7drv50/DXrh4p0mhcO74RhuP0o7C4oHKEN2NqSCSeHQwoFchH4AJom
 UjaeTumXIsxwEzYz1eF8aTn+TVIWZTtuSut6Vsyy3Svek5XLJmslZYcif5w7Zfhof3Ni
 yoEXbWOSMn3mwHdVRTaCLimTpu8tuNzgJw1MFor34IzkVlkhib9EX6PgG34JJj6YlU+N
 DUFHbhnvcEzEuJFhRtG7xh/gLEg3ffPmqX3ZN7W408v54RELeqfV3CCfMldvfPHSCKq9
 Oo4A==
X-Gm-Message-State: AOJu0YyxCWDCHyaQUYiTy29OJ7WCLbhKLgvig799ur+bFocukdTOxtnf
 h+nhELaSpeBfIDPJBytPgcu71nYhDUKvJgT3cKZO766HzrSqk4WK9nAIRpqlI+eNpIqXtYiFbqv
 /szjZ6hc=
X-Gm-Gg: ASbGncsZwQLe0wnOb1yAzn9TkPqdjSjCet0ECTp6gTXPqk7cpUs2XjAHxss3+1TFZrS
 RL0MdltCNI7SyGzOQu+eVMVLQrXOVD0JbVckLNs3eEsd26EaGJrb6qqe/zlnWLGNfPpr6JCQx9B
 gTktPG4bppl7JWBa18Kl3QyqFOczQVnj0F5H07KbzyX6YlGGRKril2EEieg7Y9XqRMV0GmXN1yN
 FGiz2QMrVcPFzfLacg7HtUJVn/w7E7xB3UO1mqx4LC7qdfeO7ZlURrC5il3Ch6h/uPqAJUC0ov2
 ojf/opbAZg0aIFA60EwCx5xMbkKunfJCYMKRbeVlN0ZFETKK9My9/yAk9qDJrcBoXNwkwrSVT3N
 VUCL2f0u1oIjgtTqYjB7lHkFfqvEOQaUyEJTnz1qATx9NwHDvKR9yAr7YYDO8jLXDMs7RTHBiFF
 OTfOWltjMsfYEopBv0b99xJxuzJWnnfPxMT7e9a4L9viGow0UC+njlHQ9/kw7qtWIz2VhJt/6uc
 tYlq5H4YjqbVkvyWRT4
X-Google-Smtp-Source: AGHT+IHaiPgSe0fZhNDcPS5DT3AFpCWO1bjtD/eJSkae3SsdhUZiPI8poLuK/aLFGFFMFBjDj+DwnQ==
X-Received: by 2002:a17:906:c150:b0:b3e:6091:2c7d with SMTP id
 a640c23a62f3a-b50aa89b304mr1719587966b.27.1760192152630; 
 Sat, 11 Oct 2025 07:15:52 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d9a4054fsm491007966b.89.2025.10.11.07.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 07:15:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 11 Oct 2025 16:15:49 +0200
Message-ID: <20251011141549.2045266-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760192153; x=1760796953;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IS1VVsO+DKvsjFZnQP+uI0dtkIf2J/Z0Dz6kanZaNQw=;
 b=B0J/bTHhNkUoYIiQ/if9aKN4HfeGJEzq96TlgsW9fIR77eQoYFADmBRog8fTMSwMMm
 TCgDDkyUDtV7BWwX30ZrGbmUz3WBpw++XONkbFusPsa9HXiHsctkSnLu0NjLCiUPTn7K
 1zio7Ljw1TI5nxbNMtjsI4ZVNuUeK6j6merWE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=B0J/bTHh
Subject: [Buildroot] [PATCH 1/1] package/gssdp: bump to version 1.6.4
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

Release notes:
https://gitlab.gnome.org/GNOME/gssdp/-/blob/gssdp-1.6.4/NEWS

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/gssdp/gssdp.hash | 4 ++--
 package/gssdp/gssdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
index 06bf51090f0c..eabbf6e7c714 100644
--- a/package/gssdp/gssdp.hash
+++ b/package/gssdp/gssdp.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.gnome.org/sources/gssdp/1.6/gssdp-1.6.3.sha256sum:
-sha256  2fedb5afdb22cf14d5498a39a773ca89788a250fcf70118783df821e1f3f3446  gssdp-1.6.3.tar.xz
+# Hash from: https://download.gnome.org/sources/gssdp/1.6/gssdp-1.6.4.sha256sum:
+sha256  ff97fdfb7f561d3e6813b4f6a2145259e7c2eff43cc0e63f3fd031d0b6266032  gssdp-1.6.4.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index 3b446496ea23..d8c34760d37f 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GSSDP_VERSION_MAJOR = 1.6
-GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).3
+GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).4
 GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
 GSSDP_SITE = https://download.gnome.org/sources/gssdp/$(GSSDP_VERSION_MAJOR)
 GSSDP_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
