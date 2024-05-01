Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5775AC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 12:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73D9A407D9;
	Wed,  1 May 2024 12:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0QR4rc8yeWAH; Wed,  1 May 2024 12:01:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FA1F40834
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FA1F40834;
	Wed,  1 May 2024 12:01:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 084721BF844
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 12:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0123C40737
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 12:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXMdIZ6pJNwM for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 12:00:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F7C240712
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F7C240712
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F7C240712
 for <buildroot@buildroot.org>; Wed,  1 May 2024 12:00:57 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-572250b7704so7083320a12.2
 for <buildroot@buildroot.org>; Wed, 01 May 2024 05:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714564855; x=1715169655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wTJnTFDMcw+FBJcgHBTfjNqFulcuDAVsnmsmUmbgt8E=;
 b=hs4ObyNE8e1uKa5/AWEh5W9XUj6Knm6q5/gTTdGO7A8ImPBaKAWYtOwLwi+uonoZ4r
 QQHSrZ3sS01NdnkiGvyYFtvK+gkyoiWSWnpafyp82zV00qKATDK5JYbLR2xgL8lV4oTs
 54KpGooKye+Os0hCrwu3YJx3ktNtxyHzVVpAinDlt7YloR91++RfMrZznz/sjE2MgkYI
 uYBSKIMbkx94YQ0bRAyEG5JLUUcjTGWlAjhKoXnceZN+QyZwmGtb/r54UKKn7XfyGsfF
 Btdn5AQ9xR7TbEe5WQOXjVhrPi3E4oxL9Ysw4L1mIeHsoIESF7nNCNXDl0AnPkDt/+qt
 kIkA==
X-Gm-Message-State: AOJu0Ywd1tULvfpRsjx01g83cVMjsgGUO8D67JVYIuaaTNLx1c8Iuicp
 OjzzPF+EyABrKjwwDztMsb/MjWwCWt7VFxit67HhtcFCw+p/ijxYp4WqsQ8wzpHTDyT4T/T0ecA
 Nw9k=
X-Google-Smtp-Source: AGHT+IFc2ucmxgRhqUx574m39fmhEiQ2jNVMeRxjodQrw5vt9OVXb9DklPyDxua/eBN7IlGmUS478w==
X-Received: by 2002:a50:ccd7:0:b0:568:9cfe:1974 with SMTP id
 b23-20020a50ccd7000000b005689cfe1974mr1766208edj.18.1714564854997; 
 Wed, 01 May 2024 05:00:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a50eb09000000b005727bdb1eafsm3973689edp.40.2024.05.01.05.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 05:00:54 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  1 May 2024 14:00:50 +0200
Message-ID: <20240501120050.670109-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240501120050.670109-1-dario.binacchi@amarulasolutions.com>
References: <20240501120050.670109-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1714564855; x=1715169655;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wTJnTFDMcw+FBJcgHBTfjNqFulcuDAVsnmsmUmbgt8E=;
 b=M9trpjWgZBwUkD/WbQMds/Oy5EfzC/uWdLj6ZRc2WKlbJMMzX2ZSkra0nlOrr5wHvM
 G0cXQ5tu+qF6BonLNXORY0ugb5l1g4zwXuueEFrb2bEjEwbM4cjLtk9wU+npxOLkY3Hm
 3IQeYdOstVywiiO/XVgEC6AplM8Iz3uqXoSyw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=M9trpjWg
Subject: [Buildroot] [PATCH 2/2] package/qemu: renumber patch
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
Cc: Romain Naour <romain.naour@gmail.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 3fa1ae00681ca ("package/qemu: add option to enable tracing")
added a patch with a wrong number.

The patch also updates the upstream trailer of the renumbered patch to
ensure successful completion of the `utils/docker-run make check-package`
command checks.

The patch also modifies the upstream trailer of the renumbered patch to
successfully pass the checks of the `utils/docker-run make check-package`
command.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                                             | 1 +
 ...3-tracing-install-trace-events-file-only-if-necessary.patch} | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename package/qemu/{0004-tracing-install-trace-events-file-only-if-necessary.patch => 0003-tracing-install-trace-events-file-only-if-necessary.patch} (90%)

diff --git a/.checkpackageignore b/.checkpackageignore
index c16e17cc35e4..e4f9139d665a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1075,6 +1075,7 @@ package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch lib_pa
 package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch lib_patch.Upstream
 package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch lib_patch.Upstream
 package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.patch lib_patch.Upstream
+package/qemu/0003-tracing-install-trace-events-file-only-if-necessary.patch lib_patch.Upstream
 package/qextserialport/0001-Create-a-main-include-file-QExtSerialPort.patch lib_patch.Upstream
 package/qextserialport/0002-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch lib_patch.Upstream
 package/qt5/qt5base/0001-qtbase-Fix-build-error-when-using-EGL.patch lib_patch.Upstream
diff --git a/package/qemu/0004-tracing-install-trace-events-file-only-if-necessary.patch b/package/qemu/0003-tracing-install-trace-events-file-only-if-necessary.patch
similarity index 90%
rename from package/qemu/0004-tracing-install-trace-events-file-only-if-necessary.patch
rename to package/qemu/0003-tracing-install-trace-events-file-only-if-necessary.patch
index 36bdaa4978ad..f9b82865ce16 100644
--- a/package/qemu/0004-tracing-install-trace-events-file-only-if-necessary.patch
+++ b/package/qemu/0003-tracing-install-trace-events-file-only-if-necessary.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] tracing: install trace events file only if necessary
 
 It is not useful when configuring with --enable-trace-backends=nop.
 
-Upstream: https://patchwork.kernel.org/project/qemu-devel/patch/20230408010410.281263-1-casantos@redhat.com/
+[Upstream status: https://patchwork.kernel.org/project/qemu-devel/patch/20230408010410.281263-1-casantos@redhat.com/]
 Signed-off-by: Carlos Santos <casantos@redhat.com>
 Signed-off-by: Carlos Santos <unixmania@gmail.com>
 ---
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
