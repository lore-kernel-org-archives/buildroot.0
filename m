Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7EBCD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 14:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1FBD608A5;
	Sun,  7 Apr 2024 14:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ziNXF72vOJOU; Sun,  7 Apr 2024 14:43:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0094760A52
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0094760A52;
	Sun,  7 Apr 2024 14:43:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22BDF1BF30F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04F7881E54
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_DuBPXfNryG for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 14:43:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 73B8281E47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73B8281E47
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73B8281E47
 for <buildroot@busybox.net>; Sun,  7 Apr 2024 14:43:21 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a44ad785a44so423554666b.3
 for <buildroot@busybox.net>; Sun, 07 Apr 2024 07:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712500999; x=1713105799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1cSeeVD61t05vGMa6z+8fZg1rt8ZLTz1TWehFvQasWc=;
 b=odEpTE/nSKwikMRklVh0w6UleU6Ee65EiJ5+EJKS0PigKi/zO2/mxj3hHHD+A0NMk2
 dtSvIDh+ujhQRwm4w83WFpg4xltMHUG9vWkUKDFrpU3ykiw3Azz/RfkBvZ+Vk8qekTcL
 7IgZPDepIhT21xgvPW/froTDO5zzgPX3oYMqwtblPvmP+HRzOpvQ7SIemWqWwqiw4oDh
 VsyLSsTud96y7Cc7dBdoauIETeIic9actBqq474jtRFZVcB46E/FHiTtqsk8HWoKMQdL
 jMUpbRHI/L8Q7fQfIyRDPu8VgHragZIz/CCq4GzjaeAYVRSYjgHlXTaYMRFMF4lXDuva
 wprg==
X-Gm-Message-State: AOJu0Yzc/PB91Wwep+ZUTX9Tx6NgH22mn0XdIiFygoeDZi7uP2L5MLdv
 0zvU/mPSldTl8cT41xRzTwNXh/0nojg9zc7vrl4T8jivrSffWdvx6CwHIwPxWSqrEazymd13fdw
 =
X-Google-Smtp-Source: AGHT+IFY7oyQqNYx5zyb1qb/iyInpAhGphLOAbYIpSUUg8QGFlFiwqYp06Ox93hTq0a9a7I+/EARqw==
X-Received: by 2002:a17:906:4550:b0:a51:c52d:e530 with SMTP id
 s16-20020a170906455000b00a51c52de530mr1624302ejq.34.1712500998895; 
 Sun, 07 Apr 2024 07:43:18 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 bv4-20020a170907934400b00a51ce4710c5sm785136ejc.19.2024.04.07.07.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 07:43:17 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  7 Apr 2024 16:42:50 +0200
Message-Id: <20240407144250.7558-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240407144250.7558-1-francois.perrad@gadz.org>
References: <20240407144250.7558-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712500999; x=1713105799; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1cSeeVD61t05vGMa6z+8fZg1rt8ZLTz1TWehFvQasWc=;
 b=aL8KPQnWxfS/ww69ypIl9xVd6cS2fgmzcfpptE0jWUjHIAUdJkHsSTUju+hYCLd7Hc
 8E9H031nC3KRs5l9yT8uVC6ZK2injebsly/lMJCVd1NITRhpqKZxNVxJrTYdcjzAUeg8
 XOoM3cogd11Vjm31et6qEWymbIx59278n8pFnQOIf+jw8WOQRGOjRVHSCGKWIMTxDmr7
 UJ6pvIb7hZTJv0M6OuZQisHqvTaEjTGPRvKoJ8/uwLMl46J24ZvZ3eVH0my4jahu/OjS
 +u/s0ISfxONBu8nMqe12wxdc2JnoCxCAZqg/Hwv/vcP9Tgmtpp+zaSkjbMfjYItvJGpw
 LvcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=aL8KPQnW
Subject: [Buildroot] [RFC PATCH 2/2] package/perl-*: regenerate with PURL
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
Cc: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-apache-logformat-compiler.mk                            | 1 +
 package/perl-appconfig/perl-appconfig.mk                         | 1 +
 package/perl-astro-suntime/perl-astro-suntime.mk                 | 1 +
 package/perl-class-inspector/perl-class-inspector.mk             | 1 +
 package/perl-class-load/perl-class-load.mk                       | 1 +
 .../perl-class-method-modifiers/perl-class-method-modifiers.mk   | 1 +
 package/perl-class-std-fast/perl-class-std-fast.mk               | 1 +
 package/perl-class-std/perl-class-std.mk                         | 1 +
 package/perl-clone/perl-clone.mk                                 | 1 +
 package/perl-convert-asn1/perl-convert-asn1.mk                   | 1 +
 package/perl-cookie-baker/perl-cookie-baker.mk                   | 1 +
 package/perl-crypt-blowfish/perl-crypt-blowfish.mk               | 1 +
 package/perl-crypt-cbc/perl-crypt-cbc.mk                         | 1 +
 package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.mk         | 1 +
 package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk     | 1 +
 package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk   | 1 +
 package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk         | 1 +
 package/perl-data-dump/perl-data-dump.mk                         | 1 +
 package/perl-data-optlist/perl-data-optlist.mk                   | 1 +
 package/perl-data-uuid/perl-data-uuid.mk                         | 1 +
 package/perl-date-manip/perl-date-manip.mk                       | 1 +
 package/perl-datetime-tiny/perl-datetime-tiny.mk                 | 1 +
 package/perl-dbd-mysql/perl-dbd-mysql.mk                         | 1 +
 package/perl-dbi/perl-dbi.mk                                     | 1 +
 package/perl-devel-cycle/perl-devel-cycle.mk                     | 1 +
 .../perl-devel-globaldestruction/perl-devel-globaldestruction.mk | 1 +
 package/perl-devel-size/perl-devel-size.mk                       | 1 +
 .../perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.mk | 1 +
 package/perl-devel-stacktrace/perl-devel-stacktrace.mk           | 1 +
 package/perl-device-serialport/perl-device-serialport.mk         | 1 +
 package/perl-digest-hmac/perl-digest-hmac.mk                     | 1 +
 package/perl-digest-sha1/perl-digest-sha1.mk                     | 1 +
 package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk     | 1 +
 package/perl-encode-detect/perl-encode-detect.mk                 | 1 +
 package/perl-encode-locale/perl-encode-locale.mk                 | 1 +
 package/perl-exporter-tiny/perl-exporter-tiny.mk                 | 1 +
 package/perl-extutils-config/perl-extutils-config.mk             | 1 +
 package/perl-extutils-helpers/perl-extutils-helpers.mk           | 1 +
 package/perl-extutils-installpaths/perl-extutils-installpaths.mk | 1 +
 package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.mk       | 1 +
 package/perl-file-listing/perl-file-listing.mk                   | 1 +
 package/perl-file-sharedir-install/perl-file-sharedir-install.mk | 1 +
 package/perl-file-sharedir/perl-file-sharedir.mk                 | 1 +
 package/perl-file-slurp/perl-file-slurp.mk                       | 1 +
 package/perl-file-util/perl-file-util.mk                         | 1 +
 package/perl-filesys-notify-simple/perl-filesys-notify-simple.mk | 1 +
 package/perl-gd/perl-gd.mk                                       | 1 +
 package/perl-gdgraph/perl-gdgraph.mk                             | 1 +
 package/perl-gdtextutil/perl-gdtextutil.mk                       | 1 +
 package/perl-hash-multivalue/perl-hash-multivalue.mk             | 1 +
 package/perl-html-parser/perl-html-parser.mk                     | 1 +
 package/perl-html-tagset/perl-html-tagset.mk                     | 1 +
 package/perl-http-cookies/perl-http-cookies.mk                   | 1 +
 package/perl-http-daemon/perl-http-daemon.mk                     | 1 +
 package/perl-http-date/perl-http-date.mk                         | 1 +
 package/perl-http-entity-parser/perl-http-entity-parser.mk       | 1 +
 package/perl-http-headers-fast/perl-http-headers-fast.mk         | 1 +
 package/perl-http-message/perl-http-message.mk                   | 1 +
 package/perl-http-multipartparser/perl-http-multipartparser.mk   | 1 +
 package/perl-http-negotiate/perl-http-negotiate.mk               | 1 +
 package/perl-i18n/perl-i18n.mk                                   | 1 +
 package/perl-image-exiftool/perl-image-exiftool.mk               | 1 +
 package/perl-io-html/perl-io-html.mk                             | 1 +
 package/perl-io-interface/perl-io-interface.mk                   | 1 +
 package/perl-io-socket-multicast/perl-io-socket-multicast.mk     | 1 +
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk                 | 1 +
 package/perl-json-maybexs/perl-json-maybexs.mk                   | 1 +
 package/perl-json-tiny/perl-json-tiny.mk                         | 1 +
 package/perl-libwww-perl/perl-libwww-perl.mk                     | 1 +
 .../perl-locale-maketext-lexicon/perl-locale-maketext-lexicon.mk | 1 +
 package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk               | 1 +
 package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk       | 1 +
 package/perl-mail-dkim/perl-mail-dkim.mk                         | 1 +
 package/perl-mailtools/perl-mailtools.mk                         | 1 +
 package/perl-math-int64/perl-math-int64.mk                       | 1 +
 package/perl-math-prime-util/perl-math-prime-util.mk             | 1 +
 package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk     | 1 +
 package/perl-mime-tools/perl-mime-tools.mk                       | 1 +
 package/perl-module-build-tiny/perl-module-build-tiny.mk         | 1 +
 package/perl-module-build/perl-module-build.mk                   | 1 +
 package/perl-module-implementation/perl-module-implementation.mk | 1 +
 package/perl-module-runtime/perl-module-runtime.mk               | 1 +
 .../perl-mojolicious-plugin-authentication.mk                    | 1 +
 .../perl-mojolicious-plugin-authorization.mk                     | 1 +
 .../perl-mojolicious-plugin-cspheader.mk                         | 1 +
 .../perl-mojolicious-plugin-i18n/perl-mojolicious-plugin-i18n.mk | 1 +
 .../perl-mojolicious-plugin-securityheader.mk                    | 1 +
 package/perl-mojolicious/perl-mojolicious.mk                     | 1 +
 package/perl-moo/perl-moo.mk                                     | 1 +
 package/perl-mozilla-ca/perl-mozilla-ca.mk                       | 1 +
 package/perl-net-dns/perl-net-dns.mk                             | 1 +
 package/perl-net-http/perl-net-http.mk                           | 1 +
 package/perl-net-snmp/perl-net-snmp.mk                           | 1 +
 package/perl-net-ssh2/perl-net-ssh2.mk                           | 1 +
 package/perl-net-ssleay/perl-net-ssleay.mk                       | 1 +
 package/perl-net-telnet/perl-net-telnet.mk                       | 1 +
 package/perl-netaddr-ip/perl-netaddr-ip.mk                       | 1 +
 package/perl-number-bytes-human/perl-number-bytes-human.mk       | 1 +
 package/perl-package-stash/perl-package-stash.mk                 | 1 +
 package/perl-params-util/perl-params-util.mk                     | 1 +
 package/perl-parse-yapp/perl-parse-yapp.mk                       | 1 +
 package/perl-path-tiny/perl-path-tiny.mk                         | 1 +
 package/perl-plack/perl-plack.mk                                 | 1 +
 .../perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk | 1 +
 package/perl-role-tiny/perl-role-tiny.mk                         | 1 +
 package/perl-stream-buffered/perl-stream-buffered.mk             | 1 +
 .../perl-sub-exporter-progressive.mk                             | 1 +
 package/perl-sub-install/perl-sub-install.mk                     | 1 +
 package/perl-sub-quote/perl-sub-quote.mk                         | 1 +
 package/perl-sys-meminfo/perl-sys-meminfo.mk                     | 1 +
 package/perl-sys-mmap/perl-sys-mmap.mk                           | 1 +
 package/perl-time-parsedate/perl-time-parsedate.mk               | 1 +
 package/perl-timedate/perl-timedate.mk                           | 1 +
 package/perl-try-tiny/perl-try-tiny.mk                           | 1 +
 package/perl-type-tiny/perl-type-tiny.mk                         | 1 +
 package/perl-uri/perl-uri.mk                                     | 1 +
 package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk     | 1 +
 package/perl-www-robotrules/perl-www-robotrules.mk               | 1 +
 package/perl-x10/perl-x10.mk                                     | 1 +
 package/perl-xml-libxml/perl-xml-libxml.mk                       | 1 +
 package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk   | 1 +
 package/perl-xml-sax-base/perl-xml-sax-base.mk                   | 1 +
 package/perl-xml-sax/perl-xml-sax.mk                             | 1 +
 123 files changed, 123 insertions(+)

diff --git a/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk b/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk
index 82ceb7979..4e919bb3e 100644
--- a/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk
+++ b/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk
@@ -7,6 +7,7 @@
 PERL_APACHE_LOGFORMAT_COMPILER_VERSION = 0.36
 PERL_APACHE_LOGFORMAT_COMPILER_SOURCE = Apache-LogFormat-Compiler-$(PERL_APACHE_LOGFORMAT_COMPILER_VERSION).tar.gz
 PERL_APACHE_LOGFORMAT_COMPILER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
+PERL_APACHE_LOGFORMAT_COMPILER_PURL = pkg:cpan/KAZEBURO/Apache-LogFormat-Compiler@$(PERL_APACHE_LOGFORMAT_COMPILER_VERSION)
 PERL_APACHE_LOGFORMAT_COMPILER_DEPENDENCIES = host-perl-module-build-tiny
 PERL_APACHE_LOGFORMAT_COMPILER_LICENSE = Artistic or GPL-1.0+
 PERL_APACHE_LOGFORMAT_COMPILER_LICENSE_FILES = LICENSE
diff --git a/package/perl-appconfig/perl-appconfig.mk b/package/perl-appconfig/perl-appconfig.mk
index 8f9dd5202..45abdb427 100644
--- a/package/perl-appconfig/perl-appconfig.mk
+++ b/package/perl-appconfig/perl-appconfig.mk
@@ -7,6 +7,7 @@
 PERL_APPCONFIG_VERSION = 1.71
 PERL_APPCONFIG_SOURCE = AppConfig-$(PERL_APPCONFIG_VERSION).tar.gz
 PERL_APPCONFIG_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NE/NEILB
+PERL_APPCONFIG_PURL = pkg:cpan/NEILB/AppConfig@$(PERL_APPCONFIG_VERSION)
 PERL_APPCONFIG_LICENSE = Artistic or GPL-1.0+
 PERL_APPCONFIG_LICENSE_FILES = LICENSE
 PERL_APPCONFIG_DISTNAME = AppConfig
diff --git a/package/perl-astro-suntime/perl-astro-suntime.mk b/package/perl-astro-suntime/perl-astro-suntime.mk
index e5cad6a40..045787531 100644
--- a/package/perl-astro-suntime/perl-astro-suntime.mk
+++ b/package/perl-astro-suntime/perl-astro-suntime.mk
@@ -7,6 +7,7 @@
 PERL_ASTRO_SUNTIME_VERSION = 0.06
 PERL_ASTRO_SUNTIME_SOURCE = Astro-SunTime-$(PERL_ASTRO_SUNTIME_VERSION).tar.gz
 PERL_ASTRO_SUNTIME_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RO/ROBF
+PERL_ASTRO_SUNTIME_PURL = pkg:cpan/ROBF/Astro-SunTime@$(PERL_ASTRO_SUNTIME_VERSION)
 PERL_ASTRO_SUNTIME_DEPENDENCIES = host-perl-module-build
 PERL_ASTRO_SUNTIME_LICENSE = GPL-3.0
 PERL_ASTRO_SUNTIME_LICENSE_FILES = LICENSE
diff --git a/package/perl-class-inspector/perl-class-inspector.mk b/package/perl-class-inspector/perl-class-inspector.mk
index fdb332366..c85818fea 100644
--- a/package/perl-class-inspector/perl-class-inspector.mk
+++ b/package/perl-class-inspector/perl-class-inspector.mk
@@ -7,6 +7,7 @@
 PERL_CLASS_INSPECTOR_VERSION = 1.36
 PERL_CLASS_INSPECTOR_SOURCE = Class-Inspector-$(PERL_CLASS_INSPECTOR_VERSION).tar.gz
 PERL_CLASS_INSPECTOR_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PL/PLICEASE
+PERL_CLASS_INSPECTOR_PURL = pkg:cpan/PLICEASE/Class-Inspector@$(PERL_CLASS_INSPECTOR_VERSION)
 PERL_CLASS_INSPECTOR_LICENSE = Artistic or GPL-1.0+
 PERL_CLASS_INSPECTOR_LICENSE_FILES = LICENSE
 PERL_CLASS_INSPECTOR_DISTNAME = Class-Inspector
