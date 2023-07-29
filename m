Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB90C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 04:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B292840AC;
	Sat, 29 Jul 2023 04:14:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B292840AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qJpFiTq4bzFc; Sat, 29 Jul 2023 04:14:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2E8F83F8E;
	Sat, 29 Jul 2023 04:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2E8F83F8E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B61351BF2C0
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 04:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88DD983F8E
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 04:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88DD983F8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XU7m9Gz0W4rU for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 04:14:43 +0000 (UTC)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90C4C83BF2
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 04:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90C4C83BF2
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-785d738d3feso66794639f.0
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 21:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690604082; x=1691208882;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iD/ny5rgHaCuaYnZFZ0YZKQM02cbWyUr3OSmDqa2x9g=;
 b=XDuJ+3nk/kNYY674aGeA0tSuw6/v8NpuZkrk5BWaJmfIfx+WFHExv/iDKPbFSiRQW9
 e5D74XRZdWbuAAR9w6S/yYzdtiwaXaZXeKmJkYwz1peer0vONIA0TQTnk4JKiJWt7PQH
 3UUvWqLj3xJicYBvbt95zvY9mvuvqbNlsC9UN0hopi8KowuteYffdsn3MKYcQrX7hiH1
 cXg2mlgJ+yb6eTQQ/v1VdovEfnlQQsRhQ6ZqbxWIM9SMBMii4fEfI2MbZknoC1VYudOy
 FMCnl8as661c9RMpUnc5FKrG+k/nylnUQoO5PkHU9JNJUIL6bvjnJmpdQ2ceisgfnVjR
 tN4w==
X-Gm-Message-State: ABy/qLZ5UpLt482172SWL1J5Nxo6/1hHNLycFZMuTZDS28mQWsWij9XQ
 WsWlpzYRq5g5xyz7RyV7P2h0KnQ+92Y=
X-Google-Smtp-Source: APBJJlF0VmBE2X2YbljllLJkRiA+Zoxtp9/vKJEdVqCcddhOx6V1ftbOLYHIUBmZzs1r8KC+YRn6wQ==
X-Received: by 2002:a05:6602:22c5:b0:783:727a:8e15 with SMTP id
 e5-20020a05660222c500b00783727a8e15mr1622761ioe.6.1690604082171; 
 Fri, 28 Jul 2023 21:14:42 -0700 (PDT)
Received: from james-x399.localdomain (71-218-110-92.hlrn.qwest.net.
 [71.218.110.92]) by smtp.gmail.com with ESMTPSA id
 b19-20020a056602219300b007836252a084sm1635001iob.48.2023.07.28.21.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 21:14:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 22:14:18 -0600
Message-Id: <20230729041418.2490902-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690604082; x=1691208882;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iD/ny5rgHaCuaYnZFZ0YZKQM02cbWyUr3OSmDqa2x9g=;
 b=CWVgBXGiGrISFtCsy1BwbNdpivhnjnV4H5rVe3ySSvW1Uauma29+wtnQ/xgtim1Gua
 87FWg45zOibi5dEyBx6zSXy5HJeXYmsNNQFxeaipJ8hi5elFSLygmI6jba/jBEbJohA1
 s3cq/eQLwv1vLcKs7Jg5t9+zDqfS5MVZOYGGSY4PgtXddNlI9cJjnjP0CsvJwMuxoQnt
 9jRTNR6syVaQlO+b3JZrUKy76F2LGi8p6MFosQAqInT+PNbM2mO574QWiNp7W0c0qeB0
 3ZC1XN2JFT/006tKWas0axzMtyFMrogzm4b8LhnMw3ofkOJwsDYnTDGMVTOhA4/Yq0ea
 nXdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=CWVgBXGi
Subject: [Buildroot] [PATCH 1/1] package/dbus: bump to version 1.14.8
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Also apply system.conf and session.conf updates to dbus-broker.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/dbus-broker/session.conf | 15 +++++++++++++++
 package/dbus-broker/system.conf  | 25 ++++++++++++++++++++++---
 package/dbus/dbus.hash           |  6 +++---
 package/dbus/dbus.mk             |  3 ++-
 4 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/package/dbus-broker/session.conf b/package/dbus-broker/session.conf
index e4758fa218..8e9488b1db 100644
--- a/package/dbus-broker/session.conf
+++ b/package/dbus-broker/session.conf
@@ -12,6 +12,18 @@
        the behavior of child processes. -->
   <keep_umask/>
 
