Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99BDC4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CAF260E71;
	Sun,  1 Jan 2023 23:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CAF260E71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgxJDQfB9SkV; Sun,  1 Jan 2023 23:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B10D760C16;
	Sun,  1 Jan 2023 23:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B10D760C16
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE23E1BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6F0981378
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6F0981378
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OwwoRNX3xI5g for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:40:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9101812CC
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9101812CC
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:40:11 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id j130so18188309oif.4
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:40:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gvz8Dp9shjSo61+Fv6KKlzbnsB9izBGoiuj1EFP98sQ=;
 b=XfKUjU4IsjIKEBKZdHZpK/L0oGdygeuI8s6uZhNvPN44lgLH2B3xMwXsJIPn77y0It
 6pn/UXbEyLtwVcq9QYuTe6i2rljqoc8y+uQn+GMlu5nvhvPGiDtda/qI4r0onfr8fvwX
 c14x1Dwtdw8zdYwDQXY1eEk+oqvwgjddX3+VhnbIQQ2ijthrc8bNCIlUBoTydiCdh3s1
 UoQRh8KhXMv4URA+yra+wVz0LWF3nKAq2DzXU5pQA38/WOnv8fqWf5Tztk7LP+jz3BNB
 rEDE7HGRcGevipKTb5mCYi022TMOoWqqg1FtRtuxT2UN9MKuO7rmr+GTqzqB9yCB7zsu
 wzBg==
X-Gm-Message-State: AFqh2kqyouoj2R3gMTerFS4v8LmhnDnU8LzGlBgYDnNZGdwtf5jgVwLj
 BCngFr6lHeaqIHhIcfTcAgDnVY1K04g=
X-Google-Smtp-Source: AMrXdXvTCHuy/NK8pEjZOb/tew+nxkXkIl/i6rBTWKiGAifdw2GgcTJsKapRvY/QwCqc0bnMf0+h4g==
X-Received: by 2002:aca:130c:0:b0:363:b6b9:4682 with SMTP id
 e12-20020aca130c000000b00363b6b94682mr1990451oii.34.1672616410916; 
 Sun, 01 Jan 2023 15:40:10 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:40:09 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:50 -0300
Message-Id: <20230101233653.487175-27-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gvz8Dp9shjSo61+Fv6KKlzbnsB9izBGoiuj1EFP98sQ=;
 b=JG02+hK591i9cwezqH8zuvlthpGElDGS9eKMIFk+5Wr7WcpJt9c7RYufdlogtXQ41T
 S5mqlzLMBtYxH2/j0yN8DhGa4L8u/JJDyhWWkqrBsRZW9MQvfyjIsg22ajguXJN8fA46
 MarBK5wax/BTfqPZh2oZYUJ6GG7XNvz4N4HWmde4d6uBimcG/evyf8OcYaOFXotvrUG3
 Ybkcqh3qxFBzePrhfMHAHieMnuVhNIpWpgfwqLDHqSJyRdMR1x8WjnY4rWpAD6RdO4yl
 DQ6j1OWTJbxM8f7544sdyG8/KBufx1fTCU01anwkFSHvy3dZ00xfyGX7etc8NhmoNTU+
 vaeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JG02+hK5
Subject: [Buildroot] [PATCH 26/29] utils/check-package: check linux-tools
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Each linux tool uses a fragment of a .mk file, named, for instance:
package/linux-tools/linux-tool-cpupower.mk.in
So currently check-package does not check these files.

Add the support in check-package script.
At the same time, factor out a function to derive package prefix from
the filename being checked, so the fix (calling os.path.splitext twice)
can be applied in a single place.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Running on current master generates no warnings.
---
 utils/check-package                  |  3 ++-
 utils/checkpackagelib/lib_mk.py      | 28 ++++++++++---------
 utils/checkpackagelib/test_lib_mk.py | 40 ++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+), 14 deletions(-)

