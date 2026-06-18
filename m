Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD73CDB470
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 09:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64B90861A7;
	Sat, 20 Jun 2026 09:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQmISAhrCkNr; Sat, 20 Jun 2026 09:06:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4825861A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781946403;
	bh=VMDtn81Bi/M+dc7AxmGGBAaE7MooPyOq1Fnz+wSyZJ4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j8QnoAT7bO+05/HL6C+Xul0pu2unHWqzB+SLGVgHsEcxPPvluiEsCCotf2AZQbIT0
	 kXmyjBU6L4gFlvf5cIRl6zJpWOqWSkY+7UjHiFoz5hf2FYXVc+9fakRnaZY8iMc30r
	 6ZoyDa2SQMaPugQnzsZVv9DZsASYmIDYr1wNW9EOMV0OGoLE6OUGj7hlHbZae5ar/r
	 bFpaHsJ3yPmh4x0IyecTDW7ZrFOcs5dHRoxga4dxQ/4GkVCSuBc+WTa0O9cirfkKcp
	 kXlKZhBvOE+gi4+dQQX12h1Di3XSlFO0/bP0zcxwDohRKIvSxo6nKO16H16b9tVXNm
	 5jUDmVHgtyZpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4825861A8;
	Sat, 20 Jun 2026 09:06:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A1283367
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91282861A6
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAB7EV4owcAf for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 09:06:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68BF58618C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68BF58618C
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EAEE81E3E; Sat, 20 Jun 2026 09:06:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 15:05:10 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 55a0d4dadacbafbe73b4070e2be0baad515fd4d5
X-Git-Newrev: a3f4bbe9145217946e0b8df4105712346cb31874
X-Patchwork-Hint: ignore
Message-Id: <20260620090612.6EAEE81E3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libinput:
 backport patch CVE-2026-50292
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a3f4bbe9145217946e0b8df4105712346cb31874
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2026-50292:
    In libinput before 1.30.4 and 1.31.x before 1.31.3, libinput-device-
    group unescaped phys output can inject udev properties leading to
    arbitrary root code execution

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-50292
  - https://gitlab.freedesktop.org/libinput/libinput/-/commit/8c15a01d1692cf0301b25ec2ead1d15d8176ad29
  - https://gitlab.freedesktop.org/libinput/libinput/-/commit/fc2262e1c1847021239065e84f39f15492ef05cc
  - https://gitlab.freedesktop.org/libinput/libinput/-/commit/b2bde9504d42a5976d76e1f27c640dc561fbd99b

(cherry picked from commit 1cc0363191c33545adfe327881b32756aef9594b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...0001-dont-call-function-in-macro-argument.patch | 30 +++++++
 ...nitize-control-characters-in-str-sanitize.patch | 90 ++++++++++++++++++++
 ...ce-group-sanitize-phys-before-printing-it.patch | 95 ++++++++++++++++++++++
 package/libinput/libinput.mk                       |  5 ++
 4 files changed, 220 insertions(+)

diff --git a/package/libinput/0001-dont-call-function-in-macro-argument.patch b/package/libinput/0001-dont-call-function-in-macro-argument.patch
new file mode 100644
index 0000000000..61791278d0
--- /dev/null
+++ b/package/libinput/0001-dont-call-function-in-macro-argument.patch
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
index 0000000000..cb3bc4aae0
--- /dev/null
+++ b/package/libinput/0003-libinput-device-group-sanitize-phys-before-printing-it.patch
@@ -0,0 +1,95 @@
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
+@@ -109,7 +109,8 @@ wacom_handle_ekr(struct udev_device *dev
+ 
+ 	udev_list_entry_foreach(entry, udev_enumerate_get_list_entry(e)) {
+ 		struct udev_device *d;
+-		const char *path, *phys;
++		char *phys = NULL;
++		const char *path;
+ 		const char *pidstr, *vidstr;
+ 		int pid, vid, dist;
+ 
+@@ -124,7 +125,7 @@ wacom_handle_ekr(struct udev_device *dev
+ 
+ 		vidstr = udev_device_get_property_value(d, "ID_VENDOR_ID");
+ 		pidstr = udev_device_get_property_value(d, "ID_MODEL_ID");
+-		phys = udev_device_get_sysattr_value(d, "phys");
++		phys = str_sanitize(udev_device_get_sysattr_value(d, "phys"));
+ 
+ 		if (vidstr && pidstr && phys &&
+ 		    safe_atoi_base(vidstr, &vid, 16) &&
+@@ -138,11 +139,13 @@ wacom_handle_ekr(struct udev_device *dev
+ 				best_dist = dist;
+ 
+ 				free(*phys_attr);
+-				*phys_attr = safe_strdup(phys);
++				*phys_attr = phys;
++				phys = NULL;
+ 			}
+ 		}
+ 
+ 		udev_device_unref(d);
++		free(phys);
+ 	}
+ 
+ 	udev_enumerate_unref(e);
+@@ -154,8 +157,8 @@ int main(int argc, char **argv)
+ 	int rc = 1;
+ 	struct udev *udev = NULL;
+ 	struct udev_device *device = NULL;
+-	const char *syspath,
+-	           *phys = NULL;
++	char *phys = NULL;
++	const char *syspath = NULL;
+ 	const char *product;
+ 	int bustype, vendor_id, product_id, version;
+ 	char group[1024];
+@@ -179,8 +182,7 @@ int main(int argc, char **argv)
+ 	 * bit and use the remainder as device group identifier */
+ 	while (device != NULL) {
+ 		struct udev_device *parent;
+-
+-		phys = udev_device_get_sysattr_value(device, "phys");
++		phys = str_sanitize(udev_device_get_sysattr_value(device, "phys"));
+ 		if (phys)
+ 			break;
+ 
+@@ -249,6 +251,8 @@ int main(int argc, char **argv)
+ 
+ 	printf("LIBINPUT_DEVICE_GROUP=%s\n", group);
+ 
++	free(phys);
++
+ 	rc = 0;
+ out:
+ 	if (device)
+-- 
+GitLab
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 1930a8cea5..ef63709418 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -19,6 +19,11 @@ LIBINPUT_CONF_OPTS = -Dtests=false -Dlibwacom=false -Ddocumentation=false
 # https://gitlab.freedesktop.org/libinput/libinput/-/commit/9e37bc0cfa4d975291e5a2899e148fb83526d4a2
 LIBINPUT_IGNORE_CVES += CVE-2026-35093 CVE-2026-35094
 
+# 0001-dont-call-function-in-macro-argument.patch
+# 0002-util-sanitize-control-characters-in-str-sanitize.patch
+# 0003-libinput-device-group-sanitize-phys-before-printing-it.patch
+LIBINPUT_IGNORE_CVES += CVE-2026-50292
+
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 LIBINPUT_CONF_OPTS += -Ddebug-gui=true
 LIBINPUT_DEPENDENCIES += libgtk3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
