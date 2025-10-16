Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D83CCD183
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 15:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 010B480651;
	Thu, 16 Oct 2025 15:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DS0mh1MMlP-N; Thu, 16 Oct 2025 15:27:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ACFD80644
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ACFD80644;
	Thu, 16 Oct 2025 15:27:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70B33968
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 15:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57A8640026
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 15:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5vn3sNvEQzK for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 15:27:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 078B140028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 078B140028
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 078B140028
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 15:27:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 13D071A1435
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 15:27:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DCE8E6062C;
 Thu, 16 Oct 2025 15:27:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F2294102F2317; 
 Thu, 16 Oct 2025 17:27:16 +0200 (CEST)
Date: Thu, 16 Oct 2025 17:27:02 +0200
MIME-Version: 1.0
Message-Id: <20251016-libldns_drill-v1-1-21bfa8c53896@bootlin.com>
References: <20251016-libldns_drill-v1-0-21bfa8c53896@bootlin.com>
In-Reply-To: <20251016-libldns_drill-v1-0-21bfa8c53896@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bernd Kuhls <bernd@kuhls.net>, nicolas.carrier@nav-timing.safrangroup.com, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760628437; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pAC0rkrtYVPClB1UbXr0l5bFI+8DcsIY7HxPwn61PqU=;
 b=Re8UxdEETIGKsBk3fhqnRPSvMKBiQY9RxmOm5A2/B5ZBAD8KiRC7h/6RhCrtIcFlBgBrmB
 nVx0lDyF/T0sauYjbbhGWvz/hiMK0y8uHjCCcn55fv0YWp2KNUAoKD9U52JuodVGfofsHD
 70B5gZw+OHpOS8AZa9ym3miFaFhYKpSEuXQHnxQRJlE/nUBYJw+hoVSaFYLqGa/tgmqQmK
 EZ1BRbbyatau5vEAKC653MUoq3dupqKSI2BNbF3RNCspVouw6QZyQIH6L5XOsP5fplUvR9
 otUayf20epuyOU/NM9umMJrzONh7YFCgK2owhWxMtzLRiO4TLxIrsgTRB+5oQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Re8UxdEE
Subject: [Buildroot] [PATCH RESEND 1/2] package/libldns: add an option to
 build and install drill
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The libldns library also comes with a CLI tool named drill, allowing to
perform DNS requests. Drill build is currently disabled by default.

Add a KConfig option to allow building and installing drill tool. Set
the default value to n to preserve the current behavior. Similarly to
linktest (see the comment in the .mk), drill fails to build correctly as
a static binary, so make the new option depend on non-static build.
---
 package/libldns/Config.in  | 14 ++++++++++++++
 package/libldns/libldns.mk |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/package/libldns/Config.in b/package/libldns/Config.in
index 696fec97b59857fbd99bdcaababa09d49774f3ae..7a169c495281be01b2ee724fd2f9e27b83f5e2ec 100644
--- a/package/libldns/Config.in
+++ b/package/libldns/Config.in
@@ -8,3 +8,17 @@ config BR2_PACKAGE_LIBLDNS
 	  experimental software for current Internet Drafts.
 
 	  http://www.nlnetlabs.nl/projects/ldns
+
+if BR2_PACKAGE_LIBLDNS
+
+config BR2_PACKAGE_LIBLDNS_DRILL
+	bool "drill binary"
+	default n
+	depends on !BR2_STATIC_LIBS
+	help
+	  Install the drill binary
+
+comment "drill needs dynamic library"
+	depends on BR2_STATIC_LIBS
+
+endif # BR2_PACKAGE_LIBLDNS
diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index 0740d09fab2fd15592c3d55cd2c1932664ca3344..6ced75a44fcf5bf9c95e443181362f99c9375eeb 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -45,4 +45,11 @@ endif
 # interested in the lib target anyway
 LIBLDNS_MAKE_OPTS = lib
 
+ifeq ($(BR2_PACKAGE_LIBLDNS_DRILL),y)
+LIBLDNS_CONF_OPTS += --with-drill
+LIBLDNS_MAKE_OPTS += drill
+else
+LIBLDNS_CONF_OPTS += --without-drill
+endif
+
 $(eval $(autotools-package))

-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
