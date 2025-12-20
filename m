Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F90E668BC
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 17:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 173A24091D;
	Sat, 20 Dec 2025 17:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sDN1AhgDZ_Vd; Sat, 20 Dec 2025 17:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48FFE408C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766252076;
	bh=BEd1HK0QvPuS8tCxffxqV4ukxVxSs0EyZA2UyPPLAgk=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=kIS11TbkgUJRdvwwhCMbmEf9+YM0oXH2XheM3ITDBxNNT9jA1Otc2cCCKA8wtVdpf
	 7aoxBMh2ra5guXMTYguU5toRfeLRNmDZneHHNDMMugClT7bylxNeIASf3e7T+OE4Nk
	 QT95ZYy1/HhJZKh9nYZichR2RHFQfiKxT3BsVYCJwybPs1LzHUO1Iw7Nyt5279gUDT
	 Hyb2QxVqdxRnQdMEwmCG4fmZQVTq1712ypWeoGLDiqtotyT/u7k3cr/OZAs8Vz2dWH
	 /v9t23DryOCIauLERdZXViym5d9payevhC57irxk0jUFnJJT0kSdw7Udizm7gKtAar
	 AGF63lAi9j5hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48FFE408C2;
	Sat, 20 Dec 2025 17:34:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD4DA119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B564C810E0
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o25vXXoFhu5r for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 17:34:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E762680FFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E762680FFE
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E762680FFE
 for <buildroot@busybox.net>; Sat, 20 Dec 2025 17:34:31 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso26799175e9.3
 for <buildroot@busybox.net>; Sat, 20 Dec 2025 09:34:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766252070; x=1766856870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4RidmoB6oORqLUwTqK955o3oMOztG7DeMElzzikyAyo=;
 b=bmM9laNmTHcKNt6FMk1GVIo54a7U3ykC6ietl4acsVCYgwJkw4aTlkpRX0OBBirlwD
 ZBNvdExjt+683tcxv33vg4Hdn/sygSjFVpS6Be7LbJkScOSj0vNqQbDL1syqZibSRO4t
 Mqme/zcfNlGlaIJHxYgIOlD/vHBW7wWCaaArjcq7Ld3Fp1Xs7TmMGoo4Yt1oTQ2C5wjb
 PK2Kx/rYDi376SxpKIUXQqn3a9g10QrtZnv9NDHJH2gNJiBj2nV0sBSK1FkqIPy7NSaH
 4Zr5Rk3EezP6DVJuqPrXtTvAWdBZ0Y9RXNU/do2r5mXp1BNSxl4Ny+n3HBloFDESRvEH
 mJZg==
X-Gm-Message-State: AOJu0Yza7Lxc/upaepJFhVPHec82GtmNHfHdFFBH0wWCiJREDfOcMjrH
 HMfek7hmEUiMqpnZWpuTc+ix6UJQED27pTXGY6KlZDmxIcaPUi9iWctoDH9m0wj2P9JZWgNaK5J
 IwJd2pA==
X-Gm-Gg: AY/fxX7XDZnFXw4IjIvg+v/B2onFz9DNfI+GwYmK0nSRlvaYwYiVaeBkjdXz0YRIlUa
 XB2SuOyGK1joC4lIRQ+TuVa312tR0osQlkBlI7rhRen2qzV8ZVDApBHggPYEooJpKe0p9Ed/fN8
 YDe6GDzDuCFkWR/t+4EAPJ16cDG1pB6TKqJMnJ/oaOsRKae7VQFaQDUdbzwc7qnlNr/kjmbkQZs
 8NLtvSPdtWkIWZCy03kjkp3aMjQH0KlAL+XGula+2Oo8RN54MFQL2emvmj+0dfuPmKNHEf4XWZe
 NE/B7o/nDX+WCZjHRyOGfDdhQ0bh/tceS2dH0ufQE9kLe6F8TfXlu4CQpbCwB1hP5dunuyI+Wwy
 fLso/XWder/v18ezdfMtuyAxnwwT36vVC3oIRr9AoY3wUnnlY4YynIuiWyE2un1MA+CxYQepITy
 Zlvrk/SOyXXUnCtalgImJs6GafhM7Qweq6x2Q=
X-Google-Smtp-Source: AGHT+IGbcjXxaRCmioVqgND8v8U7Tblsl/vCmUZJEhz8pRubVoJEYAlnwtjCuEj4GnT1iycZGkcQSQ==
X-Received: by 2002:a05:600c:608e:b0:477:58af:a91d with SMTP id
 5b1f17b1804b1-47d1956ec9dmr64614855e9.5.1766252069597; 
 Sat, 20 Dec 2025 09:34:29 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4325dbc522esm1036447f8f.11.2025.12.20.09.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 09:34:29 -0800 (PST)
