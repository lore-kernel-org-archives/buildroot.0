Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409A2D339B2
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 18:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B392260728;
	Fri,  5 Dec 2025 18:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZTtFBYMVvCYW; Fri,  5 Dec 2025 18:19:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B769F606A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764958741;
	bh=+6bRMFH7+hZP+EnlOVrSEQ6luGT7eXqR6W+/hntdMOQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g0VLLmqL+jxx/m+jBzKMuomLwR62F54YjnUS06BIOk5eLBbClAH7lLSx1X43+EyqV
	 bKzkbO4Y6uwjBeDSw8rdu8z/JgT4ZDS/5LtPhR7N3d8FCnOGUFPNtYLfKw5PNdIXW3
	 O4dqtyrQqglglBEBbFMC0YWi3YCUYftFqeOSh/89bE8GVQIp+XZyFGyn6GOvLbJUi6
	 VgIXa8iJ4nq4rYRolGle4kYmijf+nowLBpzgsSVA86cPjK7mhiR1O6U9KZFpzcf/jl
	 RLkxXGXDccUFaxyrOS8ezAIiE0eCcxM7dbys+4OczLyewaHgasI5lOKsatI7TKb5QK
	 hI7QXCw3vM58g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B769F606A3;
	Fri,  5 Dec 2025 18:19:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F198D34B
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 18:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFBAA40BCD
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 18:18:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vReJ0t8o-7GV for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 18:18:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CCC8140BCB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCC8140BCB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCC8140BCB
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 18:18:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BB827A4C21AD
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:18:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46326)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRaON-000000002gT-02fV
 for buildroot@buildroot.org; Fri, 05 Dec 2025 18:18:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  5 Dec 2025 19:18:55 +0100
Message-ID: <20251205181855.1699260-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764958735;
 bh=uy65N0V7pI0nrAmJZGBamjlx9xR6LWbT+lyNjGjV9B0=;
 h=From:To:Subject:Date:From;
 b=UluA9UFj3TU4qPbddN9omQyjP6YUmobY4DW/bRl/artUMsXSmpS1dnfqR3rjnG2n0
 PuX3UY8F02tzd3SoVOeI/eqwxUGy7YlaAW+R02Apd05ws8oJ75/IyhuX/ytH8AjK9y
 igQCQdKbS9i1ydj9mByRBP+2K38EirVgdfU3Adr/fkrqIj8CrgiXqjGKVvlvqfq87m
 Joa5l1AlPy5Vwktz9dAcvmdYntGe7M3+u3cnTsa7PACmVLcsId6OXPcxNByiBM1SNh
 iayB++zsso54jWBHmuv7bKDofqFKxuAMhiY8vk8fLI1Sfnr6GBI+a4cRGSbhW/KYdF
 B4ugfxecYDRBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=UluA9UFj
Subject: [Buildroot] [PATCH 1/1] package/lrzsz: fix build error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://autobuild.buildroot.net/results/2e3/2e33c61e1c9bee099f973c1e43b696c63e5eed4b/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/lrzsz/0007-force-cross-compile.patch | 36 ++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/lrzsz/0007-force-cross-compile.patch

diff --git a/package/lrzsz/0007-force-cross-compile.patch b/package/lrzsz/0007-force-cross-compile.patch
new file mode 100644
index 0000000000..48b029208d
--- /dev/null
+++ b/package/lrzsz/0007-force-cross-compile.patch
@@ -0,0 +1,36 @@
+Fix build error
+
+xstrtol.h:11:19: error: implicit declaration of function 'strtol';
+ did you mean 'xstrtol'? [-Wimplicit-function-declaration]
+   11 | # define __strtol strtol
+
+When build host and target share the same arch the test for cross-
+compiling may fail to detect this leading to further errors which
+leads to "#undef STDC_HEADERS" being added to config.h. This in turn
+prevents "#include <stdlib.h>" in lib/xstrtol.c causing a build error.
+
+Patching configure.in is not an option because autoreconf fails and
+upstream meanwhile added heavy changes to the "whole autoconf/automake/
+libtool/gettext mess":
+https://github.com/UweOhse/lrzsz/commit/29ec4b7c2869fee3f0e8d65c42779ead11c34f07
+
+So we patch configure directly to force a cross-compiled build.
+
+Adding ac_cv_header_stdc=yes to lrzsz.mk would also fix the build error
+but masks the fact that the cross-compile environment is misdetected.
+
+Upstream: not applicable
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/configure	2025-12-05 19:07:42.514385175 +0100
++++ b/configure	2025-12-05 19:07:55.506624148 +0100
+@@ -1059,7 +1059,7 @@
+   ac_cv_prog_cc_works=yes
+   # If we can't run a trivial program, we are probably using a cross compiler.
+   if (./conftest; exit) 2>/dev/null; then
+-    ac_cv_prog_cc_cross=no
++    ac_cv_prog_cc_cross=yes
+   else
+     ac_cv_prog_cc_cross=yes
+   fi
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
