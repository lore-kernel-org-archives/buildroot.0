Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB106C43334
	for <buildroot@archiver.kernel.org>; Fri,  8 Jul 2022 05:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50FF861315;
	Fri,  8 Jul 2022 05:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50FF861315
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Infn9JtfCdof; Fri,  8 Jul 2022 05:50:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1CDB612EE;
	Fri,  8 Jul 2022 05:50:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1CDB612EE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33E4E1BF44C
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 05:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D37984663
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 05:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D37984663
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l8TBUcZYi-iK for <buildroot@lists.busybox.net>;
 Fri,  8 Jul 2022 05:50:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26C6884660
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26C6884660
 for <buildroot@busybox.net>; Fri,  8 Jul 2022 05:50:12 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id z12so19459804wrq.7
 for <buildroot@busybox.net>; Thu, 07 Jul 2022 22:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ckrqu4CKg2qXn2OascCYgcnL9a3cnfu0eSWS0Emwc40=;
 b=OYkN1LxRcvRdLcPbjMLSZ4ZApX9E4tByoWWbJ9KiVH52o3wbrs1rPmCrbSBSX80XuS
 da3yxjNi9ZbadHRHO+6qaeMHfkavMktUjwRcGczC1UVN5IZNgX/mgX88P9qNkHewb06J
 dPuw/xdEaz/PfNVYw7Hx74+xj7CzborHVq3NrxTokFWE6QEclHd2rNT+fVjvL1oVZkAL
 wXB+pcR37Q5B5F+Ms67Pb7Ue0d+GERHKFPQV3yAOo7pOqTaLMpjdpwn6ZPHbX+z6/oP5
 O1en49olli7WmLIVxWPIwIqK/0O70KKY8EJav8aubM0/NytXsbzOh1GIlyy9E/uBSfds
 Wbsg==
X-Gm-Message-State: AJIora+p2iuqE/Km9TSZ+yTZmM7Nu98+JWdp1uGVzW3Et6qAby6MEF+L
 WeUScvRiODFDo+Wm6b3vKGslDkIbyh8=
X-Google-Smtp-Source: AGRyM1tFMJgzxHv4eFCyw3wKN2457IXJ0zW6aLp0MhDQsRzv6aSQPsYCAzv3D6BrtvXVwOYrW+R7qg==
X-Received: by 2002:a05:6000:1c13:b0:21d:6964:fcca with SMTP id
 ba19-20020a0560001c1300b0021d6964fccamr1427836wrb.663.1657259410427; 
 Thu, 07 Jul 2022 22:50:10 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 k12-20020adfb34c000000b0021d73772c87sm8855575wrd.91.2022.07.07.22.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 22:50:09 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri,  8 Jul 2022 07:50:06 +0200
Message-Id: <20220708055006.2613116-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ckrqu4CKg2qXn2OascCYgcnL9a3cnfu0eSWS0Emwc40=;
 b=oVT8bc1ogjcBFlWPkCw1KzzqsPkQ1bZJpzbY21SAaZLozuScEPMDktckQPRxAUOlVf
 CNrE+gyPJlJYEejvfOKGbPLCK+iFpGPLVmLBFO1nNpcLOQ/gfpQxBEgdcYDqMaw/WZrB
 +YE7PWkpIzacnsHhjmNxG6RQ+Qt3TCDWl6wE1wERe2peZcekANKPVvia/c3iwntVgTJt
 ql00wSOonzsPrF5OjsKp3dhx56zAwaoco+eprc0gMIbPFMOSD6jnUkT2hFFJnw7mBIcK
 mXpkmiPe6ptiS1C1poLWH7MR1BlAbL1DIWreXN8jdapmdmxmMy7wyKcf3/l6xBS/zd4g
 OtIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oVT8bc1o
Subject: [Buildroot] [PATCH] package/lighttpd: bump to version 1.4.65
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

remove upstream patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...uild-meson-fix-typo-in-variable-name.patch | 25 -------------------
 package/lighttpd/lighttpd.hash                |  4 +--
 package/lighttpd/lighttpd.mk                  |  2 +-
 3 files changed, 3 insertions(+), 28 deletions(-)
 delete mode 100644 package/lighttpd/0002-build-meson-fix-typo-in-variable-name.patch

diff --git a/package/lighttpd/0002-build-meson-fix-typo-in-variable-name.patch b/package/lighttpd/0002-build-meson-fix-typo-in-variable-name.patch
deleted file mode 100644
index d338979d4..000000000
--- a/package/lighttpd/0002-build-meson-fix-typo-in-variable-name.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 876a1e1b2cc21282a0df5245004197cdffe1d380 Mon Sep 17 00:00:00 2001
-From: Glenn Strauss <gstrauss@gluelogic.com>
-Date: Thu, 20 Jan 2022 07:04:51 -0500
-Subject: [PATCH] [build] meson: fix typo in variable name
-
-[Retrieved from:
-https://github.com/lighttpd/lighttpd1.4/commit/876a1e1b2cc21282a0df5245004197cdffe1d380]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index 4ee163468..b35c1037f 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -266,7 +266,7 @@ endif
- libbrotli = []
- if get_option('with_brotli')
- 	libbrotli = [ compiler.find_library('brotlienc') ]
--	if compiler.has_function('BrotliEncoderCreateInstance', args: defs, dependencies: libbrotlienc, prefix: '#include <brotli/encode.h>')
-+	if compiler.has_function('BrotliEncoderCreateInstance', args: defs, dependencies: libbrotli, prefix: '#include <brotli/encode.h>')
- 		conf_data.set('HAVE_BROTLI_ENCODE_H', true)
- 		conf_data.set('HAVE_BROTLI', true)
- 	else
diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index ce026b9b4..0b4310aa7 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,4 +1,4 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.64.sha512sum
-sha512  8e2ad0830ff80fcebf0c33600caafb5ab4e9ff6b5073c12572f88a44fdfe85f777fa8b22b2fc2964fecbeb556997ad660867dcee80efb224d63329c8b18ea936  lighttpd-1.4.64.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.65.sha512sum
+sha512  e9ecb3e99dd5cd0efbf98cfc937f0cfcfafe712ab0e6c11f9cdee936c508820cd8de06ef03d2f888dab19a842eebae342a83818e601dd21094f154832acb69ec  lighttpd-1.4.65.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 595c59cb3..bedb9c8f3 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).64
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).65
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
