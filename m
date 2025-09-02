Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8B4CA1007
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 21:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C3EE41A73;
	Tue,  2 Sep 2025 21:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXk0mFN3UZDq; Tue,  2 Sep 2025 21:04:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23BF94188A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23BF94188A;
	Tue,  2 Sep 2025 21:04:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A70FED2
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 21:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A6D084149
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 21:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8F7orgfIS6HF for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 21:04:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 898E983F4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 898E983F4B
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 898E983F4B
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 21:04:15 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-619487c8865so513125a12.1
 for <buildroot@buildroot.org>; Tue, 02 Sep 2025 14:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756847053; x=1757451853;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2VmwLBr9aklM2WZV+/ol2O2LHTkMBpM4PRhoP004X30=;
 b=D4Mx9u0pcQE63CTsTIish9d7gdi/tATW77klkIP0ZVEOzg6FEyjaHz+aEqli/pSemu
 oHShGGsc6OmXIW/lCL3SZhAT+Q8mbRU5ZlBzYonebL6GZ2Abswz0msRQKI3kOyicaCV6
 kS6uwQF81Z0b2P/4ZnPVcqd4eY4A8sSi5gEl+KSE594K4jAMFYuvZhskkhBdiJ0kLyyR
 LNFtGfRZ+iICWq+uQQTaoHPpjhrHWhlOCq9BC2SySd2A2QG/0gUk16anPmZ3akN91py1
 EYvE6iq9JShjRoVajfRrmCRbywtYmkRZAW2/PH+ETqStyW18bb80aHGUQtgCGFh7Mo0p
 Hz7Q==
X-Gm-Message-State: AOJu0YxEq5KlLfkES1LOxuZk9wO070F1jKHz3Jsm/gTHhK7+Dkv41XBx
 yUGtlFDHxGifnC0BFNsSBS5ZCiiGSECcuBMUOmP8WTw8edaPBPG8CNtrl6/evb1UJ8BhYUyRBGx
 MpRyV
X-Gm-Gg: ASbGnctr3/oJqV5coJ8eVaagyT7ROJGdZRoOK+VgF3nENiU7k6MzLchf22WKcVT1l9o
 0z+gLDY51aETVtgxGxWqFJwihN1jebkhcSvC+BXzTCVgEoZzjqyMCjfkGLeCIDOLTplZLfTbYFM
 uy3ihno1gY8s1xsQQ4z+GzndQTFFl7PnfhJo4TaCJFKjoA1byneELLXwtJHm7jkhrG6P5XjOHIw
 ixI6aIBcN5GZugQXq7pJ8lDkNSvHXDiEQoxKGQB+zhDBK8MKtiGq5vMnceX1OwDg35T9/cs/mgJ
 0jEbs0HQTOjEzbogUdpeSptaGL8CgkaT7nme0iS6S8xZ2olk1y8FzvM/MeF3WKIc5C/AaU2YFbz
 QYFJvnv6phMog+kEnQc1aTuVETHRKBIOHpeCDnBS+oIUjZ6C415/4LaAXo7PTatwOO631mjYhuS
 H+8XBp/oSy/08YFG/m2xBRGfQgBsZgG1/XA8g3elbL8tVCLeyoSRbfQfFl0/UrwmBPUfB5vw==
X-Google-Smtp-Source: AGHT+IG27OdZMygTe6qLduXm+Vc90xv7nlM4B2uPat9UelRKXzxqVP+GlD0GgFHycMeUeJrHRSCGBg==
X-Received: by 2002:a17:907:940a:b0:afe:159:14b1 with SMTP id
 a640c23a62f3a-b01d8a8b621mr1479180466b.9.1756847053249; 
 Tue, 02 Sep 2025 14:04:13 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b03fa921a32sm859876666b.31.2025.09.02.14.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 14:04:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Tue,  2 Sep 2025 23:04:08 +0200
Message-ID: <20250902210408.668877-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1756847053; x=1757451853;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2VmwLBr9aklM2WZV+/ol2O2LHTkMBpM4PRhoP004X30=;
 b=jl0PkZsj2KWzsetZSlme/3gyskz4QGDlrKTviiy8iEcPD7RYR8iEMjuFXHQusV7uGz
 K+vIe+BceYHn0dtiNkTmlpzLKmwPvwoADE7LKc/Jc+DDsPxYgxSs8ov05osDD33fJn35
 +7oInqm4uvqGt1sppV8PRI7oRFcpHeKZDnsGw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=jl0PkZsj
Subject: [Buildroot] [PATCH 1/1] package/pocketpy: bump to version 2.1.1
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

The LICENSE sha256 changed because of a date update (2023 -> 2024),
not due to any substantive license modification.

