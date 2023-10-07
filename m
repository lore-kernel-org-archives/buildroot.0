Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEBCE95A6A
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 20:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE14641B99;
	Sat,  7 Oct 2023 20:57:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE14641B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q8jCnItY8Eej; Sat,  7 Oct 2023 20:57:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B189041BA1;
	Sat,  7 Oct 2023 20:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B189041BA1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A187E1BF3BD
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 20:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B19360DE5
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 20:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B19360DE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U4ZisGCkNJul for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 20:57:52 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C6E660B13
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 20:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C6E660B13
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32157c8e4c7so3262674f8f.1
 for <buildroot@buildroot.org>; Sat, 07 Oct 2023 13:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696712270; x=1697317070;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V+4QGF0iy091xBdmiKhnxqTUX8FawY4Rld+O3Y2RZPo=;
 b=gBMXr4yfGKEQ4PHTf5PKR5Czd//mPAhj2ihxJWJCmZ3tqXtjnFdrt78PQltCT0zxRe
 YqNt0tYLu5pQk0Vewn23qYePsZLtjSglwkHybuu7NCR2NzrK83/gT5yW/RquvT6vK00f
 YM1iQyda4uCAvXq/jVGUzlFjWYVJUHyYVIT8ZtNsJp/vv9FUGeoBaIMYrMtb+jVERmcv
 O2knklnOYksnjqbdhZ2hnwgvTmqP5Fl1uJerwWjBABZ9QiIeaDuu1RHLAYjJqvQo/eFc
 N3O9/X3JDA2mQV0ONNscQtnnMm3VZTtHnsE01TxaTEjl99giiu/iocjQwpIDUc4h6VAp
 msbw==
X-Gm-Message-State: AOJu0YxaoNcrK8viJ/4FIA7pjsm9cNW9XBDbkipVMokeS10UfZNx/sQA
 9jMPtC+Kq40yNzI+d6blvkaQg1ZdecM=
X-Google-Smtp-Source: AGHT+IH4v45hift3WShaJaK9Nx5StKViosGWADKbKn1ct05F3GkOkEnbLytgpevy1Yu7etzhXCmWlg==
X-Received: by 2002:a5d:58ed:0:b0:31f:e026:30ac with SMTP id
 f13-20020a5d58ed000000b0031fe02630acmr10606339wrd.34.1696712269935; 
 Sat, 07 Oct 2023 13:57:49 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:77f1:3f6b:b690:928a])
 by smtp.gmail.com with ESMTPSA id
 v6-20020adff686000000b0031980294e9fsm5054562wrp.116.2023.10.07.13.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 13:57:49 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  7 Oct 2023 22:57:49 +0200
Message-Id: <20231007205749.443600-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696712270; x=1697317070; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=V+4QGF0iy091xBdmiKhnxqTUX8FawY4Rld+O3Y2RZPo=;
 b=kxyiy1aIjKH/z7belc2Rv4a7X2dreE6l4z7TdqNk0KGr65mn+PbB1A3qBki6bSy2V7
 zuRGp20C72co0k0ij9BPWv8MXVHUHTFnernUPGQk66mI5IAKVd2ntJcxU5zmk/DO8Xd6
 YTcE54ZUF0ghUBdlvaP44M2txotzSHx8Pdz8kEkppGBEwZDbY89q3f1mDfZ7LgHuzrnV
 2ews+6dwCcoF0/i9zD8CTloWrGfyFXIj8lS9eZKa1+kYB53PXDt39rjZ6YoUDQXiEVVK
 ZGelFu6A8xeDEnY55xfK6nShljy2j0YZk6pJElys6TQA22Xbcdkt9h9SyJSEQXiemG19
 t0Ew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kxyiy1aI
Subject: [Buildroot] [PATCH] support/bootlin-toolchains: don't depend on
 non-existent gcc version
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit a0d2a5cfec0a (support/scripts/gen-bootlin-toolchains: generate
BR2_ARCH_NEEDS_GCC_AT_LEAST_X guard) added a negative dependency to the
gcc version required by the configured architecture.

However, when the toolchain is using the latest gcc version currently
known to Buildroot, this generates a dependency on a non-existing gcc
version. For example, a toolchain using gcc 13, the most recent version
currently known to Buildroot, this would generate a dependency against
BR2_ARCH_NEEDS_GCC_AT_LEAST_14, which does not exist yet.

This dependency is in practice a no-op, because the symbol is missing,
so Kconfig evaluates it to false, and since it is negated, the
dependency is fulfilled. Still, this is spurious and semantically
incorrect.

We fix that by extracting the most recent gcc version that an
architecture may require, and use that to decide whether the guard is
needed for the toolchain.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vincent Fazio <vfazio@xes-inc.com>
---
 support/scripts/gen-bootlin-toolchains | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 4344221213..3b5f65515d 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -305,7 +305,7 @@ class Toolchain:
         return os.path.join(BASE_URL, self.arch, "fragments",
                             self.fname_prefix + ".frag")
 
-    def gen_config_in_options(self, f):
+    def gen_config_in_options(self, f, latest_gcc):
         f.write("config %s\n" % self.option_name)
         f.write("\tbool \"%s %s %s %s\"\n" %
                 (self.arch, self.libc, self.variant, self.version))
@@ -339,7 +339,8 @@ class Toolchain:
                 assert m, "Cannot get gcc version for toolchain %s" % self.fname_prefix
                 selects.append("BR2_TOOLCHAIN_GCC_AT_LEAST_%s" % m[1])
                 # respect the GCC requirement for the selected CPU/arch tuning
-                depends.append("!BR2_ARCH_NEEDS_GCC_AT_LEAST_%s" % str(int(m[1]) + 1))
+                if int(m[1]) + 1 <= latest_gcc:
+                    depends.append("!BR2_ARCH_NEEDS_GCC_AT_LEAST_%s" % str(int(m[1]) + 1))
 
             # kernel headers version
             if frag.startswith("BR2_TOOLCHAIN_EXTERNAL_HEADERS_"):
@@ -462,6 +463,17 @@ class Toolchain:
             (self.arch, self.libc, self.variant, self.version, self.option_name)
 
 
+def get_latest_gcc():
+    match = "config BR2_ARCH_NEEDS_GCC_AT_LEAST_"
+    with open("arch/Config.in", "r") as f:
+        latest = sorted([
+            int(line[len(match):].strip().split("_")[0])
+            for line in f.readlines()
+            if line.startswith(match)
+        ])[-1]
+    return latest
+
+
 def get_toolchains():
     toolchains = list()
     for arch, details in arches.items():
@@ -494,6 +506,7 @@ def get_toolchains():
 
 
 def gen_config_in_options(toolchains, fpath):
+    latest_gcc = get_latest_gcc()
     with open(fpath, "w") as f:
         f.write(AUTOGENERATED_COMMENT)
 
@@ -520,7 +533,7 @@ def gen_config_in_options(toolchains, fpath):
         f.write("\tprompt \"Bootlin toolchain variant\"\n")
 
         for toolchain in toolchains:
-            toolchain.gen_config_in_options(f)
+            toolchain.gen_config_in_options(f, latest_gcc)
 
         f.write("endchoice\n")
         f.write("endif\n")
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
