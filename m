Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B76CD98D2
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 11:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C168540852;
	Thu, 11 Jun 2026 11:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Tfcln3Dz7bC; Thu, 11 Jun 2026 11:53:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 914CC40856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781178793;
	bh=UI+MPdHQFgfHLBjdsWkDCa9lQaUMaXSxZ+kgK544qSY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YV0tnBlCMHvk0PI/IkmtqrGnbEqOqy9jnbO+e2jl8JIW/5uQ0/mxmoVuB6Pw9I6cq
	 vsXpLd/4g9vmUqGUfw4hp6PSeNN0y/nhibiMYCQYZquFpwO1ld/o0XGY3+vCZ6AEGu
	 HYMeouBe+uB0+e6u3UQvppVni7lk6YKlCuJjiPqxdeC6r1+hLctngWgruFQd7S+II8
	 axumhDxenckmdqosvlLtIluB/MqSvMPqQVCfdZzBeYsP+fbFrD7ZC13LvFn7ppGlFT
	 AymsBLdEs7oXlmgnHbm/OIz3IWSDAWaLPgNll+8thd9iMT1pRPJ/552eO6EiJXs5r6
	 5EXLUfShmnHVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 914CC40856;
	Thu, 11 Jun 2026 11:53:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A89712F
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 11:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A2F040849
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 11:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZxqqBs89dCo for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 11:53:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C0DE240847
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0DE240847
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0DE240847
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 11:53:09 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-490a76757e5so52614915e9.2
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 04:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781178787; x=1781783587;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GEaogRq2mO+2ULdh1tfdWDgINzLaKqO8kMUrbukEQvM=;
 b=dTJnggShAi0QwDD/VI4QqhcxwDYGbZCJuEXJzcR6GUQxucxZpYm1UovP9TSYVEf/O/
 lR9mj3QFPz2wAGmY7xo0ATfmkwVOGpecJhBgWI9Y4HKSfiUQ7n8+DKrHtz++7Nqe4arV
 /vpdsY6E3R6nGZXnQx7nJJXGGEaVMvzOQNf9ug8g3czJ5pUgmNqKPJ9iL92PmSAN9hDN
 8pyE6+4uCX5xKMq1EBrglxlfjUsFu50WbyYntDc+yHp5qixPfRHT7H5qoA2MjxHGDvPm
 4+mohaepW81RdiAjRNsqYLvYs2LVwfIP3Au2+A9MVtwa74I/hESffn+l9HUp/3zFxx96
 ebVg==
X-Gm-Message-State: AOJu0YxgQPY1e0UQM4gKIF4Lg9AzQmnEz3hJGVP9mNlztIu0nXl+4DoH
 rEal/3aP0kLe0i51k58TeORRyFPn00KZtpk/v84UKzKD4m1UydbnJ1REX9wzp7oo2r2A/NsGFEB
 fxrC5
X-Gm-Gg: Acq92OEPHepxvqe8O+4LuAgO1473n7aPvfwJqU8b1SkEtYAEgfN6jot2MbicqHlnQ18
 3R7zW4wzov/32pbhwUKP0RpvsrOCvw7gY51e+OjS2cDNgAbjVFDWMJszaibmX+/sZLGL/QrANoL
 7QcxQndlGJ46+VKoPQeulJpBVO457bhyqMQG+rLBCWNQSmwm+3TavzVgDfOtZsAwRB+Tr6pNMvQ
 STExoCicZuwGIXgSIh6XDsStLSgtnuuBENZVEh1P5itz+iTeCYhKRmVzi+Z2IdirM1/hz1tL60h
 evmwULaJ5Fi2ErEvh03Q9tW3AciF++GhktuwNCSSTKlW3hUpQ/eQ6xF81xByFnMhoyehSExqFAd
 cLlfjiVCGtWyJBAt90fVId6RA4TdfuKHYIF9dc78FZix7ighE+HdRZNED4WSgR0TCFAsJ7M+SG9
 NBHNlhGeM+TifUIXM8rJCqg6X6BQ==
X-Received: by 2002:a05:600c:620b:b0:490:e342:127 with SMTP id
 5b1f17b1804b1-490e561e427mr30264755e9.34.1781178787216; 
 Thu, 11 Jun 2026 04:53:07 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2f2710sm62965075f8f.14.2026.06.11.04.53.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 04:53:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 13:53:06 +0200