Release notes:
https://github.com/pocketpy/pocketpy/releases/tag/v2.1.1

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/pocketpy/0001-fix-371.patch | 73 -----------------------------
 package/pocketpy/pocketpy.hash      |  4 +-
 package/pocketpy/pocketpy.mk        |  2 +-
 3 files changed, 3 insertions(+), 76 deletions(-)
 delete mode 100644 package/pocketpy/0001-fix-371.patch

diff --git a/package/pocketpy/0001-fix-371.patch b/package/pocketpy/0001-fix-371.patch
deleted file mode 100644
index 6d9e324ba762..000000000000
--- a/package/pocketpy/0001-fix-371.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From e2e3bdca6e79ce7be5607397c5f0152c28c7500b Mon Sep 17 00:00:00 2001
-From: blueloveTH <blueloveth@foxmail.com>
-Date: Sat, 7 Jun 2025 02:19:55 +0800
-Subject: [PATCH] fix #371
-
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: backport from https://github.com/pocketpy/pocketpy/commit/70e824a6b695e963621664589d1d00aeb182c018
----
- include/pocketpy/pocketpy.h | 2 +-
- src/interpreter/vm.c        | 6 ++++--
- src/public/modules.c        | 2 +-
- 3 files changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/include/pocketpy/pocketpy.h b/include/pocketpy/pocketpy.h
-index a44faa41a922..a6cb4f658f73 100644
---- a/include/pocketpy/pocketpy.h
-+++ b/include/pocketpy/pocketpy.h
-@@ -69,7 +69,7 @@ typedef struct py_Callbacks {
-     /// Used by `print` to output a string.
-     void (*print)(const char*);
-     /// Used by `input` to get a character.
--    int (*getchar)();
-+    int (*getchr)();
- } py_Callbacks;
- 
- /// Native function signature.
-diff --git a/src/interpreter/vm.c b/src/interpreter/vm.c
-index 2bae82740ac7..2da28fa80730 100644
---- a/src/interpreter/vm.c
-+++ b/src/interpreter/vm.c
-@@ -29,6 +29,8 @@ static char* pk_default_importfile(const char* path) {
- 
- static void pk_default_print(const char* data) { printf("%s", data); }
- 
-+static int pk_default_getchr() { return getchar(); }
-+
- static void py_TypeInfo__ctor(py_TypeInfo* self,
-                               py_Name name,
-                               py_Type index,
-@@ -67,7 +69,7 @@ void VM__ctor(VM* self) {
- 
-     self->callbacks.importfile = pk_default_importfile;
-     self->callbacks.print = pk_default_print;
--    self->callbacks.getchar = getchar;
-+    self->callbacks.getchr = pk_default_getchr;
- 
-     self->last_retval = *py_NIL();
-     self->curr_exception = *py_NIL();
-@@ -810,7 +812,7 @@ int py_replinput(char* buf, int max_size) {
-     printf(">>> ");
- 
-     while(true) {
--        int c = pk_current_vm->callbacks.getchar();
-+        int c = pk_current_vm->callbacks.getchr();
-         if(c == EOF) return -1;
- 
-         if(c == '\n') {
-diff --git a/src/public/modules.c b/src/public/modules.c
-index 3efb362701e2..cdfd5549461a 100644
---- a/src/public/modules.c
-+++ b/src/public/modules.c
-@@ -205,7 +205,7 @@ static bool builtins_input(int argc, py_Ref argv) {
-     c11_sbuf buf;
-     c11_sbuf__ctor(&buf);
-     while(true) {
--        int c = pk_current_vm->callbacks.getchar();
-+        int c = pk_current_vm->callbacks.getchr();
-         if(c == '\n' || c == '\r') break;
-         if(c == EOF) break;
-         c11_sbuf__write_char(&buf, c);
--- 
-2.43.0
-
diff --git a/package/pocketpy/pocketpy.hash b/package/pocketpy/pocketpy.hash
index aabd5f077a2b..4032fda442f8 100644
--- a/package/pocketpy/pocketpy.hash
+++ b/package/pocketpy/pocketpy.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  5e07994d66311a6b5ac032cc5243aaabe3ab318946971e7fa1cd0614934efc81  pocketpy-2.0.8.tar.gz
-sha256  d3a2bf8ca609a75941e980e62c13cf5a21aeaa4a2502822934d282fe7de5d319  LICENSE
+sha256  34976a5eb099869b134d93bd4c801cb330bb17466f2b1f4543a5217034a867cd  pocketpy-2.1.1.tar.gz
+sha256  9dab6fe9086f93847540387be578edc94b6b280004db5ed7c850ccf8f086fd66  LICENSE
diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
index 20a8e9ad1e20..74e6b4910deb 100644
--- a/package/pocketpy/pocketpy.mk
+++ b/package/pocketpy/pocketpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCKETPY_VERSION = 2.0.8
+POCKETPY_VERSION = 2.1.1
 POCKETPY_SITE = $(call github,pocketpy,pocketpy,v$(POCKETPY_VERSION))
 POCKETPY_LICENSE = MIT
 POCKETPY_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
