Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AD1C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 20:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D86181886;
	Mon, 25 Mar 2024 20:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xCQY-hAyhlbP; Mon, 25 Mar 2024 20:10:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E7C1818A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E7C1818A7;
	Mon, 25 Mar 2024 20:10:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FA841BF3E3
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 20:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A216606BA
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 20:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wta3AE0KAgLH for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 20:10:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=bleemayer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F36B7605D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F36B7605D9
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F36B7605D9
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 20:10:36 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6e6b22af648so3784092b3a.0
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 13:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711397436; x=1712002236;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VZLr4U0Xzn2ilPwXEpr7nX7ZHCwqLY5ctQVKf7MtQag=;
 b=XbKDRelq4xGeSOsmk7QdQLWfU4CkvU3eE0cvHG9I4ObLY+tIZRwGDfRp5xETO62+fW
 KHQCW+FfJ3/0BlcjPQZyynWWnhVJGULtq91mBdQF3qlG8dyYtG0GSaqpyxidiRtStvEZ
 UEi+p/ZriLHNEp4xOs3HClTSZNHWj98fweJ4Jswdaz9kAz5RZ3pppYAUNXFXlAcvFYSG
 6xHt6POVW8J23Yw/FPESFHzIX9+ppcS8YbqYsIDjsHQKius23sCEX/1g2hpBcTqqzz0z
 phd8JgBJ4Sv96HlXrhYKs6qZ6nsLNQoEVMsbCm6ym4JJi1hnfMuiXE/NONgd9dO36lae
 XBsw==
X-Gm-Message-State: AOJu0YwouEj7ZuoYqCjXYgqnWyPODBXfX2RuE6AlVf2iGjJLcIxSipcD
 aRiwVZ/zJ4p22BT4StfgrfPvWR0ZwtorAoVxLofsL+sm2yJnFBIbMm0nAG3ECMo2f3XcC/oi4qt
 0FVSvjK+fhTboLuUFLuN12v9Gi3XcbEEzKXmbmA==
X-Google-Smtp-Source: AGHT+IGwnx66VkWpCr/GNbx/sKLodtJbtUeo5KNnwgg7jv8eLzbfQzuiBvLwT0BiLl2B3REFBeVhG4iuFwgKowyrBdE=
X-Received: by 2002:a17:90a:428b:b0:29b:46f0:6f8e with SMTP id
 p11-20020a17090a428b00b0029b46f06f8emr10256331pjg.8.1711397435926; Mon, 25
 Mar 2024 13:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAB3eKoAK26-HuqGE+ewedW9-o6izS754ybr_KdanQwERZebapA@mail.gmail.com>
 <CAB3eKoAXBR9MSf1od3mqBnaBV1+xD8BYegFkRQo31UDSx0JQZw@mail.gmail.com>
In-Reply-To: <CAB3eKoAXBR9MSf1od3mqBnaBV1+xD8BYegFkRQo31UDSx0JQZw@mail.gmail.com>
From: Brian Mayer <bleemayer@gmail.com>
Date: Mon, 25 Mar 2024 17:10:24 -0300
Message-ID: <CAB3eKoABoAsDrsdRZq8uCoxu3uExOMiAY9KsUBYGxoFD_nE-=Q@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711397436; x=1712002236; darn=buildroot.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VZLr4U0Xzn2ilPwXEpr7nX7ZHCwqLY5ctQVKf7MtQag=;
 b=Vn2v6qlSH2h5+RlziHKAJ9YIUO3T/YMR+oS6CZSmBMD/0b/TAY7ENPD0BW0u8nTUNH
 7kewCsIkf/PgFKiX1krWD2sSqQpIxB1h15TRdRxW4IbBoAx8mmStncEs3NdT3fEH7bHd
 +OIAhIyKo0loqEn6Rij1jqZrsuQr89LV9ueAMqMZ5Uubf7bg2LtYCcZODMKSW2gFYV0o
 4GVxePXssbh1KEkwez/m7UUV6uCprGc82vYd3wKbes9RL2LzyBxKwINrBU3kVqDEgW4+
 11/d6Gk6SumdvQNDocn/P2MmvpZR1dm1vnvLOVewxLlwYm1ePCJCNpJ5x4l3Q/eRr/wt
 gwZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vn2v6qlS
Subject: Re: [Buildroot] [PATCH] package/sbase: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

sbase is a collection of unix tools that are inherently portable across
UNIX and UNIX-like systems.

Signed-off-by: brian <git@myr.sh>
---
 package/Config.in        |  1 +
 package/sbase/Config.in  | 11 +++++++++++
 package/sbase/sbase.hash |  1 +
 package/sbase/sbase.mk   | 22 ++++++++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/sbase/Config.in
 create mode 100644 package/sbase/sbase.hash
 create mode 100644 package/sbase/sbase.mk

diff --git a/package/Config.in b/package/Config.in
index 1a62bfb1be..177b8a89ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2549,6 +2549,7 @@ endif
        source "package/s6-dns/Config.in"
        source "package/s6-networking/Config.in"
        source "package/samba4/Config.in"
+       source "package/sbase/Config.in"
        source "package/sconeserver/Config.in"
        source "package/ser2net/Config.in"
        source "package/shadowsocks-libev/Config.in"
diff --git a/package/sbase/Config.in b/package/sbase/Config.in
new file mode 100644
index 0000000000..b6ef049b11
--- /dev/null
+++ b/package/sbase/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_SBASE
+        bool "sbase"
+        help
+          sbase is a collection of unix tools that are inherently
portable across
+         UNIX and UNIX-like systems.
+
+         The complement of sbase is ubase[1] which is Linux-specific
and provides
+         all the non-portable tools. Together they are intended to form a base
+         system similar to busybox but much smaller and suckless.
+
+          https://git.suckless.org/sbase/
diff --git a/package/sbase/sbase.hash b/package/sbase/sbase.hash
new file mode 100644
index 0000000000..d13f3bd110
--- /dev/null
+++ b/package/sbase/sbase.hash
@@ -0,0 +1 @@
+sha256  af10b9995526b6367e6e11453f4762e4c67d2835ecba7257716b5024440e6f51
 sbase-13898fa7a91155a60c4c0bd61d4b7693a2ff3f09-br1.tar.gz
diff --git a/package/sbase/sbase.mk b/package/sbase/sbase.mk
new file mode 100644
index 0000000000..373ec4965b
--- /dev/null
+++ b/package/sbase/sbase.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# sbase
+#
+################################################################################
+
+SBASE_VERSION = 13898fa7a91155a60c4c0bd61d4b7693a2ff3f09
+SBASE_SITE = git://git.suckless.org/sbase
+SBASE_SITE_METHOD = git
+SBASE_LICENSE = MIT
+SBASE_LICENSE_FILES = LICENSE README
+SBASE_CPE_ID_VENDOR = sbase
+
+define SBASE_BUILD_CMDS
+       $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define SBASE_INSTALL_TARGET_CMDS
+       $(MAKE) PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
+endef
+
+$(eval $(generic-package))
--
2.44.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
