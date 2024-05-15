Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E80C25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 16:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04DC482133;
	Wed, 15 May 2024 16:25:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUuEdpjZsCnj; Wed, 15 May 2024 16:25:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05904820E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05904820E1;
	Wed, 15 May 2024 16:25:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4DCAE1BF396
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 16:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 399C94068C
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 16:25:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUOguYjrxY2T for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 16:25:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E2AB240691
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2AB240691
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2AB240691
 for <buildroot@buildroot.org>; Wed, 15 May 2024 16:25:10 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-51f174e316eso8638428e87.0
 for <buildroot@buildroot.org>; Wed, 15 May 2024 09:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715790308; x=1716395108;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tNWYIVE6ASlTapC2pXXtrW8lDRVZpLdr67atapK+mwA=;
 b=sI396HxzLZQ8mPL1cCsTwz7wTHtpbXm6dukfZXIewEPHPYh79K74+Xd9KhQ16d+EE+
 eroZfK8kmW56bjKKmxNgwfkC2K4yn1keeW9MmN+pcrqB+xuS3xbAizlvYL+Y0lUPFGu1
 rC1b4QPxpiwuk0RjdCq3nObg3C56qgooW1IfqssQjhoNe7yFfA3pE5czbocVg46i4z5F
 cW8kBUayg4pTMO6vNsuH9XaTntiX6omVjIauZKBfWYw7bDE5bAQCe3i12LmscC35fM0w
 gnMvGh2m3kQT2UwI7xiJfEz0bcWoM38MZDw9SNkXFD36H+hxWac7XgJmOERnTgyJlwnz
 Ej1Q==
X-Gm-Message-State: AOJu0YwAytHYfRRaeomVZidDLyog6q7tDakgJAp2sXM+Qm3KfQ7KE7et
 Qynk0J/rdHHVh6va6ECqusJwY5VpZ7H+gfhr0p4gHZJu+bGnGzENv0tTEQ==
X-Google-Smtp-Source: AGHT+IGe/QSOLUgKZBBzI1JC5R29wOp+obj/wyTp2TVf0+u4YBoRLG2k2eJmSzsi/I4oBa4nngV8XA==
X-Received: by 2002:a05:6512:3e0e:b0:522:2edc:c858 with SMTP id
 2adb3069b0e04-5224b73a706mr9379035e87.34.1715790308037; 
 Wed, 15 May 2024 09:25:08 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42012276231sm138974535e9.26.2024.05.15.09.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 09:25:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 May 2024 18:25:01 +0200
Message-ID: <20240515162501.1086749-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715790308; x=1716395108; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tNWYIVE6ASlTapC2pXXtrW8lDRVZpLdr67atapK+mwA=;
 b=NJTAm1xm6ClqtHktsjDg5jA3KN265rtmHp5i1KJS7ktfzkovIFHkhl4Fk+krxeFWG8
 Bdk/0ydcFakli1bnCoHgZZcUiFmU+ySqbvhC2NIXVWHS67IT1+ixVUktDwMnfstMXx65
 MwhaG60Ev60wlGYjj7xwY/opMIFuoWbcf7+Xl2fLdlBwKeULKs3XFMnKl5CHfa/ZPaw3
 vYjZAbqpQkeBE5ew0r/BisNLU2wGhfUMnFvTlrYSzKsLm6x8Izh77EUMBkWHOwlA73i3
 wlDcARBgwu85pqNuYFnzbYEN6y2rwtYdfHuO/iQkSg8m4D2KqtvP0Om4Yt5aJcXb9a7n
 xxRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NJTAm1xm
Subject: [Buildroot] [PATCH 1/1] package/syslog-ng: fix libcurl build
 without C++
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Chris Packham <judge.packham@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following libcurl build failure without C++ raised since bump to
version 4.7.1 in commit 105f0398c76f3288b2668e0b3ec722b2ebe55a0b and
https://github.com/syslog-ng/syslog-ng/commit/86feed7bff068a48be477a5b702ca24abc441d70:

configure: error: C++ support is mandatory when the cloud-auth module is enabled.

Fixes: 105f0398c76f3288b2668e0b3ec722b2ebe55a0b
 - http://autobuild.buildroot.org/results/cf36fb119224ba50a768dbe363d4c381f76eb476

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/syslog-ng/syslog-ng.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 4f9a455e81..57ee46ce05 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -61,8 +61,13 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 SYSLOG_NG_DEPENDENCIES += libcurl
-SYSLOG_NG_CONF_OPTS += --enable-http --enable-cloud-auth
+SYSLOG_NG_CONF_OPTS += --enable-http
 SYSLOG_NG_CONF_OPTS += --with-libcurl="$(STAGING_DIR)/usr"
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+SYSLOG_NG_CONF_OPTS += --enable-cloud-auth
+else
+SYSLOG_NG_CONF_OPTS += --disable-cloud-auth
+endif
 else
 SYSLOG_NG_CONF_OPTS += --disable-http --disable-cloud-auth
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