Message-ID: <20260611115306.590527-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781178787; x=1781783587; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=GEaogRq2mO+2ULdh1tfdWDgINzLaKqO8kMUrbukEQvM=;
 b=ezlXvW6Tbe94dciKufvnKb7nQq1eEC8RLCYtfVj9KPfOhm0e5I+/D/LsheepJP8eVT
 k0Izb4tjK2Z9X1TxM1Boky6DpPmLORFfLlIF5VAT5Vq8hXKrVsgAmmZXyylEPGZUWOPF
 rJoWi94O0ZOs7qelAz46AeBwTD4MB9VB0+HXukDXW68oVJCFwOtUFESm1CiyLkI8nVKw
 wAuFffQ44DJCdKNzM22ZJupBFfU86eSKJYsbWhc4T4m2y9baF/Ve8Jmpx6E9jGAbtZBP
 3zYm+5zCMM6+eH4WE42em+RomCw1ns/Go9PkfO/CFIYpsN3wXHvbt7rMpoAWxJi3AytR
 M23A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ezlXvW6T
Subject: [Buildroot] [PATCH 2025.02.x] package/libinput: backport patch
 CVE-2026-50292
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- CVE-2026-50292:
    In libinput before 1.30.4 and 1.31.x before 1.31.3, libinput-device-
    group unescaped phys output can inject udev properties leading to
    arbitrary root code execution

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-50292
  - https://gitlab.freedesktop.org/libinput/libinput/-/commit/8c15a01d1692cf0301b25ec2ead1d15d8176ad29
  - https://gitlab.freedesktop.org/libinput/libinput/-/commit/fc2262e1c1847021239065e84f39f15492ef05cc
  - https://gitlab.freedesktop.org/libinput/libinput/-/commit/b2bde9504d42a5976d76e1f27c640dc561fbd99b

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...dont-call-function-in-macro-argument.patch | 30 +++++++
 ...e-control-characters-in-str-sanitize.patch | 90 +++++++++++++++++++
 ...oup-sanitize-phys-before-printing-it.patch | 90 +++++++++++++++++++
 package/libinput/libinput.mk                  |  5 ++
 4 files changed, 215 insertions(+)
 create mode 100644 package/libinput/0001-util-sanitize-control-characters-in-str-sanitize.patchdont-call-function-in-macro-argument.patch
 create mode 100644 package/libinput/0002-util-sanitize-control-characters-in-str-sanitize.patch
 create mode 100644 package/libinput/0003-libinput-device-group-sanitize-phys-before-printing-it.patch

