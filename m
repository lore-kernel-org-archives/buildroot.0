Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A06C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 08:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4332F826EF;
	Wed,  7 Feb 2024 08:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZkZmKRD1PjHK; Wed,  7 Feb 2024 08:45:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AA2E8266C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AA2E8266C;
	Wed,  7 Feb 2024 08:45:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43E2B1BF836
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 08:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DC5B421E1
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 08:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2cTSNMr7v-8L for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 08:45:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5328E421DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5328E421DA
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5328E421DA
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 08:45:07 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40ff28388a6so3047825e9.1
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 00:45:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707295506; x=1707900306;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gTXz92NPvJhG+A1Om9XZX9r6+NVyf3zdOvcAnyqhQ3E=;
 b=kswl8E1wBcGbO2OX2sgsdZrpMHczMFRDizpG9nNgJR36XSN4Xob3sUg91Asi/ccxV9
 bLz6HR0c/lr1Ir6yWUfLzXmy82bVRNPpUPYGxzpZgIRDR+1zzgxJaZZ8hrXFLHgQ1FeY
 zdHE+Otiz0EcwEvohP6s9wdbyeO9bMndhQ/wu4QJImRid+udgDo/EloDrczaTYqv1U/V
 tdE56+dqxNTKZKUMkY6Hbf8wWynhfUMKxD3faZML4TGSBVOrBB76yQNxv6CFFsilfddo
 1dpQjO3795xYQJOPMlgocO3+fmhzeLekmPiyxSZKNBOTL1wquYsQbDDtqDOozZf0TWTa
 qs3Q==
X-Gm-Message-State: AOJu0Yxp3gG06AyJ/R48dBVRbDjZNG9dpLDINIzQPRoCOclEqNTIDIpN
 /8FDWdLob7ja26qf8AsgUWUbrYxLJVGgifP1+Qnft2M8CDuu26UtF0AcYZFsBc7lv11Hz1DJJTj
 qP7s=
X-Google-Smtp-Source: AGHT+IGODg1YWKPiZmX5b5M6Pu36rhKFU24we2FscPDJc9lWjO2pxIoUMyrh5DuN1mACYWo6wyp8UA==
X-Received: by 2002:a05:600c:470f:b0:410:14f1:7ee6 with SMTP id
 v15-20020a05600c470f00b0041014f17ee6mr451035wmo.0.1707295505889; 
 Wed, 07 Feb 2024 00:45:05 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV61mqsGKXy6nwOvLTQj1RgjtfojD9POljnTDO99/VF4Rjkk8CHx5PnLZWA1+HX0VYviDQ+DwycqUvZQQ3w5ULMcw4=
Received: from P-NTS-Evian.. ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 n30-20020a05600c501e00b004101bdae3a0sm54935wmr.38.2024.02.07.00.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 00:45:05 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 09:45:02 +0100
Message-ID: <20240207084503.11109-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707295506; x=1707900306;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gTXz92NPvJhG+A1Om9XZX9r6+NVyf3zdOvcAnyqhQ3E=;
 b=k0b40BjXKkz2ElVOT+SRA1KhEqUd3lrK7/l97NKXDnQi1iaa5Ox5p57tdUyv01SlgC
 hlHzYhWwyIc+c+vvu6WG5fUcUv5jxyfbTnfj3cbXLBTztKATL33S+gnUiFpkJPiLav4w
 oqbp82beo3s/u+Q5sV840RgO5cTHue6/q0wzDNa83UUIKcx+/aoXZtVLZ405q4cmmfxY
 FYxn9Oq10j773Lj/vJXT7KlRfi5rALrCd+I6P5QxXald16RxffTcc1SSDOk3tVBqYBhQ
 WJVNU9/2wOm7ilS9fQSF1dePSE4haYh0gp9huZzKW0pnRYtXNuhRvHsD0TUfbjiplUSC
 UIiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=k0b40BjX
Subject: [Buildroot] [PATCH v2 1/2] package/python-bitarray: new package
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
Cc: Romain Naour <romain.naour@smile.fr>, Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is needed at runtime by python-bitstring since
4.1.0 already [1].

Note: the License is under Python-2.0 but "Python Software
Foundation License (PSF)" has been remplaced by the author
of bitarray Ilan Schnell.

[1] https://github.com/scott-griffiths/bitstring/releases/tag/bitstring-4.1.0

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
Triple checked the license type with other distribution:
https://salsa.debian.org/python-team/packages/python-bitarray/-/blob/master/debian/copyright?ref_type=heads
https://src.fedoraproject.org/rpms/python-bitarray/blob/rawhide/f/python-bitarray.spec
https://aur.archlinux.org/packages/python-bitarray

v2: update python-bitstring version (Marcus Hoffmann)
---
 package/Config.in                            |  1 +
 package/python-bitarray/Config.in            |  6 ++++++
 package/python-bitarray/python-bitarray.hash |  5 +++++
 package/python-bitarray/python-bitarray.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-bitarray/Config.in
 create mode 100644 package/python-bitarray/python-bitarray.hash
 create mode 100644 package/python-bitarray/python-bitarray.mk

diff --git a/package/Config.in b/package/Config.in
index 24e5f04ed6..89537f87b6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1008,6 +1008,7 @@ menu "External python modules"
 	source "package/python-bcrypt/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bidict/Config.in"
+	source "package/python-bitarray/Config.in"
 	source "package/python-bitstring/Config.in"
 	source "package/python-bleak/Config.in"
 	source "package/python-blinker/Config.in"
diff --git a/package/python-bitarray/Config.in b/package/python-bitarray/Config.in
new file mode 100644
index 0000000000..38d685f4fd
--- /dev/null
+++ b/package/python-bitarray/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_BITARRAY
+	bool "python-bitarray"
+	help
+	  efficient arrays of booleans -- C extension.
+
+	  https://github.com/ilanschnell/bitarray
diff --git a/package/python-bitarray/python-bitarray.hash b/package/python-bitarray/python-bitarray.hash
new file mode 100644
index 0000000000..d91a28af20
--- /dev/null
+++ b/package/python-bitarray/python-bitarray.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/bitarray/json
+md5  024324a82314e9e68ecdcdefdc69071f  bitarray-2.9.2.tar.gz
+sha256  a8f286a51a32323715d77755ed959f94bef13972e9a2fe71b609e40e6d27957e  bitarray-2.9.2.tar.gz
+# Locally computed sha256 checksums
+sha256  6b5e04f6e0462e1b97be833f9d65e66cd5eceb3283f4a6f532261087d0ab1233  LICENSE
diff --git a/package/python-bitarray/python-bitarray.mk b/package/python-bitarray/python-bitarray.mk
new file mode 100644
index 0000000000..f86320c112
--- /dev/null
+++ b/package/python-bitarray/python-bitarray.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-bitarray
+#
+################################################################################
+
+PYTHON_BITARRAY_VERSION = 2.9.2
+PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
+PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/c7/bf/25cf92a83e1fe4948d7935ae3c02f4c9ff9cb9c13e977fba8af11a5f642c
+PYTHON_BITARRAY_SETUP_TYPE = setuptools
+PYTHON_BITARRAY_LICENSE = Python-2.0
+PYTHON_BITARRAY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
