Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0C7E6E7F9
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 10:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BA4E8075F;
	Tue,  3 Feb 2026 10:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJyZkmyl-6zX; Tue,  3 Feb 2026 10:44:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C641381046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770115475;
	bh=pzgo9aZbeG2yNbaO6fJT/gkVmCUnT4F64NKmIfvzU5k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E8P3jHnX8Q8XV7VNhJKDjWcyf57elTVFRLtEAIaUU+BaLvPHcFz+Oct+qgg/OziDw
	 1igYo22XQXmZmlqUpt/XIruOduPWCDH/v7fuIyuIpfwVRppRnYbyn4GHAXun6sjade
	 zPgSrJfFRncsWBniqxNsgHS/SUftDIBUj06+/MYC+vRq/hhzQyHxMoUKVIURCrRvFq
	 odAZlYOb4B3ta1eFzJbpPzUYM/eOpNUTSsLJ9a1X314tSm5hXswfI5I8CW05ZCTEwg
	 q8aiRv2E68BZN4XBQYjkuLKAQfEYMkMx12IqS39GMg8skuE4J+q3KgBw1C4EHPM7C8
	 ALeXmZ3Tttqyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C641381046;
	Tue,  3 Feb 2026 10:44:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12A14F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F198841137
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XbIP-rlNMnFk for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 10:44:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8A3141135
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8A3141135
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:44:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAD8F8661B; Tue,  3 Feb 2026 10:44:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 11:37:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e4c663529d135088c78a9c7f4b59354f19d6580
X-Git-Newrev: bc2d04f30ddcabaa624479319f6dd54421f8767d
X-Patchwork-Hint: ignore
Message-Id: <20260203104423.CAD8F8661B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/depot-tools: fix python 3.14
 support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bc2d04f30ddcabaa624479319f6dd54421f8767d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport a fix to support python 3.14 [1].

depot-tools is used to build flutter package but it doesn't run due to
deprecated ast.Str et al. (since Py3.8) that was removed from python
3.14.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/12944797062

[1] https://chromium.googlesource.com/chromium/tools/depot_tools/+/80d6ca1b1ac55fbd9dd8f506417824591251b8eb

Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ce-deprecated-ast-types-with-ast.Constant.patch | 244 +++++++++++++++++++++
 1 file changed, 244 insertions(+)

