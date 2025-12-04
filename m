Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB811D20697
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 13:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0A8F8466A;
	Thu,  4 Dec 2025 13:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSEh2IAhH3YX; Thu,  4 Dec 2025 13:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5409846C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764856086;
	bh=w8FoQlNniJVYqHd62x3evrbxh10RzW5WLzUPqgyCViY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ia129uJkhB3I0Tfy6zckRZLpZtcFCNE3R0097m/TN3abZaDAzchUeyUICQH2XwjM8
	 60GICVIY8lsmvqLfrjcZVAk76S4CCtS6mY4+VfV1vMxYqskyTO4KiGS1v2nAL3eTMI
	 qFKQ3mEuu7e+3lZezFwCudbPPUnJb3PPqrzAjQYpu4QDuCF5tUYe/20PMt4LDYBoTc
	 gEM6/T3VnHeIm2E/H7p/QPqlIc1vHdSVmv+xMYm6bDV4s+QaCrPOYG8XFJ60xeOlye
	 jvwjm01FbXXc8WG7hKrbe8Gighti59MDxhJxjO7XYQJ9EuBwXa9hrcWF+iBNgo0HUw
	 nb4+uSnBTXOCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5409846C9;
	Thu,  4 Dec 2025 13:48:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F44DE7
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 067B040C72
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FVJa-D1Uh11 for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 13:48:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E48240082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E48240082
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E48240082
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:48:04 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso12863035e9.3
 for <buildroot@buildroot.org>; Thu, 04 Dec 2025 05:48:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764856082; x=1765460882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A8bFMJMdSABRSlRFPrsIr/WjkLf9nFIo3HqVPRdsZFk=;
 b=dEk9XJXRB/XJ1kYQ/S+z+lHXmh6WLAgUNp+0lAWGAUgi08aSiddYlJysi57uCp5FlV
 ym/znPrLSzFjh6uKHjTDL9YxzMUVVhoLX6v97ry6du4euEmjRwAKdJ28qEkrPFYkgG1+
 9MvSRsXEAplTWmf5oBsEfy2pmmgi0ffCdXR6TykJD8auxvSoB3LSxlDtmL7J15ewyJ5c
 6Ueb6Cbqr+Xr5/ZQ1T6LatfKpu+5Jk5nOWz9FsBlB1lhryW/JY5jG9e7FYkyKqQ5794V
 CWs8oqwv5A5pk+k1meZY84JG6bwWscb9gz0B9soIo0amexiAS7xOyP2IO95qfyKEzPQ3
 sTOQ==
X-Gm-Message-State: AOJu0YwZoDs8thBVnS67PsQnvfjGiHu2muWIl4+/JUsqdSbgAsKFMZwJ
 Tjc8Hq5dCmlAMWeAe8EiUABH0uWPaULwWOlGp6gXdwfK0ZnK3f+nn578DesMuw==
X-Gm-Gg: ASbGnctKxkEqQblmzh1tSWq/72OGQ08MhVhUQMQtAGb1KislS0xUK5gHSFcVkvWJVE/
 xDghH9dqX6nseq7N2nz8wDtYQgMXJPL4JGNanT9fS19IGQd4BAUlRo+hC6w96RBikA62MFOqLzq
 4VnUXv2//qMkQ7I0dcHkBQda0zpwot3LX8BQOKUFDZcAfnw+tBnO7BMb3LM7mMFUW1gwfN5EB1Q
 ++Njq5/reqGXTXe+LGDkUrGqC2t/Cn5Y6JFIERr2Tf3azNxeH8txKoGsJ5s5XrXn1VO8CR9dmLS
 4Rj0cIE60vDRpvlo5BXAiIaFroOYy5MV6mrchtLd5OhPL4oSvqFwS6jf5ezuG3uHa+fYL0eSE05
 S06jI7+IQbyQYoGpbPMHHnQxxVWsDpE25+VnPp2ZjCUyB7kJnvNK/FbFZnl8Z5xOgZg+jllGAn8
 e+XSeskDZ9anaRzw==
