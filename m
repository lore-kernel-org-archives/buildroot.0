Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E445CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D6C26114D;
	Fri, 16 Oct 2026 13:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id FfazhIWYfuhd; Fri, 16 Oct 2026 13:12:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B0C6A611CB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156322;
	b=dwHJXM3xoHkXFZi9h1NVkB+jDbpAYGbmuBoVbP/3vdIYVVSkKOw/+2lZg3gh3faF+Ted
	 lFYFPBgZsB8wktjOVgrai/+bGHt+Q7bw/W6Qv1CidrNYnQnrzt61RP7YJ87rzMmaYyJci
	 hj+CDE3s4WlM4G9MESgDeeMJTtKq/9KL/nRKIebSV5P/oyUFYUmoeOeiy+UiDYN5wT0qR
	 u8rlq8+Hgx0kk0DWJV6/GIhRSj8+q+LL57TwRv7fzfp6GNyBnv/iHQ8ThMvc6tYbWzuoD
	 i1DN0qjko9zeSTorr5rEjiUt0B9fbXOwO/dL+BQ8A6jTCYgXYJqAX9NaNcHSiyQ/ZRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156322;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=RxpCfYlGkk8Lg4m72kFLPbTicq8woytUG8IJCsJo4Qo=;
	b=VMl1OGPXWm40NlrxsiDdcrzb2md0jgxRb2kpsoK6YZqs6ADszwxddkAft6u5xP12naiN
	 1JyowYB2aCqtQkeK2nd4tScLj46jSoKeOIe/4HcjUEktBTRa8A5HpyBIaN5n31wm0NhrE
	 c1yDGpn7TIPLWOjHoeEcj2WtXl98cqWPXXTz9Sa7nokoDqmnP1VfLx6Ee5tTCgT6BjgrA
	 7w5anBOhuGAjO0k7xDxZOGjpSHJ1U6WfOCrnnZ2sZJBVnssgHdGBimwf2w1iOC9Nfymte
	 WpX14qVJAuBgIr2jZwEisGeFAvrktCrnketksbxbphW3huMfegpR1sEsSuZ3Vaw8Lpw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156321;
	bh=RxpCfYlGkk8Lg4m72kFLPbTicq8woytUG8IJCsJo4Qo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WaNSlLpkucEr1wQCNZLbai77b2BNiGLzhufXU1ZQ00xZI/7XkxhDo0xSOXmf/MYVa
	 95Vc7YV2raE2XneWBl8fA4z0y4ES93Kihw32JZKA1+TC1AJUkOKT5MwMShmS114R6J
	 r/wwtrhnp2nVgtHfhw+YkHQhqgHFz02JFcIQ4b0Gbya9htmOBKrM2WXhtsuInP7p/U
	 CeQKzllDmZ/xPl8q8Obol+UcU1EvK41uFeKn7brakykj257+4QmIRu2DvReYFApFrT
	 UsFAmyn8CYYADWBKXfDJLiSIi/E95d18eLWNqXss+Z5viJPyxD3hE99lxjrRIqMISe
	 SyVFeP3pL/Fdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0C6A611CB;
	Fri, 16 Oct 2026 13:12:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 60E21769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E65B409F4
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CGYqePx6uJJh for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 74BED409F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156194;
 b=Mo/ZAMD+l8ALR5L+vpXIt8Jkq1EznxG5RWWpyFg5w37KU9SscR5Fyb+1sqMxKzkIGLZZ
 l9XDd0qEYnFfIwpeJzhvfqhlt++Kh0qSIU1JHNPp+mD4riIBDg4mg5AMZFJUY/MY56epF
 PCE4GVYu/BDfN7371AdZzcOK9IwHyFQJFjXIk3GnHnqoqIfBdYn1qfrXSj6WhXxD3HZel
 SLUBnX8UMT1Xz0jGPDm8Ld2f1WICnsLqQHKNt4M1bUPiUIjS4pmYFxPh4kycQw4jqNcuy
 R4riWgjtUaSktbG8vii5Y0NOAeKF69lvCPm1MLE8Z93CMHeSeMn6V1lKDxeRAAyxtDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156194;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=kmmhQDilSt0oQhNTJjTBUgJslZRyEh8b97+1cvUpuh4=;
 b=XHsnGPLr/byuCn4m1YrTJ2aMewcxb7WOTP7WoDYTifVaKbM3u06MXwPuT7tCq5UJSMzk
 rnWuD4KXD2Cj+irAhHwVWLok1yp4+BXKIWCp65lSrA1FbYC8CZa2gyow2CaDbP8TbQXHh
 f7UliQO/Pa9yN/EG7Z0mqmUEdlPh4RmF2bmmRR9gA8pi61/d9IbAfjz7JkF2s1AwMTaZC
 PJwA5GOM7RM8PsDt+FAUhoSyxt0Y6xY4SMZnLMaXNNvwKIMo1hvNapsdQGoOItcxRCaR1
 aTntKitRcKQSeT0LbPXXCmJdemdq9hRFHxoK6DFh4WbkUDD9wqQqUX5Jkiw5x3Wb5AQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74BED409F3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63B66960D3; Fri, 16 Oct 2026 13:08:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:46:29 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 30173a8c58e7ecef04ef139fbccaa30a9f549198