diff --git a/package/depot-tools/0002-Replace-deprecated-ast-types-with-ast.Constant.patch b/package/depot-tools/0002-Replace-deprecated-ast-types-with-ast.Constant.patch
new file mode 100644
index 0000000000..09e88d04a2
--- /dev/null
+++ b/package/depot-tools/0002-Replace-deprecated-ast-types-with-ast.Constant.patch
@@ -0,0 +1,244 @@
+From 7d467257a7cd57e746885ea73ccbda903450b461 Mon Sep 17 00:00:00 2001
+From: jj <jj@imput.net>
+Date: Fri, 5 Dec 2025 11:47:42 -0800
+Subject: [PATCH] Replace deprecated ast types with ast.Constant
+
+ast.Str et al. have been deprecated since Py3.8 and have been
+completely removed in 3.14. Replace their usage with ast.Constant.
+
+This change should not have any functional impact, since
+according to [1]:
+> Changed in version 3.8: Class ast.Constant is now used for
+> all constants.
+> Deprecated since version 3.8: Old classes ast.Num, ast.Str,
+> [...]  instantiating them will return an instance of a
+> different class.
+
+[1] https://docs.python.org/3/library/ast.html
+
+Bug: 40283283
+Change-Id: I0ed8ef3910f921483bff118976f516c5a935e0fc
+Reviewed-on: https://chromium-review.googlesource.com/c/chromium/tools/depot_tools/+/7228507
+Reviewed-by: Gavin Mak <gavinmak@google.com>
+Reviewed-by: Yiwei Zhang <yiwzhang@google.com>
+Commit-Queue: jj <jj@chromium.org>
+
+Upstream: https://chromium.googlesource.com/chromium/tools/depot_tools/+/80d6ca1b1ac55fbd9dd8f506417824591251b8eb
+[Romain: backport to 097e2072377]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ gclient_eval.py                | 72 ++++++++++++++++++++--------------
+ tests/gclient_eval_unittest.py |  6 +++
+ 2 files changed, 49 insertions(+), 29 deletions(-)
+
+diff --git a/gclient_eval.py b/gclient_eval.py
+index f8a05d78a..94874e3ce 100644
+--- a/gclient_eval.py
++++ b/gclient_eval.py
+@@ -101,6 +101,24 @@ def _NodeDictSchema(dict_schema):
+     return validate
+ 
+ 
++def _IsConstant(node):
++    return isinstance(node, ast.Constant)
++
++
++def _IsStringConstant(node):
++    return _IsConstant(node) and isinstance(node.value, str)
++
++
++def _IsNameConstant(node):
++    return _IsConstant(node) \
++        and isinstance(node.value, (bool, type(None)))
++
++
++def _IsNumericConstant(node):
++    return _IsConstant(node) \
++        and isinstance(node.value, (int, float, complex)) \
++        and not isinstance(node.value, bool)
++
+ # See https://github.com/keleshev/schema for docs how to configure schema.
+ _GCLIENT_DEPS_SCHEMA = _NodeDictSchema({
+     schema.Optional(str):
+@@ -316,18 +334,18 @@ def _gclient_eval(node_or_string, filename='<unknown>', vars_dict=None):
+         node_or_string = node_or_string.body
+ 
+     def _convert(node):
+-        if isinstance(node, ast.Str):
++        if _IsStringConstant(node):
+             if vars_dict is None:
+-                return node.s
++                return node.value
+             try:
+-                return node.s.format(**vars_dict)
++                return node.value.format(**vars_dict)
+             except KeyError as e:
+                 raise KeyError(
+                     '%s was used as a variable, but was not declared in the vars dict '
+                     '(file %r, line %s)' %
+                     (e.args[0], filename, getattr(node, 'lineno', '<unknown>')))
+-        elif isinstance(node, ast.Num):
+-            return node.n
++        elif _IsNameConstant(node) or _IsNumericConstant(node):
++            return node.value
+         elif isinstance(node, ast.Tuple):
+             return tuple(map(_convert, node.elts))
+         elif isinstance(node, ast.List):
+@@ -349,9 +367,6 @@ def _gclient_eval(node_or_string, filename='<unknown>', vars_dict=None):
+                     'invalid name %r (file %r, line %s)' %
+                     (node.id, filename, getattr(node, 'lineno', '<unknown>')))
+             return _allowed_names[node.id]
+-        elif not sys.version_info[:2] < (3, 4) and isinstance(
+-                node, ast.NameConstant):  # Since Python 3.4
+-            return node.value
+         elif isinstance(node, ast.Call):
+             if (not isinstance(node.func, ast.Name)
+                     or (node.func.id not in ('Str', 'Var'))):
+@@ -366,8 +381,8 @@ def _gclient_eval(node_or_string, filename='<unknown>', vars_dict=None):
+                                                      '<unknown>')))
+ 
+             if node.func.id == 'Str':
+-                if isinstance(node.args[0], ast.Str):
+-                    return ConstantString(node.args[0].s)
++                if _IsStringConstant(node.args[0]):
++                    return ConstantString(node.args[0].value)
+                 raise ValueError(
+                     'Passed a non-string to Str() (file %r, line%s)' %
+                     (filename, getattr(node, 'lineno', '<unknown>')))
+@@ -594,8 +609,8 @@ def EvaluateCondition(condition, variables, referenced_variables=None):
+         main_node = main_node.body
+ 
+     def _convert(node, allow_tuple=False):
+-        if isinstance(node, ast.Str):
+-            return node.s
++        if _IsStringConstant(node):
++            return node.value
+ 
+         if isinstance(node, ast.Tuple) and allow_tuple:
+             return tuple(map(_convert, node.elts))
+@@ -627,8 +642,7 @@ def EvaluateCondition(condition, variables, referenced_variables=None):
+             # be evaluated.
+             return node.id
+ 
+-        if not sys.version_info[:2] < (3, 4) and isinstance(
+-                node, ast.NameConstant):  # Since Python 3.4
++        if _IsNameConstant(node):
+             return node.value
+ 
+         if isinstance(node, ast.BoolOp) and isinstance(node.op, ast.Or):
+@@ -696,11 +710,11 @@ def _UpdateAstString(tokens, node, value):
+         node = node.args[0]
+     position = node.lineno, node.col_offset
+     quote_char = ''
+-    if isinstance(node, ast.Str):
++    if _IsStringConstant(node):
+         quote_char = tokens[position][1][0]
+         value = value.encode('unicode_escape').decode('utf-8')
+     tokens[position][1] = quote_char + value + quote_char
+-    node.s = value
++    node.value = value
+ 
+ 
+ def _ShiftLinesInTokens(tokens, delta, start):
+@@ -793,11 +807,11 @@ def SetVar(gclient_dict, var_name, value):
+ 
+ def _GetVarName(node):
+     if isinstance(node, ast.Call):
+-        return node.args[0].s
++        return node.args[0].value
+ 
+-    if node.s.endswith('}'):
+-        last_brace = node.s.rfind('{')
+-        return node.s[last_brace + 1:-1]
++    if node.value.endswith('}'):
++        last_brace = node.value.rfind('{')
++        return node.value[last_brace + 1:-1]
+     return None
+ 
+ 
+@@ -821,9 +835,9 @@ def SetGCS(gclient_dict, dep_name, new_objects):
+     keys_to_update = ('object_name', 'sha256sum', 'size_bytes', 'generation')
+     for index, object_node in enumerate(objects_node.elts):
+         for key, value in zip(object_node.keys, object_node.values):
+-            if key.s not in keys_to_update:
++            if key.value not in keys_to_update:
+                 continue
+-            _UpdateAstString(tokens, value, new_objects[index][key.s])
++            _UpdateAstString(tokens, value, new_objects[index][key.value])
+ 
+     node.SetNode('objects', new_objects, objects_node)
+ 
+@@ -855,7 +869,7 @@ def SetCIPD(gclient_dict, dep_name, package_name, new_version):
+             "The deps entry for %s:%s has no formatting information." %
+             (dep_name, package_name))
+ 
+-    if not isinstance(node, ast.Call) and not isinstance(node, ast.Str):
++    if not isinstance(node, ast.Call) and not _IsStringConstant(node):
+         raise ValueError(
+             "Unsupported dependency revision format. Please file a bug to the "
+             "Infra>SDK component in crbug.com")
+@@ -880,15 +894,15 @@ def SetRevision(gclient_dict, dep_name, new_revision):
+         if isinstance(node, ast.BinOp):
+             node = node.right
+ 
+-        if isinstance(node, ast.Str):
++        if _IsStringConstant(node):
+             token = _gclient_eval(tokens[node.lineno, node.col_offset][1])
+-            if token != node.s:
++            if token != node.value:
+                 raise ValueError(
+                     'Can\'t update value for %s. Multiline strings and implicitly '
+                     'concatenated strings are not supported.\n'
+                     'Consider reformatting the DEPS file.' % dep_key)
+ 
+-        if not isinstance(node, ast.Call) and not isinstance(node, ast.Str):
++        if not isinstance(node, ast.Call) and not _IsStringConstant(node):
+             raise ValueError(
+                 "Unsupported dependency revision format. Please file a bug to the "
+                 "Infra>SDK component in crbug.com")
+@@ -897,15 +911,15 @@ def SetRevision(gclient_dict, dep_name, new_revision):
+         if var_name is not None:
+             SetVar(gclient_dict, var_name, new_revision)
+         else:
+-            if '@' in node.s:
++            if '@' in node.value:
+                 # '@' is part of the last string, which we want to modify.
+                 # Discard whatever was after the '@' and put the new revision in
+                 # its place.
+-                new_revision = node.s.split('@')[0] + '@' + new_revision
++                new_revision = node.value.split('@')[0] + '@' + new_revision
+             elif '@' not in dep_dict[dep_key]:
+                 # '@' is not part of the URL at all. This mean the dependency is
+                 # unpinned and we should pin it.
+-                new_revision = node.s + '@' + new_revision
++                new_revision = node.value + '@' + new_revision
+             _UpdateAstString(tokens, node, new_revision)
+             dep_dict.SetNode(dep_key, new_revision, node)
+ 
+diff --git a/tests/gclient_eval_unittest.py b/tests/gclient_eval_unittest.py
+index 03decdf30..3aed06156 100755
+--- a/tests/gclient_eval_unittest.py
++++ b/tests/gclient_eval_unittest.py
+@@ -30,6 +30,11 @@ class GClientEvalTest(unittest.TestCase):
+     def test_str(self):
+         self.assertEqual('foo', gclient_eval._gclient_eval('"foo"'))
+ 
++    def test_num(self):
++        self.assertEqual(42, gclient_eval._gclient_eval('42'))
++        self.assertEqual(1024.0, gclient_eval._gclient_eval('1024.0'))
++        self.assertEqual(42j, gclient_eval._gclient_eval('42j'))
++
+     def test_tuple(self):
+         self.assertEqual(('a', 'b'), gclient_eval._gclient_eval('("a", "b")'))
+ 
+@@ -40,6 +45,7 @@ class GClientEvalTest(unittest.TestCase):
+         self.assertEqual({'a': 'b'}, gclient_eval._gclient_eval('{"a": "b"}'))
+ 
+     def test_name_safe(self):
++        self.assertEqual(None, gclient_eval._gclient_eval('None'))
+         self.assertEqual(True, gclient_eval._gclient_eval('True'))
+ 
+     def test_name_unsafe(self):
+-- 
+2.52.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
