Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99721C88E5A
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 12:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17A1860649;
	Sun, 13 Sep 2026 12:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cbEuaddXs7kH; Sun, 13 Sep 2026 12:01:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C713E60624
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789300872;
	b=qXoXhZbadv06aRXSTamNoqsSeXUg58cw/0R24+coIRtjDr8MNsBOs/c1pfCAqUX2TM+W
	 wFhWsePWQbKrt3LcK7MU/8+mdZ3YmUaMBCY/DmSJU7ylZnu8N2ezTzL6UbVbjtJewt5Ub
	 dUFADLfX5c2BXNpuiF2bWiEmEGxlCnARPs90RnBlfsDT39/gkFiuOd7FFSHUAHqLg1A+s
	 rSPU68/suX43iOGRWAbmgrAg8X7ykEOSNQUtsn4b1EsMNdU1moij2bQm69EHRoRbgqXH8
	 V6sRLJ6bl+EYiIYJV1saezklFOX5/2rvU0jVPbhFFYkwqkAcjanv9gvN/llgH5JsRaw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789300872;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xq3OQkvp4hrvEpN/kcMK3uRjVIu6LIJo3S3KRnLWsfs=;
	b=slPQAdfEX7Fl/w0caOWQUZQJRuuyr9ZO38tYkwohRC8odDAm/3CTmpAMi8iOt5SAUPiE
	 vGwYdNr3CSVk9ucq7QqEv++zJh22+xHzG+HWOcfeVzYymoMckBrwUilMG2cxcR+E4ghHd
	 oAmTzfqv5qjylM3BXTRIdAqqvGVhHZYcw7dV9SBURFrSdrIwqOOEe5m1F7Y8OIlpsmDNb
	 RHTvCgXp+KjS1xrk247QnTGtIDgcDcr8U3fds7ZqcnucPWMUrdy0Y3RRWAmHj4MGJdGXK
	 JYxMunggyROvjbIvof5NpILQT2/5UKrCq+arh2QH65Ki0PinqAfn6mPBRwt6Jtbxksw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789300872;
	bh=xq3OQkvp4hrvEpN/kcMK3uRjVIu6LIJo3S3KRnLWsfs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=cXxbwo6MWGFxDokTZOturZQ03X818Ax3dae36moR1v/8k/d8m6gm9Ex7gV9xdMhRc
	 uQF8DAscyzdZmiPDOt7Cziu+mdMfakbJhzWKVcDkB6AdQN9a1J6NweCAcYof1k4/H4
	 gdz9CqUwbc9pvXniSI897CZYeQNIgQq9HA+c/SJzzNtewp+BRev6vviBtNVaecxteZ
	 XxX0FUlKc6pjZnfQfd1H+zVbVy1Z6zpp6WwXuL+alsVrRTyUsq6lA0ok1Wvty94NLs
	 h/bebhYb9JdajSGZmtWcgovbWXOsF/oZGSpz71ytdA+BR3pZsRT6XyAveCBbvF0dHv
	 dR0IvBvF+/VZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C713E60624;
	Sun, 13 Sep 2026 12:01:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BBC4224
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2193404F9
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pND3Kh2-GrEg for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 12:01:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2828B40537
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789300870;
 b=fvGGy444D0ozbZsJ+ISSqtKbw+mBReOT+8f+1th5IgxQ++/ozmz70XMwayUG/TdQysJw
 ErjXHcYos00HQ+WaQAVwJcdcz4tvEBQM4QxB0jJTuG5tE2e2N9cKdqW8vmPxn9V1o8ekV
 uXRd3TgOVQAf3LtxB3lovA7PutOHJfIonri88UrJpdByhCWzlNqxOxhNVX2vqO9D8q0yN
 7j+Rp412xanELDQgJIWCHUQjo3ve9ipKkTKZ4pphbdRLi0ETzVjzuPz4MgsRNpdm0rxJp
 XxtOmGRWnY01CXYh43tODMir3/f940JsMmESmjwmwN3VVWPJA74CWfA4qoQ2xSzmoEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789300870;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=ZaL+hno+WJxvMLhPP38kLHZg9bpA/zaE+gMKu7uzGOA=;
 b=JPSSjQFtVGK35w0w5yu3gfo0Uhmc01nW/pazDRa8DbeQN4mSCcybWFf8GUJd9Djv4XUu
 bBohuRkrezSopOQLgC0tgD2J+pzuvFRRLp5E/n9ccZhUQLJirPvCOFqUHAseBNLoZUeLz
 k4CTq7l0VH5unXaQXBGslJfKbPBt4ZoXavo8JwT4zfITd+8a70yPOAjtZJdm50ZoTd/Yn
 yRDwKmz29Qtnog4p2Oodv1I4VziH0SkScolGQcGNRX0KMryNyPg1cM4D0BLEQy1DdFpCN
 Gq1cwLxprhCmLoxHyyZLWT3us65CxANQ6BIJrlNWMkdGmpDB9PjXQYqaa8cii9AU+ow==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=tbIuIgQ+; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2828B40537
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:01:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D10291A04FC
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:01:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9DC5D60435;
 Sun, 13 Sep 2026 12:01:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6033E11C7AFB9; 
 Sun, 13 Sep 2026 14:01:02 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 14:01:00 +0200
