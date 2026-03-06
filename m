Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0771AFCC04D
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 17:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 946DD83BD8;
	Fri,  6 Mar 2026 17:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWE7jddVoecz; Fri,  6 Mar 2026 17:36:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABDAF83BED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772818580;
	bh=6YmEZvlsFjxrvO3N3e40SLEpBDePArxKpd2dmwCaNmk=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Piy58dXLmwCM2Er5c/xG4jGtroLje6K/DDRTE6bJ1AvktvKcNngDcKdqdcIFYkO6w
	 YTUHZ48T5Hob0BYM0KPzMwm830X+aQjWdiTaO/mcnd9sYdlNuA1gYINQlq5LEoJaS/
	 uUwnIQa+VC+4l0wf+h7xtOw7rI9ANnryH8YcbmwsC8baljlnqw4u/epE+A5qPn2/vT
	 XI7xjGzMmdYh3Sks67WVNTAXJXWyTDOW5zl6QF6YDpnyaGVUAnciVihjqzAaJUttoR
	 HQmZVhJT6pAs11gvOWb6SegKThlCgr4ATAxR8BLyydaH5hEmWTSpXPJZdFiUmRyYyG
	 +jwV8jeST/mpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABDAF83BED;
	Fri,  6 Mar 2026 17:36:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84A80223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 17:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68FEA41B95
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 17:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKRqy9La0fBD for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 17:36:18 +0000 (UTC)
X-Greylist: delayed 402 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 06 Mar 2026 17:36:17 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 79F0D41B89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79F0D41B89
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:4:17::8faa;
 helo=smtp-8faa.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::8faa])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79F0D41B89
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 17:36:17 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch
 [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fSD182DtczqD6;
 Fri,  6 Mar 2026 18:29:32 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4fSD175kqVz5kB; Fri,  6 Mar 2026 18:29:31 +0100 (CET)
Date: Fri, 06 Mar 2026 18:29:17 +0100
MIME-Version: 1.0
Message-Id: <20260306-libwebsockets-zlib-opt-v2-1-d8e99f01d2cd@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQ6CMBCFr0Jm7Zh2aA268h6GBT+DnWgoaRsUC
 Xe3cgHzVt9L3vdWiByEI1yKFQLPEsWPGehQQOea8c4ofWYgRVYRGXxK++I2+u7BKeInI/opoS3
 JGjNUSrOCPJ4CD/Lexbc6s5OYfFj2n1n/2r/KWWPOyehzwyVX1F47xyEsx56h3rbtC6H7tum8A
 AAA
X-Change-ID: 20250224-libwebsockets-zlib-opt-532544f801e0
To: buildroot@buildroot.org
Cc: Danomi Manchego <danomimanchego123@gmail.com>, 
 Gregory Dymarek <gregd72002@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1772818172;
 bh=/x5YqEecOmRL/3rVZvVhdXO/cWFsgC13T3U0mbImyEQ=;
 h=From:Date:Subject:To:Cc:From;
 b=DsF0lb6ud2ndQNXj2gB9Y1XR5klAtGjwd9XCK5hxTo9/62haShZk1w2FF6vVkEtpo
 2zC/1Irpu0vp3eF1nNojiVkSl0Un7K81nLz9jlJrn4dkLUpobwRljASuIbKpCR+ZIN
 YCerKzo4gWa6uNT5xktskXsm5K5m2VNZYO8VhAGSLj2AhHLsraOe1oGcvshq0m0uyu
 1cdunjlSd4yCWsiXOdxqJqoksANr3n1Q0FDhB7WYzeBD5chNNAyif2+SMJx+6mXVyE
 WV0KeHjgL2C+oNq76P+tnJCYZfudot+KKns7tV84zYFjAcj3CBqkX2rRhUWlFSmWai
 XntZ9WjbuQNlA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256
 header.s=20231125 header.b=DsF0lb6u
Subject: [Buildroot] [PATCH v2] package/libwebsockets: make websocket
 extension support optional
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <foss+buildroot@0leil.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

zlib is a dependency of websocket extensions and HTTP stream compression
features. The latter is disabled by default in CMake in the project. The
same can be said of the former but Buildroot currently enables it
unconditionally, making the zlib dependency a requirement.

Websocket extension support may not be desired, in order to reduce the
attack surface and also the total size of the library. While it requires
the server to declare the extensions it supports to the client, it also
exposes yet another interface over the network with access (if enabled)
to zlib for compressing/uncompressing messages (the typical websocket
extension; with all the security implications of
compressing/uncompressing random payloads). If support for websocket
extensions isn't built, there's no potential vulnerability there to take
advantage of. The impact on the size of libwebsockets library is a
reduction of around 17KiB (~4%) in addition to removing the zlib
dependency (around 92KiB for libz shared library alone).

This adds a new Kconfig knob to disable websocket extension support but
have it enabled by default, for backward-compatibility purposes as it
was enabled by default before this commit.

See https://datatracker.ietf.org/doc/html/rfc6455#section-9 and
https://datatracker.ietf.org/doc/html/rfc7692.html for the websocket
extensions RFCs.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
This was only build tested on master. Runtime tested on 2025.02.
---
Changes in v2:
- Removed RFC,
- Reimplemented by simply adding an enabled-by-default knob to disable
  websocket extension support as suggested by Arnout,
- Reworded help text and commit log with new findings (library size
  reduction, size of libz that isn't brought in anymore),
- Link to v1: https://lore.kernel.org/r/20250224-libwebsockets-zlib-opt-v1-1-16419ae3e82b@cherry.de
---
 package/libwebsockets/Config.in        | 25 ++++++++++++++++++++++++-
 package/libwebsockets/libwebsockets.mk | 13 ++++++++++---
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
index 6116cfecb5..a663e6fdde 100644
--- a/package/libwebsockets/Config.in
+++ b/package/libwebsockets/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBWEBSOCKETS
 	bool "libwebsockets"
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_ZLIB
 	help
 	  Libwebsockets is a lightweight pure C library built to use
 	  minimal CPU and memory resources, and provide fast throughput
@@ -25,6 +24,30 @@ config BR2_PACKAGE_LIBWEBSOCKETS_ASYNC_DNS
 	  Enable asynchronous DNS resolver that directly queries
 	  the configured nameserver over UDP, from the event loop.
 
+config BR2_PACKAGE_LIBWEBSOCKETS_EXTENSIONS
+	bool "enable extension support"
+	default y  # legacy, was previously always enabled in Buildroot
+	select BR2_PACKAGE_ZLIB
+	help
+	  Enable websocket extension support.
+
+	  This slightly reduces the library size (~17KiB) and removes
+	  the zlib dependency (~92KiB for libz shared library).
+
+	  Aside from size reduction, it may be disabled to avoid
+	  exposing yet another interface over the network, especially
+	  since this may allow compressing messages (with all the
+	  security implications of compressing/uncompressing random
+	  payloads).
+
+	  See
+	  https://datatracker.ietf.org/doc/html/rfc6455#section-9 and
+	  https://datatracker.ietf.org/doc/html/rfc7692.html
+
+	  This used to be enabled by default without a Kconfig toggle,
+	  so for backward-compatibility purposes this is kept enabled by
+	  default.
+
 endif
 
 comment "libwebsockets needs a toolchain w/ dynamic library"
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 2d3395c5dd..7ec4f98d29 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -8,14 +8,12 @@ LIBWEBSOCKETS_VERSION = 4.4.1
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = MIT with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
-LIBWEBSOCKETS_DEPENDENCIES = zlib
 LIBWEBSOCKETS_INSTALL_STAGING = YES
 LIBWEBSOCKETS_CONF_OPTS = \
 	-DDISABLE_WERROR=ON \
 	-DLWS_WITHOUT_TESTAPPS=ON \
 	-DLWS_IPV6=ON \
-	-DLWS_UNIX_SOCK=ON \
-	-DLWS_WITHOUT_EXTENSIONS=OFF
+	-DLWS_UNIX_SOCK=ON
 
 # If LWS_MAX_SMP=1, then there is no code related to pthreads compiled
 # in the library. If unset, LWS_MAX_SMP defaults to 1.
@@ -29,6 +27,15 @@ LIBWEBSOCKETS_CONF_OPTS += \
 	-DLWS_WITH_SYS_SMD=ON
 endif
 
+ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS_EXTENSIONS),y)
+LIBWEBSOCKETS_DEPENDENCIES += zlib
+LIBWEBSOCKETS_CONF_OPTS += \
+	-DLWS_WITHOUT_EXTENSIONS=OFF
+else
+LIBWEBSOCKETS_CONF_OPTS += \
+	-DLWS_WITHOUT_EXTENSIONS=ON
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBWEBSOCKETS_DEPENDENCIES += openssl host-openssl
 LIBWEBSOCKETS_CONF_OPTS += \

---
base-commit: ea5d82f1f69dd856afc08cdc940249019cc6447a
change-id: 20250224-libwebsockets-zlib-opt-532544f801e0

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