To: buildroot@busybox.net
Date: Sat, 20 Dec 2025 18:34:10 +0100
Message-ID: <20251220173412.433583-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251220173412.433583-1-francois.perrad@gadz.org>
References: <20251220173412.433583-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1766252070; x=1766856870; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4RidmoB6oORqLUwTqK955o3oMOztG7DeMElzzikyAyo=;
 b=PgBrpysmJ3Ca/t3OzXj1FcbSpV8NiUvTlERxpd4qxwRWssjdpUXzvra63KnErvymI7
 mkVu18H+Pqhk186umtCGOvhyp8fa7SCs+LSpEGMqEqujfvyJ1bHBm8ngDrlrv+S3wIx7
 c4hfGP4eNUADVjhk6eM1mMxIQaQhdEpwDs5JAgDh6bFOo0ccB820tyCZvYynLqEOBxti
 5JVpR7rBrE4OY7/2RMolvmpIWZvxz3Di0y88pMuVzP3idfBN+88kpPasKr07z0RfA9mN
 st+IUVVYy2rkFY4sYKv8sFVzbDadZAl/82HtJk/r8NuC3X6F1IDnSOEPVfhiSwXx6VHr
 bgQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=PgBrpysm
Subject: [Buildroot] [PATCH 2/4] package/jmp: new host package
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                                    |  1 +
 ...er-command-with-BR-toolchain-wrapper.patch | 27 +++++++++++++++++++
 package/jpm/jpm.hash                          |  3 +++
 package/jpm/jpm.mk                            | 25 +++++++++++++++++
 4 files changed, 56 insertions(+)
 create mode 100644 package/jpm/0001-fix-linker-command-with-BR-toolchain-wrapper.patch
 create mode 100644 package/jpm/jpm.hash
 create mode 100644 package/jpm/jpm.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5c9eb94f5..5ac155572 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1172,6 +1172,7 @@ F:	package/dado/
 F:	package/ficl/
 F:	package/graphene/
 F:	package/janet/
+F:	package/jpm/
 F:	package/libgtk4/
 F:	package/libtomcrypt/
 F:	package/libtommath/
diff --git a/package/jpm/0001-fix-linker-command-with-BR-toolchain-wrapper.patch b/package/jpm/0001-fix-linker-command-with-BR-toolchain-wrapper.patch
new file mode 100644
index 000000000..4569a469d
--- /dev/null
+++ b/package/jpm/0001-fix-linker-command-with-BR-toolchain-wrapper.patch
@@ -0,0 +1,27 @@
+From 33982bbf739a3a4eb70cf18a0575d5106324873a Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Mon, 20 Oct 2025 14:57:25 +0200
+Subject: [PATCH] fix linker command with BR toolchain-wrapper
+
+Upstream: N/A specific for Buildroot build
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ jpm/cc.janet | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/jpm/cc.janet b/jpm/cc.janet
+index c5abdac..4ebb25c 100644
+--- a/jpm/cc.janet
++++ b/jpm/cc.janet
+@@ -110,7 +110,7 @@
+         (if (dyn :is-msvc)
+           (clexe-shell linker ;ldflags (string "/OUT:" target) ;objects
+                  (string (dyn:headerpath) "/janet.lib") ;dep-importlibs ;lflags)
+-          (shell linker ;cflags ;ldflags `-o` target ;objects ;lflags))))
++          (shell linker ;lflags `-o` target ;objects))))
+ 
+ (defn archive-c
+   "Link object files together to make a static library."
+-- 
+2.43.0
+
diff --git a/package/jpm/jpm.hash b/package/jpm/jpm.hash
new file mode 100644
index 000000000..c8259737f
--- /dev/null
+++ b/package/jpm/jpm.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  337c40d9b8c087b920202287b375c2962447218e8e127ce3a5a12e6e47ac6f16  jpm-1.1.0.tar.gz
+sha256  e2d2ae8360d95386af751ac7d1a3da36ea8ceb230e5f0eba7eb762547b1c58c9  LICENSE
diff --git a/package/jpm/jpm.mk b/package/jpm/jpm.mk
new file mode 100644
index 000000000..f6a20690d
--- /dev/null
+++ b/package/jpm/jpm.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# jpm
+#
+################################################################################
+
+JPM_VERSION = 1.1.0
+JPM_SITE = $(call github,janet-lang,jpm,v$(JPM_VERSION))
+JPM_LICENSE = MIT
+JPM_LICENSE_FILES = LICENSE
+
+HOST_JPM_DEPENDENCIES = host-janet
+
+define HOST_JPM_INSTALL_CMDS
+	(cd $(@D); \
+		DESTDIR=$(HOST_DIR) \
+		PREFIX=/usr \
+		JANET_BINPATH=/usr/bin \
+		JANET_MODPATH=/usr/lib/janet \
+		JANET_MANPATH=/usr/share/man/man1 \
+		$(HOST_DIR)/bin/janet bootstrap.janet);
+	$(SED) 's|/usr/|$(HOST_DIR)/usr/|' $(HOST_DIR)/usr/bin/jpm
+endef
+
+$(eval $(host-generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