diff --git a/package/perl-class-load/perl-class-load.mk b/package/perl-class-load/perl-class-load.mk
index c18e53d19..27b0d43bf 100644
--- a/package/perl-class-load/perl-class-load.mk
+++ b/package/perl-class-load/perl-class-load.mk
@@ -7,6 +7,7 @@
 PERL_CLASS_LOAD_VERSION = 0.25
 PERL_CLASS_LOAD_SOURCE = Class-Load-$(PERL_CLASS_LOAD_VERSION).tar.gz
 PERL_CLASS_LOAD_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
+PERL_CLASS_LOAD_PURL = pkg:cpan/ETHER/Class-Load@$(PERL_CLASS_LOAD_VERSION)
 PERL_CLASS_LOAD_LICENSE = Artistic or GPL-1.0+
 PERL_CLASS_LOAD_LICENSE_FILES = LICENSE
 PERL_CLASS_LOAD_DISTNAME = Class-Load
diff --git a/package/perl-class-method-modifiers/perl-class-method-modifiers.mk b/package/perl-class-method-modifiers/perl-class-method-modifiers.mk
index d4a7f11b8..d0f0b535e 100644
--- a/package/perl-class-method-modifiers/perl-class-method-modifiers.mk
+++ b/package/perl-class-method-modifiers/perl-class-method-modifiers.mk
@@ -7,6 +7,7 @@
 PERL_CLASS_METHOD_MODIFIERS_VERSION = 2.15
 PERL_CLASS_METHOD_MODIFIERS_SOURCE = Class-Method-Modifiers-$(PERL_CLASS_METHOD_MODIFIERS_VERSION).tar.gz
 PERL_CLASS_METHOD_MODIFIERS_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
+PERL_CLASS_METHOD_MODIFIERS_PURL = pkg:cpan/ETHER/Class-Method-Modifiers@$(PERL_CLASS_METHOD_MODIFIERS_VERSION)
 PERL_CLASS_METHOD_MODIFIERS_LICENSE = Artistic or GPL-1.0+
 PERL_CLASS_METHOD_MODIFIERS_LICENSE_FILES = LICENSE
 PERL_CLASS_METHOD_MODIFIERS_DISTNAME = Class-Method-Modifiers
diff --git a/package/perl-class-std-fast/perl-class-std-fast.mk b/package/perl-class-std-fast/perl-class-std-fast.mk
index b5d32398a..b848038e2 100644
--- a/package/perl-class-std-fast/perl-class-std-fast.mk
+++ b/package/perl-class-std-fast/perl-class-std-fast.mk
@@ -7,6 +7,7 @@
 PERL_CLASS_STD_FAST_VERSION = 0.0.8
 PERL_CLASS_STD_FAST_SOURCE = Class-Std-Fast-v$(PERL_CLASS_STD_FAST_VERSION).tar.gz
 PERL_CLASS_STD_FAST_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AC/ACID
+PERL_CLASS_STD_FAST_PURL = pkg:cpan/ACID/Class-Std-Fast@$(PERL_CLASS_STD_FAST_VERSION)
 PERL_CLASS_STD_FAST_DEPENDENCIES = host-perl-module-build
 PERL_CLASS_STD_FAST_LICENSE = Artistic or GPL-1.0+
 PERL_CLASS_STD_FAST_LICENSE_FILES = README
diff --git a/package/perl-class-std/perl-class-std.mk b/package/perl-class-std/perl-class-std.mk
index 493a89f26..138d4b1c4 100644
--- a/package/perl-class-std/perl-class-std.mk
+++ b/package/perl-class-std/perl-class-std.mk
@@ -7,6 +7,7 @@
 PERL_CLASS_STD_VERSION = 0.013
 PERL_CLASS_STD_SOURCE = Class-Std-$(PERL_CLASS_STD_VERSION).tar.gz
 PERL_CLASS_STD_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CH/CHORNY
+PERL_CLASS_STD_PURL = pkg:cpan/CHORNY/Class-Std@$(PERL_CLASS_STD_VERSION)
 PERL_CLASS_STD_DEPENDENCIES = host-perl-module-build
 PERL_CLASS_STD_LICENSE = Artistic or GPL-1.0+
 PERL_CLASS_STD_LICENSE_FILES = README
diff --git a/package/perl-clone/perl-clone.mk b/package/perl-clone/perl-clone.mk
index 9e04329ea..16914f970 100644
--- a/package/perl-clone/perl-clone.mk
+++ b/package/perl-clone/perl-clone.mk
@@ -7,6 +7,7 @@
 PERL_CLONE_VERSION = 0.46
 PERL_CLONE_SOURCE = Clone-$(PERL_CLONE_VERSION).tar.gz
 PERL_CLONE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GARU
+PERL_CLONE_PURL = pkg:cpan/GARU/Clone@$(PERL_CLONE_VERSION)
 PERL_CLONE_LICENSE = Artistic or GPL-1.0+
 PERL_CLONE_LICENSE_FILES = README.md
 PERL_CLONE_DISTNAME = Clone
diff --git a/package/perl-convert-asn1/perl-convert-asn1.mk b/package/perl-convert-asn1/perl-convert-asn1.mk
index 07f9b1d1b..e417a22e5 100644
--- a/package/perl-convert-asn1/perl-convert-asn1.mk
+++ b/package/perl-convert-asn1/perl-convert-asn1.mk
@@ -7,6 +7,7 @@
 PERL_CONVERT_ASN1_VERSION = 0.34
 PERL_CONVERT_ASN1_SOURCE = Convert-ASN1-$(PERL_CONVERT_ASN1_VERSION).tar.gz
 PERL_CONVERT_ASN1_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TI/TIMLEGGE
+PERL_CONVERT_ASN1_PURL = pkg:cpan/TIMLEGGE/Convert-ASN1@$(PERL_CONVERT_ASN1_VERSION)
 PERL_CONVERT_ASN1_LICENSE = Artistic-1.0-Perl or GPL-1.0+
 PERL_CONVERT_ASN1_LICENSE_FILES = LICENSE
 PERL_CONVERT_ASN1_DISTNAME = Convert-ASN1
diff --git a/package/perl-cookie-baker/perl-cookie-baker.mk b/package/perl-cookie-baker/perl-cookie-baker.mk
index add5fcd0e..3a2d4b5cb 100644
--- a/package/perl-cookie-baker/perl-cookie-baker.mk
+++ b/package/perl-cookie-baker/perl-cookie-baker.mk
@@ -7,6 +7,7 @@
 PERL_COOKIE_BAKER_VERSION = 0.12
 PERL_COOKIE_BAKER_SOURCE = Cookie-Baker-$(PERL_COOKIE_BAKER_VERSION).tar.gz
 PERL_COOKIE_BAKER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
+PERL_COOKIE_BAKER_PURL = pkg:cpan/KAZEBURO/Cookie-Baker@$(PERL_COOKIE_BAKER_VERSION)
 PERL_COOKIE_BAKER_DEPENDENCIES = host-perl-module-build-tiny
 PERL_COOKIE_BAKER_LICENSE = Artistic or GPL-1.0+
 PERL_COOKIE_BAKER_LICENSE_FILES = LICENSE
diff --git a/package/perl-crypt-blowfish/perl-crypt-blowfish.mk b/package/perl-crypt-blowfish/perl-crypt-blowfish.mk
index a8f274b60..fef509115 100644
--- a/package/perl-crypt-blowfish/perl-crypt-blowfish.mk
+++ b/package/perl-crypt-blowfish/perl-crypt-blowfish.mk
@@ -7,6 +7,7 @@
 PERL_CRYPT_BLOWFISH_VERSION = 2.14
 PERL_CRYPT_BLOWFISH_SOURCE = Crypt-Blowfish-$(PERL_CRYPT_BLOWFISH_VERSION).tar.gz
 PERL_CRYPT_BLOWFISH_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DP/DPARIS
+PERL_CRYPT_BLOWFISH_PURL = pkg:cpan/DPARIS/Crypt-Blowfish@$(PERL_CRYPT_BLOWFISH_VERSION)
 PERL_CRYPT_BLOWFISH_LICENSE = BSD-4-Clause-like
 PERL_CRYPT_BLOWFISH_LICENSE_FILES = COPYRIGHT
 PERL_CRYPT_BLOWFISH_DISTNAME = Crypt-Blowfish
diff --git a/package/perl-crypt-cbc/perl-crypt-cbc.mk b/package/perl-crypt-cbc/perl-crypt-cbc.mk
index c00ec37ee..9940306cf 100644
--- a/package/perl-crypt-cbc/perl-crypt-cbc.mk
+++ b/package/perl-crypt-cbc/perl-crypt-cbc.mk
@@ -7,6 +7,7 @@
 PERL_CRYPT_CBC_VERSION = 2.33
 PERL_CRYPT_CBC_SOURCE = Crypt-CBC-$(PERL_CRYPT_CBC_VERSION).tar.gz
 PERL_CRYPT_CBC_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LD/LDS
+PERL_CRYPT_CBC_PURL = pkg:cpan/LDS/Crypt-CBC@$(PERL_CRYPT_CBC_VERSION)
 PERL_CRYPT_CBC_LICENSE = Artistic
 PERL_CRYPT_CBC_LICENSE_FILES = CBC.pm
 PERL_CRYPT_CBC_DISTNAME = Crypt-CBC
diff --git a/package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.mk b/package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.mk
index c05f3a9c3..453ed5d09 100644
--- a/package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.mk
+++ b/package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.mk
@@ -7,6 +7,7 @@
 PERL_CRYPT_OPENSSL_AES_VERSION = 0.02
 PERL_CRYPT_OPENSSL_AES_SOURCE = Crypt-OpenSSL-AES-$(PERL_CRYPT_OPENSSL_AES_VERSION).tar.gz
 PERL_CRYPT_OPENSSL_AES_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TT/TTAR
+PERL_CRYPT_OPENSSL_AES_PURL = pkg:cpan/TIMLEGGE/Crypt-OpenSSL-AES@$(PERL_CRYPT_OPENSSL_AES_VERSION)
 PERL_CRYPT_OPENSSL_AES_LICENSE = Artistic or GPL-1.0+
 PERL_CRYPT_OPENSSL_AES_LICENSE_FILES = README
 PERL_CRYPT_OPENSSL_AES_DISTNAME = Crypt-OpenSSL-AES
diff --git a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
index 56ff79d84..2cd2e29ad 100644
--- a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
+++ b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
@@ -7,6 +7,7 @@
 PERL_CRYPT_OPENSSL_GUESS_VERSION = 0.15
 PERL_CRYPT_OPENSSL_GUESS_SOURCE = Crypt-OpenSSL-Guess-$(PERL_CRYPT_OPENSSL_GUESS_VERSION).tar.gz
 PERL_CRYPT_OPENSSL_GUESS_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AK/AKIYM
+PERL_CRYPT_OPENSSL_GUESS_PURL = pkg:cpan/AKIYM/Crypt-OpenSSL-Guess@$(PERL_CRYPT_OPENSSL_GUESS_VERSION)
 PERL_CRYPT_OPENSSL_GUESS_LICENSE = Artistic or GPL-1.0+
 PERL_CRYPT_OPENSSL_GUESS_LICENSE_FILES = LICENSE
 PERL_CRYPT_OPENSSL_GUESS_DISTNAME = Crypt-OpenSSL-Guess
diff --git a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
index e70eb7e92..e04111f28 100644
--- a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
+++ b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
@@ -7,6 +7,7 @@
 PERL_CRYPT_OPENSSL_RANDOM_VERSION = 0.15
 PERL_CRYPT_OPENSSL_RANDOM_SOURCE = Crypt-OpenSSL-Random-$(PERL_CRYPT_OPENSSL_RANDOM_VERSION).tar.gz
 PERL_CRYPT_OPENSSL_RANDOM_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
+PERL_CRYPT_OPENSSL_RANDOM_PURL = pkg:cpan/RURBAN/Crypt-OpenSSL-Random@$(PERL_CRYPT_OPENSSL_RANDOM_VERSION)
 PERL_CRYPT_OPENSSL_RANDOM_DEPENDENCIES = \
 	host-perl-crypt-openssl-guess \
 	openssl
diff --git a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
index e1bfd6a76..c54aa1257 100644
--- a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
+++ b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
@@ -7,6 +7,7 @@
 PERL_CRYPT_OPENSSL_RSA_VERSION = 0.33
 PERL_CRYPT_OPENSSL_RSA_SOURCE = Crypt-OpenSSL-RSA-$(PERL_CRYPT_OPENSSL_RSA_VERSION).tar.gz
 PERL_CRYPT_OPENSSL_RSA_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
+PERL_CRYPT_OPENSSL_RSA_PURL = pkg:cpan/TODDR/Crypt-OpenSSL-RSA@$(PERL_CRYPT_OPENSSL_RSA_VERSION)
 PERL_CRYPT_OPENSSL_RSA_DEPENDENCIES = \
 	host-perl-crypt-openssl-guess \
 	perl-crypt-openssl-random \
diff --git a/package/perl-data-dump/perl-data-dump.mk b/package/perl-data-dump/perl-data-dump.mk
index e70de2a21..ee4e29e06 100644
--- a/package/perl-data-dump/perl-data-dump.mk
+++ b/package/perl-data-dump/perl-data-dump.mk
@@ -7,6 +7,7 @@
 PERL_DATA_DUMP_VERSION = 1.25
 PERL_DATA_DUMP_SOURCE = Data-Dump-$(PERL_DATA_DUMP_VERSION).tar.gz
 PERL_DATA_DUMP_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GARU
+PERL_DATA_DUMP_PURL = pkg:cpan/GARU/Data-Dump@$(PERL_DATA_DUMP_VERSION)
 PERL_DATA_DUMP_LICENSE = Artistic or GPL-1.0+
 PERL_DATA_DUMP_LICENSE_FILES = README.md
 PERL_DATA_DUMP_DISTNAME = Data-Dump
diff --git a/package/perl-data-optlist/perl-data-optlist.mk b/package/perl-data-optlist/perl-data-optlist.mk
index 8c22cfe78..09dcc6514 100644
--- a/package/perl-data-optlist/perl-data-optlist.mk
+++ b/package/perl-data-optlist/perl-data-optlist.mk
@@ -7,6 +7,7 @@
 PERL_DATA_OPTLIST_VERSION = 0.114
 PERL_DATA_OPTLIST_SOURCE = Data-OptList-$(PERL_DATA_OPTLIST_VERSION).tar.gz
 PERL_DATA_OPTLIST_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
+PERL_DATA_OPTLIST_PURL = pkg:cpan/RJBS/Data-OptList@$(PERL_DATA_OPTLIST_VERSION)
 PERL_DATA_OPTLIST_LICENSE = Artistic or GPL-1.0+
 PERL_DATA_OPTLIST_LICENSE_FILES = LICENSE
 PERL_DATA_OPTLIST_DISTNAME = Data-OptList
diff --git a/package/perl-data-uuid/perl-data-uuid.mk b/package/perl-data-uuid/perl-data-uuid.mk
index 93060964b..82031c985 100644
--- a/package/perl-data-uuid/perl-data-uuid.mk
+++ b/package/perl-data-uuid/perl-data-uuid.mk
@@ -7,6 +7,7 @@
 PERL_DATA_UUID_VERSION = 1.226
 PERL_DATA_UUID_SOURCE = Data-UUID-$(PERL_DATA_UUID_VERSION).tar.gz
 PERL_DATA_UUID_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
+PERL_DATA_UUID_PURL = pkg:cpan/GTERMARS/Data-UUID@$(PERL_DATA_UUID_VERSION)
 # The license is documented at
 # https://fedoraproject.org/wiki/Licensing:MIT#HP_Variant as the "HP
 # Variant" of the MIT license. There is no official SPDX tag for this
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
index 55d9cff6e..e97ab8c83 100644
--- a/package/perl-date-manip/perl-date-manip.mk
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -7,6 +7,7 @@
 PERL_DATE_MANIP_VERSION = 6.94
 PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
 PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
+PERL_DATE_MANIP_PURL = pkg:cpan/SBECK/Date-Manip@$(PERL_DATE_MANIP_VERSION)
 PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
 PERL_DATE_MANIP_LICENSE_FILES = LICENSE
 PERL_DATE_MANIP_DISTNAME = Date-Manip
