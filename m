Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE805CDB46B
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 09:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 800AC6FABF;
	Sat, 20 Jun 2026 09:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2CfexFyI93bM; Sat, 20 Jun 2026 09:10:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8071160E78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781946624;
	bh=kukXS4hvM56QtUd3mGDJQFxIBolaB/DuhOdxxwn53Dc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n4VZyCoF9UB6+lyn0wpDrFy0kh3fWCzPVkGGPojEVMCt0VuI4XyQPK47Kr7kes5Io
	 5ht6Ftnoc13BAYMhGD1cuaW/bOQqObbUz9T/7t8ahhPdCNKlRYXwI2Ro/P8a5eOfst
	 wW/KxHVvH1OvjVB0JRWQVtXJNGM2mpDRB0o7CDZ1ynBsXmpcVHxEQ0UOV8QA/tSP1k
	 ++AUzdCoJvjRCZNFhiWH/q0msmWFBZUOB0IsFQSf0R2EfHq2DhJ4qLrnRf9Oh/X/yR
	 njqZbxfuXqsbwMYBIp7+7Cr+6CD6qywHTh94OEqGIhJAxc6s1k+ddPDi3Fb4qUaPIa
	 13uf0T394IsLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8071160E78;
	Sat, 20 Jun 2026 09:10:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02590367
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F31334EE28
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AlPTOY1W7RBm for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 09:10:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D3A44EE14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D3A44EE14
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D3A44EE14
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:17 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so20639595e9.1
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 02:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781946616; x=1782551416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QFxpHEFOGAk0L41V6xuPX+KXVk+enEY5lXMU8SwLI3M=;
 b=kF4vJ3EngTT7QUIEWDpbLF4SzSMCdlLX4hU6+NqDomR1hNlEoRn/Gsb0FOJuk9rUJ8
 sT4Q4nKNKGLiCKhxPFsXIYidhO7NKI1vdpcwGxhkfbwNXXP7IWXVcEfyEE3FC0xpMb3w
 qWdOh7HGdmJSxz/r6phlLnNfm94ao0b58AbsN2dmEM9nN4btKGbGf8tEtCbnMbMiK5Mu
 OUlQAQ1ISbHXCx2G2nHigIblVIV98fu+KOzLR/qsMusAPakMFmx07y6lWFuAmW4/zoOS
 8pU2RdVDCr4vCpSCFrmlx/TLhirSF1hEI4osMF1BWRbE5it/xAxZUd3H71/GwW+/eNQK
 yw3g==
X-Gm-Message-State: AOJu0YwNSBee3krPVXMrALNx8l1ZMVKBUtZggpxafsgYcfA8KMl4JDTG
 E8b0eSeXwGzsJWKQ3Ct9o7uVX4fPl72zSUT+XDaPmx3k8A46T1EjgMu2tSHTGt1Pa6lnQIMmGKu
 fQWYC
X-Gm-Gg: AfdE7cmnaoQ7aDBc1ubOdkOFrVLvjj+GvQjHfwR5hdApSJI+1QVD1LkCad51vesYhuV
 LxDXcVonlnb+LIKy/6YrDX0IhJSUhL5BTvQyjODIjE/SBqR3YhdbJSXf5+KLKs/17QIsfaD7DDT
 wzmKD0Y4LlgzgIgGNJtKUv0n5tefQw3fEs0l0R1S0ODm1+kTxc5uXfnnsmyv/3O5U1BzhO+UBoO
 JoLKxcP1e+5DBY/lXdceGzuPMhfaEon6FsI8XqUgpIud/h5tD7z0LO655h8Rqugrgb201IE0p8K
 16qzsC4MZ/mrf02ltR+yAVwbyZ9Jcp3jOswceI20iUoByTokKRvYz9BgZzzpfHz2z8RGP898pUH
 xKDrH7fsaQiqOC6hS0x8awk8Yi5CEtBDRTAVK+gNvcqM8eZ6tIgeZONY0i15Bvmg4Yv/f/c0UYK
 q8tRzq
X-Received: by 2002:a05:600c:4f84:b0:490:b2c9:e284 with SMTP id
 5b1f17b1804b1-4923f582d94mr123058005e9.30.1781946615937; 
 Sat, 20 Jun 2026 02:10:15 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fc47720sm205248535e9.0.2026.06.20.02.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2026 02:10:15 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Sat, 20 Jun 2026 11:10:15 +0200