X-Google-Smtp-Source: AGHT+IGGflTCNTL+JXeObvicPGhfJYuCv9+jeg2DIYXLnAQkc6GmBZcMa0GR25MeEP7jOlyvfnD7SQ==
X-Received: by 2002:a05:600c:4443:b0:477:9b35:3e36 with SMTP id
 5b1f17b1804b1-4792aedfbf4mr65251645e9.2.1764856082214; 
 Thu, 04 Dec 2025 05:48:02 -0800 (PST)
Received: from freepad.proxad.net ([213.228.1.188])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479311fbaf4sm28817255e9.15.2025.12.04.05.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:48:01 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Maxime Leroy <maxime@leroys.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>
Date: Thu,  4 Dec 2025 14:47:38 +0100
Message-ID: <20251204134742.406507-4-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204134742.406507-1-maxime@leroys.fr>
References: <20251204134742.406507-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764856082; x=1765460882; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A8bFMJMdSABRSlRFPrsIr/WjkLf9nFIo3HqVPRdsZFk=;
 b=UjDZaT3eaZjwhAUCRz52tr87QHZNmXZM8MfmyTnqMrsGAh1GF5G5btxW3fr4aYsp2z
 LIxBoZ3uXftSjo07bkWVTgLYjHfBI9A9CeRE1het2wcB30rFhC2F9q0J6zZpoobqvyRb
 lKpX0VRMfIq7L2Hbi4X7czOZPEWdni0gkMJMdypROm/zIrocVaCRtmSuMUK1VvwW1xkV
 2TYwj4Gat8mije1B7aKCP12cRMn7xlyxk1Uyj7y33mYMB5FnLAgHKmhLmks1E6hS6Rtp
 CttNT3HefwOZhV9+34Z6m1R9+wH77dn6+mqep2dw4B3Mx2aZG8hv+Tqx4dCJfaKuXtzN
 hjyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UjDZaT3e
Subject: [Buildroot] [PATCH 3/7] package/dpdk: make libraries selectable
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

Add BR2_PACKAGE_DPDK_LIBS_LIST to control which DPDK libraries are
built:
  - empty : use DPDK defaults
  - none  : disable all libs (-Ddisable_libs='*')
  - list  : pass to -Denable_libs= (comma-separated)

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dpdk/Config.in | 21 +++++++++++++++++++++
 package/dpdk/dpdk.mk   |  9 +++++++++
 2 files changed, 30 insertions(+)

diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
index 9b6b367ee8..200d151a7f 100644
--- a/package/dpdk/Config.in
+++ b/package/dpdk/Config.in
@@ -64,6 +64,27 @@ config BR2_PACKAGE_DPDK_DRIVERS_LIST
 	  Buildroot packages for external dependencies. DPDK
 	  configuration will fail in case of missing dependencies.
 
+config BR2_PACKAGE_DPDK_LIBS_LIST
+	string "List of enabled libraries"
+	help
+	  Controls which DPDK libraries are built.
+
+	  Values:
+	    (empty): use DPDK defaults
+	    none   : build no libraries
+	    list   : e.g. "hash,fib,rib"
+
+	  To list all libraries found in the DPDK source tree:
+	    find lib -mindepth 2 -maxdepth 2 -type f -name meson.build \
+	      -printf '%h\n' | xargs -n1 basename | sort -u
+
+	  Note: providing manually a list of dpdk libraries to enable
+	  does not automatically enable its dependencies (internal or
+	  external). It is the user responsiblity to add internal dpdk
+	  dependencies in this list, and/or select the relevant
+	  Buildroot packages for external dependencies. DPDK
+	  configuration will fail in case of missing dependencies.
+
 endif
 
 comment "dpdk needs a glibc toolchain w/ threads, gcc >= 4.9, headers >= 4.19"
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 829b0cc640..d0c7caaa48 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -56,6 +56,15 @@ ifneq ($(DPDK_DRIVERS),)
   endif
 endif
 
+DPDK_LIBS := $(call qstrip,$(BR2_PACKAGE_DPDK_LIBS_LIST))
+ifneq ($(DPDK_LIBS),)
+  ifeq ($(DPDK_LIBS),none)
+    DPDK_CONF_OPTS += -Ddisable_libs='*'
+  else
+    DPDK_CONF_OPTS += -Denable_libs='$(DPDK_LIBS)'
+  endif
+endif
+
 ifeq ($(BR2_PACKAGE_DPDK_TESTS),y)
 DPDK_CONF_OPTS += -Dtests=true
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