diff --git a/package/perl-datetime-tiny/perl-datetime-tiny.mk b/package/perl-datetime-tiny/perl-datetime-tiny.mk
index 2a4264261..8d9342b3e 100644
--- a/package/perl-datetime-tiny/perl-datetime-tiny.mk
+++ b/package/perl-datetime-tiny/perl-datetime-tiny.mk
@@ -7,6 +7,7 @@
 PERL_DATETIME_TINY_VERSION = 1.07
 PERL_DATETIME_TINY_SOURCE = DateTime-Tiny-$(PERL_DATETIME_TINY_VERSION).tar.gz
 PERL_DATETIME_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
+PERL_DATETIME_TINY_PURL = pkg:cpan/DAGOLDEN/DateTime-Tiny@$(PERL_DATETIME_TINY_VERSION)
 PERL_DATETIME_TINY_LICENSE = Artistic or GPL-1.0+
 PERL_DATETIME_TINY_LICENSE_FILES = LICENSE
 PERL_DATETIME_TINY_DISTNAME = DateTime-Tiny
diff --git a/package/perl-dbd-mysql/perl-dbd-mysql.mk b/package/perl-dbd-mysql/perl-dbd-mysql.mk
index e87e34100..b0df5e457 100644
--- a/package/perl-dbd-mysql/perl-dbd-mysql.mk
+++ b/package/perl-dbd-mysql/perl-dbd-mysql.mk
@@ -7,6 +7,7 @@
 PERL_DBD_MYSQL_VERSION = 4.046
 PERL_DBD_MYSQL_SOURCE = DBD-mysql-$(PERL_DBD_MYSQL_VERSION).tar.gz
 PERL_DBD_MYSQL_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CA/CAPTTOFU
+PERL_DBD_MYSQL_PURL = pkg:cpan/DVEEDEN/DBD-mysql@$(PERL_DBD_MYSQL_VERSION)
 PERL_DBD_MYSQL_DEPENDENCIES = \
 	host-perl-dbi \
 	mariadb
diff --git a/package/perl-dbi/perl-dbi.mk b/package/perl-dbi/perl-dbi.mk
index 482d3d176..c04af7a53 100644
--- a/package/perl-dbi/perl-dbi.mk
+++ b/package/perl-dbi/perl-dbi.mk
@@ -7,6 +7,7 @@
 PERL_DBI_VERSION = 1.643
 PERL_DBI_SOURCE = DBI-$(PERL_DBI_VERSION).tar.gz
 PERL_DBI_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TI/TIMB
+PERL_DBI_PURL = pkg:cpan/TIMB/DBI@$(PERL_DBI_VERSION)
 PERL_DBI_LICENSE = Artistic or GPL-1.0+
 PERL_DBI_LICENSE_FILES = LICENSE
 PERL_DBI_DISTNAME = DBI
diff --git a/package/perl-devel-cycle/perl-devel-cycle.mk b/package/perl-devel-cycle/perl-devel-cycle.mk
index 0599e1c3a..afd323c1a 100644
--- a/package/perl-devel-cycle/perl-devel-cycle.mk
+++ b/package/perl-devel-cycle/perl-devel-cycle.mk
@@ -7,6 +7,7 @@
 PERL_DEVEL_CYCLE_VERSION = 1.12
 PERL_DEVEL_CYCLE_SOURCE = Devel-Cycle-$(PERL_DEVEL_CYCLE_VERSION).tar.gz
 PERL_DEVEL_CYCLE_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LD/LDS
+PERL_DEVEL_CYCLE_PURL = pkg:cpan/LDS/Devel-Cycle@$(PERL_DEVEL_CYCLE_VERSION)
 PERL_DEVEL_CYCLE_LICENSE = Artistic or GPL-1.0+
 PERL_DEVEL_CYCLE_LICENSE_FILES = README
 PERL_DEVEL_CYCLE_DISTNAME = Devel-Cycle
diff --git a/package/perl-devel-globaldestruction/perl-devel-globaldestruction.mk b/package/perl-devel-globaldestruction/perl-devel-globaldestruction.mk
index 3d4d60ed2..dd30c8c05 100644
--- a/package/perl-devel-globaldestruction/perl-devel-globaldestruction.mk
+++ b/package/perl-devel-globaldestruction/perl-devel-globaldestruction.mk
@@ -7,6 +7,7 @@
 PERL_DEVEL_GLOBALDESTRUCTION_VERSION = 0.14
 PERL_DEVEL_GLOBALDESTRUCTION_SOURCE = Devel-GlobalDestruction-$(PERL_DEVEL_GLOBALDESTRUCTION_VERSION).tar.gz
 PERL_DEVEL_GLOBALDESTRUCTION_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
+PERL_DEVEL_GLOBALDESTRUCTION_PURL = pkg:cpan/HAARG/Devel-GlobalDestruction@$(PERL_DEVEL_GLOBALDESTRUCTION_VERSION)
 PERL_DEVEL_GLOBALDESTRUCTION_LICENSE = Artistic or GPL-1.0+
 PERL_DEVEL_GLOBALDESTRUCTION_LICENSE_FILES = README
 PERL_DEVEL_GLOBALDESTRUCTION_DISTNAME = Devel-GlobalDestruction
diff --git a/package/perl-devel-size/perl-devel-size.mk b/package/perl-devel-size/perl-devel-size.mk
index 9acc67c9e..5d1eb4a1d 100644
--- a/package/perl-devel-size/perl-devel-size.mk
+++ b/package/perl-devel-size/perl-devel-size.mk
@@ -7,6 +7,7 @@
 PERL_DEVEL_SIZE_VERSION = 0.83
 PERL_DEVEL_SIZE_SOURCE = Devel-Size-$(PERL_DEVEL_SIZE_VERSION).tar.gz
 PERL_DEVEL_SIZE_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NW/NWCLARK
+PERL_DEVEL_SIZE_PURL = pkg:cpan/NWCLARK/Devel-Size@$(PERL_DEVEL_SIZE_VERSION)
 PERL_DEVEL_SIZE_LICENSE = Artistic or GPL-1.0+
 PERL_DEVEL_SIZE_LICENSE_FILES = README
 PERL_DEVEL_SIZE_DISTNAME = Devel-Size
diff --git a/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.mk b/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.mk
index 949823c02..e7d05b900 100644
--- a/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.mk
+++ b/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.mk
@@ -7,6 +7,7 @@
 PERL_DEVEL_STACKTRACE_ASHTML_VERSION = 0.15
 PERL_DEVEL_STACKTRACE_ASHTML_SOURCE = Devel-StackTrace-AsHTML-$(PERL_DEVEL_STACKTRACE_ASHTML_VERSION).tar.gz
 PERL_DEVEL_STACKTRACE_ASHTML_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
+PERL_DEVEL_STACKTRACE_ASHTML_PURL = pkg:cpan/MIYAGAWA/Devel-StackTrace-AsHTML@$(PERL_DEVEL_STACKTRACE_ASHTML_VERSION)
 PERL_DEVEL_STACKTRACE_ASHTML_LICENSE = Artistic or GPL-1.0+
 PERL_DEVEL_STACKTRACE_ASHTML_LICENSE_FILES = LICENSE
 PERL_DEVEL_STACKTRACE_ASHTML_DISTNAME = Devel-StackTrace-AsHTML
diff --git a/package/perl-devel-stacktrace/perl-devel-stacktrace.mk b/package/perl-devel-stacktrace/perl-devel-stacktrace.mk
index 557f21bb8..463ac39f1 100644
--- a/package/perl-devel-stacktrace/perl-devel-stacktrace.mk
+++ b/package/perl-devel-stacktrace/perl-devel-stacktrace.mk
@@ -7,6 +7,7 @@
 PERL_DEVEL_STACKTRACE_VERSION = 2.05
 PERL_DEVEL_STACKTRACE_SOURCE = Devel-StackTrace-$(PERL_DEVEL_STACKTRACE_VERSION).tar.gz
 PERL_DEVEL_STACKTRACE_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DR/DROLSKY
+PERL_DEVEL_STACKTRACE_PURL = pkg:cpan/DROLSKY/Devel-StackTrace@$(PERL_DEVEL_STACKTRACE_VERSION)
 PERL_DEVEL_STACKTRACE_LICENSE = Artistic-2.0
 PERL_DEVEL_STACKTRACE_LICENSE_FILES = LICENSE
 PERL_DEVEL_STACKTRACE_DISTNAME = Devel-StackTrace
diff --git a/package/perl-device-serialport/perl-device-serialport.mk b/package/perl-device-serialport/perl-device-serialport.mk
index 9889c9132..37c158b75 100644
--- a/package/perl-device-serialport/perl-device-serialport.mk
+++ b/package/perl-device-serialport/perl-device-serialport.mk
@@ -7,6 +7,7 @@
 PERL_DEVICE_SERIALPORT_VERSION = 1.04
 PERL_DEVICE_SERIALPORT_SOURCE = Device-SerialPort-$(PERL_DEVICE_SERIALPORT_VERSION).tar.gz
 PERL_DEVICE_SERIALPORT_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CO/COOK
+PERL_DEVICE_SERIALPORT_PURL = pkg:cpan/COOK/Device-SerialPort@$(PERL_DEVICE_SERIALPORT_VERSION)
 PERL_DEVICE_SERIALPORT_LICENSE = Artistic or GPL-1.0+
 PERL_DEVICE_SERIALPORT_LICENSE_FILES = README
 PERL_DEVICE_SERIALPORT_DISTNAME = Device-SerialPort
diff --git a/package/perl-digest-hmac/perl-digest-hmac.mk b/package/perl-digest-hmac/perl-digest-hmac.mk
index bc080703d..9a4d99592 100644
--- a/package/perl-digest-hmac/perl-digest-hmac.mk
+++ b/package/perl-digest-hmac/perl-digest-hmac.mk
@@ -7,6 +7,7 @@
 PERL_DIGEST_HMAC_VERSION = 1.04
 PERL_DIGEST_HMAC_SOURCE = Digest-HMAC-$(PERL_DIGEST_HMAC_VERSION).tar.gz
 PERL_DIGEST_HMAC_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AR/ARODLAND
+PERL_DIGEST_HMAC_PURL = pkg:cpan/ARODLAND/Digest-HMAC@$(PERL_DIGEST_HMAC_VERSION)
 PERL_DIGEST_HMAC_LICENSE = Artistic or GPL-1.0+
 PERL_DIGEST_HMAC_LICENSE_FILES = LICENSE
 PERL_DIGEST_HMAC_DISTNAME = Digest-HMAC
diff --git a/package/perl-digest-sha1/perl-digest-sha1.mk b/package/perl-digest-sha1/perl-digest-sha1.mk
index d3188db14..b0774724d 100644
--- a/package/perl-digest-sha1/perl-digest-sha1.mk
+++ b/package/perl-digest-sha1/perl-digest-sha1.mk
@@ -7,6 +7,7 @@
 PERL_DIGEST_SHA1_VERSION = 2.13
 PERL_DIGEST_SHA1_SOURCE = Digest-SHA1-$(PERL_DIGEST_SHA1_VERSION).tar.gz
 PERL_DIGEST_SHA1_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_DIGEST_SHA1_PURL = pkg:cpan/GAAS/Digest-SHA1@$(PERL_DIGEST_SHA1_VERSION)
 PERL_DIGEST_SHA1_LICENSE = Artistic or GPL-1.0+
 PERL_DIGEST_SHA1_LICENSE_FILES = README
 PERL_DIGEST_SHA1_DISTNAME = Digest-SHA1
diff --git a/package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk b/package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk
index 47bd19f6c..82d795e1f 100644
--- a/package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk
+++ b/package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk
@@ -7,6 +7,7 @@
 PERL_DIST_CHECKCONFLICTS_VERSION = 0.11
 PERL_DIST_CHECKCONFLICTS_SOURCE = Dist-CheckConflicts-$(PERL_DIST_CHECKCONFLICTS_VERSION).tar.gz
 PERL_DIST_CHECKCONFLICTS_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DO/DOY
+PERL_DIST_CHECKCONFLICTS_PURL = pkg:cpan/DOY/Dist-CheckConflicts@$(PERL_DIST_CHECKCONFLICTS_VERSION)
 PERL_DIST_CHECKCONFLICTS_LICENSE = Artistic or GPL-1.0+
 PERL_DIST_CHECKCONFLICTS_LICENSE_FILES = LICENSE
 PERL_DIST_CHECKCONFLICTS_DISTNAME = Dist-CheckConflicts
diff --git a/package/perl-encode-detect/perl-encode-detect.mk b/package/perl-encode-detect/perl-encode-detect.mk
index 8e9ea7796..f7380a4b4 100644
--- a/package/perl-encode-detect/perl-encode-detect.mk
+++ b/package/perl-encode-detect/perl-encode-detect.mk
@@ -7,6 +7,7 @@
 PERL_ENCODE_DETECT_VERSION = 1.01
 PERL_ENCODE_DETECT_SOURCE = Encode-Detect-$(PERL_ENCODE_DETECT_VERSION).tar.gz
 PERL_ENCODE_DETECT_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JG/JGMYERS
+PERL_ENCODE_DETECT_PURL = pkg:cpan/JGMYERS/Encode-Detect@$(PERL_ENCODE_DETECT_VERSION)
 PERL_ENCODE_DETECT_DEPENDENCIES = host-perl-module-build
 PERL_ENCODE_DETECT_LICENSE = MPL-1.1
 PERL_ENCODE_DETECT_LICENSE_FILES = LICENSE
diff --git a/package/perl-encode-locale/perl-encode-locale.mk b/package/perl-encode-locale/perl-encode-locale.mk
index 1e948c65e..978693d42 100644
--- a/package/perl-encode-locale/perl-encode-locale.mk
+++ b/package/perl-encode-locale/perl-encode-locale.mk
@@ -7,6 +7,7 @@
 PERL_ENCODE_LOCALE_VERSION = 1.05
 PERL_ENCODE_LOCALE_SOURCE = Encode-Locale-$(PERL_ENCODE_LOCALE_VERSION).tar.gz
 PERL_ENCODE_LOCALE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_ENCODE_LOCALE_PURL = pkg:cpan/GAAS/Encode-Locale@$(PERL_ENCODE_LOCALE_VERSION)
 PERL_ENCODE_LOCALE_LICENSE = Artistic or GPL-1.0+
 PERL_ENCODE_LOCALE_LICENSE_FILES = README
 PERL_ENCODE_LOCALE_DISTNAME = Encode-Locale
diff --git a/package/perl-exporter-tiny/perl-exporter-tiny.mk b/package/perl-exporter-tiny/perl-exporter-tiny.mk
index 715070623..dd8e2e1d7 100644
--- a/package/perl-exporter-tiny/perl-exporter-tiny.mk
+++ b/package/perl-exporter-tiny/perl-exporter-tiny.mk
@@ -7,6 +7,7 @@
 PERL_EXPORTER_TINY_VERSION = 1.006002
 PERL_EXPORTER_TINY_SOURCE = Exporter-Tiny-$(PERL_EXPORTER_TINY_VERSION).tar.gz
 PERL_EXPORTER_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
+PERL_EXPORTER_TINY_PURL = pkg:cpan/TOBYINK/Exporter-Tiny@$(PERL_EXPORTER_TINY_VERSION)
 PERL_EXPORTER_TINY_LICENSE = Artistic or GPL-1.0+
 PERL_EXPORTER_TINY_LICENSE_FILES = LICENSE
 PERL_EXPORTER_TINY_DISTNAME = Exporter-Tiny
diff --git a/package/perl-extutils-config/perl-extutils-config.mk b/package/perl-extutils-config/perl-extutils-config.mk
index f46ca3e6f..a246b9cb4 100644
--- a/package/perl-extutils-config/perl-extutils-config.mk
+++ b/package/perl-extutils-config/perl-extutils-config.mk
@@ -7,6 +7,7 @@
 PERL_EXTUTILS_CONFIG_VERSION = 0.008
 PERL_EXTUTILS_CONFIG_SOURCE = ExtUtils-Config-$(PERL_EXTUTILS_CONFIG_VERSION).tar.gz
 PERL_EXTUTILS_CONFIG_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
+PERL_EXTUTILS_CONFIG_PURL = pkg:cpan/LEONT/ExtUtils-Config@$(PERL_EXTUTILS_CONFIG_VERSION)
 PERL_EXTUTILS_CONFIG_LICENSE = Artistic or GPL-1.0+
 PERL_EXTUTILS_CONFIG_LICENSE_FILES = LICENSE
 PERL_EXTUTILS_CONFIG_DISTNAME = ExtUtils-Config