diff --git a/package/libinput/0001-util-sanitize-control-characters-in-str-sanitize.patchdont-call-function-in-macro-argument.patch b/package/libinput/0001-util-sanitize-control-characters-in-str-sanitize.patchdont-call-function-in-macro-argument.patch
new file mode 100644
index 0000000000..61791278d0
--- /dev/null
+++ b/package/libinput/0001-util-sanitize-control-characters-in-str-sanitize.patchdont-call-function-in-macro-argument.patch
@@ -0,0 +1,30 @@
+From 8c15a01d1692cf0301b25ec2ead1d15d8176ad29 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Kacper=20Piwi=C5=84ski?= <vfjpl1@gmail.com>
+Date: Sun, 29 Jun 2025 07:21:27 +0000
+Subject: [PATCH] util: don't call function in macro argument
+
+Part-of: <https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/1252>
+Upstream: https://gitlab.freedesktop.org/libinput/libinput/-/commit/8c15a01d1692cf0301b25ec2ead1d15d8176ad29
+CVE: CVE-2026-50292
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/util-strings.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/util-strings.h b/src/util-strings.h
+index 870995f5..fc37ac4b 100644
+--- a/src/util-strings.h
++++ b/src/util-strings.h
+@@ -480,7 +480,8 @@ str_sanitize(const char *str)
+ 	if (!strchr(str, '%'))
+ 		return strdup(str);
+ 
+-	size_t slen = min(strlen(str), 512);
++	size_t slen = strlen(str);
++	slen = min(slen, 512);
+ 	char *sanitized = zalloc(2 * slen + 1);
+ 	const char *src = str;
+ 	char *dst = sanitized;
+-- 
+GitLab
+
diff --git a/package/libinput/0002-util-sanitize-control-characters-in-str-sanitize.patch b/package/libinput/0002-util-sanitize-control-characters-in-str-sanitize.patch
new file mode 100644
index 0000000000..11107cc270
--- /dev/null
+++ b/package/libinput/0002-util-sanitize-control-characters-in-str-sanitize.patch
@@ -0,0 +1,90 @@
+From fc2262e1c1847021239065e84f39f15492ef05cc Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon, 1 Jun 2026 10:12:29 +1000
+Subject: [PATCH] util: sanitize control characters in str_sanitize()
+
+str_sanitize() only escaped '%' characters for format string safety.
+Device names from uinput devices can contain arbitrary bytes including
+ANSI escape sequences (ESC, 0x1b) and other control characters. When
+these strings are included in log messages and printed to a terminal,
+the escape sequences are interpreted by the terminal emulator. This
+could allow an attacker to manipulate terminal output (change colors,
+set window title, clear screen) when an administrator views libinput
+logs.
+
+Replace all control characters (0x00-0x1f and 0x7f) with '?' in
+addition to the existing '%' escaping. This prevents terminal escape
+sequence injection through device names in log output.
+
+Assisted-by: Claude:claude-opus-4-6
+(cherry picked from commit 71a2c5cae2a80a1e3bb29e3f3a07ccc3f3de5acb)
+
+Part-of: <https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/1489>
+Upstream: https://gitlab.freedesktop.org/libinput/libinput/-/commit/fc2262e1c1847021239065e84f39f15492ef05cc
+CVE: CVE-2026-50292
+[thomas: remove tests]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/util-strings.h | 30 ++++++++++++++++++++++++------
+ test/test-utils.c  | 10 ++++++++++
+ 2 files changed, 34 insertions(+), 6 deletions(-)
+
+diff --git a/src/util-strings.h b/src/util-strings.h
+index 94236c48..3c662633 100644
+--- a/src/util-strings.h
++++ b/src/util-strings.h
+@@ -469,7 +469,10 @@ trunkname(const char *filename);
+ 
+ /**
+  * Return a copy of str with all % converted to %% to make the string
+- * acceptable as printf format.
++ * acceptable as printf format, and all non-NUL control characters
++ * (bytes 0x01-0x1f, 0x7f) replaced with '?' to prevent terminal
++ * escape sequence injection. NUL bytes are excluded implicitly
++ * because the string is null-terminated.
+  */
+ static inline char *
+ str_sanitize(const char *str)
+@@ -477,19 +480,34 @@ str_sanitize(const char *str)
+ 	if (!str)
+ 		return NULL;
+ 
+-	if (!strchr(str, '%'))
+-		return strdup(str);
+-
+ 	size_t slen = strlen(str);
+ 	slen = min(slen, 512);
++
++	bool needs_sanitization = false;
++	for (size_t i = 0; i < slen; i++) {
++		unsigned char c = str[i];
++		if (c == '%' || c < 0x20 || c == 0x7f) {
++			needs_sanitization = true;
++			break;
++		}
++	}
++	if (!needs_sanitization)
++		return strdup(str);
++
+ 	char *sanitized = zalloc(2 * slen + 1);
+ 	const char *src = str;
+ 	char *dst = sanitized;
+ 
+ 	for (size_t i = 0; i < slen; i++) {
+-		if (*src == '%')
++		unsigned char c = *src++;
++		if (c == '%') {
+ 			*dst++ = '%';
+-		*dst++ = *src++;
++			*dst++ = '%';
++		} else if (c < 0x20 || c == 0x7f) {
++			*dst++ = '?';
++		} else {
++			*dst++ = c;
++		}
+ 	}
+ 	*dst = '\0';
+ 
+-- 
+GitLab
+
diff --git a/package/libinput/0003-libinput-device-group-sanitize-phys-before-printing-it.patch b/package/libinput/0003-libinput-device-group-sanitize-phys-before-printing-it.patch
new file mode 100644
index 0000000000..24ed91eae6
--- /dev/null
+++ b/package/libinput/0003-libinput-device-group-sanitize-phys-before-printing-it.patch
@@ -0,0 +1,90 @@
+From b2bde9504d42a5976d76e1f27c640dc561fbd99b Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon, 1 Jun 2026 10:48:24 +1000
+Subject: [PATCH] libinput-device-group: sanitize phys before printing it
+
+A malicious uinput device could set the phys value (via UI_SET_PHYS)
+to contain a '\n'. When the value is printed as part of the device group
+the udev rules will interpret it as separate property.
+
+Depending on the property this can cause local privilege escalation.
+
+Closes #1296
+
+Found-by: Csome
+(cherry picked from commit 76f0d8a7f57e2868882864b4611281f12f704b55)
+
+Part-of: <https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/1489>
+Upstream: https://gitlab.freedesktop.org/libinput/libinput/-/commit/b2bde9504d42a5976d76e1f27c640dc561fbd99b
+CVE: CVE-2026-50292
+[thomas: backport]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ udev/libinput-device-group.c | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/udev/libinput-device-group.c b/udev/libinput-device-group.c
+index cdb38c0b..f9188406 100644
+--- a/udev/libinput-device-group.c
++++ b/udev/libinput-device-group.c
+@@ -109,7 +109,8 @@ wacom_handle_ekr(struct udev_device *device,
+ 
+ 	udev_list_entry_foreach(entry, udev_enumerate_get_list_entry(e)) {
+ 		struct udev_device *d;
+-		const char *path, *phys;
++		char *phys = NULL;
++		const char *path;
+ 		const char *pidstr, *vidstr;
+ 		int pid, vid, dist;
+ 
+@@ -124,7 +125,7 @@ wacom_handle_ekr(struct udev_device *device,
+ 
+ 		vidstr = udev_device_get_property_value(d, "ID_VENDOR_ID");
+ 		pidstr = udev_device_get_property_value(d, "ID_MODEL_ID");
+-		phys = udev_device_get_sysattr_value(d, "phys");
++		phys = str_sanitize(udev_device_get_sysattr_value(d, "phys"));
+ 
+ 		if (vidstr && pidstr && phys &&
+ 		    safe_atoi_base(vidstr, &vid, 16) &&
+@@ -142,6 +143,9 @@ wacom_handle_ekr(struct udev_device *dev
+ 			}
+ 		}
+ 
++		free(phys);
++		phys = NULL;
++
+ 		udev_device_unref(d);
+ 	}
+ 
+@@ -154,8 +154,8 @@ int main(int argc, char **argv)
+ 	int rc = 1;
+ 	struct udev *udev = NULL;
+ 	struct udev_device *device = NULL;
+-	const char *syspath,
+-	           *phys = NULL;
++	const char *syspath;
++	char *phys = NULL;
+ 	const char *product;
+ 	int bustype, vendor_id, product_id, version;
+ 	char group[1024];
+@@ -179,8 +180,7 @@ main(int argc, char **argv)
+ 	 * bit and use the remainder as device group identifier */
+ 	while (device != NULL) {
+ 		struct udev_device *parent;
+-
+-		phys = udev_device_get_sysattr_value(device, "phys");
++		phys = str_sanitize(udev_device_get_sysattr_value(device, "phys"));
+ 		if (phys)
+ 			break;
+ 
+@@ -251,6 +272,7 @@ int main(int argc, char **argv)
+ 
+ 	rc = 0;
+ out:
++	free(phys);
+ 	if (device)
+ 		udev_device_unref(device);
+ 	if (udev)
+-- 
+GitLab
+
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 1930a8cea5..bb7589e502 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -19,6 +19,11 @@ LIBINPUT_CONF_OPTS = -Dtests=false -Dlibwacom=false -Ddocumentation=false
 # https://gitlab.freedesktop.org/libinput/libinput/-/commit/9e37bc0cfa4d975291e5a2899e148fb83526d4a2
 LIBINPUT_IGNORE_CVES += CVE-2026-35093 CVE-2026-35094
 
+# 0001-util-sanitize-control-characters-in-str-sanitize.patchdont-call-function-in-macro-argument.patch
+# 0002-util-sanitize-control-characters-in-str-sanitize.patch
+# 0003-libinput-device-group-sanitize-phys-before-printing-it.patch
+LIBINPUT_IGNORE_CVES += CVE-2026-50292
+
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 LIBINPUT_CONF_OPTS += -Ddebug-gui=true
 LIBINPUT_DEPENDENCIES += libgtk3
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
