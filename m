Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB70C433F5
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 21:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 040E6408D4;
	Thu, 25 Nov 2021 21:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u1sA_xGFGaHA; Thu, 25 Nov 2021 21:59:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52416408D0;
	Thu, 25 Nov 2021 21:59:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 165091BF263
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 21:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB4C760653
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 21:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rRAgdqsmwN4A for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 21:59:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42AD760633
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 21:59:29 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id s13so14461767wrb.3
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 13:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JCh8fLbBDkNBYZqzI+/jmSb3M6Z9Nyu/FXPh7w8y9FE=;
 b=LdyeMZ+qPmgVeTU424fzognk+8FZLIJR4BwcEr5BToGzPrVnyVm0q7hmLtSGmcADHR
 +xqacQppiXzGYJaOlh5/++5MxBrvI+KSswbTB2x7BRFDXkukuDlmezWPQX1SZAXo3sKW
 8pKPTCWC7fyGK9tlLuCgzjFWfY5zQzm8vTh4adGJHJEE8HQmealm+3XpV0LpXV/lHBdX
 7l754K7/qo0fTfYcRCYTgwix0V/Ze49DHlEnx6ULDPS7NHrNKsA6z36P3RVMTYrf5Cin
 mnIIrLcnDWxp6eKLXCcygPU7mAvQFDfsImK7udlACVMaUf/KoaYC+ipARY3kgeayzSkc
 PZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JCh8fLbBDkNBYZqzI+/jmSb3M6Z9Nyu/FXPh7w8y9FE=;
 b=Zl06pjP+v8JM+rZK/bC8PtN5gllzp/L2ACsU5V2N4+iRK5gjfQjUeBSxeAQAjvuAzu
 euWEquLidb0MP3+/6SvfNqatN//dGl86ukZGHIurL7Uyk2woEPhdNF/304WACgfK/Fax
 gqkHeb5Wyyw6bRDpWym2WaGCjM3CgWGJlMNmjIK4ATm1MLwiX+xyOycnb/NeuLnOTmgk
 p0YI7e6bQQl/YPSHr0yL2y0mDxxRhRjI4i4phTPevNPI38QDozULUMP0t8hzLZG6Nwkq
 gHxkVhQJG2cmw1SZtah4DTWW5V1V4fP5uE9V2G0xnM394u3dLBBtKpWJEvhf/dP0oRTX
 0k1Q==
X-Gm-Message-State: AOAM5332yXugjD5FzupxF+5gNUBpYyyI7sOdNhPsjaMWJdigUtbYHnKA
 W+WjlV8ln+I+9izbB+Hj4/qlRIos5Qo=
X-Google-Smtp-Source: ABdhPJwVzwOIzXYEi+OQw7SxtQlyBIvjmv9dMdZXchPXXioo/rcLAxDMubo5TRht7V0iTwmjQ+qrWQ==
X-Received: by 2002:a5d:4a52:: with SMTP id v18mr9992593wrs.499.1637877567088; 
 Thu, 25 Nov 2021 13:59:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id k8sm3691637wrn.91.2021.11.25.13.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 13:59:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Nov 2021 22:56:54 +0100
Message-Id: <20211125215654.4189447-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] utils/checkpackagelib/lib_mk.py: check
 typo in define
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Check typo in define to detect SMAKE_LINUX_CONFIG_FIXUPS in smack
(fixed by 41e2132fbe8a8fc237ca4a2cd2eff9bd9ced09a6)

Add GCC_TARGET in ALLOWED variable to avoid the following warnings:

arch/arch.mk:12: possible typo: GCC_TARGET_ARCH -> *ARCH*
arch/arch.mk:13: possible typo: GCC_TARGET_ABI -> *ARCH*
arch/arch.mk:14: possible typo: GCC_TARGET_NAN -> *ARCH*
arch/arch.mk:15: possible typo: GCC_TARGET_FP32_MODE -> *ARCH*
arch/arch.mk:16: possible typo: GCC_TARGET_CPU -> *ARCH*
arch/arch.mk:17: possible typo: GCC_TARGET_FPU -> *ARCH*
arch/arch.mk:18: possible typo: GCC_TARGET_FLOAT_ABI -> *ARCH*
arch/arch.mk:19: possible typo: GCC_TARGET_MODE -> *ARCH*

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/checkpackagelib/lib_mk.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index d09922f724..9178931276 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -236,6 +236,7 @@ class TypoInPackageVariable(_CheckFunction):
         "BR_CCACHE_INITIAL_SETUP",
         "BR_LIBC",
         "BR_NO_CHECK_HASH_FOR",
+        "GCC_TARGET",
         "LINUX_EXTENSIONS",
         "LINUX_POST_PATCH_HOOKS",
         "LINUX_TOOLS",
@@ -248,7 +249,7 @@ class TypoInPackageVariable(_CheckFunction):
         "TARGET_FINALIZE_HOOKS",
         "TARGETS_ROOTFS",
         "XTENSA_CORE_NAME"]))
-    VARIABLE = re.compile(r"^([A-Z0-9_]+_[A-Z0-9_]+)\s*(\+|)=")
+    VARIABLE = re.compile(r"^(define )?([A-Z0-9_]+_[A-Z0-9_]+)")
 
     def before(self):
         package, _ = os.path.splitext(os.path.basename(self.filename))
@@ -258,7 +259,7 @@ class TypoInPackageVariable(_CheckFunction):
         # linux extensions do not use LINUX_EXT_ prefix for variables
         package = package.replace("LINUX_EXT_", "")
         self.package = package
-        self.REGEX = re.compile(r"^(HOST_|ROOTFS_)?({}_[A-Z0-9_]+)".format(package))
+        self.REGEX = re.compile(r"(HOST_|ROOTFS_)?({}_[A-Z0-9_]+)".format(package))
         self.FIND_VIRTUAL = re.compile(
             r"^{}_PROVIDES\s*(\+|)=\s*(.*)".format(package))
         self.virtual = []
@@ -268,7 +269,7 @@ class TypoInPackageVariable(_CheckFunction):
         if m is None:
             return
 
-        variable = m.group(1)
+        variable = m.group(2)
 
         # allow to set variables for virtual package this package provides
         v = self.FIND_VIRTUAL.search(text)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