diff --git a/package/perl-extutils-helpers/perl-extutils-helpers.mk b/package/perl-extutils-helpers/perl-extutils-helpers.mk
index d3b14d88c..c82111a2d 100644
--- a/package/perl-extutils-helpers/perl-extutils-helpers.mk
+++ b/package/perl-extutils-helpers/perl-extutils-helpers.mk
@@ -7,6 +7,7 @@
 PERL_EXTUTILS_HELPERS_VERSION = 0.026
 PERL_EXTUTILS_HELPERS_SOURCE = ExtUtils-Helpers-$(PERL_EXTUTILS_HELPERS_VERSION).tar.gz
 PERL_EXTUTILS_HELPERS_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
+PERL_EXTUTILS_HELPERS_PURL = pkg:cpan/LEONT/ExtUtils-Helpers@$(PERL_EXTUTILS_HELPERS_VERSION)
 PERL_EXTUTILS_HELPERS_LICENSE = Artistic or GPL-1.0+
 PERL_EXTUTILS_HELPERS_LICENSE_FILES = LICENSE
 PERL_EXTUTILS_HELPERS_DISTNAME = ExtUtils-Helpers
diff --git a/package/perl-extutils-installpaths/perl-extutils-installpaths.mk b/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
index e90e130c3..dba0d3b31 100644
--- a/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
+++ b/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
@@ -7,6 +7,7 @@
 PERL_EXTUTILS_INSTALLPATHS_VERSION = 0.012
 PERL_EXTUTILS_INSTALLPATHS_SOURCE = ExtUtils-InstallPaths-$(PERL_EXTUTILS_INSTALLPATHS_VERSION).tar.gz
 PERL_EXTUTILS_INSTALLPATHS_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
+PERL_EXTUTILS_INSTALLPATHS_PURL = pkg:cpan/LEONT/ExtUtils-InstallPaths@$(PERL_EXTUTILS_INSTALLPATHS_VERSION)
 HOST_PERL_EXTUTILS_INSTALLPATHS_DEPENDENCIES = host-perl-extutils-config
 PERL_EXTUTILS_INSTALLPATHS_LICENSE = Artistic or GPL-1.0+
 PERL_EXTUTILS_INSTALLPATHS_LICENSE_FILES = LICENSE
diff --git a/package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.mk b/package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.mk
index cb11e9f58..4c1207d5f 100644
--- a/package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.mk
+++ b/package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.mk
@@ -7,6 +7,7 @@
 PERL_EXTUTILS_PKGCONFIG_VERSION = 1.16
 PERL_EXTUTILS_PKGCONFIG_SOURCE = ExtUtils-PkgConfig-$(PERL_EXTUTILS_PKGCONFIG_VERSION).tar.gz
 PERL_EXTUTILS_PKGCONFIG_SITE = $(BR2_CPAN_MIRROR)/authors/id/X/XA/XAOC
+PERL_EXTUTILS_PKGCONFIG_PURL = pkg:cpan/XAOC/ExtUtils-PkgConfig@$(PERL_EXTUTILS_PKGCONFIG_VERSION)
 PERL_EXTUTILS_PKGCONFIG_LICENSE = LGPL-2.1
 PERL_EXTUTILS_PKGCONFIG_LICENSE_FILES = README
 PERL_EXTUTILS_PKGCONFIG_DISTNAME = ExtUtils-PkgConfig
diff --git a/package/perl-file-listing/perl-file-listing.mk b/package/perl-file-listing/perl-file-listing.mk
index 583de605a..96a4802dc 100644
--- a/package/perl-file-listing/perl-file-listing.mk
+++ b/package/perl-file-listing/perl-file-listing.mk
@@ -7,6 +7,7 @@
 PERL_FILE_LISTING_VERSION = 6.16
 PERL_FILE_LISTING_SOURCE = File-Listing-$(PERL_FILE_LISTING_VERSION).tar.gz
 PERL_FILE_LISTING_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PL/PLICEASE
+PERL_FILE_LISTING_PURL = pkg:cpan/PLICEASE/File-Listing@$(PERL_FILE_LISTING_VERSION)
 PERL_FILE_LISTING_LICENSE = Artistic or GPL-1.0+
 PERL_FILE_LISTING_LICENSE_FILES = LICENSE
 PERL_FILE_LISTING_DISTNAME = File-Listing
diff --git a/package/perl-file-sharedir-install/perl-file-sharedir-install.mk b/package/perl-file-sharedir-install/perl-file-sharedir-install.mk
index 4f152e1b5..1a9f5a410 100644
--- a/package/perl-file-sharedir-install/perl-file-sharedir-install.mk
+++ b/package/perl-file-sharedir-install/perl-file-sharedir-install.mk
@@ -7,6 +7,7 @@
 PERL_FILE_SHAREDIR_INSTALL_VERSION = 0.14
 PERL_FILE_SHAREDIR_INSTALL_SOURCE = File-ShareDir-Install-$(PERL_FILE_SHAREDIR_INSTALL_VERSION).tar.gz
 PERL_FILE_SHAREDIR_INSTALL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
+PERL_FILE_SHAREDIR_INSTALL_PURL = pkg:cpan/ETHER/File-ShareDir-Install@$(PERL_FILE_SHAREDIR_INSTALL_VERSION)
 PERL_FILE_SHAREDIR_INSTALL_LICENSE = Artistic or GPL-1.0+
 PERL_FILE_SHAREDIR_INSTALL_LICENSE_FILES = LICENSE
 PERL_FILE_SHAREDIR_INSTALL_DISTNAME = File-ShareDir-Install
diff --git a/package/perl-file-sharedir/perl-file-sharedir.mk b/package/perl-file-sharedir/perl-file-sharedir.mk
index 0121b5634..40687cfc9 100644
--- a/package/perl-file-sharedir/perl-file-sharedir.mk
+++ b/package/perl-file-sharedir/perl-file-sharedir.mk
@@ -7,6 +7,7 @@
 PERL_FILE_SHAREDIR_VERSION = 1.118
 PERL_FILE_SHAREDIR_SOURCE = File-ShareDir-$(PERL_FILE_SHAREDIR_VERSION).tar.gz
 PERL_FILE_SHAREDIR_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RE/REHSACK
+PERL_FILE_SHAREDIR_PURL = pkg:cpan/REHSACK/File-ShareDir@$(PERL_FILE_SHAREDIR_VERSION)
 PERL_FILE_SHAREDIR_DEPENDENCIES = host-perl-file-sharedir-install
 PERL_FILE_SHAREDIR_LICENSE = Artistic or GPL-1.0+
 PERL_FILE_SHAREDIR_LICENSE_FILES = LICENSE
diff --git a/package/perl-file-slurp/perl-file-slurp.mk b/package/perl-file-slurp/perl-file-slurp.mk
index 0d4ab9403..4f2678840 100644
--- a/package/perl-file-slurp/perl-file-slurp.mk
+++ b/package/perl-file-slurp/perl-file-slurp.mk
@@ -7,6 +7,7 @@
 PERL_FILE_SLURP_VERSION = 9999.32
 PERL_FILE_SLURP_SOURCE = File-Slurp-$(PERL_FILE_SLURP_VERSION).tar.gz
 PERL_FILE_SLURP_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CA/CAPOEIRAB
+PERL_FILE_SLURP_PURL = pkg:cpan/CAPOEIRAB/File-Slurp@$(PERL_FILE_SLURP_VERSION)
 PERL_FILE_SLURP_LICENSE = Artistic or GPL-1.0+
 PERL_FILE_SLURP_LICENSE_FILES = README.md
 PERL_FILE_SLURP_DISTNAME = File-Slurp
diff --git a/package/perl-file-util/perl-file-util.mk b/package/perl-file-util/perl-file-util.mk
index 4348b0e95..1e4a6d8b2 100644
--- a/package/perl-file-util/perl-file-util.mk
+++ b/package/perl-file-util/perl-file-util.mk
@@ -7,6 +7,7 @@
 PERL_FILE_UTIL_VERSION = 4.201720
 PERL_FILE_UTIL_SOURCE = File-Util-$(PERL_FILE_UTIL_VERSION).tar.gz
 PERL_FILE_UTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOMMY
+PERL_FILE_UTIL_PURL = pkg:cpan/TOMMY/File-Util@$(PERL_FILE_UTIL_VERSION)
 PERL_FILE_UTIL_DEPENDENCIES = host-perl-module-build
 PERL_FILE_UTIL_LICENSE = Artistic or GPL-1.0+
 PERL_FILE_UTIL_LICENSE_FILES = COPYING LICENSE
diff --git a/package/perl-filesys-notify-simple/perl-filesys-notify-simple.mk b/package/perl-filesys-notify-simple/perl-filesys-notify-simple.mk
index 62bc80c9f..63014ceda 100644
--- a/package/perl-filesys-notify-simple/perl-filesys-notify-simple.mk
+++ b/package/perl-filesys-notify-simple/perl-filesys-notify-simple.mk
@@ -7,6 +7,7 @@
 PERL_FILESYS_NOTIFY_SIMPLE_VERSION = 0.14
 PERL_FILESYS_NOTIFY_SIMPLE_SOURCE = Filesys-Notify-Simple-$(PERL_FILESYS_NOTIFY_SIMPLE_VERSION).tar.gz
 PERL_FILESYS_NOTIFY_SIMPLE_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
+PERL_FILESYS_NOTIFY_SIMPLE_PURL = pkg:cpan/MIYAGAWA/Filesys-Notify-Simple@$(PERL_FILESYS_NOTIFY_SIMPLE_VERSION)
 PERL_FILESYS_NOTIFY_SIMPLE_LICENSE = Artistic or GPL-1.0+
 PERL_FILESYS_NOTIFY_SIMPLE_LICENSE_FILES = LICENSE
 PERL_FILESYS_NOTIFY_SIMPLE_DISTNAME = Filesys-Notify-Simple
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index 17c24bc97..5e827ef13 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -7,6 +7,7 @@
 PERL_GD_VERSION = 2.77
 PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
 PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
+PERL_GD_PURL = pkg:cpan/RURBAN/GD@$(PERL_GD_VERSION)
 PERL_GD_DEPENDENCIES = host-perl-extutils-pkgconfig zlib gd
 PERL_GD_LICENSE = Artistic or GPL-1.0+
 PERL_GD_LICENSE_FILES = LICENSE
diff --git a/package/perl-gdgraph/perl-gdgraph.mk b/package/perl-gdgraph/perl-gdgraph.mk
index 286902a66..be9953b29 100644
--- a/package/perl-gdgraph/perl-gdgraph.mk
+++ b/package/perl-gdgraph/perl-gdgraph.mk
@@ -7,6 +7,7 @@
 PERL_GDGRAPH_VERSION = 1.54
 PERL_GDGRAPH_SOURCE = GDGraph-$(PERL_GDGRAPH_VERSION).tar.gz
 PERL_GDGRAPH_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RUZ
+PERL_GDGRAPH_PURL = pkg:cpan/BPS/GDGraph@$(PERL_GDGRAPH_VERSION)
 PERL_GDGRAPH_LICENSE = Artistic or GPL-1.0+ (perl module), GPL-2.0+ (font)
 PERL_GDGRAPH_LICENSE_FILES = Dustismo.LICENSE README
 PERL_GDGRAPH_DISTNAME = GDGraph
diff --git a/package/perl-gdtextutil/perl-gdtextutil.mk b/package/perl-gdtextutil/perl-gdtextutil.mk
index f91d9e9eb..9e82df9a8 100644
--- a/package/perl-gdtextutil/perl-gdtextutil.mk
+++ b/package/perl-gdtextutil/perl-gdtextutil.mk
@@ -7,6 +7,7 @@
 PERL_GDTEXTUTIL_VERSION = 0.86
 PERL_GDTEXTUTIL_SOURCE = GDTextUtil-$(PERL_GDTEXTUTIL_VERSION).tar.gz
 PERL_GDTEXTUTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MV/MVERB
+PERL_GDTEXTUTIL_PURL = pkg:cpan/MVERB/GDTextUtil@$(PERL_GDTEXTUTIL_VERSION)
 PERL_GDTEXTUTIL_LICENSE = Artistic or GPL-1.0+ (perl module), GPL-2.0+ (font)
 PERL_GDTEXTUTIL_LICENSE_FILES = Dustismo.LICENSE README
 PERL_GDTEXTUTIL_DISTNAME = GDTextUtil
diff --git a/package/perl-hash-multivalue/perl-hash-multivalue.mk b/package/perl-hash-multivalue/perl-hash-multivalue.mk
index dcbfe8431..23d7797d0 100644
--- a/package/perl-hash-multivalue/perl-hash-multivalue.mk
+++ b/package/perl-hash-multivalue/perl-hash-multivalue.mk
@@ -7,6 +7,7 @@
 PERL_HASH_MULTIVALUE_VERSION = 0.16
 PERL_HASH_MULTIVALUE_SOURCE = Hash-MultiValue-$(PERL_HASH_MULTIVALUE_VERSION).tar.gz
 PERL_HASH_MULTIVALUE_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AR/ARISTOTLE
+PERL_HASH_MULTIVALUE_PURL = pkg:cpan/ARISTOTLE/Hash-MultiValue@$(PERL_HASH_MULTIVALUE_VERSION)
 PERL_HASH_MULTIVALUE_LICENSE = Artistic or GPL-1.0+
 PERL_HASH_MULTIVALUE_LICENSE_FILES = LICENSE
 PERL_HASH_MULTIVALUE_DISTNAME = Hash-MultiValue
diff --git a/package/perl-html-parser/perl-html-parser.mk b/package/perl-html-parser/perl-html-parser.mk
index 50efaa273..8c4624259 100644
--- a/package/perl-html-parser/perl-html-parser.mk
+++ b/package/perl-html-parser/perl-html-parser.mk
@@ -7,6 +7,7 @@
 PERL_HTML_PARSER_VERSION = 3.81
 PERL_HTML_PARSER_SOURCE = HTML-Parser-$(PERL_HTML_PARSER_VERSION).tar.gz
 PERL_HTML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
+PERL_HTML_PARSER_PURL = pkg:cpan/OALDERS/HTML-Parser@$(PERL_HTML_PARSER_VERSION)
 PERL_HTML_PARSER_LICENSE = Artistic or GPL-1.0+
 PERL_HTML_PARSER_LICENSE_FILES = LICENSE
 PERL_HTML_PARSER_DISTNAME = HTML-Parser
diff --git a/package/perl-html-tagset/perl-html-tagset.mk b/package/perl-html-tagset/perl-html-tagset.mk
index c6b5f6913..1d9c04eb5 100644
--- a/package/perl-html-tagset/perl-html-tagset.mk
+++ b/package/perl-html-tagset/perl-html-tagset.mk
@@ -7,6 +7,7 @@
 PERL_HTML_TAGSET_VERSION = 3.20
 PERL_HTML_TAGSET_SOURCE = HTML-Tagset-$(PERL_HTML_TAGSET_VERSION).tar.gz
 PERL_HTML_TAGSET_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PETDANCE
+PERL_HTML_TAGSET_PURL = pkg:cpan/PETDANCE/HTML-Tagset@$(PERL_HTML_TAGSET_VERSION)
 PERL_HTML_TAGSET_LICENSE = Artistic or GPL-1.0+
 PERL_HTML_TAGSET_LICENSE_FILES = README
 PERL_HTML_TAGSET_DISTNAME = HTML-Tagset
diff --git a/package/perl-http-cookies/perl-http-cookies.mk b/package/perl-http-cookies/perl-http-cookies.mk
index 745fd10a7..a2c5bcb7a 100644
--- a/package/perl-http-cookies/perl-http-cookies.mk
+++ b/package/perl-http-cookies/perl-http-cookies.mk
@@ -7,6 +7,7 @@
 PERL_HTTP_COOKIES_VERSION = 6.10
 PERL_HTTP_COOKIES_SOURCE = HTTP-Cookies-$(PERL_HTTP_COOKIES_VERSION).tar.gz
 PERL_HTTP_COOKIES_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
+PERL_HTTP_COOKIES_PURL = pkg:cpan/OALDERS/HTTP-Cookies@$(PERL_HTTP_COOKIES_VERSION)
 PERL_HTTP_COOKIES_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_COOKIES_LICENSE_FILES = LICENSE
 PERL_HTTP_COOKIES_DISTNAME = HTTP-Cookies