Message-ID: <20260913120101.1646000-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/hidapi: propagate dependencies of
 libgudev
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Jean Burgat <jeanburgat33@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since hidapi was introduced in commit
6267f34afdd06ad848bbf7a2975cb279132b6ba0, it forgot to propagate some
dependencies of libgudev (which existed back then). Initially libgudev
was only needed when BR2_INIT_SYSTEMD=y, but still the dependencies
were not propagated for the systemd case.

Anyway, since e739dd5a11f5b2bd9648a45623bc174adae42b6e, libgudev is a
mandatory dependency of hidapi, independently from the selected init
system.

We make sure to propagate all dependencies of libgudev to hidapi, and
propagate them to the reverse dependencies of hidapi.

Fixes: 6267f34afdd06ad848bbf7a2975cb279132b6ba0 ("hidapi: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hidapi/Config.in         | 8 ++++++--
 package/libmanette/Config.in     | 4 ++--
 package/openfpgaloader/Config.in | 9 +++++++--
 package/openocd/Config.in        | 9 +++++++++
 package/python-hid/Config.in     | 8 ++++++--
 5 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/package/hidapi/Config.in b/package/hidapi/Config.in
index 1d3c86b677..fa44288917 100644
--- a/package/hidapi/Config.in
+++ b/package/hidapi/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_HIDAPI
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	depends on BR2_USE_MMU # libgudev
+	depends on BR2_USE_WCHAR # libgudev
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBGUDEV
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -15,7 +17,9 @@ config BR2_PACKAGE_HIDAPI
 
 	  http://github.com/libusb/hidapi/
 
-comment "hidapi needs udev /dev management and a toolchain w/ NPTL, gcc >= 4.9"
+comment "hidapi needs udev /dev management and a toolchain w/ NPTL, gcc >= 4.9, wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_PACKAGE_HAS_UDEV || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_USE_WCHAR
diff --git a/package/libmanette/Config.in b/package/libmanette/Config.in
index 873f8d8b0b..d4f45e25ad 100644
--- a/package/libmanette/Config.in
+++ b/package/libmanette/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBMANETTE
 	bool "libmanette"
-	depends on BR2_USE_MMU # libglib2
-	depends on BR2_USE_WCHAR # libglib2 -> gettext
+	depends on BR2_USE_MMU # libglib2, hidapi
+	depends on BR2_USE_WCHAR # libglib2, hidapi
 	depends on BR2_PACKAGE_HAS_UDEV # hidapi
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # hidapi
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
diff --git a/package/openfpgaloader/Config.in b/package/openfpgaloader/Config.in
index bd83ad415b..80305f1eba 100644
--- a/package/openfpgaloader/Config.in
+++ b/package/openfpgaloader/Config.in
@@ -17,12 +17,17 @@ config BR2_PACKAGE_OPENFPGALOADER_CMSIS
 	depends on BR2_PACKAGE_HAS_UDEV # hidapi
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # hidapi
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # hidapi -> libusb
+	depends on BR2_USE_MMU # hidapi
+	depends on BR2_USE_WCHAR # hidapi
 	select BR2_PACKAGE_HIDAPI
 	help
 	  openfpgaloader CMSIS-DAP support
 
-comment "openfpgaloader CMSIS-DAP needs udev /dev management and a toolchain w/ NPTL threads"
-	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+comment "openfpgaloader CMSIS-DAP needs udev /dev management and a toolchain w/ NPTL threads, gcc >= 4.9, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_USE_WCHAR
 
 config BR2_PACKAGE_OPENFPGALOADER_LIBGPIOD
 	bool "libgpiod support"
diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index a7e068f10d..2c2f6fe7aa 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -16,12 +16,21 @@ config BR2_PACKAGE_OPENOCD_CMSIS_DAP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	depends on BR2_PACKAGE_HAS_UDEV # hidapi
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # hidapi
+	depends on BR2_USE_MMU # hidapi
+	depends on BR2_USE_WCHAR # hidapi
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_HIDAPI
 	help
 	  Enable support for CMSIS-DAP compliant debuggers (i.e
 	  Atmel/Microchip EDBG, etc.)
 
+comment "CMSIS-DAP support needs udev, toolchain w/ NPTL, gcc >= 4.9, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_HAS_UDEV || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_OPENOCD_FTDI
 	bool "MPSSE mode of FTDI based devices"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
diff --git a/package/python-hid/Config.in b/package/python-hid/Config.in
index 3a9e16c9f4..e46a5c2000 100644
--- a/package/python-hid/Config.in
+++ b/package/python-hid/Config.in
@@ -3,13 +3,17 @@ config BR2_PACKAGE_PYTHON_HID
 	depends on BR2_PACKAGE_HAS_UDEV # hidapi
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # hidapi
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # hidapi
+	depends on BR2_USE_MMU # hidapi
+	depends on BR2_USE_WCHAR # hidapi
 	select BR2_PACKAGE_HIDAPI
 	help
 	  ctypes bindings for hidapi.
 
 	  https://github.com/apmorton/pyhidapi
 
-comment "python-hid needs udev /dev management and a toolchain w/ NPTL, gcc >= 4.9"
+comment "python-hid needs udev /dev management and a toolchain w/ NPTL, gcc >= 4.9, wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_PACKAGE_HAS_UDEV || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_USE_WCHAR
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
