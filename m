Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B37C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 20:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 665BC8128A;
	Wed,  7 Aug 2024 20:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RhaJL7VFGzKt; Wed,  7 Aug 2024 20:06:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60D738131C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60D738131C;
	Wed,  7 Aug 2024 20:06:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 533641BF2BE
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CDB840633
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4RwRzvNVPehJ for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 20:06:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9910240632
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9910240632
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9910240632
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 20:06:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 939EA1BF203;
 Wed,  7 Aug 2024 20:05:59 +0000 (UTC)
Date: Wed, 7 Aug 2024 22:05:57 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240807220557.604f9e3f@windsurf>
In-Reply-To: <20240807150952.765978-1-buildroot@bubu1.eu>
References: <20240807150952.765978-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723061160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nXVK30gtpxhLgS1FmV/xTBiVXaWd8/SVh+TUX2bUYSc=;
 b=Tm83GPM/b8A/Cdq0dYLIsEBQhrn66R01NiqNMmdZQzB/9ZT/Qtdf4AwgptLQac8Zs4Ee8v
 AFjSAn/M+1ZH80qiAXJAup88sotV7zhk27SHuvD4rhB9Py3yawxyI8GH9RzntpB0S2jiiq
 2TG5BK6+GG8PQ0YW6/dVqH97tpa1ZSq86cVSra8VLS6fnVa2fB1SC5bChluNttvdJ/ymxK
 nFHao0aUEeJVl0+cwnPmM7yvgEVBj5VCk4OJSkxDMek9MwSr6eCpGhxxii7o4pvCNOc2Y3
 rCUhbH49Tn9Yubqke77tdCriVOrsEjvpcl7sJ1/makkOKH3MCOi5Ueix7lZIow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Tm83GPM/
Subject: Re: [Buildroot] [PATCH] package/picotool: add patch to fix sparc
 static build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Marcus,

On Wed,  7 Aug 2024 17:09:52 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index ff3e787..d6e41da 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -58,7 +58,8 @@ else()
> +             pico_platform_headers
> +             pico_usb_reset_interface_headers
> +             picoboot_connection_cxx
> +-            ${LIBUSB_LIBRARIES})
> ++            ${LIBUSB_LIBRARIES}
> ++            ${PC_LIBUSB_LIBRARIES})

Thanks for working on this. Unfortunately, while this patch perhaps
works for you, it might breaks things for systems where pkg-config is
not available: you unconditionally use ${PC_LIBUSB_LIBRARIES}, which
will only have a value if pkg-config is used. Instead could you try
something like this:

diff --git a/cmake/FindLIBUSB.cmake b/cmake/FindLIBUSB.cmake
index 169f594..7ae02b3 100644
--- a/cmake/FindLIBUSB.cmake
+++ b/cmake/FindLIBUSB.cmake
@@ -17,14 +17,18 @@ else (LIBUSB_INCLUDE_DIR AND LIBUSB_LIBRARIES)
         # in the FIND_PATH() and FIND_LIBRARY() calls
         find_package(PkgConfig)
         pkg_check_modules(PC_LIBUSB libusb-1.0)
+	IF (${PC_LIBUSB_FOUND})
+	  SET(LIBUSB_INCLUDE_DIR ${PC_LIBUSB_INCLUDE_DIRS})
+	  SET(LIBUSB_LIBRARIES ${PC_LIBUSB_LIBRARIES})
+	ENDIF ()
+    ENDIF ()
+    IF (NOT ${PC_LIBUSB_FOUND})
+      FIND_PATH(LIBUSB_INCLUDE_DIR libusb.h
+        HINTS $ENV{LIBUSB_ROOT}/include/libusb-1.0)
+      FIND_LIBRARY(LIBUSB_LIBRARIES NAMES libusb-1.0 usb-1.0 usb
+        HINTS $ENV{LIBUSB_ROOT}/VS2019/MS32/static)
+      include(FindPackageHandleStandardArgs)
+      FIND_PACKAGE_HANDLE_STANDARD_ARGS(LIBUSB DEFAULT_MSG LIBUSB_LIBRARIES LIBUSB_INCLUDE_DIR)
+      MARK_AS_ADVANCED(LIBUSB_INCLUDE_DIR LIBUSB_LIBRARIES)
     ENDIF ()
-    FIND_PATH(LIBUSB_INCLUDE_DIR libusb.h
-            HINTS $ENV{LIBUSB_ROOT}/include/libusb-1.0
-            PATHS ${PC_LIBUSB_INCLUDEDIR} ${PC_LIBUSB_INCLUDE_DIRS})
-    FIND_LIBRARY(LIBUSB_LIBRARIES NAMES libusb-1.0 usb-1.0 usb
-            HINTS $ENV{LIBUSB_ROOT}/VS2019/MS32/static
-            PATHS ${PC_LIBUSB_LIBDIR} ${PC_LIBUSB_LIBRARY_DIRS})
-    include(FindPackageHandleStandardArgs)
-    FIND_PACKAGE_HANDLE_STANDARD_ARGS(LIBUSB DEFAULT_MSG LIBUSB_LIBRARIES LIBUSB_INCLUDE_DIR)
-    MARK_AS_ADVANCED(LIBUSB_INCLUDE_DIR LIBUSB_LIBRARIES)
 endif (LIBUSB_INCLUDE_DIR AND LIBUSB_LIBRARIES)


The logic is:

- If pkg-config has found the library, assign LIBUSB_INCLUDE_DIR and
  LIBUSB_LIBRARIES to the values found by pkg-config

- If pkg-config has not found the library, proceed with find_path() and
  find_library().

Of course, we drop the hints passed to find_path() and find_library()
that were results of pkg-config... as if pkg-config has returned
meaningful results, we will no longer be calling find_path() and
find_library().

I am not 100% sure of my change (I did not even test it), but I believe
it is closer to something that has a chance of being acceptable
upstream.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