diff --git a/package/perl-http-daemon/perl-http-daemon.mk b/package/perl-http-daemon/perl-http-daemon.mk
index c017c4e09..dbfbf9bb1 100644
--- a/package/perl-http-daemon/perl-http-daemon.mk
+++ b/package/perl-http-daemon/perl-http-daemon.mk
@@ -7,6 +7,7 @@
 PERL_HTTP_DAEMON_VERSION = 6.16
 PERL_HTTP_DAEMON_SOURCE = HTTP-Daemon-$(PERL_HTTP_DAEMON_VERSION).tar.gz
 PERL_HTTP_DAEMON_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
+PERL_HTTP_DAEMON_PURL = pkg:cpan/OALDERS/HTTP-Daemon@$(PERL_HTTP_DAEMON_VERSION)
 PERL_HTTP_DAEMON_DEPENDENCIES = host-perl-module-build-tiny
 PERL_HTTP_DAEMON_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_DAEMON_LICENSE_FILES = LICENCE
diff --git a/package/perl-http-date/perl-http-date.mk b/package/perl-http-date/perl-http-date.mk
index 2f1aeb7da..430a01ff7 100644
--- a/package/perl-http-date/perl-http-date.mk
+++ b/package/perl-http-date/perl-http-date.mk
@@ -7,6 +7,7 @@
 PERL_HTTP_DATE_VERSION = 6.06
 PERL_HTTP_DATE_SOURCE = HTTP-Date-$(PERL_HTTP_DATE_VERSION).tar.gz
 PERL_HTTP_DATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
+PERL_HTTP_DATE_PURL = pkg:cpan/OALDERS/HTTP-Date@$(PERL_HTTP_DATE_VERSION)
 PERL_HTTP_DATE_LICENSE = Artistic-1.0-Perl or GPL-1.0+
 PERL_HTTP_DATE_LICENSE_FILES = LICENSE
 PERL_HTTP_DATE_DISTNAME = HTTP-Date
diff --git a/package/perl-http-entity-parser/perl-http-entity-parser.mk b/package/perl-http-entity-parser/perl-http-entity-parser.mk
index 2304955bd..51c016b4e 100644
--- a/package/perl-http-entity-parser/perl-http-entity-parser.mk
+++ b/package/perl-http-entity-parser/perl-http-entity-parser.mk
@@ -7,6 +7,7 @@
 PERL_HTTP_ENTITY_PARSER_VERSION = 0.25
 PERL_HTTP_ENTITY_PARSER_SOURCE = HTTP-Entity-Parser-$(PERL_HTTP_ENTITY_PARSER_VERSION).tar.gz
 PERL_HTTP_ENTITY_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
+PERL_HTTP_ENTITY_PARSER_PURL = pkg:cpan/KAZEBURO/HTTP-Entity-Parser@$(PERL_HTTP_ENTITY_PARSER_VERSION)
 PERL_HTTP_ENTITY_PARSER_DEPENDENCIES = host-perl-module-build-tiny
 PERL_HTTP_ENTITY_PARSER_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_ENTITY_PARSER_LICENSE_FILES = LICENSE
diff --git a/package/perl-http-headers-fast/perl-http-headers-fast.mk b/package/perl-http-headers-fast/perl-http-headers-fast.mk
index d7bff6f99..408e5aade 100644
--- a/package/perl-http-headers-fast/perl-http-headers-fast.mk
+++ b/package/perl-http-headers-fast/perl-http-headers-fast.mk
@@ -7,6 +7,7 @@
 PERL_HTTP_HEADERS_FAST_VERSION = 0.22
 PERL_HTTP_HEADERS_FAST_SOURCE = HTTP-Headers-Fast-$(PERL_HTTP_HEADERS_FAST_VERSION).tar.gz
 PERL_HTTP_HEADERS_FAST_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOKUHIROM
+PERL_HTTP_HEADERS_FAST_PURL = pkg:cpan/TOKUHIROM/HTTP-Headers-Fast@$(PERL_HTTP_HEADERS_FAST_VERSION)
 PERL_HTTP_HEADERS_FAST_DEPENDENCIES = host-perl-module-build-tiny
 PERL_HTTP_HEADERS_FAST_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_HEADERS_FAST_LICENSE_FILES = LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index 7fdba0b29..79295fb95 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -7,6 +7,7 @@
 PERL_HTTP_MESSAGE_VERSION = 6.45
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
+PERL_HTTP_MESSAGE_PURL = pkg:cpan/OALDERS/HTTP-Message@$(PERL_HTTP_MESSAGE_VERSION)
 PERL_HTTP_MESSAGE_LICENSE = Artistic-1.0-Perl or GPL-1.0+
 PERL_HTTP_MESSAGE_LICENSE_FILES = LICENSE
 PERL_HTTP_MESSAGE_DISTNAME = HTTP-Message
diff --git a/package/perl-http-multipartparser/perl-http-multipartparser.mk b/package/perl-http-multipartparser/perl-http-multipartparser.mk
index 7fb3b8aaa..d4070357d 100644
--- a/package/perl-http-multipartparser/perl-http-multipartparser.mk
+++ b/package/perl-http-multipartparser/perl-http-multipartparser.mk
@@ -7,6 +7,7 @@
 PERL_HTTP_MULTIPARTPARSER_VERSION = 0.02
 PERL_HTTP_MULTIPARTPARSER_SOURCE = HTTP-MultiPartParser-$(PERL_HTTP_MULTIPARTPARSER_VERSION).tar.gz
 PERL_HTTP_MULTIPARTPARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CH/CHANSEN
+PERL_HTTP_MULTIPARTPARSER_PURL = pkg:cpan/CHANSEN/HTTP-MultiPartParser@$(PERL_HTTP_MULTIPARTPARSER_VERSION)
 PERL_HTTP_MULTIPARTPARSER_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_MULTIPARTPARSER_LICENSE_FILES = README
 PERL_HTTP_MULTIPARTPARSER_DISTNAME = HTTP-MultiPartParser
diff --git a/package/perl-http-negotiate/perl-http-negotiate.mk b/package/perl-http-negotiate/perl-http-negotiate.mk
index 868516fa7..b8f8eb5f4 100644
--- a/package/perl-http-negotiate/perl-http-negotiate.mk
+++ b/package/perl-http-negotiate/perl-http-negotiate.mk
@@ -7,6 +7,7 @@
 PERL_HTTP_NEGOTIATE_VERSION = 6.01
 PERL_HTTP_NEGOTIATE_SOURCE = HTTP-Negotiate-$(PERL_HTTP_NEGOTIATE_VERSION).tar.gz
 PERL_HTTP_NEGOTIATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_HTTP_NEGOTIATE_PURL = pkg:cpan/GAAS/HTTP-Negotiate@$(PERL_HTTP_NEGOTIATE_VERSION)
 PERL_HTTP_NEGOTIATE_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_NEGOTIATE_LICENSE_FILES = README
 PERL_HTTP_NEGOTIATE_DISTNAME = HTTP-Negotiate
diff --git a/package/perl-i18n/perl-i18n.mk b/package/perl-i18n/perl-i18n.mk
index 04d75c214..5cbb6a344 100644
--- a/package/perl-i18n/perl-i18n.mk
+++ b/package/perl-i18n/perl-i18n.mk
@@ -7,6 +7,7 @@
 PERL_I18N_VERSION = 0.13
 PERL_I18N_SOURCE = i18n-$(PERL_I18N_VERSION).tar.gz
 PERL_I18N_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AU/AUDREYT
+PERL_I18N_PURL = pkg:cpan/AUDREYT/i18n@$(PERL_I18N_VERSION)
 PERL_I18N_LICENSE = MIT
 PERL_I18N_LICENSE_FILES = README
 PERL_I18N_DISTNAME = i18n
diff --git a/package/perl-image-exiftool/perl-image-exiftool.mk b/package/perl-image-exiftool/perl-image-exiftool.mk
index 42adb04d3..1b0e0e078 100644
--- a/package/perl-image-exiftool/perl-image-exiftool.mk
+++ b/package/perl-image-exiftool/perl-image-exiftool.mk
@@ -7,6 +7,7 @@
 PERL_IMAGE_EXIFTOOL_VERSION = 12.50
 PERL_IMAGE_EXIFTOOL_SOURCE = Image-ExifTool-$(PERL_IMAGE_EXIFTOOL_VERSION).tar.gz
 PERL_IMAGE_EXIFTOOL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/EX/EXIFTOOL
+PERL_IMAGE_EXIFTOOL_PURL = pkg:cpan/EXIFTOOL/Image-ExifTool@$(PERL_IMAGE_EXIFTOOL_VERSION)
 PERL_IMAGE_EXIFTOOL_LICENSE = Artistic or GPL-1.0+
 PERL_IMAGE_EXIFTOOL_LICENSE_FILES = README
 PERL_IMAGE_EXIFTOOL_DISTNAME = Image-ExifTool
diff --git a/package/perl-io-html/perl-io-html.mk b/package/perl-io-html/perl-io-html.mk
index 934ac60cb..5c432f1f9 100644
--- a/package/perl-io-html/perl-io-html.mk
+++ b/package/perl-io-html/perl-io-html.mk
@@ -7,6 +7,7 @@
 PERL_IO_HTML_VERSION = 1.004
 PERL_IO_HTML_SOURCE = IO-HTML-$(PERL_IO_HTML_VERSION).tar.gz
 PERL_IO_HTML_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CJ/CJM
+PERL_IO_HTML_PURL = pkg:cpan/CJM/IO-HTML@$(PERL_IO_HTML_VERSION)
 PERL_IO_HTML_LICENSE = Artistic or GPL-1.0+
 PERL_IO_HTML_LICENSE_FILES = LICENSE
 PERL_IO_HTML_DISTNAME = IO-HTML
diff --git a/package/perl-io-interface/perl-io-interface.mk b/package/perl-io-interface/perl-io-interface.mk
index 84e4d1a9b..d7a8f9c0e 100644
--- a/package/perl-io-interface/perl-io-interface.mk
+++ b/package/perl-io-interface/perl-io-interface.mk
@@ -7,6 +7,7 @@
 PERL_IO_INTERFACE_VERSION = 1.09
 PERL_IO_INTERFACE_SOURCE = IO-Interface-$(PERL_IO_INTERFACE_VERSION).tar.gz
 PERL_IO_INTERFACE_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LD/LDS
+PERL_IO_INTERFACE_PURL = pkg:cpan/LDS/IO-Interface@$(PERL_IO_INTERFACE_VERSION)
 PERL_IO_INTERFACE_DEPENDENCIES = host-perl-module-build
 PERL_IO_INTERFACE_LICENSE = Artistic-2.0
 PERL_IO_INTERFACE_LICENSE_FILES = LICENSE
diff --git a/package/perl-io-socket-multicast/perl-io-socket-multicast.mk b/package/perl-io-socket-multicast/perl-io-socket-multicast.mk
index a8c6896ce..1aa60f7ae 100644
--- a/package/perl-io-socket-multicast/perl-io-socket-multicast.mk
+++ b/package/perl-io-socket-multicast/perl-io-socket-multicast.mk
@@ -7,6 +7,7 @@
 PERL_IO_SOCKET_MULTICAST_VERSION = 1.12
 PERL_IO_SOCKET_MULTICAST_SOURCE = IO-Socket-Multicast-$(PERL_IO_SOCKET_MULTICAST_VERSION).tar.gz
 PERL_IO_SOCKET_MULTICAST_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BR/BRAMBLE
+PERL_IO_SOCKET_MULTICAST_PURL = pkg:cpan/BRAMBLE/IO-Socket-Multicast@$(PERL_IO_SOCKET_MULTICAST_VERSION)
 PERL_IO_SOCKET_MULTICAST_LICENSE = Artistic or GPL-1.0+
 PERL_IO_SOCKET_MULTICAST_LICENSE_FILES = README
 PERL_IO_SOCKET_MULTICAST_DISTNAME = IO-Socket-Multicast
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index d5c09d908..1c3075776 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -7,6 +7,7 @@
 PERL_IO_SOCKET_SSL_VERSION = 2.080
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
+PERL_IO_SOCKET_SSL_PURL = pkg:cpan/SULLR/IO-Socket-SSL@$(PERL_IO_SOCKET_SSL_VERSION)
 PERL_IO_SOCKET_SSL_LICENSE = Artistic or GPL-1.0+
 PERL_IO_SOCKET_SSL_LICENSE_FILES = README
 PERL_IO_SOCKET_SSL_DISTNAME = IO-Socket-SSL
diff --git a/package/perl-json-maybexs/perl-json-maybexs.mk b/package/perl-json-maybexs/perl-json-maybexs.mk
index 13c9439ea..2db715a8b 100644
--- a/package/perl-json-maybexs/perl-json-maybexs.mk
+++ b/package/perl-json-maybexs/perl-json-maybexs.mk
@@ -7,6 +7,7 @@
 PERL_JSON_MAYBEXS_VERSION = 1.004005
 PERL_JSON_MAYBEXS_SOURCE = JSON-MaybeXS-$(PERL_JSON_MAYBEXS_VERSION).tar.gz
 PERL_JSON_MAYBEXS_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
+PERL_JSON_MAYBEXS_PURL = pkg:cpan/ETHER/JSON-MaybeXS@$(PERL_JSON_MAYBEXS_VERSION)
 PERL_JSON_MAYBEXS_LICENSE = Artistic or GPL-1.0+
 PERL_JSON_MAYBEXS_LICENSE_FILES = LICENSE
 PERL_JSON_MAYBEXS_DISTNAME = JSON-MaybeXS
diff --git a/package/perl-json-tiny/perl-json-tiny.mk b/package/perl-json-tiny/perl-json-tiny.mk
index 886cff810..88e43c92c 100644
--- a/package/perl-json-tiny/perl-json-tiny.mk
+++ b/package/perl-json-tiny/perl-json-tiny.mk
@@ -7,6 +7,7 @@
 PERL_JSON_TINY_VERSION = 0.58
 PERL_JSON_TINY_SOURCE = JSON-Tiny-$(PERL_JSON_TINY_VERSION).tar.gz
 PERL_JSON_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAVIDO
+PERL_JSON_TINY_PURL = pkg:cpan/DAVIDO/JSON-Tiny@$(PERL_JSON_TINY_VERSION)
 PERL_JSON_TINY_LICENSE = Artistic-2.0
 PERL_JSON_TINY_LICENSE_FILES = LICENSE
 PERL_JSON_TINY_DISTNAME = JSON-Tiny
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index 6c4bd2980..f72c74d84 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -7,6 +7,7 @@
 PERL_LIBWWW_PERL_VERSION = 6.67
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
+PERL_LIBWWW_PERL_PURL = pkg:cpan/OALDERS/libwww-perl@$(PERL_LIBWWW_PERL_VERSION)
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LIBWWW_PERL_LICENSE_FILES = LICENSE
 PERL_LIBWWW_PERL_DISTNAME = libwww-perl
diff --git a/package/perl-locale-maketext-lexicon/perl-locale-maketext-lexicon.mk b/package/perl-locale-maketext-lexicon/perl-locale-maketext-lexicon.mk
index 64b37f920..ec9e52e19 100644
--- a/package/perl-locale-maketext-lexicon/perl-locale-maketext-lexicon.mk
+++ b/package/perl-locale-maketext-lexicon/perl-locale-maketext-lexicon.mk
@@ -7,6 +7,7 @@
 PERL_LOCALE_MAKETEXT_LEXICON_VERSION = 1.00
 PERL_LOCALE_MAKETEXT_LEXICON_SOURCE = Locale-Maketext-Lexicon-$(PERL_LOCALE_MAKETEXT_LEXICON_VERSION).tar.gz
 PERL_LOCALE_MAKETEXT_LEXICON_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DR/DRTECH
+PERL_LOCALE_MAKETEXT_LEXICON_PURL = pkg:cpan/DRTECH/Locale-Maketext-Lexicon@$(PERL_LOCALE_MAKETEXT_LEXICON_VERSION)
 PERL_LOCALE_MAKETEXT_LEXICON_LICENSE = MIT
 PERL_LOCALE_MAKETEXT_LEXICON_LICENSE_FILES = LICENSE
 PERL_LOCALE_MAKETEXT_LEXICON_DISTNAME = Locale-Maketext-Lexicon
diff --git a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
index 687a84427..64b43620b 100644
--- a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
+++ b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
@@ -7,6 +7,7 @@
 PERL_LWP_MEDIATYPES_VERSION = 6.04
 PERL_LWP_MEDIATYPES_SOURCE = LWP-MediaTypes-$(PERL_LWP_MEDIATYPES_VERSION).tar.gz
 PERL_LWP_MEDIATYPES_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
