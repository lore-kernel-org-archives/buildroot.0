Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE41FC05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 11:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D07160A99;
	Fri, 10 Feb 2023 11:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D07160A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ypyl4Dw52mXD; Fri, 10 Feb 2023 11:07:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A140B60ABE;
	Fri, 10 Feb 2023 11:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A140B60ABE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05E051BF2AA
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 11:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4A664107E
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 11:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4A664107E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yk5zYlIP5KXq for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 11:07:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55A354104D
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55A354104D
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 11:07:12 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id fi26so4424341edb.7
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 03:07:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=88ee8j9xbIsC1gEugjHzCNXSa8mv/aVw8cgcd5CLq0U=;
 b=uyIYlvCMU8JUt7ZPwDT/UhUeEJxn4TDYvc/HKybZk+F7JxJniBKhIxh7VPq5U3cP4d
 HzMfDjtv6qWtdUZs2/Swit7oktuLt+5cD3IR99l0RAqKJgAkL8aVe9uMM62wtrdVli71
 jceMTrdCQ/hAVSUC9sUwwuvXVXGtnS6DQtG/mLC7MpDV05ofK3mUX447ruQUoT4Uq6d3
 Wow6qpX6B9XHxSP2e45k8vojVk7ZOfry3L1+mFxqFFiMpE7g1yPAFOYq8esoiR3nSthP
 aajNmVmqU/nhB38fYAqhKb62P+DVQIo+7xsOrEw0JYimxYsa6upytAhrWw8lDkhaz7Ww
 QWHQ==
X-Gm-Message-State: AO0yUKXwlOcH55/mhK0Mu+u3jWsGBbleSWCLfC3gRAFFllgIe6Kem2af
 RjF70wl2JQ9pOVF8IcBippwZDlm5W6Qn/OIm8MQ=
X-Google-Smtp-Source: AK7set+xxmEniVaqrWKoxZrCHsUjMrSbPp0pWBe6c1Zx/pyFUFzfEO3q9WIQ7Lnoc+YHVFIOE5smDw==
X-Received: by 2002:a50:954e:0:b0:4ab:f00:a with SMTP id
 v14-20020a50954e000000b004ab0f00000amr9518238eda.2.1676027229925; 
 Fri, 10 Feb 2023 03:07:09 -0800 (PST)
Received: from wintermute.ecorp.int (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 y59-20020a50bb41000000b004ab17b9a92csm2060833ede.50.2023.02.10.03.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 03:07:09 -0800 (PST)
From: Frank Vanbever <frank.vanbever@mind.be>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 12:06:43 +0100
Message-Id: <20230210110643.449927-1-frank.vanbever@mind.be>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=88ee8j9xbIsC1gEugjHzCNXSa8mv/aVw8cgcd5CLq0U=;
 b=QMgDeF/VlH16BN2HNWyxWwtv76yThDQa7hy45nk9FiM8pJsPgs80gcweiflk97LeWK
 Uf3QXSCSB5VRjvQz62tsC24mk4oHWLXxpUEeJKpdCn4IicD7tbvQUK3t6y/QESy5V3s7
 TYsfMV4OVTs1JuyJP2pGQZkIJzNQt26fPGGXDSUEA3Ouqq04mnXKxLaRITSL45WiJdcI
 WmbW2ufdb300y4yiw6XeZjbSpZUNf1DM+O7jhoiaDjEYvg+hs9lpYY5wUvZqXmCdJ0mn
 XMfKFWPA6+nOPlcKSAI/rfEKCqf0GM8yY2HIHy83n5LUAeagssPcQt6ugLqaULBlOyZX
 JQWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QMgDeF/V
Subject: [Buildroot] [PATCH 1/1] package/elixir: drop package
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
Cc: Frank Vanbever <frank.vanbever@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Elixir was a dependency of rabbitmq-server which got dropped in
89815bad0a531d01ee2733dd9c17576a7647e1d9. It is a host package with no other
users, hence it is no longer required. Additionally, newer versions require
Erlang 23+.

Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
---
 DEVELOPERS                 |  1 -
 package/elixir/elixir.hash |  3 ---
 package/elixir/elixir.mk   | 21 ---------------------
 3 files changed, 25 deletions(-)
 delete mode 100644 package/elixir/elixir.hash
 delete mode 100644 package/elixir/elixir.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 32c6e54919..e8e0671709 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1089,7 +1089,6 @@ F:	package/upx/
 F:	package/zxing-cpp/
 
 N:	Frank Vanbever <frank.vanbever@mind.be>
-F: 	package/elixir/
 F:	package/libmodsecurity/
 F:	package/nginx-modsecurity/
 
diff --git a/package/elixir/elixir.hash b/package/elixir/elixir.hash
deleted file mode 100644
index 6d083e72de..0000000000
--- a/package/elixir/elixir.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Computed locally
-sha256  f3465d8a8e386f3e74831bf9594ee39e6dfde6aa430fe9260844cfe46aa10139  elixir-1.9.4.tar.gz
-sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE
diff --git a/package/elixir/elixir.mk b/package/elixir/elixir.mk
deleted file mode 100644
index 6d935516f4..0000000000
--- a/package/elixir/elixir.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# elixir
-#
-################################################################################
-
-ELIXIR_VERSION = 1.9.4
-ELIXIR_SITE = $(call github,elixir-lang,elixir,v$(ELIXIR_VERSION))
-ELIXIR_LICENSE = Apache-2.0
-ELIXIR_LICENSE_FILES = LICENSE
-HOST_ELIXIR_DEPENDENCIES = host-erlang
-
-define HOST_ELIXIR_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) compile
-endef
-
-define HOST_ELIXIR_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) PREFIX="$(HOST_DIR)" -C $(@D) install
-endef
-
-$(eval $(host-generic-package))
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