+  <listen>unix:tmpdir=/tmp</listen>
+
+  <!-- On Unix systems, the most secure authentication mechanism is
+  EXTERNAL, which uses credential-passing over Unix sockets.
+
+  This authentication mechanism is not available on Windows,
+  is not suitable for use with the tcp: or nonce-tcp: transports,
+  and will not work on obscure flavours of Unix that do not have
+  a supported credentials-passing mechanism. On those platforms/transports,
+  comment out the <auth> element to allow fallback to DBUS_COOKIE_SHA1. -->
+  <auth>EXTERNAL</auth>
+
   <standard_session_servicedirs />
 
   <policy context="default">
@@ -23,6 +35,9 @@
     <allow own="*"/>
   </policy>
 
+  <!-- Include legacy configuration location -->
+  <include ignore_missing="yes">/etc/dbus-1/session.conf</include>
+
   <!-- Config files are placed here that among other things,
        further restrict the above policy for specific services. -->
   <includedir>session.d</includedir>
diff --git a/package/dbus-broker/system.conf b/package/dbus-broker/system.conf
index 4b17fbd90e..272f92361e 100644
--- a/package/dbus-broker/system.conf
+++ b/package/dbus-broker/system.conf
@@ -14,18 +14,33 @@
   <!-- Our well-known bus type, do not change this -->
   <type>system</type>
 
-  <!-- Fork into daemon mode -->
-  <fork/>
-
   <!-- Run as special user -->
   <user>dbus</user>
 
+  <!-- Fork into daemon mode -->
+  <fork/>
+
   <!-- We use system service launching using a helper -->
   <standard_system_servicedirs/>
 
+  <!-- This is a setuid helper that is used to launch system services -->
+  <servicehelper>/usr/libexec/dbus-daemon-launch-helper</servicehelper>
+
+  <!-- Write a pid file -->
+  <pidfile>/run/messagebus.pid</pidfile>
+
   <!-- Enable logging to syslog -->
   <syslog/>
 
+  <!-- Only allow socket-credentials-based authentication -->
+  <auth>EXTERNAL</auth>
+
+  <!-- Only listen on a local socket. (abstract=/path/to/socket
+       means use abstract namespace, don't really create filesystem
+       file; only Linux supports this. Use path=/whatever on other
+       systems.) -->
+  <listen>unix:path=/run/dbus/system_bus_socket</listen>
+
   <policy context="default">
     <!-- All users can connect to system bus -->
     <allow user="*"/>
@@ -54,6 +69,8 @@
            send_interface="org.freedesktop.DBus.Introspectable"/>
     <allow send_destination="org.freedesktop.DBus"
            send_interface="org.freedesktop.DBus.Properties"/>
+    <allow send_destination="org.freedesktop.DBus"
+           send_interface="org.freedesktop.DBus.Containers1"/>
     <!-- But disallow some specific bus services -->
     <deny send_destination="org.freedesktop.DBus"
           send_interface="org.freedesktop.DBus"
@@ -84,6 +101,8 @@
            send_interface="org.freedesktop.DBus.Debug.Stats"/>
   </policy>
 
+  <!-- Include legacy configuration location -->
+  <include ignore_missing="yes">/etc/dbus-1/system.conf</include>
 
   <!-- The defaults for these limits are hard-coded in dbus-daemon.
        Some clarifications:
diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 0e48d4dafd..638bb4bc6f 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.28.tar.gz.asc
+# https://dbus.freedesktop.org/releases/dbus/dbus-1.14.8.tar.xz.asc
 # using key 36EC5A6448A4F5EF79BEFE98E05AE1478F814C4F
-sha256  9da1e3f2b73f75eec0a9e4509d64be43909d1f2853fe809528a0a53984d76420  dbus-1.12.28.tar.gz
+sha256  a6bd5bac5cf19f0c3c594bdae2565a095696980a683a0ef37cb6212e093bde35  dbus-1.14.8.tar.xz
 
 # Locally calculated
-sha256  0e46f54efb12d04ab5c33713bacd0e140c9a35b57ae29e03c853203266e8f3a1  COPYING
+sha256  e61807cd1c32ff4e7bd5b4b61dd21997c6dc5642cf19316124fe38d50e1f9fa3  COPYING
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 99d2c4301c..930b1a298b 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -6,7 +6,8 @@
 
 # When updating dbus, check if there are changes in session.conf and
 # system.conf, and update the versions in the dbus-broker package accordingly.
-DBUS_VERSION = 1.12.28
+DBUS_VERSION = 1.14.8
+DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.xz
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