+PERL_LWP_MEDIATYPES_PURL = pkg:cpan/OALDERS/LWP-MediaTypes@$(PERL_LWP_MEDIATYPES_VERSION)
 PERL_LWP_MEDIATYPES_LICENSE = Artistic or GPL-1.0+
 PERL_LWP_MEDIATYPES_LICENSE_FILES = LICENSE
 PERL_LWP_MEDIATYPES_DISTNAME = LWP-MediaTypes
diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
index a2048e25a..02cfbf554 100644
--- a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
@@ -7,6 +7,7 @@
 PERL_LWP_PROTOCOL_HTTPS_VERSION = 6.12
 PERL_LWP_PROTOCOL_HTTPS_SOURCE = LWP-Protocol-https-$(PERL_LWP_PROTOCOL_HTTPS_VERSION).tar.gz
 PERL_LWP_PROTOCOL_HTTPS_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
+PERL_LWP_PROTOCOL_HTTPS_PURL = pkg:cpan/OALDERS/LWP-Protocol-https@$(PERL_LWP_PROTOCOL_HTTPS_VERSION)
 PERL_LWP_PROTOCOL_HTTPS_LICENSE = Artistic-1.0-Perl or GPL-1.0+
 PERL_LWP_PROTOCOL_HTTPS_LICENSE_FILES = LICENSE
 PERL_LWP_PROTOCOL_HTTPS_CPE_ID_VENDOR = lwp\:\:protocol\:\:https_project
diff --git a/package/perl-mail-dkim/perl-mail-dkim.mk b/package/perl-mail-dkim/perl-mail-dkim.mk
index 4f4d86ee1..88967f46e 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.mk
+++ b/package/perl-mail-dkim/perl-mail-dkim.mk
@@ -7,6 +7,7 @@
 PERL_MAIL_DKIM_VERSION = 1.20230630
 PERL_MAIL_DKIM_SOURCE = Mail-DKIM-$(PERL_MAIL_DKIM_VERSION).tar.gz
 PERL_MAIL_DKIM_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MB/MBRADSHAW
+PERL_MAIL_DKIM_PURL = pkg:cpan/MBRADSHAW/Mail-DKIM@$(PERL_MAIL_DKIM_VERSION)
 PERL_MAIL_DKIM_LICENSE = Artistic or GPL-1.0+
 PERL_MAIL_DKIM_LICENSE_FILES = LICENSE
 PERL_MAIL_DKIM_DISTNAME = Mail-DKIM
diff --git a/package/perl-mailtools/perl-mailtools.mk b/package/perl-mailtools/perl-mailtools.mk
index 900ee41ff..262430df6 100644
--- a/package/perl-mailtools/perl-mailtools.mk
+++ b/package/perl-mailtools/perl-mailtools.mk
@@ -7,6 +7,7 @@
 PERL_MAILTOOLS_VERSION = 2.21
 PERL_MAILTOOLS_SOURCE = MailTools-$(PERL_MAILTOOLS_VERSION).tar.gz
 PERL_MAILTOOLS_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MA/MARKOV
+PERL_MAILTOOLS_PURL = pkg:cpan/MARKOV/MailTools@$(PERL_MAILTOOLS_VERSION)
 PERL_MAILTOOLS_LICENSE = Artistic or GPL-1.0+
 PERL_MAILTOOLS_LICENSE_FILES = README
 PERL_MAILTOOLS_DISTNAME = MailTools
diff --git a/package/perl-math-int64/perl-math-int64.mk b/package/perl-math-int64/perl-math-int64.mk
index c0abcf48a..82107ad0f 100644
--- a/package/perl-math-int64/perl-math-int64.mk
+++ b/package/perl-math-int64/perl-math-int64.mk
@@ -7,6 +7,7 @@
 PERL_MATH_INT64_VERSION = 0.57
 PERL_MATH_INT64_SOURCE = Math-Int64-$(PERL_MATH_INT64_VERSION).tar.gz
 PERL_MATH_INT64_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SA/SALVA
+PERL_MATH_INT64_PURL = pkg:cpan/SALVA/Math-Int64@$(PERL_MATH_INT64_VERSION)
 PERL_MATH_INT64_LICENSE = Artistic or GPL-1.0+
 PERL_MATH_INT64_LICENSE_FILES = COPYING
 PERL_MATH_INT64_DISTNAME = Math-Int64
diff --git a/package/perl-math-prime-util/perl-math-prime-util.mk b/package/perl-math-prime-util/perl-math-prime-util.mk
index 5781fe75d..b5e94e64f 100644
--- a/package/perl-math-prime-util/perl-math-prime-util.mk
+++ b/package/perl-math-prime-util/perl-math-prime-util.mk
@@ -7,6 +7,7 @@
 PERL_MATH_PRIME_UTIL_VERSION = 0.73
 PERL_MATH_PRIME_UTIL_SOURCE = Math-Prime-Util-$(PERL_MATH_PRIME_UTIL_VERSION).tar.gz
 PERL_MATH_PRIME_UTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DANAJ
+PERL_MATH_PRIME_UTIL_PURL = pkg:cpan/DANAJ/Math-Prime-Util@$(PERL_MATH_PRIME_UTIL_VERSION)
 PERL_MATH_PRIME_UTIL_LICENSE = Artistic or GPL-1.0+
 PERL_MATH_PRIME_UTIL_LICENSE_FILES = LICENSE
 PERL_MATH_PRIME_UTIL_DISTNAME = Math-Prime-Util
diff --git a/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk b/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk
index 1a6a36eea..18399d76c 100644
--- a/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk
+++ b/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk
@@ -7,6 +7,7 @@
 PERL_MIME_BASE64_URLSAFE_VERSION = 0.01
 PERL_MIME_BASE64_URLSAFE_SOURCE = MIME-Base64-URLSafe-$(PERL_MIME_BASE64_URLSAFE_VERSION).tar.gz
 PERL_MIME_BASE64_URLSAFE_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZUHO
+PERL_MIME_BASE64_URLSAFE_PURL = pkg:cpan/KAZUHO/MIME-Base64-URLSafe@$(PERL_MIME_BASE64_URLSAFE_VERSION)
 PERL_MIME_BASE64_URLSAFE_LICENSE = Artistic or GPL-1.0+
 PERL_MIME_BASE64_URLSAFE_LICENSE_FILES = README
 PERL_MIME_BASE64_URLSAFE_DISTNAME = MIME-Base64-URLSafe
diff --git a/package/perl-mime-tools/perl-mime-tools.mk b/package/perl-mime-tools/perl-mime-tools.mk
index 10279d730..1edcc30ff 100644
--- a/package/perl-mime-tools/perl-mime-tools.mk
+++ b/package/perl-mime-tools/perl-mime-tools.mk
@@ -7,6 +7,7 @@
 PERL_MIME_TOOLS_VERSION = 5.509
 PERL_MIME_TOOLS_SOURCE = MIME-tools-$(PERL_MIME_TOOLS_VERSION).tar.gz
 PERL_MIME_TOOLS_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DS/DSKOLL
+PERL_MIME_TOOLS_PURL = pkg:cpan/DSKOLL/MIME-tools@$(PERL_MIME_TOOLS_VERSION)
 PERL_MIME_TOOLS_LICENSE = Artistic or GPL-1.0+
 PERL_MIME_TOOLS_LICENSE_FILES = COPYING
 PERL_MIME_TOOLS_DISTNAME = MIME-tools
diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.mk b/package/perl-module-build-tiny/perl-module-build-tiny.mk
index e2e3d83e7..564eeca15 100644
--- a/package/perl-module-build-tiny/perl-module-build-tiny.mk
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.mk
@@ -7,6 +7,7 @@
 PERL_MODULE_BUILD_TINY_VERSION = 0.047
 PERL_MODULE_BUILD_TINY_SOURCE = Module-Build-Tiny-$(PERL_MODULE_BUILD_TINY_VERSION).tar.gz
 PERL_MODULE_BUILD_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
+PERL_MODULE_BUILD_TINY_PURL = pkg:cpan/LEONT/Module-Build-Tiny@$(PERL_MODULE_BUILD_TINY_VERSION)
 HOST_PERL_MODULE_BUILD_TINY_DEPENDENCIES = \
 	host-perl-extutils-config \
 	host-perl-extutils-helpers \
diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
index 972902e04..d5345ffc8 100644
--- a/package/perl-module-build/perl-module-build.mk
+++ b/package/perl-module-build/perl-module-build.mk
@@ -7,6 +7,7 @@
 PERL_MODULE_BUILD_VERSION = 0.4234
 PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
 PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
+PERL_MODULE_BUILD_PURL = pkg:cpan/LEONT/Module-Build@$(PERL_MODULE_BUILD_VERSION)
 PERL_MODULE_BUILD_LICENSE = Artistic or GPL-1.0+
 PERL_MODULE_BUILD_LICENSE_FILES = LICENSE
 PERL_MODULE_BUILD_DISTNAME = Module-Build
diff --git a/package/perl-module-implementation/perl-module-implementation.mk b/package/perl-module-implementation/perl-module-implementation.mk
index 7cf7cbb21..0da88e283 100644
--- a/package/perl-module-implementation/perl-module-implementation.mk
+++ b/package/perl-module-implementation/perl-module-implementation.mk
@@ -7,6 +7,7 @@
 PERL_MODULE_IMPLEMENTATION_VERSION = 0.09
 PERL_MODULE_IMPLEMENTATION_SOURCE = Module-Implementation-$(PERL_MODULE_IMPLEMENTATION_VERSION).tar.gz
 PERL_MODULE_IMPLEMENTATION_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DR/DROLSKY
+PERL_MODULE_IMPLEMENTATION_PURL = pkg:cpan/DROLSKY/Module-Implementation@$(PERL_MODULE_IMPLEMENTATION_VERSION)
 PERL_MODULE_IMPLEMENTATION_LICENSE = Artistic-2.0
 PERL_MODULE_IMPLEMENTATION_LICENSE_FILES = LICENSE
 PERL_MODULE_IMPLEMENTATION_DISTNAME = Module-Implementation
diff --git a/package/perl-module-runtime/perl-module-runtime.mk b/package/perl-module-runtime/perl-module-runtime.mk
index dcf045cf1..c936d6a61 100644
--- a/package/perl-module-runtime/perl-module-runtime.mk
+++ b/package/perl-module-runtime/perl-module-runtime.mk
@@ -7,6 +7,7 @@
 PERL_MODULE_RUNTIME_VERSION = 0.016
 PERL_MODULE_RUNTIME_SOURCE = Module-Runtime-$(PERL_MODULE_RUNTIME_VERSION).tar.gz
 PERL_MODULE_RUNTIME_SITE = $(BR2_CPAN_MIRROR)/authors/id/Z/ZE/ZEFRAM
+PERL_MODULE_RUNTIME_PURL = pkg:cpan/ZEFRAM/Module-Runtime@$(PERL_MODULE_RUNTIME_VERSION)
 PERL_MODULE_RUNTIME_DEPENDENCIES = host-perl-module-build
 PERL_MODULE_RUNTIME_LICENSE = Artistic or GPL-1.0+
 PERL_MODULE_RUNTIME_LICENSE_FILES = README
diff --git a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
index 1d5e2511f..1a281e202 100644
--- a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
+++ b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
@@ -7,6 +7,7 @@
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION = 1.39
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_SOURCE = Mojolicious-Plugin-Authentication-$(PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION).tar.gz
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JJ/JJATRIA
+PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_PURL = pkg:cpan/JJATRIA/Mojolicious-Plugin-Authentication@$(PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION)
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_LICENSE = Artistic or GPL-1.0+
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_LICENSE_FILES = LICENSE
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_DISTNAME = Mojolicious-Plugin-Authentication
diff --git a/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.mk b/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.mk
index f136be3ba..2b692677e 100644
--- a/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.mk
+++ b/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.mk
@@ -7,6 +7,7 @@
 PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_VERSION = 1.06
 PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_SOURCE = Mojolicious-Plugin-Authorization-$(PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_VERSION).tar.gz
 PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BY/BYTEROCK
+PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_PURL = pkg:cpan/BYTEROCK/Mojolicious-Plugin-Authorization@$(PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_VERSION)
 PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_DEPENDENCIES = host-perl-module-build
 PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_LICENSE = Artistic or GPL-1.0+
 PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_LICENSE_FILES = LICENSE
diff --git a/package/perl-mojolicious-plugin-cspheader/perl-mojolicious-plugin-cspheader.mk b/package/perl-mojolicious-plugin-cspheader/perl-mojolicious-plugin-cspheader.mk
index 438d6d517..dd339c73c 100644
--- a/package/perl-mojolicious-plugin-cspheader/perl-mojolicious-plugin-cspheader.mk
+++ b/package/perl-mojolicious-plugin-cspheader/perl-mojolicious-plugin-cspheader.mk
@@ -7,6 +7,7 @@
 PERL_MOJOLICIOUS_PLUGIN_CSPHEADER_VERSION = 0.06
 PERL_MOJOLICIOUS_PLUGIN_CSPHEADER_SOURCE = Mojolicious-Plugin-CSPHeader-$(PERL_MOJOLICIOUS_PLUGIN_CSPHEADER_VERSION).tar.gz
 PERL_MOJOLICIOUS_PLUGIN_CSPHEADER_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LD/LDIDRY
+PERL_MOJOLICIOUS_PLUGIN_CSPHEADER_PURL = pkg:cpan/LDIDRY/Mojolicious-Plugin-CSPHeader@$(PERL_MOJOLICIOUS_PLUGIN_CSPHEADER_VERSION)
 PERL_MOJOLICIOUS_PLUGIN_CSPHEADER_LICENSE = Artistic or GPL-1.0+
 PERL_MOJOLICIOUS_PLUGIN_CSPHEADER_LICENSE_FILES = LICENSE
 PERL_MOJOLICIOUS_PLUGIN_CSPHEADER_DISTNAME = Mojolicious-Plugin-CSPHeader
diff --git a/package/perl-mojolicious-plugin-i18n/perl-mojolicious-plugin-i18n.mk b/package/perl-mojolicious-plugin-i18n/perl-mojolicious-plugin-i18n.mk
index 11d41ac55..2682b7d79 100644
--- a/package/perl-mojolicious-plugin-i18n/perl-mojolicious-plugin-i18n.mk
+++ b/package/perl-mojolicious-plugin-i18n/perl-mojolicious-plugin-i18n.mk
@@ -7,6 +7,7 @@
 PERL_MOJOLICIOUS_PLUGIN_I18N_VERSION = 1.6
 PERL_MOJOLICIOUS_PLUGIN_I18N_SOURCE = Mojolicious-Plugin-I18N-$(PERL_MOJOLICIOUS_PLUGIN_I18N_VERSION).tar.gz
 PERL_MOJOLICIOUS_PLUGIN_I18N_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHARIFULN
+PERL_MOJOLICIOUS_PLUGIN_I18N_PURL = pkg:cpan/SHARIFULN/Mojolicious-Plugin-I18N@$(PERL_MOJOLICIOUS_PLUGIN_I18N_VERSION)
 PERL_MOJOLICIOUS_PLUGIN_I18N_DEPENDENCIES = host-perl-module-build
 PERL_MOJOLICIOUS_PLUGIN_I18N_LICENSE = Artistic-2.0
 PERL_MOJOLICIOUS_PLUGIN_I18N_LICENSE_FILES = README.pod
diff --git a/package/perl-mojolicious-plugin-securityheader/perl-mojolicious-plugin-securityheader.mk b/package/perl-mojolicious-plugin-securityheader/perl-mojolicious-plugin-securityheader.mk
index 1f287f6f6..638cdb034 100644
--- a/package/perl-mojolicious-plugin-securityheader/perl-mojolicious-plugin-securityheader.mk
+++ b/package/perl-mojolicious-plugin-securityheader/perl-mojolicious-plugin-securityheader.mk
@@ -7,6 +7,7 @@
 PERL_MOJOLICIOUS_PLUGIN_SECURITYHEADER_VERSION = 0.07
 PERL_MOJOLICIOUS_PLUGIN_SECURITYHEADER_SOURCE = Mojolicious-Plugin-SecurityHeader-$(PERL_MOJOLICIOUS_PLUGIN_SECURITYHEADER_VERSION).tar.gz
 PERL_MOJOLICIOUS_PLUGIN_SECURITYHEADER_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RE/RENEEB
