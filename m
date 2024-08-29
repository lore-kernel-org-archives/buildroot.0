Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42587C83F2D
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04DA741997;
	Thu, 29 Aug 2024 14:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TV00-0HshEMP; Thu, 29 Aug 2024 14:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F963423B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F963423B8;
	Thu, 29 Aug 2024 14:51:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF09F1BF98E
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0B8F606BE
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xmw7VQcMIT8s for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C8773606B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8773606B9
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8773606B9
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:56 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-37193ef72a4so501551f8f.1
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943054; x=1725547854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OIUYK0Mg2lz78JDv5g2YQtCvhE/swKPdDLCHgPS/44I=;
 b=gpyZVdCky5WFijCRcZdWSPBkMM/uYOGqOv9BeeOnGJbIQgLPK1bbTciukIkwKcRVma
 ndOBhdTxVU2ESx2EpXJcDV+400+fSdMBY9MXSA/r9LeAIEIw6HMviowuxg6CjvXaOFF+
 MShqt5vM7lu1ocbgUDoRiHahQVoqNhdMF43VrfJN5K5g0QrlO7Pt+IU8a3Gb4vTZGEAV
 08E7TBZB3TLj8bk2/w+ltSE/Rinqj9Rp2USqTl6Zbb8x9SmKewjugDRJB9roVgyfIbUK
 /dV8bk+ySyXsq0VyQtNkmDzQaWwbV7XyGNjRRWgxTA++xjY6MgOV69+PJ/qXmn+7OIHq
 Qrnw==
X-Gm-Message-State: AOJu0Yyxekn5dFtIo5SDnKEUe9ajZGh1q8XXzMT50xRyanJJ02KWr1El
 7tP6ACi1aDHvb6Maj02FZXVRSFCK7JIZGdvmmtjDug9SEJ7FOa4SM9yrlg==
X-Google-Smtp-Source: AGHT+IGKBgZWHlk6Y4gdDtToc4eVosm8PV2NVbTjsGgdWG6DzNINCfTRVMZ323ujBB4LOxClOZIUkA==
X-Received: by 2002:adf:e642:0:b0:367:9614:fb99 with SMTP id
 ffacd0b85a97d-3749b526f8bmr2196069f8f.10.1724943054136; 
 Thu, 29 Aug 2024 07:50:54 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:53 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:38 +0200
Message-Id: <20240829144940.209964-23-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943054; x=1725547854; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OIUYK0Mg2lz78JDv5g2YQtCvhE/swKPdDLCHgPS/44I=;
 b=YEZeXDK2I4ZiPNnvBZaNgcwXY9qPuQXGNgRUNITbtVG40MSRFPfqFPm0WMiiI7sX1F
 +0//HWUuNCKFjV4/jITmHNVEPuFIwmG456KPXOlPpdjdZUt1/Q/wwQZMApfUTRdlWKFx
 yB/O7JviNxeCK+9gf5/1R3QPgk302BaLfB1wBRG8ltE1jPlKDDpot4T9+9HjZaPNpAz7
 6NpKWZaXZ30Btkz5oLU/IHdYzhUyFww5Oltbjv0vcOnXdcjCbt9OaykKZssV1C4FOqup
 snssNfFWOClCAt3mH6r3Fprr25BSoUsZXfRZsHH6CYRdQtaz8Em1r6bl9urKU66FG2Cs
 Rgjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YEZeXDK2
Subject: [Buildroot] [PATCH v2 22/23] package/ejabberd: bump version to 24.07
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

and update the two patched accordingly. Ejabberd now uses rebar3 by
default, so use the --with-rebar configure option to set the correct
rebar binary to use.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 ...not-download-or-compile-dependencies.patch | 23 +++++++++----------
 package/ejabberd/0002-fix-ejabberdctl.patch   | 19 ++++++++-------
 package/ejabberd/ejabberd.hash                |  4 ++--
 package/ejabberd/ejabberd.mk                  |  5 ++--
 4 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch b/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
index abcc8975b2..69f25304b5 100644
--- a/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
+++ b/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
@@ -1,37 +1,36 @@
-From bf3571da4a68a6a857ab7ad8256f8276b3687a38 Mon Sep 17 00:00:00 2001
-From: Johan Oudinet <johan.oudinet@gmail.com>
-Date: Fri, 13 May 2022 14:22:37 +0200
+From bfcc72e5bb96fc9fc1f3558191a1a3f40c7f159a Mon Sep 17 00:00:00 2001
+From: Johan Oudinet <johan.oudinet@gmail.com>
+Date: Fri, 2 Aug 2024 17:32:37 +0200
 Subject: [PATCH] Makefile.in: do not download or compile dependencies
 
-Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
-[Bernd: updated for version 23.04]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
+Upstream: N/A, not upstreamable
 ---
  Makefile.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index ab0e9d967..6e54168a7 100644
+index 5adf241d5..74aad3156 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -155,7 +155,7 @@ else
- endif
- endif
+@@ -201,7 +201,7 @@ endif
+ #' main targets
+ #
  
 -all: scripts deps src
 +all: scripts src
  
  deps: $(DEPSDIR)/.got
  
-@@ -169,7 +169,7 @@ $(DEPSDIR)/.built: $(DEPSDIR)/.got
+@@ -215,7 +215,7 @@ $(DEPSDIR)/.got:
  $(DEPSDIR)/.built: $(DEPSDIR)/.got
  	$(REBAR) compile && :> $(DEPSDIR)/.built
  
 -src: $(DEPSDIR)/.built
 +src:
  	$(REBAR) $(SKIPDEPS) compile
+ 	$(EXPLICIT_ELIXIR_COMPILE)
  
- update:
 -- 
 2.34.1
 
diff --git a/package/ejabberd/0002-fix-ejabberdctl.patch b/package/ejabberd/0002-fix-ejabberdctl.patch
index ae28f3a632..89504d11c5 100644
--- a/package/ejabberd/0002-fix-ejabberdctl.patch
+++ b/package/ejabberd/0002-fix-ejabberdctl.patch
@@ -1,30 +1,29 @@
-From 4283f675f21d3923e200092cec6418014a03ad52 Mon Sep 17 00:00:00 2001
-From: Johan Oudinet <johan.oudinet@gmail.com>
-Date: Thu, 26 Dec 2019 17:06:34 +0100
+From d403c0bca48f2678c70763c3faca41c9adc76658 Mon Sep 17 00:00:00 2001
+From: Johan Oudinet <johan.oudinet@gmail.com>
+Date: Fri, 2 Aug 2024 17:39:07 +0200
 Subject: [PATCH] fix ejabberdctl
 
 Change default values so ejabberdctl run commands as ejabberd user.
 
-Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
-[Bernd: updated for version 23.04]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
+Upstream: N/A (specific to buildroot)
 ---
  ejabberdctl.template | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/ejabberdctl.template b/ejabberdctl.template
-index a940c3df7..5166e5a27 100755
+index 83ec7e1bd..513c48c25 100755
 --- a/ejabberdctl.template
 +++ b/ejabberdctl.template
-@@ -17,7 +17,7 @@ SCRIPT_DIR=$(cd "${0%/*}" && pwd)
+@@ -17,7 +17,7 @@ ERTS_VSN="{{erts_vsn}}"
  ERL="{{erl}}"
- IEX="{{bindir}}/iex"
  EPMD="{{epmd}}"
+ IEX="{{iexpath}}"
 -INSTALLUSER="{{installuser}}"
 +INSTALLUSER=ejabberd
  
  # check the proper system user is used
  case $(id -un) in
 -- 
-2.20.1
+2.34.1
 
diff --git a/package/ejabberd/ejabberd.hash b/package/ejabberd/ejabberd.hash
index 15e879be19..e6d9b2560e 100644
--- a/package/ejabberd/ejabberd.hash
+++ b/package/ejabberd/ejabberd.hash
@@ -1,4 +1,4 @@
-# From https://static.process-one.net/ejabberd/downloads/23.04/ejabberd-23.04.tar.gz.sum
-sha256  6ff1d41a1ff6261a0c846193647d8ec143e82142859bf1cfdc62299022ceb2ad  ejabberd-23.04.tar.gz
+# From https://static.process-one.net/ejabberd/downloads/24.07/ejabberd-24.07.tar.gz.sum
+sha256  c0fb746acba81a5db41de97c03968c1f681a13b1b6c1a895b7182e33820c18d9  ejabberd-24.07.tar.gz
 # Locally computed
 sha256  469bb8cfa3ef22c102875ff31932450c075e6908ff3f7d36893485c0c30898eb  COPYING
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 58b544fb84..df9fc1c1d0 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EJABBERD_VERSION = 23.04
+EJABBERD_VERSION = 24.07
 EJABBERD_SITE = https://static.process-one.net/ejabberd/downloads/$(EJABBERD_VERSION)
 EJABBERD_LICENSE = GPL-2.0+ with OpenSSL exception
 EJABBERD_LICENSE_FILES = COPYING
@@ -36,7 +36,8 @@ EJABBERD_CONF_ENV = \
 
 EJABBERD_CONF_OPTS = \
 	--enable-system-deps \
-	--disable-erlang-version-check
+	--disable-erlang-version-check \
+	--with-rebar="$(HOST_DIR)/bin/rebar"
 
 define EJABBERD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) all install -C $(@D)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