diff --git a/utils/check-package b/utils/check-package
index f64daed84c..6bd0c0b31f 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -61,6 +61,7 @@ DO_CHECK_INTREE = re.compile(r"|".join([
 DO_NOT_CHECK_INTREE = re.compile(r"|".join([
     r"boot/barebox/barebox\.mk$",
     r"fs/common\.mk$",
+    r"package/alchemy/atom.mk.in$",
     r"package/doc-asciidoc\.mk$",
     r"package/pkg-\S*\.mk$",
     r"toolchain/helpers\.mk$",
@@ -84,7 +85,7 @@ def get_lib_from_filename(fname):
         return checkpackagelib.lib_config
     if fname.endswith(".hash"):
         return checkpackagelib.lib_hash
-    if fname.endswith(".mk"):
+    if fname.endswith(".mk") or fname.endswith(".mk.in"):
         return checkpackagelib.lib_mk
     if fname.endswith(".patch"):
         return checkpackagelib.lib_patch
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index b0bd52bdf6..931fa39dda 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -21,6 +21,16 @@ continue_conditional = ["elif", "else"]
 end_conditional = ["endif"]
 
 
+def get_package_prefix_from_filename(filename):
+    package = os.path.splitext(os.path.splitext(os.path.basename(filename))[0])[0]
+    # linux tools do not use LINUX_TOOL_ prefix for variables
+    package = package.replace("linux-tool-", "")
+    # linux extensions do not use LINUX_EXT_ prefix for variables
+    package = package.replace("linux-ext-", "")
+    package_upper = package.replace("-", "_").upper()
+    return package, package_upper
+
+
 class Indent(_CheckFunction):
     COMMENT = re.compile(r"^\s*#")
     CONDITIONAL = re.compile(r"^\s*({})\s".format("|".join(start_conditional + end_conditional + continue_conditional)))
@@ -179,12 +189,10 @@ class RemoveDefaultPackageSourceVariable(_CheckFunction):
     packages_that_may_contain_default_source = ["binutils", "gcc", "gdb"]
 
     def before(self):
-        package, _ = os.path.splitext(os.path.basename(self.filename))
-        package_upper = package.replace("-", "_").upper()
-        self.package = package
+        self.package, package_upper = get_package_prefix_from_filename(self.filename)
         self.FIND_SOURCE = re.compile(
             r"^{}_SOURCE\s*=\s*{}-\$\({}_VERSION\)\.tar\.gz"
-            .format(package_upper, package, package_upper))
+            .format(package_upper, self.package, package_upper))
 
     def check_line(self, lineno, text):
         if self.FIND_SOURCE.search(text):
@@ -254,16 +262,10 @@ class TypoInPackageVariable(_CheckFunction):
     VARIABLE = re.compile(r"^(define\s+)?([A-Z0-9_]+_[A-Z0-9_]+)")
 
     def before(self):
-        package, _ = os.path.splitext(os.path.basename(self.filename))
-        package = package.replace("-", "_").upper()
-        # linux tools do not use LINUX_TOOL_ prefix for variables
-        package = package.replace("LINUX_TOOL_", "")
-        # linux extensions do not use LINUX_EXT_ prefix for variables
-        package = package.replace("LINUX_EXT_", "")
-        self.package = package
-        self.REGEX = re.compile(r"(HOST_|ROOTFS_)?({}_[A-Z0-9_]+)".format(package))
+        _, self.package = get_package_prefix_from_filename(self.filename)
+        self.REGEX = re.compile(r"(HOST_|ROOTFS_)?({}_[A-Z0-9_]+)".format(self.package))
         self.FIND_VIRTUAL = re.compile(
-            r"^{}_PROVIDES\s*(\+|)=\s*(.*)".format(package))
+            r"^{}_PROVIDES\s*(\+|)=\s*(.*)".format(self.package))
         self.virtual = []
 
     def check_line(self, lineno, text):
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index 5f5663377b..d817cdece0 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -3,6 +3,40 @@ import checkpackagelib.test_util as util
 import checkpackagelib.lib_mk as m
 
 
+get_package_prefix_from_filename = [
+    ('linux extension',
+     'linux/linux-ext-aufs.mk',
+     ['aufs', 'AUFS']),
+    ('linux tool',
+     'package/linux-tools/linux-tool-gpio.mk.in',
+     ['gpio', 'GPIO']),
+    ('boot',
+     'boot/binaries-marvell/binaries-marvell.mk',
+     ['binaries-marvell', 'BINARIES_MARVELL']),
+    ('toolchain',
+     'toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk',
+     ['toolchain-external-bootlin', 'TOOLCHAIN_EXTERNAL_BOOTLIN']),
+    ('package, underscore, subfolder',
+     'package/x11r7/xapp_bitmap/xapp_bitmap.mk',
+     ['xapp_bitmap', 'XAPP_BITMAP']),
+    ('package, starting with number',
+     'package/4th/4th.mk',
+     ['4th', '4TH']),
+    ('package, long name',
+     'package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk',
+     ['perl-mojolicious-plugin-authentication', 'PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION']),
+    ('package, case sensitive',
+     'package/libeXosip2/libeXosip2.mk',
+     ['libeXosip2', 'LIBEXOSIP2']),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,expected', get_package_prefix_from_filename)
+def test_get_package_prefix_from_filename(testname, filename, expected):
+    prefix_lower, prefix_upper = m.get_package_prefix_from_filename(filename)
+    assert [prefix_lower, prefix_upper] == expected
+
+
 Indent = [
     ('ignore comment at beginning of line',
      'any',
@@ -496,6 +530,12 @@ TypoInPackageVariable = [
      'OTHERS_VAR = \n',
      [['any.mk:2: possible typo: OTHERS_VAR -> *ANY*',
        'OTHERS_VAR = \n']]),
+    ('linux tool',
+     'package/linux-tools/linux-tool-cpupower.mk.in',
+     'CPUPOWER_DEPENDENCIES =\n'
+     'POWER_DEPENDENCIES +=\n',
+     [['package/linux-tools/linux-tool-cpupower.mk.in:2: possible typo: POWER_DEPENDENCIES -> *CPUPOWER*',
+       'POWER_DEPENDENCIES +=\n']]),
     ]
 
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
