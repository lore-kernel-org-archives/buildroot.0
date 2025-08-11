Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FB5CA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 20:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E68E615C9;
	Mon, 11 Aug 2025 20:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c6F5Yb0N5pfv; Mon, 11 Aug 2025 20:32:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF07A615CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF07A615CD;
	Mon, 11 Aug 2025 20:32:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 071D6D98
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 20:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0DFF4177C
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 20:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0XPy6pPuHUy for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 20:32:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 365DF41720
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 365DF41720
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 365DF41720
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 20:32:13 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-459e210bd2dso17143495e9.1
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 13:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754944331; x=1755549131;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RFfL/u21re/7ma7hYJdTEgfmWaWxe1lLheLcFL+735Q=;
 b=fcou4F8j7y+fkWmn9Jq7MTYLgHoHhElxtBXmXYqIu37+iaeNw298hmGyAYDSf67Iun
 QtqDniO87xk2SewTbqGF6YUaJgBO5yarvkn/0hqt/SjCC5O3UyNZadRAiPbLVX0TrD0g
 BtojYkTTVQFglEMTsY0S+e48LXwP+JoI5PhfYRLabtcNbhZay6Iy6o5ElvBK7o208UO5
 qRSMs3vxz8Ud2tk82xkyrTHoWbzAvhrWLa/qDrHYEAC9800OJzB8akio4GtDIeFvuND6
 6l/HX63VoLaMIyGHeq/mJyM5tqo3ftFt4xwhpwjo0JVwwPbJVg45IgMygPyvxm9tK5Jn
 1KMQ==
X-Gm-Message-State: AOJu0YyWwGPv1S/WTAAqhVy+EwcJ9Db7/id2b3jmYC4RO/1k+4aqLqvu
 tkDE/jExF58Q3lGh65/UrlPpYU2bQRCQDgO8y0/YeL503eajuqTe7goPFfgmhLOds58Rm8zDxx2
 yuiNl
X-Gm-Gg: ASbGncvKb5056AOhn5mOeRcTBJQMgxD17/hy5zOX2jN7qqM+Dj8aBeG2kseI3CGgXEU
 tYwpNvEHWIXVEBfiMmRQe5jEMBBZFtwZzETSVKC8d8bihHmCxt45SB2Ou7G8O858kH7F+dSfKiO
 WmgKBg+qTe/3WGyBbb/gQgkFfHeFlHmxYG9vMCId/kGYl5V+YSmrTYZrCY+QQiNiZVhpQxzJWsf
 rGDpc/dG7bSZ1JrylomsYAyjgpjCmThiDYGs/avnkCkP58EaMKDs33sT9TiN6ShkaXWRKwkMOkl
 E2k6WgbyvxPne7+YnypBdnRsnDMA6mDgjXuTOjyfoDTKc432iAbhVO9/OmSO9Vil/eW2N7LEWF2
 5tw7DdlD7GCPQp+0YahTE5+pGduOmntIeGcPDuE8ONF05tCDnHK/mM6X6uOKCkEyZKDf+dKwrb7
 nWzW78ssuUpb/OgiKtx6kZKy4w0ggS/5w=
X-Google-Smtp-Source: AGHT+IFEz5KxEMgYlciD2G3HXisqw7nox3qf9F23sfV0IWBuPq/uz2ekTDFPOYryJ9fVH3zd7KA6+A==
X-Received: by 2002:a05:600c:304a:b0:456:1146:5c01 with SMTP id
 5b1f17b1804b1-45a10dd6efemr5079465e9.12.1754944331198; 
 Mon, 11 Aug 2025 13:32:11 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abed3sm41624078f8f.10.2025.08.11.13.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 13:32:10 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Mon, 11 Aug 2025 22:32:06 +0200
Message-ID: <20250811203206.1506378-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811203206.1506378-1-romain.naour@smile.fr>
References: <20250811203206.1506378-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754944331; x=1755549131; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RFfL/u21re/7ma7hYJdTEgfmWaWxe1lLheLcFL+735Q=;
 b=nsWRuh7tgAJ5zbxzAUziJ0+eTCpPguLLgBL21jtZQWHFbKHLdYfuv0pBnjM8EfWbW/
 woLaNHi+2/zWUqbXMhF/Z8pkNaW9P8dsqVb9oUBNmRyG3gQPPGCgf7B7ps/kK1AIniMv
 3OISzbaBOhQ02VqmqIfxxb2PiUC1KmoS8JL/U=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=nsWRuh7t
Subject: [Buildroot] [PATCH 2/2] package/thttpd: disable static build for
 shared only builds
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When BR2_SHARED_LIBS is set, thttpd package is trying to link with
the static variant of lcrypt.

  [...]/host/bin/arm-linux-gcc  -static htpasswd.o -o htpasswd -lcrypt
  [...]arm-buildroot-linux-gnueabi/bin/ld: cannot find -lcrypt: No such file or directory

Disable static build using STATICFLAG=""

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/thttpd/thttpd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index d9cb5c9071..53cd4c3462 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -16,6 +16,10 @@ ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
 THTTPD_DEPENDENCIES += libxcrypt
 endif
 
+ifeq ($(BR2_SHARED_LIBS),y)
+THTTPD_MAKE_OPTS += STATICFLAG=""
+endif
+
 define THTTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/thttpd $(TARGET_DIR)/usr/sbin/thttpd
 	$(INSTALL) -D -m 0755 $(@D)/extras/htpasswd $(TARGET_DIR)/usr/bin/htpasswd
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