Message-ID: <20260620091015.21758-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611115306.590527-1-thomas.perale@mind.be>
References: <20260611115306.590527-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781946616; x=1782551416; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QFxpHEFOGAk0L41V6xuPX+KXVk+enEY5lXMU8SwLI3M=;
 b=SxTLLyjFlXQ3JHAJppS3vouLovP/WfryaUgKEXoKKJZj/yLihp6Vhp/+wBLhoy7tQT
 HRHYpPJTOjieldc4k+mT1oLzsfLQirjjqOFKR+c7GoVxw3k3eVSQmDWnZrzN1x6CzOUl
 M7fYmDrfN/Fe/uaQCGWJG/qpwWSs1eWYY5aKEzyUD22T/HiAm4hMoInXrauy9Mi4bvED
 rZO8E1hlQ/ur8jEQsDS3jKi2u24oM8lMgNauI7HzUs2IfS9+h3MyjZFP2t6TQHikMLVb
 XRu0oWi711TpfZC/GZAXryRlFsYVfnyovL1zXyHMbXdBJmy7IKbC2gSa1bwXSnttRWC8
 vrfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SxTLLyjF
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/libinput: backport patch
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

In reply of:
> - CVE-2026-50292:
>     In libinput before 1.30.4 and 1.31.x before 1.31.3, libinput-device-
>     group unescaped phys output can inject udev properties leading to
>     arbitrary root code execution
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-50292
>   - https://gitlab.freedesktop.org/libinput/libinput/-/commit/8c15a01d1692cf0301b25ec2ead1d15d8176ad29
>   - https://gitlab.freedesktop.org/libinput/libinput/-/commit/fc2262e1c1847021239065e84f39f15492ef05cc
>   - https://gitlab.freedesktop.org/libinput/libinput/-/commit/b2bde9504d42a5976d76e1f27c640dc561fbd99b
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...dont-call-function-in-macro-argument.patch | 30 +++++++
>  ...e-control-characters-in-str-sanitize.patch | 90 +++++++++++++++++++
>  ...oup-sanitize-phys-before-printing-it.patch | 90 +++++++++++++++++++
>  package/libinput/libinput.mk                  |  5 ++
>  4 files changed, 215 insertions(+)
>  create mode 100644 package/libinput/0001-util-sanitize-control-characters-in-str-sanitize.patchdont-call-function-in-macro-argument.patch
>  create mode 100644 package/libinput/0002-util-sanitize-control-characters-in-str-sanitize.patch
>  create mode 100644 package/libinput/0003-libinput-device-group-sanitize-phys-before-printing-it.patch
> 
> diff --git a/package/libinput/0001-util-sanitize-control-characters-in-str-sanitize.patchdont-call-function-in-macro-argument.patch b/package/libinput/0001-util-sanitize-control-characters-in-str-sanitize.patchdont-call-function-in-macro-argument.patch
> new file mode 100644
> index 0000000000..61791278d0
> --- /dev/null
> +++ b/package/libinput/0001-util-sanitize-control-characters-in-str-sanitize.patchdont-call-function-in-macro-argument.patch
> @@ -0,0 +1,30 @@
> +From 8c15a01d1692cf0301b25ec2ead1d15d8176ad29 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Kacper=20Piwi=C5=84ski?= <vfjpl1@gmail.com>
> +Date: Sun, 29 Jun 2025 07:21:27 +0000
> +Subject: [PATCH] util: don't call function in macro argument
> +
> +Part-of: <https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/1252>
> +Upstream: https://gitlab.freedesktop.org/libinput/libinput/-/commit/8c15a01d1692cf0301b25ec2ead1d15d8176ad29
> +CVE: CVE-2026-50292
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/util-strings.h | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/util-strings.h b/src/util-strings.h
> +index 870995f5..fc37ac4b 100644
> +--- a/src/util-strings.h
> ++++ b/src/util-strings.h
> +@@ -480,7 +480,8 @@ str_sanitize(const char *str)
> + 	if (!strchr(str, '%'))
> + 		return strdup(str);
> + 
> +-	size_t slen = min(strlen(str), 512);
> ++	size_t slen = strlen(str);
> ++	slen = min(slen, 512);
> + 	char *sanitized = zalloc(2 * slen + 1);
> + 	const char *src = str;
> + 	char *dst = sanitized;
> +-- 
> +GitLab
> +
> diff --git a/package/libinput/0002-util-sanitize-control-characters-in-str-sanitize.patch b/package/libinput/0002-util-sanitize-control-characters-in-str-sanitize.patch
> new file mode 100644
> index 0000000000..11107cc270
> --- /dev/null
> +++ b/package/libinput/0002-util-sanitize-control-characters-in-str-sanitize.patch
> @@ -0,0 +1,90 @@
> +From fc2262e1c1847021239065e84f39f15492ef05cc Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Mon, 1 Jun 2026 10:12:29 +1000
> +Subject: [PATCH] util: sanitize control characters in str_sanitize()
> +
> +str_sanitize() only escaped '%' characters for format string safety.
> +Device names from uinput devices can contain arbitrary bytes including
> +ANSI escape sequences (ESC, 0x1b) and other control characters. When
> +these strings are included in log messages and printed to a terminal,
> +the escape sequences are interpreted by the terminal emulator. This
> +could allow an attacker to manipulate terminal output (change colors,
> +set window title, clear screen) when an administrator views libinput
> +logs.
> +
> +Replace all control characters (0x00-0x1f and 0x7f) with '?' in
> +addition to the existing '%' escaping. This prevents terminal escape
> +sequence injection through device names in log output.
> +
> +Assisted-by: Claude:claude-opus-4-6
> +(cherry picked from commit 71a2c5cae2a80a1e3bb29e3f3a07ccc3f3de5acb)
> +
> +Part-of: <https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/1489>
> +Upstream: https://gitlab.freedesktop.org/libinput/libinput/-/commit/fc2262e1c1847021239065e84f39f15492ef05cc
> +CVE: CVE-2026-50292
> +[thomas: remove tests]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/util-strings.h | 30 ++++++++++++++++++++++++------
> + test/test-utils.c  | 10 ++++++++++
> + 2 files changed, 34 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/util-strings.h b/src/util-strings.h
> +index 94236c48..3c662633 100644
> +--- a/src/util-strings.h
> ++++ b/src/util-strings.h
> +@@ -469,7 +469,10 @@ trunkname(const char *filename);
> + 
> + /**
> +  * Return a copy of str with all % converted to %% to make the string
> +- * acceptable as printf format.
> ++ * acceptable as printf format, and all non-NUL control characters
> ++ * (bytes 0x01-0x1f, 0x7f) replaced with '?' to prevent terminal
> ++ * escape sequence injection. NUL bytes are excluded implicitly
> ++ * because the string is null-terminated.
> +  */
> + static inline char *
> + str_sanitize(const char *str)
> +@@ -477,19 +480,34 @@ str_sanitize(const char *str)
> + 	if (!str)
> + 		return NULL;
> + 
> +-	if (!strchr(str, '%'))
> +-		return strdup(str);
> +-
> + 	size_t slen = strlen(str);
> + 	slen = min(slen, 512);
> ++
> ++	bool needs_sanitization = false;
> ++	for (size_t i = 0; i < slen; i++) {
> ++		unsigned char c = str[i];
> ++		if (c == '%' || c < 0x20 || c == 0x7f) {
> ++			needs_sanitization = true;
> ++			break;
> ++		}
> ++	}
> ++	if (!needs_sanitization)
> ++		return strdup(str);
> ++
> + 	char *sanitized = zalloc(2 * slen + 1);
> + 	const char *src = str;
> + 	char *dst = sanitized;
> + 
> + 	for (size_t i = 0; i < slen; i++) {
> +-		if (*src == '%')
> ++		unsigned char c = *src++;
> ++		if (c == '%') {
> + 			*dst++ = '%';
> +-		*dst++ = *src++;
> ++			*dst++ = '%';
> ++		} else if (c < 0x20 || c == 0x7f) {
> ++			*dst++ = '?';
> ++		} else {
> ++			*dst++ = c;
> ++		}
> + 	}
> + 	*dst = '\0';
> + 
> +-- 
> +GitLab
> +
> diff --git a/package/libinput/0003-libinput-device-group-sanitize-phys-before-printing-it.patch b/package/libinput/0003-libinput-device-group-sanitize-phys-before-printing-it.patch
> new file mode 100644
> index 0000000000..24ed91eae6
> --- /dev/null
> +++ b/package/libinput/0003-libinput-device-group-sanitize-phys-before-printing-it.patch
> @@ -0,0 +1,90 @@
> +From b2bde9504d42a5976d76e1f27c640dc561fbd99b Mon Sep 17 00:00:00 2001
> +From: Peter Hutterer <peter.hutterer@who-t.net>
> +Date: Mon, 1 Jun 2026 10:48:24 +1000
> +Subject: [PATCH] libinput-device-group: sanitize phys before printing it
> +
> +A malicious uinput device could set the phys value (via UI_SET_PHYS)
> +to contain a '\n'. When the value is printed as part of the device group
> +the udev rules will interpret it as separate property.
> +
> +Depending on the property this can cause local privilege escalation.
> +
> +Closes #1296
> +
> +Found-by: Csome
> +(cherry picked from commit 76f0d8a7f57e2868882864b4611281f12f704b55)
> +
> +Part-of: <https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/1489>
> +Upstream: https://gitlab.freedesktop.org/libinput/libinput/-/commit/b2bde9504d42a5976d76e1f27c640dc561fbd99b
> +CVE: CVE-2026-50292
> +[thomas: backport]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + udev/libinput-device-group.c | 13 +++++++------
> + 1 file changed, 7 insertions(+), 6 deletions(-)
> +
> +diff --git a/udev/libinput-device-group.c b/udev/libinput-device-group.c
> +index cdb38c0b..f9188406 100644
> +--- a/udev/libinput-device-group.c
> ++++ b/udev/libinput-device-group.c
> +@@ -109,7 +109,8 @@ wacom_handle_ekr(struct udev_device *device,
> + 
> + 	udev_list_entry_foreach(entry, udev_enumerate_get_list_entry(e)) {
> + 		struct udev_device *d;
> +-		const char *path, *phys;
> ++		char *phys = NULL;
> ++		const char *path;
> + 		const char *pidstr, *vidstr;
> + 		int pid, vid, dist;
> + 
> +@@ -124,7 +125,7 @@ wacom_handle_ekr(struct udev_device *device,
> + 
> + 		vidstr = udev_device_get_property_value(d, "ID_VENDOR_ID");
> + 		pidstr = udev_device_get_property_value(d, "ID_MODEL_ID");
> +-		phys = udev_device_get_sysattr_value(d, "phys");
> ++		phys = str_sanitize(udev_device_get_sysattr_value(d, "phys"));
> + 
> + 		if (vidstr && pidstr && phys &&
> + 		    safe_atoi_base(vidstr, &vid, 16) &&
> +@@ -142,6 +143,9 @@ wacom_handle_ekr(struct udev_device *dev
> + 			}
> + 		}
> + 
> ++		free(phys);
> ++		phys = NULL;
> ++
> + 		udev_device_unref(d);
> + 	}
> + 
> +@@ -154,8 +154,8 @@ int main(int argc, char **argv)
> + 	int rc = 1;
> + 	struct udev *udev = NULL;
> + 	struct udev_device *device = NULL;
> +-	const char *syspath,
> +-	           *phys = NULL;
> ++	const char *syspath;
> ++	char *phys = NULL;
> + 	const char *product;
> + 	int bustype, vendor_id, product_id, version;
> + 	char group[1024];
> +@@ -179,8 +180,7 @@ main(int argc, char **argv)
> + 	 * bit and use the remainder as device group identifier */
> + 	while (device != NULL) {
> + 		struct udev_device *parent;
> +-
> +-		phys = udev_device_get_sysattr_value(device, "phys");
> ++		phys = str_sanitize(udev_device_get_sysattr_value(device, "phys"));
> + 		if (phys)
> + 			break;
> + 
> +@@ -251,6 +272,7 @@ int main(int argc, char **argv)
> + 
> + 	rc = 0;
> + out:
> ++	free(phys);
> + 	if (device)
> + 		udev_device_unref(device);
> + 	if (udev)
> +-- 
> +GitLab
> +
> diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
> index 1930a8cea5..bb7589e502 100644
> --- a/package/libinput/libinput.mk
> +++ b/package/libinput/libinput.mk
> @@ -19,6 +19,11 @@ LIBINPUT_CONF_OPTS = -Dtests=false -Dlibwacom=false -Ddocumentation=false
>  # https://gitlab.freedesktop.org/libinput/libinput/-/commit/9e37bc0cfa4d975291e5a2899e148fb83526d4a2
>  LIBINPUT_IGNORE_CVES += CVE-2026-35093 CVE-2026-35094
>  
> +# 0001-util-sanitize-control-characters-in-str-sanitize.patchdont-call-function-in-macro-argument.patch
> +# 0002-util-sanitize-control-characters-in-str-sanitize.patch
> +# 0003-libinput-device-group-sanitize-phys-before-printing-it.patch
> +LIBINPUT_IGNORE_CVES += CVE-2026-50292
> +
>  ifeq ($(BR2_PACKAGE_LIBGTK3),y)
>  LIBINPUT_CONF_OPTS += -Ddebug-gui=true
>  LIBINPUT_DEPENDENCIES += libgtk3
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