X-Git-Newrev: bb5e615593297c0ad2e6f7d82d10e96878c01324
X-Patchwork-Hint: ignore
Message-Id: <20261016130833.63B66960D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/check-symbols:
 check for undefined host symbols
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6595252504739111544=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6595252504739111544==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bb5e615593297c0ad2e6f7d82d10e96878c01324
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

get_warnings_for_symbols_without_definition() skips any symbol
matching BR2_PACKAGE_HOST_* or BR2_PACKAGE_HAS_HOST_*, via
br.re_host_symbol. This blanket exclusion was needed because
we don't require a Config.in.host to be present for host packages,
so BR2_PACKAGE_HOST_FOO may in fact be undefined and that's
perfectly fine.

However, this also excludes any other options that should be defined in
the Config.in.host, e.g. a BR2_PACKAGE_HOST_FOO_BAR suboption. If such
an option is misspelled in the .mk file, we will not notice.

We already treat the BR2_PACKAGE_* symbols specially. They are
considered as "used" even if there is no direct reference to them in the
.mk file. This is done in the handle_eval function. Depending on the
package infra and the type of package (bootloader, toolchain, ...) it
sets the corresponding kconfig symbol as "used".

At that point, we can also handle the special case of the host kconfig
symbols. Instead of a blanket exclusion, we say that the
BR2_PACKAGE_HOST_FOO option is implicitly defined by the eval statement.
We only add BR2_PACKAGE_HOST_FOO as implicitly defined, so any
suboptions will still be checked by
get_warnings_for_symbols_without_definition().

We could alternatively also have skipped the "usage" marking of host
packages. This approach felt more consistent though.

Make handle_eval() in checksymbolslib/makefile.py record the
implicitly defined symbols directly, at the $(eval $(host-...))
line that creates them:
- BR2_PACKAGE_HOST_<PKG> as a definition, for host-*-package and
  host-virtual-package;
- BR2_PACKAGE_HAS_HOST_<PKG> as virtual, for host-virtual-package,
  mirroring how the plain virtual-package case already registers
  BR2_PACKAGE_HAS_<PKG>.

This makes br.re_host_symbol and its use in
get_warnings_for_symbols_without_definition() unnecessary, so drop
them. The check now flags a real symbol name once it lacks both an
explicit and an implicit definition, instead of ignoring the whole
BR2_PACKAGE_HOST_*/BR2_PACKAGE_HAS_HOST_* namespace.

Assisted-by: LLM
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 48e4bab464ccc6c829c57bf01482c2dc29af4301)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/checksymbolslib/br.py            |  1 -
 utils/checksymbolslib/db.py            |  2 --
 utils/checksymbolslib/makefile.py      |  7 +++++++
 utils/checksymbolslib/test_db.py       |  4 ----
 utils/checksymbolslib/test_makefile.py | 11 ++++++++---
 5 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/utils/checksymbolslib/br.py b/utils/checksymbolslib/br.py
