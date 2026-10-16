Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567C0CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12EE460F68;
	Fri, 16 Oct 2026 13:10:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4VlXSaFOaRd; Fri, 16 Oct 2026 13:10:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 60B6260F1C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156203;
	b=kLRd05rZOgjK8zfoa+jVbJZGPfg8fsPm3Lgq8Kyc76g1Gwl2HGpm6V6ETKoGLVzfVIcA
	 UoUlgzEIKwrzXR26NJbhpN/4d1syQguk4s1f1xNZ4FZnE0Bu3txYYgcibftxF+wMoCgCB
	 yWSEyx86C1iKlSAWAwhvU+bWKByn1uPaOUIJs4OQfKwZq4hDsIiFEwtAx+37/AnE9s4y/
	 xbg3xdlucP9uCveyBYucYiMcWJY2g2MUU+rq/1i/qY397By8AFW4Apl3iJcqXfnHRGthC
	 Ndp+viZ6fTWA8sz1nuYEYhHpnjoyKcAgCBMpld5O0eDytvsOAOiBN9LnMAiTu4mZZoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156203;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=3YAbZRvqjUO/DRfr5NoYvubV7D0EOGpQPnqZduyOECs=;
	b=KOCCeEMjkQb3cPDLTGfTZoRSRawzvH+nV4b54MyhXGxd8CnuWK+qKtJq0bYOEpgxfFyP
	 +c3ZeT+P8qpm/oOZgOL3NfH1qaqgeMGWocPJG6ZqEqgP04f9JgVWtD++c8RCtjekrEeKs
	 H9PQlbahImT7re72c90sMZNdsLZp9lJw9T9MGBhtkABG5pOpdT+2e9I0njzmQHTyFQgTy
	 rLWdkWO3o1ZEpvsExrDmOsPk8HpEV/z9fwRGa6yR3TtaFqsM7WIv5q9dUxuBdq2QLesOU
	 fkDW4021fVXK+M5DK1fZklNwO9jdMrZGwBfjxyZRIVbxpO6Wgdtt/TzrlttDpls1lPA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156203;
	bh=3YAbZRvqjUO/DRfr5NoYvubV7D0EOGpQPnqZduyOECs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VEWbu2iD+96prgtBrnS/ah4IG5z7u86Yw0+50IkBr3j5KMxKq4QfO8UlSoegzAS+c
	 8p3x3sTq2CYPFCy+SB7s7m8YY2bsdrDPWldxrsWdU7skzyqVGy8WnP+LRilqwclkZ5
	 3OQi9DlQvGOTY41Ej/6IgCJsoIQnvDnaZZKwIxMwcv6bN4YL/bUm3LwP30YKAUgWJJ
	 3d2kiovphcL6dANu4kTJMO11z5ilXGdS/NQRZ4ZBktQ5aE2yr+oQD3YUI8Fhoxo+Fz
	 iU+sUZSY10FrxtWmQxdVU0JHddO8aewY/OhsUrFMyjHMM8Krw/cHHytSRpfC0jM4in
	 0RJi5BJjk43sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60B6260F1C;
	Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05E88769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E01D5409F3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0sTqUBVyUdA for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 02A38409F2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156109;
 b=pJds4RuBnXmU0w2uZf6zWy/EvBbho/ZuUj29N9VKIZtZ4w4G1DHszFbHrbcgmKrE1/J1
 6UcMhWjHPRAka4MIP7V2sI44/xfjXqEe+QvJcx57BcdKhzV6ifWIRXIUMzb0rBC/PBf9T
 KP0aPLqMumpsW5qMH/xWF+mGsnGE6vGFVAqdkau+STCUK9Yy67gBoPAQyN7KhfY2Qlan7
 mKhlqgcnS2dBM+wSfgb6t9EMO4fgp/BFVkZggjWJLFrJQJyqevMN8Bp9LtQt+sVdIXRED
 CJmtmiUvu0PeBAyyt3zcCrMpayrGJoKlvdsUcmdnCNN03wZuIO2v74oDucaBF7OjJ5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156109;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FB0TebkyoV/7nNg/oNkuIlX95ZxkA9aDumAwA67OfXM=;
 b=K1J5iHqt4LoY3G24ZjcHt+6/XYuZNG5m197l9RZQYLTGYhoijt5F4NLcyUy05k9MvTwq
 /kDqnSEXmWSYt+24r5ce8ODRW10m0mpnhAH+cpR0RQ+9O2i7STiXeNTLiDU5r04bPUNOa
 m7OMHPHN7qy94WVtH1Mwddjv6T0u/gf5f00ItELhTKfxmhwsnUIh5efJaLdXBNwEsZoQY
 Ir0Y7KQaHL+vzQmd8ktnaYwbfWhLb0SM02OhqIDgsQQbkeAL8+xCi+b9o6SVQOkRupFSo
 c0LITZsyuAfFqXV0VIwDR6xHJUVVLWhwz/8KRaPDiL8rWvVun+eiRAc52S0CqD6u3OA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02A38409F2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7ED8960D5; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 613db8496ad628b37e97882eac521f3e8c90f255
X-Git-Newrev: 51c583748ac5bf3c15086ddd2eb9a7209d5ef26a
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.E7ED8960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/check-symbols:
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1355736679613086563=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1355736679613086563==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/51c583748ac5bf3c15086ddd2eb9a7209d5ef26a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 1dc6564b2f..f8ba1cc6c1 100644
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
 
 

--===============1355736679613086563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1355736679613086563==--
