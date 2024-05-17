Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC52C04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 17:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85510406DF;
	Fri, 17 May 2024 17:32:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2dJ1a-8knW5; Fri, 17 May 2024 17:32:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C49F4072A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C49F4072A;
	Fri, 17 May 2024 17:32:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B17BA1BF357
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 17:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D2BF81F2E
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 17:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7SvkhZ1Vjvsn for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 17:31:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55;
 helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A6D281F10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A6D281F10
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A6D281F10
 for <buildroot@buildroot.org>; Fri, 17 May 2024 17:31:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CE9B4CE1B20;
 Fri, 17 May 2024 17:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4718C2BD10;
 Fri, 17 May 2024 17:31:49 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 20:31:38 +0300
Message-ID: <20240517173140.24531-2-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240517173140.24531-1-jarkko@kernel.org>
References: <20240517173140.24531-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1715967110;
 bh=HUUzOuOeSRPaq1AcSpqFx3I2OWJWQhP3KeNZV1agciE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GGRUwlUsJq7K4nLueoNeOBPn81EdYtdsaWEJpkq5ggH0kfsAQhL9YAtSERQPRGJ5O
 wbhI96av8yKpve2U9jqV1O6VixtGDSuH+Z8hoihGFYD0eB0xBklCqoevBn4kih15gz
 1YkUgvLRkyjy8ZT8fY3TAhM9e9wRnfksmXPVHiVTd0cni3MKDTiwQu5h3fAlHNGeCv
 VsqCzdV5vKNew0bVu/B+efxFCaFz0RE9p5tW2RilyFjTZJ2u58XVujYdgpj8fdeGUN
 4/TcrcRI06of2/4QVK5KS2/zthZmL5nShAhVn9rLiJjtCoW7lox97AJ7PwqixcMu6k
 77KF4udwPQ6wg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GGRUwlUs
Subject: [Buildroot] [PATCH v2 1/3] package/json-glib: add host build
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
v2:
- Disable GOI and NLS for the host.
- Add the missing host config.
---
 package/json-glib/Config.in    | 9 +++++++++
 package/json-glib/json-glib.mk | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/package/json-glib/Config.in b/package/json-glib/Config.in
index 9df03d924a..ebf697bc64 100644
--- a/package/json-glib/Config.in
+++ b/package/json-glib/Config.in
@@ -11,6 +11,15 @@ config BR2_PACKAGE_JSON_GLIB

 	  https://live.gnome.org/JsonGlib/

+config BR2_HOST_PACKAGE_JSON_GLIB
+	bool "json-glib"
+	help
+	  JSON-GLib is a library providing serialization and
+	  deserialization support for the JavaScript Object Notation
+	  (JSON) format described by RFC 4627.
+
+	  https://live.gnome.org/JsonGlib/
+
 comment "json-glib needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index cd53f24cee..a6bc53b823 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -18,6 +18,10 @@ JSON_GLIB_DEPENDENCIES = \
 	host-pkgconf \
 	libglib2

+HOST_JSON_GLIB_DEPENDENCIES = \
+	host-pkgconf \
+	host-libglib2
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 JSON_GLIB_CONF_OPTS += -Dintrospection=enabled
 JSON_GLIB_DEPENDENCIES += gobject-introspection
@@ -34,3 +38,4 @@ endif
 JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)

 $(eval $(meson-package))
+$(eval $(host-meson-package))
--
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
