Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DC5C4452B
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 15:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78870605F7;
	Mon, 20 Jul 2026 15:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bkzDi-TLP2_L; Mon, 20 Jul 2026 15:02:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E3CD606A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784559769;
	bh=U3nEWCO1ev1rCdYQV7UViUvYP8toNBcqaA4YmAP0dMc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pbK0vpU/bKrw+yD8qKmj6NMan5Jjzh4ZHWOw563avG1IkCbE6iMqyYbD8P1Sh4PxY
	 uNmDOTHcC/xEjHrUhAUkU235RgdVtDeyppO3QjYgaNoYEcmgHJn6B8NfMTVGKDXdQX
	 PiNp7y9DaX4onVfWNa7jsPqfqEkte+jM3MhnHmR8TtxmjrO7cz3Fr52F9eeRKGb2Lx
	 fxlUnhUFVizfAJjOENvqddO9RGTRkffTo2fDF3/9KPNpy/JHfWnt8GsermgejXiNCB
	 cNuQiwus1Y6n9Tq83MFhtsBeNNzHTsXhqQgA3P/FRgjuKgpUyWphGUeaYvT5ojEx61
	 to9FEF1ZpzI+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E3CD606A5;
	Mon, 20 Jul 2026 15:02:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C7081F6
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 15:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E68A80CB1
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 15:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKb6ZM8G60_u for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 15:02:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E2C480CAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E2C480CAF
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E2C480CAF
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 15:02:46 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4955adb04e8so10077285e9.2
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 08:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784559764; x=1785164564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2dMqYzqz0hUJZJQO3vIhrP8pWiKNcC9ApQbmOoOq0HE=;
 b=anebqHBB+vocyJToCZT1FST3BTWz7Wyhyq5mGpUttPQPFQDA9HwoQdSXRmtY771Q3i
 mnyXlFaCjgdBBo/sAa7RY/IRfC3gf+FXY1b2TPumQuN4UX8YL4MrwNCwHNDyK20wqwmd
 FC5a1/pzdup17We4M//IXeX8CQjKrG8lCdOyhBRHsd9znQKBYz+xslM2Flrp3rECraHS
 a3lYA6JTCQxkDywFp2y1JdcdQM+MXIn+UU+Xc9xHx7AR9jMQvWpz3d51qdxoMIm+3cm8
 akGoOzRzGNU0369BXSyhiMe7zVsjBdtPvbgYUfqB9xLvMimWKIbhB8DZEW8MKxSXsXlC
 4U6A==
X-Gm-Message-State: AOJu0YxFMs2pTk4WDBVPQtomwrPJRZdW8yOB6Lb5pUBT/bt8ClFi69ht
 Op+2yfo4k58UGoiaKsoHDGyhAaqmHdQpQ7rYeRRwTVklWtr0GhvJb7SHVAi6Bg==
X-Gm-Gg: AfdE7clFuCnOwWSqnG/ImP/KsGCOkkvuU9QMC5n4gSHGuYRVmifQdHkbXuJpkmGb6Ow
 6vuYXXRJiIqoKZ8J2rFSEuC+Ztfg4rLnU8isuwoVxzc6cZxBdVGHUeoQ425TY5JDIhY+aEQt2Ei
 C6oDYd3bymj9bXVSuNzDsTZq1GEheFAJU4AiTdYx6DyuNTTtWTNflYCCIQorv9Rhy5GQ3S3Dhv8
 rPozm5XJ9xI9B2nwAFqMr+m3sMsHHLxjlqUjof05umKLlRLawm/mr2C3F/H4QEQdx8MJ9sdlxg/
 eERP8JkDb4mzf5zy9xM4fX7HhV1+KqF0KFmMlYO7dpt+dJahZxIulpuHopdqh5zp1CyODWqhsDK
 aAcSJG/yrNKJP8SNKl9cLjAVzewwpLMtk1eZUnMOs3he/YDgrQFhdipANmOv8CdP75fPNOTsdtU
 FDkONvRRD1+HZ+7FcPKjM8o5yl4Cg8XEG935hdE6w=
X-Received: by 2002:a05:600c:820f:b0:495:52fc:e235 with SMTP id
 5b1f17b1804b1-495532489eamr114791465e9.15.1784559764217; 
 Mon, 20 Jul 2026 08:02:44 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ee926dsm28681532f8f.35.2026.07.20.08.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 08:02:43 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Mon, 20 Jul 2026 17:02:29 +0200
Message-ID: <20260720150236.243961-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720150236.243961-1-francois.perrad@gadz.org>
References: <20260720150236.243961-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784559764; x=1785164564; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2dMqYzqz0hUJZJQO3vIhrP8pWiKNcC9ApQbmOoOq0HE=;
 b=NsSxgEauSAY6xfgJaSspGvWf2JIFV+/kbyP0zBlmdk5NeMNz+CnctzMqKduqqGVN5N
 Sj9wJokAKAPRiXuhQE9nRw9ltYGih4KyB+/rWZ46KOxeiLMGDmQ25UFAETRNFF459alN
 VJIfwM0kZ1ALL5PYCQoBMZRaNBfimjxEID2vBOnmP4O+TH/jxRroO0UOrVv5Od0JGIWQ
 JNUZ6taL7JU4g0TJhmgWsRAHvEmrkw2U2RI+mWjsjb9ihA694neSSEBRRoLzAKM4q7nO
 zgTRDeHHfdX3UCIuIoRBIlXem5cJzXC+bc76OWzPNEMzgcE78lou2QnA7oHJgCYwzGvK
 YY+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=NsSxgEau
Subject: [Buildroot] [PATCH v2 2/8] package/scdoc: new host package
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

dependency for host-hare

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS               |  1 +
 package/scdoc/scdoc.hash |  3 +++
 package/scdoc/scdoc.mk   | 22 ++++++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/scdoc/scdoc.hash
 create mode 100644 package/scdoc/scdoc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 23c95db6f..442fe4e6a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1197,6 +1197,7 @@ F:	package/pkg-perl.mk
 F:	package/pkg-luarocks.mk
 F:	package/quickjs/
 F:	package/rings/
+F:	package/scdoc/
 F:	package/wsapi/
 F:	package/wsapi-fcgi/
 F:	package/wsapi-xavante/
diff --git a/package/scdoc/scdoc.hash b/package/scdoc/scdoc.hash
new file mode 100644
index 000000000..8917b4038
--- /dev/null
+++ b/package/scdoc/scdoc.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  e1a9c2000f855123a1a50c8f897073e0ee95fc41787431efe3864c2f1c2e7092  1.11.4.tar.gz
+sha256  ad227c56bf22c9fa35be3d383789d065698904b61161f6a8339b91bde5a3e48b  COPYING
diff --git a/package/scdoc/scdoc.mk b/package/scdoc/scdoc.mk
new file mode 100644
index 000000000..80ee9ce76
--- /dev/null
+++ b/package/scdoc/scdoc.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# scdoc
+#
+################################################################################
+
+SCDOC_VERSION = 1.11.4
+SCDOC_SITE = https://git.sr.ht/~sircmpwn/scdoc/archive
+SCDOC_SOURCE = $(SCDOC_VERSION).tar.gz
+SCDOC_LICENSE = MIT
+SCDOC_LICENSE_FILES = COPYING
+
+define HOST_SCDOC_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) all
+endef
+
+define HOST_SCDOC_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		PREFIX=/usr DESTDIR="$(HOST_DIR)" install
+endef
+
+$(eval $(host-generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