index a4c1b84c56..f3afa18a0a 100644
--- a/utils/checksymbolslib/br.py
+++ b/utils/checksymbolslib/br.py
@@ -120,7 +120,6 @@ re_menu = re.compile(r'^\s*menu\b')
 re_endmenu = re.compile(r'^\s*endmenu\b')
 re_comments = re.compile(r'#.*$')
 re_legacy_special_comment = re.compile(r'#.*(BR2_\w+)\s.*still referenced')
-re_host_symbol = re.compile(r'(BR2_PACKAGE_HOST_\w+|BR2_PACKAGE_HAS_HOST_\w+)')
 re_makefile_symbol_usage = re.compile(r'\$\((BR2_\w+)\)')
 re_makefile_symbol_export = re.compile(r'export\s*(BR2_\w+)')
 re_makefile_symbol_attribution = re.compile(r'^\s*(BR2_\w+)\s*[?:=]')
diff --git a/utils/checksymbolslib/db.py b/utils/checksymbolslib/db.py
index cb0dfa476f..a92fe8e382 100644
--- a/utils/checksymbolslib/db.py
+++ b/utils/checksymbolslib/db.py
@@ -122,8 +122,6 @@ class DB:
                 continue
             if legacy_definition in entries:
                 continue
-            if br.re_host_symbol.search(symbol):
-                continue
             if br.is_an_optional_symbol_for_a_roofts(symbol):
                 continue
             if symbol in br.symbols_defined_only_at_command_line:
diff --git a/utils/checksymbolslib/makefile.py b/utils/checksymbolslib/makefile.py
index e3894dd1f9..084530c29b 100644
--- a/utils/checksymbolslib/makefile.py
+++ b/utils/checksymbolslib/makefile.py
@@ -28,6 +28,8 @@ def handle_eval(db, filename, lineno, line):
         return
 
     # mimic package/pkg-generic.mk and package/pkg-virtual.mk
+    # They have ifeq ($$($$($(2)_KCONFIG_VAR)),y) so consider that a usage.
+    # Virtual packages have additional conditions.
     if '$(virtual-' in line:
         prefixes = ['BR2_PACKAGE_PROVIDES_', 'BR2_PACKAGE_HAS_']
         if filename.startswith('toolchain/'):
@@ -39,8 +41,13 @@ def handle_eval(db, filename, lineno, line):
         prefixes.append(prefix)
     elif '$(host-virtual-' in line:
         prefixes = ['BR2_PACKAGE_HOST_', 'BR2_PACKAGE_PROVIDES_HOST_', 'BR2_PACKAGE_HAS_HOST_']
+        # For host packages, we allow it to not be defined in Config.in.host, so
+        # consider the symbol as defined as well.
+        db.add_symbol_definition('BR2_PACKAGE_HOST_' + package, filename, lineno)
+        db.add_symbol_virtual('BR2_PACKAGE_HAS_HOST_' + package, filename, lineno)
     elif '$(host-' in line:
         prefixes = ['BR2_PACKAGE_HOST_']
+        db.add_symbol_definition('BR2_PACKAGE_HOST_' + package, filename, lineno)
     elif filename.startswith('boot/'):
         prefixes = [br.boot_prefix]
     elif filename.startswith('toolchain/'):
diff --git a/utils/checksymbolslib/test_db.py b/utils/checksymbolslib/test_db.py
index 15576fa897..ee5b626168 100644
--- a/utils/checksymbolslib/test_db.py
+++ b/utils/checksymbolslib/test_db.py
@@ -156,8 +156,6 @@ def test_get_warnings_for_symbols_without_definition():
     db.add_symbol_usage_in_legacy('BR2_undef3', 'file', 3)
     db.add_symbol_usage('BR2_undef3', 'another', 1)
     db.add_symbol_legacy_usage('BR2_undef3', 'another', 2)