+PERL_MOJOLICIOUS_PLUGIN_SECURITYHEADER_PURL = pkg:cpan/RENEEB/Mojolicious-Plugin-SecurityHeader@$(PERL_MOJOLICIOUS_PLUGIN_SECURITYHEADER_VERSION)
 PERL_MOJOLICIOUS_PLUGIN_SECURITYHEADER_LICENSE = Artistic-2.0
 PERL_MOJOLICIOUS_PLUGIN_SECURITYHEADER_LICENSE_FILES = LICENSE
 PERL_MOJOLICIOUS_PLUGIN_SECURITYHEADER_DISTNAME = Mojolicious-Plugin-SecurityHeader
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 4657d2792..1d7a660fd 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -7,6 +7,7 @@
 PERL_MOJOLICIOUS_VERSION = 9.35
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
+PERL_MOJOLICIOUS_PURL = pkg:cpan/SRI/Mojolicious@$(PERL_MOJOLICIOUS_VERSION)
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
 PERL_MOJOLICIOUS_LICENSE_FILES = LICENSE
 PERL_MOJOLICIOUS_DISTNAME = Mojolicious
diff --git a/package/perl-moo/perl-moo.mk b/package/perl-moo/perl-moo.mk
index 18e32688e..e7ef3da61 100644
--- a/package/perl-moo/perl-moo.mk
+++ b/package/perl-moo/perl-moo.mk
@@ -7,6 +7,7 @@
 PERL_MOO_VERSION = 2.005005
 PERL_MOO_SOURCE = Moo-$(PERL_MOO_VERSION).tar.gz
 PERL_MOO_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
+PERL_MOO_PURL = pkg:cpan/HAARG/Moo@$(PERL_MOO_VERSION)
 PERL_MOO_LICENSE = Artistic or GPL-1.0+
 PERL_MOO_LICENSE_FILES = LICENSE
 PERL_MOO_DISTNAME = Moo
diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.mk b/package/perl-mozilla-ca/perl-mozilla-ca.mk
index 92fb3cec6..8336de3a7 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.mk
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.mk
@@ -7,6 +7,7 @@
 PERL_MOZILLA_CA_VERSION = 20231213
 PERL_MOZILLA_CA_SOURCE = Mozilla-CA-$(PERL_MOZILLA_CA_VERSION).tar.gz
 PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LW/LWP
+PERL_MOZILLA_CA_PURL = pkg:cpan/LWP/Mozilla-CA@$(PERL_MOZILLA_CA_VERSION)
 PERL_MOZILLA_CA_LICENSE = MPL-2.0
 PERL_MOZILLA_CA_LICENSE_FILES = README
 PERL_MOZILLA_CA_DISTNAME = Mozilla-CA
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index 5b6c1ba1d..b58e2d98b 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -7,6 +7,7 @@
 PERL_NET_DNS_VERSION = 1.42
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
+PERL_NET_DNS_PURL = pkg:cpan/NLNETLABS/Net-DNS@$(PERL_NET_DNS_VERSION)
 PERL_NET_DNS_LICENSE = MIT
 PERL_NET_DNS_LICENSE_FILES = LICENSE
 PERL_NET_DNS_DISTNAME = Net-DNS
diff --git a/package/perl-net-http/perl-net-http.mk b/package/perl-net-http/perl-net-http.mk
index 08e81f95a..b72340028 100644
--- a/package/perl-net-http/perl-net-http.mk
+++ b/package/perl-net-http/perl-net-http.mk
@@ -7,6 +7,7 @@
 PERL_NET_HTTP_VERSION = 6.23
 PERL_NET_HTTP_SOURCE = Net-HTTP-$(PERL_NET_HTTP_VERSION).tar.gz
 PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
+PERL_NET_HTTP_PURL = pkg:cpan/OALDERS/Net-HTTP@$(PERL_NET_HTTP_VERSION)
 PERL_NET_HTTP_LICENSE = Artistic or GPL-1.0+
 PERL_NET_HTTP_LICENSE_FILES = LICENSE
 PERL_NET_HTTP_DISTNAME = Net-HTTP
diff --git a/package/perl-net-snmp/perl-net-snmp.mk b/package/perl-net-snmp/perl-net-snmp.mk
index 36b50d635..37189e1c5 100644
--- a/package/perl-net-snmp/perl-net-snmp.mk
+++ b/package/perl-net-snmp/perl-net-snmp.mk
@@ -7,6 +7,7 @@
 PERL_NET_SNMP_VERSION = 6.0.1
 PERL_NET_SNMP_SOURCE = Net-SNMP-v$(PERL_NET_SNMP_VERSION).tar.gz
 PERL_NET_SNMP_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DT/DTOWN
+PERL_NET_SNMP_PURL = pkg:cpan/DTOWN/Net-SNMP@$(PERL_NET_SNMP_VERSION)
 PERL_NET_SNMP_DEPENDENCIES = host-perl-module-build
 PERL_NET_SNMP_LICENSE = Artistic or GPL-1.0+
 PERL_NET_SNMP_LICENSE_FILES = LICENSE
diff --git a/package/perl-net-ssh2/perl-net-ssh2.mk b/package/perl-net-ssh2/perl-net-ssh2.mk
index 20e45b628..4efb8c9ab 100644
--- a/package/perl-net-ssh2/perl-net-ssh2.mk
+++ b/package/perl-net-ssh2/perl-net-ssh2.mk
@@ -7,6 +7,7 @@
 PERL_NET_SSH2_VERSION = 0.72
 PERL_NET_SSH2_SOURCE = Net-SSH2-$(PERL_NET_SSH2_VERSION).tar.gz
 PERL_NET_SSH2_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SA/SALVA
+PERL_NET_SSH2_PURL = pkg:cpan/RKITOVER/Net-SSH2@$(PERL_NET_SSH2_VERSION)
 PERL_NET_SSH2_LICENSE = Artistic or GPL-1.0+
 PERL_NET_SSH2_LICENSE_FILES = README.pod
 PERL_NET_SSH2_DEPENDENCIES = libssh2 zlib
diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index 8b7b2b973..0843ca2e8 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -7,6 +7,7 @@
 PERL_NET_SSLEAY_VERSION = 1.93_01
 PERL_NET_SSLEAY_SOURCE = Net-SSLeay-$(PERL_NET_SSLEAY_VERSION).tar.gz
 PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CH/CHRISN
+PERL_NET_SSLEAY_PURL = pkg:cpan/CHRISN/Net-SSLeay@$(PERL_NET_SSLEAY_VERSION)
 PERL_NET_SSLEAY_DEPENDENCIES = openssl
 PERL_NET_SSLEAY_LICENSE = Artistic-2.0
 PERL_NET_SSLEAY_LICENSE_FILES = LICENSE
diff --git a/package/perl-net-telnet/perl-net-telnet.mk b/package/perl-net-telnet/perl-net-telnet.mk
index ec3c02216..2ec97fd10 100644
--- a/package/perl-net-telnet/perl-net-telnet.mk
+++ b/package/perl-net-telnet/perl-net-telnet.mk
@@ -7,6 +7,7 @@
 PERL_NET_TELNET_VERSION = 3.05
 PERL_NET_TELNET_SOURCE = Net-Telnet-$(PERL_NET_TELNET_VERSION).tar.gz
 PERL_NET_TELNET_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JR/JROGERS
+PERL_NET_TELNET_PURL = pkg:cpan/JROGERS/Net-Telnet@$(PERL_NET_TELNET_VERSION)
 PERL_NET_TELNET_LICENSE = Artistic or GPL-1.0+
 PERL_NET_TELNET_LICENSE_FILES = README
 PERL_NET_TELNET_DISTNAME = Net-Telnet
diff --git a/package/perl-netaddr-ip/perl-netaddr-ip.mk b/package/perl-netaddr-ip/perl-netaddr-ip.mk
index c4885715b..e3f904543 100644
--- a/package/perl-netaddr-ip/perl-netaddr-ip.mk
+++ b/package/perl-netaddr-ip/perl-netaddr-ip.mk
@@ -7,6 +7,7 @@
 PERL_NETADDR_IP_VERSION = 4.079
 PERL_NETADDR_IP_SOURCE = NetAddr-IP-$(PERL_NETADDR_IP_VERSION).tar.gz
 PERL_NETADDR_IP_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKER
+PERL_NETADDR_IP_PURL = pkg:cpan/MIKER/NetAddr-IP@$(PERL_NETADDR_IP_VERSION)
 PERL_NETADDR_IP_LICENSE = Artistic or GPL-1.0+
 PERL_NETADDR_IP_LICENSE_FILES = Artistic Copying
 PERL_NETADDR_IP_DISTNAME = NetAddr-IP
diff --git a/package/perl-number-bytes-human/perl-number-bytes-human.mk b/package/perl-number-bytes-human/perl-number-bytes-human.mk
index d2d712f8f..6d47e9c2e 100644
--- a/package/perl-number-bytes-human/perl-number-bytes-human.mk
+++ b/package/perl-number-bytes-human/perl-number-bytes-human.mk
@@ -7,6 +7,7 @@
 PERL_NUMBER_BYTES_HUMAN_VERSION = 0.11
 PERL_NUMBER_BYTES_HUMAN_SOURCE = Number-Bytes-Human-$(PERL_NUMBER_BYTES_HUMAN_VERSION).tar.gz
 PERL_NUMBER_BYTES_HUMAN_SITE = $(BR2_CPAN_MIRROR)/authors/id/F/FE/FERREIRA
+PERL_NUMBER_BYTES_HUMAN_PURL = pkg:cpan/FERREIRA/Number-Bytes-Human@$(PERL_NUMBER_BYTES_HUMAN_VERSION)
 PERL_NUMBER_BYTES_HUMAN_LICENSE = Artistic or GPL-1.0+
 PERL_NUMBER_BYTES_HUMAN_LICENSE_FILES = README
 PERL_NUMBER_BYTES_HUMAN_DISTNAME = Number-Bytes-Human
diff --git a/package/perl-package-stash/perl-package-stash.mk b/package/perl-package-stash/perl-package-stash.mk
index dd93314d8..ce76290a9 100644
--- a/package/perl-package-stash/perl-package-stash.mk
+++ b/package/perl-package-stash/perl-package-stash.mk
@@ -7,6 +7,7 @@
 PERL_PACKAGE_STASH_VERSION = 0.40
 PERL_PACKAGE_STASH_SOURCE = Package-Stash-$(PERL_PACKAGE_STASH_VERSION).tar.gz
 PERL_PACKAGE_STASH_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
+PERL_PACKAGE_STASH_PURL = pkg:cpan/ETHER/Package-Stash@$(PERL_PACKAGE_STASH_VERSION)
 PERL_PACKAGE_STASH_LICENSE = Artistic or GPL-1.0+
 PERL_PACKAGE_STASH_LICENSE_FILES = LICENSE
 PERL_PACKAGE_STASH_DISTNAME = Package-Stash
diff --git a/package/perl-params-util/perl-params-util.mk b/package/perl-params-util/perl-params-util.mk
index 8c2a960c4..4a40541f2 100644
--- a/package/perl-params-util/perl-params-util.mk
+++ b/package/perl-params-util/perl-params-util.mk
@@ -7,6 +7,7 @@
 PERL_PARAMS_UTIL_VERSION = 1.102
 PERL_PARAMS_UTIL_SOURCE = Params-Util-$(PERL_PARAMS_UTIL_VERSION).tar.gz
 PERL_PARAMS_UTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RE/REHSACK
+PERL_PARAMS_UTIL_PURL = pkg:cpan/REHSACK/Params-Util@$(PERL_PARAMS_UTIL_VERSION)
 PERL_PARAMS_UTIL_LICENSE = Artistic or GPL-1.0+
 PERL_PARAMS_UTIL_LICENSE_FILES = ARTISTIC-1.0 GPL-1 LICENSE
 PERL_PARAMS_UTIL_DISTNAME = Params-Util
diff --git a/package/perl-parse-yapp/perl-parse-yapp.mk b/package/perl-parse-yapp/perl-parse-yapp.mk
index 12f05efe0..4a93c2389 100644
--- a/package/perl-parse-yapp/perl-parse-yapp.mk
+++ b/package/perl-parse-yapp/perl-parse-yapp.mk
@@ -7,6 +7,7 @@
 PERL_PARSE_YAPP_VERSION = 1.21
 PERL_PARSE_YAPP_SOURCE = Parse-Yapp-$(PERL_PARSE_YAPP_VERSION).tar.gz
 PERL_PARSE_YAPP_SITE = $(BR2_CPAN_MIRROR)/authors/id/W/WB/WBRASWELL
+PERL_PARSE_YAPP_PURL = pkg:cpan/WBRASWELL/Parse-Yapp@$(PERL_PARSE_YAPP_VERSION)
 PERL_PARSE_YAPP_LICENSE = Artistic or GPL-1.0+
 PERL_PARSE_YAPP_LICENSE_FILES = lib/Parse/Yapp.pm
 PERL_PARSE_YAPP_DISTNAME = Parse-Yapp
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
index 6d784a0d1..2150b8f36 100644
--- a/package/perl-path-tiny/perl-path-tiny.mk
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -7,6 +7,7 @@
 PERL_PATH_TINY_VERSION = 0.144
 PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
 PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
+PERL_PATH_TINY_PURL = pkg:cpan/DAGOLDEN/Path-Tiny@$(PERL_PATH_TINY_VERSION)
 PERL_PATH_TINY_LICENSE = Apache-2.0
 PERL_PATH_TINY_LICENSE_FILES = LICENSE
 PERL_PATH_TINY_DISTNAME = Path-Tiny
diff --git a/package/perl-plack/perl-plack.mk b/package/perl-plack/perl-plack.mk
index 2c591cc05..46801e093 100644
--- a/package/perl-plack/perl-plack.mk
+++ b/package/perl-plack/perl-plack.mk
@@ -7,6 +7,7 @@
 PERL_PLACK_VERSION = 1.0051
 PERL_PLACK_SOURCE = Plack-$(PERL_PLACK_VERSION).tar.gz
 PERL_PLACK_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
+PERL_PLACK_PURL = pkg:cpan/MIYAGAWA/Plack@$(PERL_PLACK_VERSION)
 PERL_PLACK_DEPENDENCIES = host-perl-file-sharedir-install
 PERL_PLACK_LICENSE = Artistic or GPL-1.0+
 PERL_PLACK_LICENSE_FILES = LICENSE
diff --git a/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk b/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk
index f7f6745ec..2ea00c47d 100644
--- a/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk
+++ b/package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk
@@ -7,6 +7,7 @@
 PERL_POSIX_STRFTIME_COMPILER_VERSION = 0.46
 PERL_POSIX_STRFTIME_COMPILER_SOURCE = POSIX-strftime-Compiler-$(PERL_POSIX_STRFTIME_COMPILER_VERSION).tar.gz
 PERL_POSIX_STRFTIME_COMPILER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
+PERL_POSIX_STRFTIME_COMPILER_PURL = pkg:cpan/KAZEBURO/POSIX-strftime-Compiler@$(PERL_POSIX_STRFTIME_COMPILER_VERSION)
 PERL_POSIX_STRFTIME_COMPILER_DEPENDENCIES = host-perl-module-build-tiny
 PERL_POSIX_STRFTIME_COMPILER_LICENSE = Artistic or GPL-1.0+
 PERL_POSIX_STRFTIME_COMPILER_LICENSE_FILES = LICENSE
diff --git a/package/perl-role-tiny/perl-role-tiny.mk b/package/perl-role-tiny/perl-role-tiny.mk
index 64d5085fa..44a6a027c 100644
--- a/package/perl-role-tiny/perl-role-tiny.mk
+++ b/package/perl-role-tiny/perl-role-tiny.mk
@@ -7,6 +7,7 @@
 PERL_ROLE_TINY_VERSION = 2.002004
 PERL_ROLE_TINY_SOURCE = Role-Tiny-$(PERL_ROLE_TINY_VERSION).tar.gz
 PERL_ROLE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
+PERL_ROLE_TINY_PURL = pkg:cpan/HAARG/Role-Tiny@$(PERL_ROLE_TINY_VERSION)
 PERL_ROLE_TINY_LICENSE = Artistic or GPL-1.0+
 PERL_ROLE_TINY_LICENSE_FILES = LICENSE
 PERL_ROLE_TINY_DISTNAME = Role-Tiny
diff --git a/package/perl-stream-buffered/perl-stream-buffered.mk b/package/perl-stream-buffered/perl-stream-buffered.mk
index 63aa1a246..d59f1a694 100644
--- a/package/perl-stream-buffered/perl-stream-buffered.mk
+++ b/package/perl-stream-buffered/perl-stream-buffered.mk
@@ -7,6 +7,7 @@
 PERL_STREAM_BUFFERED_VERSION = 0.03
 PERL_STREAM_BUFFERED_SOURCE = Stream-Buffered-$(PERL_STREAM_BUFFERED_VERSION).tar.gz
 PERL_STREAM_BUFFERED_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DO/DOY
