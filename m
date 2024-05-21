Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF96C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 10:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B63E581FD8;
	Tue, 21 May 2024 10:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9NMYAEIU53K; Tue, 21 May 2024 10:32:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10D7181FF2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10D7181FF2;
	Tue, 21 May 2024 10:32:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 962BB1C5114
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 10:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 902864092B
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 10:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x22u_QA_dw1g for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 10:32:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55;
 helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C1EE140572
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1EE140572
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1EE140572
 for <buildroot@buildroot.org>; Tue, 21 May 2024 10:32:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C6985CE0EB9;
 Tue, 21 May 2024 10:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F55C2BD11;
 Tue, 21 May 2024 10:32:06 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 13:31:52 +0300
Message-ID: <20240521103154.32660-2-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521103154.32660-1-jarkko@kernel.org>
References: <20240521103154.32660-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1716287527;
 bh=gTs5MCNzpYZAWdIgAeQ0ndx/eZACRUoy2LwRQbRGv/4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KtxEbGJpBg/6PuerJ1tAOQoCs4R+90NbWYGk137suJoiVy+GuH69zQK+780WdRqsw
 v09l3vg3G04lyUO+Zx5sMH9XATW33cp94g+QTetbALIE02yDX9w3OpaUovUSd18lgv
 4ifbv+d0XrjndlOoFLTahd083ihZlV2ajphW9Zq3fqKt+UTYMz9vUAZMblcJIeC661
 Kkp19w5m8E1v25Jy/nA7XLagX2GEcHdNZVGGCGITgKLKWJb06oHAueyhP8lIy0K4Oh
 EuQgGEV1d2DEEIlRFw83JpsrqsqccVp1FjvN2HtqlwJ0ZbxSTJHZ7is//4KYDhLFNZ
 GCSuB3IVPcpoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KtxEbGJp
Subject: [Buildroot] [PATCH v4 1/3] package/json-glib: add host build
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
v3:
- Remove host kconfig symbol.
- HOST_JSON_GLIB_CONF_OPTS = -Dintrospection=disabled
v2:
- Disable GOI and NLS for the host.
- Add the missing host config.
---
 package/json-glib/json-glib.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index cd53f24cee..cc9f8c9fa1 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -18,6 +18,11 @@ JSON_GLIB_DEPENDENCIES = \
 	host-pkgconf \
 	libglib2

+HOST_JSON_GLIB_DEPENDENCIES = \
+	host-pkgconf \
+	host-libglib2
+HOST_JSON_GLIB_CONF_OPTS = -Dintrospection=disabled
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 JSON_GLIB_CONF_OPTS += -Dintrospection=enabled
 JSON_GLIB_DEPENDENCIES += gobject-introspection
@@ -34,3 +39,4 @@ endif
 JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)

 $(eval $(meson-package))
+$(eval $(host-meson-package))
--
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