-    db.add_symbol_usage('BR2_PACKAGE_HOST_undef', 'file', 1)
-    db.add_symbol_usage('BR2_PACKAGE_HAS_HOST_undef', 'file', 1)
     db.add_symbol_usage('BR2_TARGET_ROOTFS_undef_XZ', 'file', 1)
     db.add_symbol_usage('BR2_GRAPH_ALT', 'file', 1)
     db.add_symbol_usage('BR2_EXTERNAL', 'file', 1)
@@ -170,8 +168,6 @@ def test_get_warnings_for_symbols_without_definition():
         'BR2_undef1': {'normal usage': {'file': [1]}},
         'BR2_undef2': {'legacy usage': {'file': [2]}},
         'BR2_undef3': {'usage inside legacy': {'file': [3]}, 'normal usage': {'another': [1]}, 'legacy usage': {'another': [2]}},
-        'BR2_PACKAGE_HOST_undef': {'normal usage': {'file': [1]}},
-        'BR2_PACKAGE_HAS_HOST_undef': {'normal usage': {'file': [1]}},
         'BR2_TARGET_ROOTFS_undef_XZ': {'normal usage': {'file': [1]}},
         'BR2_GRAPH_ALT': {'normal usage': {'file': [1]}},
         'BR2_EXTERNAL': {'normal usage': {'file': [1]}},
diff --git a/utils/checksymbolslib/test_makefile.py b/utils/checksymbolslib/test_makefile.py
index 9d24484124..859d99e42d 100644
--- a/utils/checksymbolslib/test_makefile.py
+++ b/utils/checksymbolslib/test_makefile.py
@@ -74,12 +74,15 @@ handle_eval = [
      {'add_symbol_usage': [
          call('BR2_PACKAGE_PROVIDES_HOST_FOO', 'package/foo/foo.mk', 18),
          call('BR2_PACKAGE_HAS_HOST_FOO', 'package/foo/foo.mk', 18),
-         call('BR2_PACKAGE_HOST_FOO', 'package/foo/foo.mk', 18)]}),
+         call('BR2_PACKAGE_HOST_FOO', 'package/foo/foo.mk', 18)],
+      'add_symbol_definition': [call('BR2_PACKAGE_HOST_FOO', 'package/foo/foo.mk', 18)],
+      'add_symbol_virtual': [call('BR2_PACKAGE_HAS_HOST_FOO', 'package/foo/foo.mk', 18)]}),
     ('host generic package',
      'package/foo/foo.mk',
      18,
      '$(eval $(host-package))',
-     {'add_symbol_usage': [call('BR2_PACKAGE_HOST_FOO', 'package/foo/foo.mk', 18)]}),
+     {'add_symbol_usage': [call('BR2_PACKAGE_HOST_FOO', 'package/foo/foo.mk', 18)],
+      'add_symbol_definition': [call('BR2_PACKAGE_HOST_FOO', 'package/foo/foo.mk', 18)]}),
     ('boot package',
      'boot/foo/foo.mk',
      18,
@@ -178,7 +181,9 @@ handle_usage = [
      {'add_symbol_usage': [
          call('BR2_PACKAGE_PROVIDES_HOST_FOO', 'package/foo/foo.mk', 18),
          call('BR2_PACKAGE_HAS_HOST_FOO', 'package/foo/foo.mk', 18),
-         call('BR2_PACKAGE_HOST_FOO', 'package/foo/foo.mk', 18)]}),
+         call('BR2_PACKAGE_HOST_FOO', 'package/foo/foo.mk', 18)],
+      'add_symbol_definition': [call('BR2_PACKAGE_HOST_FOO', 'package/foo/foo.mk', 18)],
+      'add_symbol_virtual': [call('BR2_PACKAGE_HAS_HOST_FOO', 'package/foo/foo.mk', 18)]}),
     ]
 
 

--===============6595252504739111544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6595252504739111544==--