+PERL_STREAM_BUFFERED_PURL = pkg:cpan/DOY/Stream-Buffered@$(PERL_STREAM_BUFFERED_VERSION)
 PERL_STREAM_BUFFERED_LICENSE = Artistic or GPL-1.0+
 PERL_STREAM_BUFFERED_LICENSE_FILES = LICENSE
 PERL_STREAM_BUFFERED_DISTNAME = Stream-Buffered
diff --git a/package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.mk b/package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.mk
index 22fc29d5b..67d3a2e37 100644
--- a/package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.mk
+++ b/package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.mk
@@ -7,6 +7,7 @@
 PERL_SUB_EXPORTER_PROGRESSIVE_VERSION = 0.001013
 PERL_SUB_EXPORTER_PROGRESSIVE_SOURCE = Sub-Exporter-Progressive-$(PERL_SUB_EXPORTER_PROGRESSIVE_VERSION).tar.gz
 PERL_SUB_EXPORTER_PROGRESSIVE_SITE = $(BR2_CPAN_MIRROR)/authors/id/F/FR/FREW
+PERL_SUB_EXPORTER_PROGRESSIVE_PURL = pkg:cpan/FREW/Sub-Exporter-Progressive@$(PERL_SUB_EXPORTER_PROGRESSIVE_VERSION)
 PERL_SUB_EXPORTER_PROGRESSIVE_LICENSE = Artistic or GPL-1.0+
 PERL_SUB_EXPORTER_PROGRESSIVE_LICENSE_FILES = LICENSE
 PERL_SUB_EXPORTER_PROGRESSIVE_DISTNAME = Sub-Exporter-Progressive
diff --git a/package/perl-sub-install/perl-sub-install.mk b/package/perl-sub-install/perl-sub-install.mk
index 5e02a37eb..6007a395c 100644
--- a/package/perl-sub-install/perl-sub-install.mk
+++ b/package/perl-sub-install/perl-sub-install.mk
@@ -7,6 +7,7 @@
 PERL_SUB_INSTALL_VERSION = 0.929
 PERL_SUB_INSTALL_SOURCE = Sub-Install-$(PERL_SUB_INSTALL_VERSION).tar.gz
 PERL_SUB_INSTALL_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
+PERL_SUB_INSTALL_PURL = pkg:cpan/RJBS/Sub-Install@$(PERL_SUB_INSTALL_VERSION)
 PERL_SUB_INSTALL_LICENSE = Artistic or GPL-1.0+
 PERL_SUB_INSTALL_LICENSE_FILES = LICENSE
 PERL_SUB_INSTALL_DISTNAME = Sub-Install
diff --git a/package/perl-sub-quote/perl-sub-quote.mk b/package/perl-sub-quote/perl-sub-quote.mk
index 3c2a25be5..a949e140a 100644
--- a/package/perl-sub-quote/perl-sub-quote.mk
+++ b/package/perl-sub-quote/perl-sub-quote.mk
@@ -7,6 +7,7 @@
 PERL_SUB_QUOTE_VERSION = 2.006008
 PERL_SUB_QUOTE_SOURCE = Sub-Quote-$(PERL_SUB_QUOTE_VERSION).tar.gz
 PERL_SUB_QUOTE_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
+PERL_SUB_QUOTE_PURL = pkg:cpan/HAARG/Sub-Quote@$(PERL_SUB_QUOTE_VERSION)
 PERL_SUB_QUOTE_LICENSE = Artistic or GPL-1.0+
 PERL_SUB_QUOTE_LICENSE_FILES = LICENSE
 PERL_SUB_QUOTE_DISTNAME = Sub-Quote
diff --git a/package/perl-sys-meminfo/perl-sys-meminfo.mk b/package/perl-sys-meminfo/perl-sys-meminfo.mk
index e70dd73af..a566ea067 100644
--- a/package/perl-sys-meminfo/perl-sys-meminfo.mk
+++ b/package/perl-sys-meminfo/perl-sys-meminfo.mk
@@ -7,6 +7,7 @@
 PERL_SYS_MEMINFO_VERSION = 0.99
 PERL_SYS_MEMINFO_SOURCE = Sys-MemInfo-$(PERL_SYS_MEMINFO_VERSION).tar.gz
 PERL_SYS_MEMINFO_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SC/SCRESTO
+PERL_SYS_MEMINFO_PURL = pkg:cpan/SCRESTO/Sys-MemInfo@$(PERL_SYS_MEMINFO_VERSION)
 PERL_SYS_MEMINFO_LICENSE = Artistic or GPL-1.0+
 PERL_SYS_MEMINFO_LICENSE_FILES = LICENSE
 PERL_SYS_MEMINFO_DISTNAME = Sys-MemInfo
diff --git a/package/perl-sys-mmap/perl-sys-mmap.mk b/package/perl-sys-mmap/perl-sys-mmap.mk
index 5e0814526..8ff32dc75 100644
--- a/package/perl-sys-mmap/perl-sys-mmap.mk
+++ b/package/perl-sys-mmap/perl-sys-mmap.mk
@@ -7,6 +7,7 @@
 PERL_SYS_MMAP_VERSION = 0.20
 PERL_SYS_MMAP_SOURCE = Sys-Mmap-$(PERL_SYS_MMAP_VERSION).tar.gz
 PERL_SYS_MMAP_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
+PERL_SYS_MMAP_PURL = pkg:cpan/TODDR/Sys-Mmap@$(PERL_SYS_MMAP_VERSION)
 PERL_SYS_MMAP_LICENSE = Artistic or GPL-1.0+
 PERL_SYS_MMAP_LICENSE_FILES = Artistic Copying
 PERL_SYS_MMAP_DISTNAME = Sys-Mmap
diff --git a/package/perl-time-parsedate/perl-time-parsedate.mk b/package/perl-time-parsedate/perl-time-parsedate.mk
index cba8c7b6b..37ad340b7 100644
--- a/package/perl-time-parsedate/perl-time-parsedate.mk
+++ b/package/perl-time-parsedate/perl-time-parsedate.mk
@@ -7,6 +7,7 @@
 PERL_TIME_PARSEDATE_VERSION = 2015.103
 PERL_TIME_PARSEDATE_SOURCE = Time-ParseDate-$(PERL_TIME_PARSEDATE_VERSION).tar.gz
 PERL_TIME_PARSEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MU/MUIR/modules
+PERL_TIME_PARSEDATE_PURL = pkg:cpan/MUIR/Time-ParseDate@$(PERL_TIME_PARSEDATE_VERSION)
 PERL_TIME_PARSEDATE_LICENSE = Time Parse Date License, Public Domain
 PERL_TIME_PARSEDATE_LICENSE_FILES = lib/Time/JulianDay.pm lib/Time/Timezone.pm
 PERL_TIME_PARSEDATE_DISTNAME = Time-ParseDate
diff --git a/package/perl-timedate/perl-timedate.mk b/package/perl-timedate/perl-timedate.mk
index 89a82c042..e1e5c5d77 100644
--- a/package/perl-timedate/perl-timedate.mk
+++ b/package/perl-timedate/perl-timedate.mk
@@ -7,6 +7,7 @@
 PERL_TIMEDATE_VERSION = 2.33
 PERL_TIMEDATE_SOURCE = TimeDate-$(PERL_TIMEDATE_VERSION).tar.gz
 PERL_TIMEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AT/ATOOMIC
+PERL_TIMEDATE_PURL = pkg:cpan/ATOOMIC/TimeDate@$(PERL_TIMEDATE_VERSION)
 PERL_TIMEDATE_LICENSE = Artistic or GPL-1.0+
 PERL_TIMEDATE_LICENSE_FILES = README
 PERL_TIMEDATE_DISTNAME = TimeDate
diff --git a/package/perl-try-tiny/perl-try-tiny.mk b/package/perl-try-tiny/perl-try-tiny.mk
index cd2421a3c..e5dcc924d 100644
--- a/package/perl-try-tiny/perl-try-tiny.mk
+++ b/package/perl-try-tiny/perl-try-tiny.mk
@@ -7,6 +7,7 @@
 PERL_TRY_TINY_VERSION = 0.31
 PERL_TRY_TINY_SOURCE = Try-Tiny-$(PERL_TRY_TINY_VERSION).tar.gz
 PERL_TRY_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
+PERL_TRY_TINY_PURL = pkg:cpan/ETHER/Try-Tiny@$(PERL_TRY_TINY_VERSION)
 PERL_TRY_TINY_LICENSE = MIT
 PERL_TRY_TINY_LICENSE_FILES = LICENCE
 PERL_TRY_TINY_DISTNAME = Try-Tiny
diff --git a/package/perl-type-tiny/perl-type-tiny.mk b/package/perl-type-tiny/perl-type-tiny.mk
index 31c84a263..49ab1fa9e 100644
--- a/package/perl-type-tiny/perl-type-tiny.mk
+++ b/package/perl-type-tiny/perl-type-tiny.mk
@@ -7,6 +7,7 @@
 PERL_TYPE_TINY_VERSION = 2.004000
 PERL_TYPE_TINY_SOURCE = Type-Tiny-$(PERL_TYPE_TINY_VERSION).tar.gz
 PERL_TYPE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
+PERL_TYPE_TINY_PURL = pkg:cpan/TOBYINK/Type-Tiny@$(PERL_TYPE_TINY_VERSION)
 PERL_TYPE_TINY_LICENSE = Artistic or GPL-1.0+
 PERL_TYPE_TINY_LICENSE_FILES = LICENSE
 PERL_TYPE_TINY_DISTNAME = Type-Tiny
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index aa0c1ed8b..c1bcc9444 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -7,6 +7,7 @@
 PERL_URI_VERSION = 5.21
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
+PERL_URI_PURL = pkg:cpan/OALDERS/URI@$(PERL_URI_VERSION)
 PERL_URI_LICENSE = Artistic-1.0-Perl or GPL-1.0+
 PERL_URI_LICENSE_FILES = LICENSE
 PERL_URI_DISTNAME = URI
diff --git a/package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk b/package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk
index a6f2edd5e..a8ca56dce 100644
--- a/package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk
+++ b/package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk
@@ -7,6 +7,7 @@
 PERL_WWW_FORM_URLENCODED_VERSION = 0.26
 PERL_WWW_FORM_URLENCODED_SOURCE = WWW-Form-UrlEncoded-$(PERL_WWW_FORM_URLENCODED_VERSION).tar.gz
 PERL_WWW_FORM_URLENCODED_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
+PERL_WWW_FORM_URLENCODED_PURL = pkg:cpan/KAZEBURO/WWW-Form-UrlEncoded@$(PERL_WWW_FORM_URLENCODED_VERSION)
 PERL_WWW_FORM_URLENCODED_DEPENDENCIES = host-perl-module-build
 PERL_WWW_FORM_URLENCODED_LICENSE = Artistic or GPL-1.0+
 PERL_WWW_FORM_URLENCODED_LICENSE_FILES = LICENSE
diff --git a/package/perl-www-robotrules/perl-www-robotrules.mk b/package/perl-www-robotrules/perl-www-robotrules.mk
index 052d9a674..aab608de5 100644
--- a/package/perl-www-robotrules/perl-www-robotrules.mk
+++ b/package/perl-www-robotrules/perl-www-robotrules.mk
@@ -7,6 +7,7 @@
 PERL_WWW_ROBOTRULES_VERSION = 6.02
 PERL_WWW_ROBOTRULES_SOURCE = WWW-RobotRules-$(PERL_WWW_ROBOTRULES_VERSION).tar.gz
 PERL_WWW_ROBOTRULES_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_WWW_ROBOTRULES_PURL = pkg:cpan/GAAS/WWW-RobotRules@$(PERL_WWW_ROBOTRULES_VERSION)
 PERL_WWW_ROBOTRULES_LICENSE = Artistic or GPL-1.0+
 PERL_WWW_ROBOTRULES_LICENSE_FILES = README
 PERL_WWW_ROBOTRULES_DISTNAME = WWW-RobotRules
diff --git a/package/perl-x10/perl-x10.mk b/package/perl-x10/perl-x10.mk
index 4c90be65b..8c95f567b 100644
--- a/package/perl-x10/perl-x10.mk
+++ b/package/perl-x10/perl-x10.mk
@@ -7,6 +7,7 @@
 PERL_X10_VERSION = 0.04
 PERL_X10_SOURCE = X10-$(PERL_X10_VERSION).tar.gz
 PERL_X10_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RO/ROBF
+PERL_X10_PURL = pkg:cpan/ROBF/X10@$(PERL_X10_VERSION)
 PERL_X10_LICENSE = GPL-3.0
 PERL_X10_LICENSE_FILES = README
 PERL_X10_DISTNAME = X10
diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
index 9b563e29b..f38a3c49f 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.mk
+++ b/package/perl-xml-libxml/perl-xml-libxml.mk
@@ -7,6 +7,7 @@
 PERL_XML_LIBXML_VERSION = 2.0134
 PERL_XML_LIBXML_SOURCE = XML-LibXML-$(PERL_XML_LIBXML_VERSION).tar.gz
 PERL_XML_LIBXML_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF
+PERL_XML_LIBXML_PURL = pkg:cpan/SHLOMIF/XML-LibXML@$(PERL_XML_LIBXML_VERSION)
 PERL_XML_LIBXML_DEPENDENCIES = zlib libxml2
 PERL_XML_LIBXML_LICENSE = Artistic or GPL-1.0+
 PERL_XML_LIBXML_LICENSE_FILES = LICENSE
diff --git a/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
index c3c54da6a..6fa770bba 100644
--- a/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
+++ b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
@@ -7,6 +7,7 @@
 PERL_XML_NAMESPACESUPPORT_VERSION = 1.12
 PERL_XML_NAMESPACESUPPORT_SOURCE = XML-NamespaceSupport-$(PERL_XML_NAMESPACESUPPORT_VERSION).tar.gz
 PERL_XML_NAMESPACESUPPORT_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PERIGRIN
+PERL_XML_NAMESPACESUPPORT_PURL = pkg:cpan/PERIGRIN/XML-NamespaceSupport@$(PERL_XML_NAMESPACESUPPORT_VERSION)
 PERL_XML_NAMESPACESUPPORT_LICENSE = Artistic or GPL-1.0+
 PERL_XML_NAMESPACESUPPORT_LICENSE_FILES = LICENSE
 PERL_XML_NAMESPACESUPPORT_DISTNAME = XML-NamespaceSupport
diff --git a/package/perl-xml-sax-base/perl-xml-sax-base.mk b/package/perl-xml-sax-base/perl-xml-sax-base.mk
index 810a46046..ef9ad7c61 100644
--- a/package/perl-xml-sax-base/perl-xml-sax-base.mk
+++ b/package/perl-xml-sax-base/perl-xml-sax-base.mk
@@ -7,6 +7,7 @@
 PERL_XML_SAX_BASE_VERSION = 1.09
 PERL_XML_SAX_BASE_SOURCE = XML-SAX-Base-$(PERL_XML_SAX_BASE_VERSION).tar.gz
 PERL_XML_SAX_BASE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GR/GRANTM
+PERL_XML_SAX_BASE_PURL = pkg:cpan/GRANTM/XML-SAX-Base@$(PERL_XML_SAX_BASE_VERSION)
 PERL_XML_SAX_BASE_LICENSE = Artistic or GPL-1.0+
 PERL_XML_SAX_BASE_LICENSE_FILES = README
 PERL_XML_SAX_BASE_DISTNAME = XML-SAX-Base
diff --git a/package/perl-xml-sax/perl-xml-sax.mk b/package/perl-xml-sax/perl-xml-sax.mk
index e8de01bcb..d80c76b7c 100644
--- a/package/perl-xml-sax/perl-xml-sax.mk
+++ b/package/perl-xml-sax/perl-xml-sax.mk
@@ -7,6 +7,7 @@
 PERL_XML_SAX_VERSION = 1.02
 PERL_XML_SAX_SOURCE = XML-SAX-$(PERL_XML_SAX_VERSION).tar.gz
 PERL_XML_SAX_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GR/GRANTM
+PERL_XML_SAX_PURL = pkg:cpan/GRANTM/XML-SAX@$(PERL_XML_SAX_VERSION)
 PERL_XML_SAX_LICENSE = Artistic or GPL-1.0+
 PERL_XML_SAX_LICENSE_FILES = LICENSE
 PERL_XML_SAX_DISTNAME = XML-SAX
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
