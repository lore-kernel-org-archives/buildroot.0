Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF6EC36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E61ED82F96;
	Wed,  9 Apr 2025 20:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdZGUfXPrPTq; Wed,  9 Apr 2025 20:04:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63CA283F6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63CA283F6A;
	Wed,  9 Apr 2025 20:04:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D4CAD6
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EE5683F6C
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYtXnhJHVi2M for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 298D581D47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 298D581D47
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 298D581D47
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:54 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3965c995151so3706396f8f.1
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229032; x=1744833832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q20E/oKAo1nWCTGYr/YpypjHmDII19i3Yhc6oDMkLd4=;
 b=NOUXmZUFsQoYf3XarR506QS+6n3HUh+5vCaHEf42194PgDSyGW5ybXT82S66PSAUdP
 jInQjVSeRa1zWN5DRdQbENK8U0XOfzXzG7Qd7ItpHCbO1Pqwu+KiUaeIf1K4A3e60BgS
 6yPeySSCB3tu5WJ93w4Itxpkh/AITh+ECQVaPiP/4dEPFnRfvDfm6pOZnNimnc1BeJZr
 2XVxo9ybEdwQaMJqLA0Byj+f+9hUJthXNLKtWis31FB+OJkuX3LMrZzK+scmeuEpElmP
 3SEBGbE3hrNOB1Xi7TcekwzLNfFmTojFgaKn33WnIpHpjlXbYGcnxxhcCDsYlh1hVhFO
 dgPg==
X-Gm-Message-State: AOJu0Yx+2VL8+9wbOhlPv/LCjDn8B12ulYspIGA4ks29WncDyPpl2myL
 wxVksJ4z5lKnGVrUD6/C1vdmVLBeAsZl370Hz9UVWAlVeEX9sSITmebUcA==
X-Gm-Gg: ASbGncuK07Dq8U8igd12LBJJjS2sfweUE5l/+qjnSa2wdaz8H9UG73EKqjsqgVQQj54
 2j5rnRBJP77m6lZBYbaajeRIOWTnmxHQJXyw13+CLshtBiVop5F6HLwEh4O2O7y+f6Cte02G2BH
 P0nA9x9bM/k+lZ92OshOC1263JvzJuVYEhml4kaccakgV+MDH55cJfF/PLptSskJEbCZ7Wo3BxU
 bjaV9Y28rgOC6GA6F8IYLbeflgn2Oy3p6nKTltZ3X93tqRrjQ0heTG1SRHxzzlpNeDnuvbRp04/
 FghUq5qQOb5Wi01xa6Bc5tJmh8CbLtWZoeQ2ThKHAPGuWILBBvU=
X-Google-Smtp-Source: AGHT+IHRGkuZITrsi9YxIhJjL/19MXFBCe1h7V2Yn+e+WWv25+4YiFNDkC+mc8xUU5tjdignQ34xTQ==
X-Received: by 2002:a05:6000:2489:b0:38f:4d20:4a17 with SMTP id
 ffacd0b85a97d-39d8f46d2aemr60871f8f.13.1744229031951; 
 Wed, 09 Apr 2025 13:03:51 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:51 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Wed,  9 Apr 2025 22:03:31 +0200
Message-ID: <69f8ee0c0869514db4fde819edd063d8a7913957.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229032; x=1744833832; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q20E/oKAo1nWCTGYr/YpypjHmDII19i3Yhc6oDMkLd4=;
 b=mULrt63nJy5EDQvtGIe0I4s/pRgYlJPyQv5pQ5HfA22oWENXON8PIvBZB85rV+F6zr
 WopM+RtRoK4QFcpC0sXc/SO4EyXRhwPpmhvcpF1H0u4cS5w6ndn6r1H7a2D/jpA1ArSk
 mQC4TvGGfbNzdMWeHBO3vt/3RHUeJjoy5kKNB5BdMyM5E9vzqtaE+hzwIKSkmByD3yM2
 +jJy8oOOSbtxBGh7k/d0da8zS19+I7WFkl2eif22xb5FB5yK6VJyNEa0qUMKdf1SEmVq
 UjVutPI/5Sd3jgapqt1vYWUpe/IRog9LV7KcPuS7XpbE+3d/0Y0HGaqYwpBlhfFsXaEd
 YgjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mULrt63n
Subject: [Buildroot] [PATCH 16/29 v2] utils/check-symbols: allow ignoring
 some defined-but-unused symbols
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

In some situations, it might be needed to not report some symbols that
are defined but not used; we already have a few heuristics for that.

For example, a symbol that selects another will not be reported as being
unused; this was what allowed the linux-tools symbols to not be reported
as unused so far.

However, there is no way to identify symbols that are (re)constructed in
Makefile code, for example from a list, like so:

    foo/Config.in:
        config BR2_PACKAGE_FOO
            bool "foo"
        if BR2_PACKAGE_FOO
        config BR2_PACKAGE_FOO_BAR
            bool "foo bar"
        config BR2_PACKAGE_FOO_BOO
            bool "foo boo"
        [...]
        endif

    foo/foo.mk:
        FOO_FEATS = bar boo and that many sub features in the foo package
        FOO_OPTS = \
            $(foreach feat, $(FOO_FEATS), \
                $(if $(BR2_PACKAGE_FOO_$(call UPPER,$(feat))),--enable-$(f),--disable-$(f)) \
            )

Although we currently have no such case, we are going to introduce one
in the following commits, for example for boost, where we currently
maintain the list of features (libraries) twice, once each for the
target and host variants, and where we repeat ad nauseam a common
construct. By having a single list with all the Boost libraries, and
reconstructing the corresponding Kconfig symbols, we can more easily
share the list between host and target, and easily update the construct
to enable/disable the libraries, as well as easily validate that list is
still up-to-date by asking boost's buildsystem.

Ideally, we would like to extend checksymbolslib to handle that case,
but it is going to be really, like really-really tricky to handle: there
is no trivial, or even mildly complex, heuristic that we can envision to
cover that case...

Instead, we decided to add a rule to be able to exclude symbols
definitions:

    # check-symbol ignore
    config BR2_PACKAGE_FOO_BAR

Those ignore directives are only valid (at least for now) for a symbol
declaration, so we make it a new warning when an ignore directive does
not guard a symbol definition. We also make it a warning when a symbol
that so guarded, is actually in use (as noted above, a symbol that
selects another is interpreted as being in use, even if it is itself
never referenced).

Finally, we want to also be able to ignore those ignore directives, if
at least to assess how many there are in the tree. So, to that effect,
we introduce the --strict option to check-symbols.

Adapt the test-suite to suit: all cases described above are tested.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>

--
Note: it took a bit of time for me to wrap my head around check-symbols
and its test-suite. So, here's a proposal for reviewing the code, in
this order:
 1. utils/checksymbolslib/db.py
    - the DB constructor defines if the DB is strict or not
    - the DB exposes the API to add ignored symbols and incorrect ignore
      directives
    - the DB exposes the API to retrieve the incorrect ignore directives
 2. utils/checksymbolslib/br.py
    - it adds the pattern to match the ignore directives
 3. utils/checksymbolslib/kconfig.py
    - the parser adds a new handler to detect ignore directives and
      store them in the DB
 4. utils/check-symbols
    - it creates the DB with the specified strictness
    - it reports invalid ignore directives
 5. utils/checksymbolslib/test_db.py
    - an ignored symbol is added to the existing DB test
    - a new test is added for incorrect ignore directives
 6. utils/checksymbolslib/test_kconfig.py
    - it adds a definition to be ignored, and a incorrect ignore
      directive
---
 utils/check-symbols                   |  9 ++--
 utils/checksymbolslib/br.py           |  1 +
 utils/checksymbolslib/db.py           | 61 +++++++++++++++++++++++++-
 utils/checksymbolslib/kconfig.py      | 18 ++++++++
 utils/checksymbolslib/test_db.py      | 17 ++++++++
 utils/checksymbolslib/test_kconfig.py | 63 +++++++++++++++++++++++++--
 6 files changed, 161 insertions(+), 8 deletions(-)

diff --git a/utils/check-symbols b/utils/check-symbols
index bb78790994..0877db0071 100755
--- a/utils/check-symbols
+++ b/utils/check-symbols
@@ -12,6 +12,8 @@ def parse_args():
     parser = argparse.ArgumentParser()
     parser.add_argument('--search', action='store', default=None,
                         help='print all symbols matching a given regular expression')
+    parser.add_argument('--strict', action='store_true',
+                        help='include ignored lines in warnings')
     return parser.parse_args()
 
 
@@ -20,8 +22,8 @@ def change_to_top_dir():
     os.chdir(base_dir)
 
 
-def get_full_db(files_to_process):
-    db = DB()
+def get_full_db(strict, files_to_process):
+    db = DB(strict)
     for f in files_to_process:
         file.populate_db_from_file(db, f)
     return db
@@ -51,7 +53,7 @@ def __main__():
     change_to_top_dir()
     all_files = file.get_list_of_files_in_the_repo()
     files_to_process = file.get_list_of_files_to_process(all_files)
-    db = get_full_db(files_to_process)
+    db = get_full_db(flags.strict, files_to_process)
 
     if flags.search:
         print_filenames_with_pattern(all_files, files_to_process, flags.search)
@@ -66,6 +68,7 @@ def __main__():
     warnings += db.get_warnings_for_symbols_with_legacy_note_and_no_usage()
     warnings += db.get_warnings_for_symbols_without_definition()
     warnings += db.get_warnings_for_symbols_without_usage()
+    warnings += db.get_warnings_for_invalid_ignore()
 
     for filename, lineno, msg in sorted(warnings):
         print('{}:{}: {}'.format(filename, lineno, msg), file=sys.stderr)
diff --git a/utils/checksymbolslib/br.py b/utils/checksymbolslib/br.py
index a4c1b84c56..dc58187dbe 100644
--- a/utils/checksymbolslib/br.py
+++ b/utils/checksymbolslib/br.py
@@ -82,6 +82,7 @@ barebox_infra_suffixes = [
     '_USE_DEFCONFIG',
 ]
 re_kconfig_symbol = re.compile(r'\b(BR2_\w+)\b')
+re_kconfig_ignore = re.compile(r'^# check-symbol ignore$')
 # Example lines to be handled:
 # config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 # menuconfig BR2_PACKAGE_GST1_PLUGINS_BASE
diff --git a/utils/checksymbolslib/db.py b/utils/checksymbolslib/db.py
index cb0dfa476f..e43f27e237 100644
--- a/utils/checksymbolslib/db.py
+++ b/utils/checksymbolslib/db.py
@@ -6,6 +6,7 @@ import checksymbolslib.br as br
 choice = 'part of a choice'
 definition = 'definition'
 helper = 'possible config helper'
+ignored = 'definition ignored'
 legacy_definition = 'legacy definition'
 legacy_note = 'legacy note'
 legacy_usage = 'legacy usage'
@@ -13,10 +14,18 @@ select = 'selected'
 usage = 'normal usage'
 usage_in_legacy = 'usage inside legacy'
 virtual = 'virtual'
+full_usage = [
+    choice,
+    helper,
+    legacy_usage,
+    usage,
+    usage_in_legacy,
+]
 
 
 class DB:
-    def __init__(self):
+    def __init__(self, strict=False):
+        self.strict = strict
         self.all_symbols = {}
 
     def __str__(self):
@@ -31,6 +40,12 @@ class DB:
             self.all_symbols[symbol][entry_type][filename] = []
         self.all_symbols[symbol][entry_type][filename].append(lineno)
 
+    def add_symbol_ignored(self, symbol, filename, lineno):
+        self.add_symbol_entry(symbol, filename, lineno, ignored)
+
+    def add_invalid_ignore(self, filename, lineno):
+        self.add_symbol_entry(None, filename, lineno, ignored)
+
     def add_symbol_choice(self, symbol, filename, lineno):
         self.add_symbol_entry(symbol, filename, lineno, choice)
 
@@ -65,6 +80,8 @@ class DB:
         re_pattern = re.compile(r'{}'.format(pattern))
         found_symbols = {}
         for symbol, entries in self.all_symbols.items():
+            if symbol is None:
+                continue
             if not re_pattern.search(symbol):
                 continue
             found_symbols[symbol] = entries
@@ -73,6 +90,8 @@ class DB:
     def get_warnings_for_choices_selected(self):
         warnings = []
         for symbol, entries in self.all_symbols.items():
+            if symbol is None:
+                continue
             if choice not in entries:
                 continue
             if select not in entries:
@@ -88,6 +107,8 @@ class DB:
     def get_warnings_for_legacy_symbols_being_used(self):
         warnings = []
         for symbol, entries in self.all_symbols.items():
+            if symbol is None:
+                continue
             if legacy_definition not in entries:
                 continue
             if usage not in entries:
@@ -103,6 +124,8 @@ class DB:
     def get_warnings_for_legacy_symbols_being_defined(self):
         warnings = []
         for symbol, entries in self.all_symbols.items():
+            if symbol is None:
+                continue
             if legacy_definition not in entries:
                 continue
             if definition not in entries:
@@ -118,6 +141,8 @@ class DB:
     def get_warnings_for_symbols_without_definition(self):
         warnings = []
         for symbol, entries in self.all_symbols.items():
+            if symbol is None:
+                continue
             if definition in entries:
                 continue
             if legacy_definition in entries:
@@ -149,6 +174,9 @@ class DB:
     def get_warnings_for_symbols_without_usage(self):
         warnings = []
         for symbol, entries in self.all_symbols.items():
+            msg_suffix = ""
+            if symbol is None:
+                continue
             if usage in entries:
                 continue
             if usage_in_legacy in entries:
@@ -165,15 +193,44 @@ class DB:
                 continue
             if choice in entries:
                 continue
+            if ignored in entries:
+                if not self.strict:
+                    continue
+                msg_suffix = " [ignored]"
             all_items = []
             all_items += entries.get(definition, {}).items()
             all_items += entries.get(legacy_definition, {}).items()
             for filename, linenos in all_items:
                 for lineno in linenos:
-                    msg = '{} defined but not referenced'.format(symbol)
+                    msg = '{} defined but not referenced{}'.format(symbol, msg_suffix)
                     warnings.append((filename, lineno, msg))
         return warnings
 
+    def get_warnings_for_invalid_ignore(self):
+        warnings = []
+        for symbol, entries in self.all_symbols.items():
+            if ignored not in entries:
+                continue
+            if symbol is None:
+                all_items = entries.get(ignored, {}).items()
+                msg = 'ignoring non-definition'
+                for filename, linenos in all_items:
+                    for lineno in linenos:
+                        warnings.append((filename, lineno, msg))
+            else:
+                if (
+                    any(map(lambda e: e in full_usage, entries))
+                    or symbol in br.symbols_used_only_in_source_code
+                    or symbol in br.symbols_used_only_for_host_variant
+                ):
+                    msg = f'{symbol} defined and referenced, but ignored'
+                    all_items = entries.get(ignored, {}).items()
+                    for filename, linenos in all_items:
+                        for lineno in linenos:
+                            warnings.append((filename, lineno, msg))
+
+        return warnings
+
     def get_warnings_for_symbols_with_legacy_note_and_no_comment_on_usage(self):
         warnings = []
         for symbol, entries in self.all_symbols.items():
diff --git a/utils/checksymbolslib/kconfig.py b/utils/checksymbolslib/kconfig.py
index 9ad6030305..bbdbc5dcbc 100644
--- a/utils/checksymbolslib/kconfig.py
+++ b/utils/checksymbolslib/kconfig.py
@@ -123,12 +123,30 @@ def handle_note(db, filename, file_content):
                 continue
 
 
+def handle_ignore(db, filename, file_content):
+    ignore_lineno = None
+    for lineno, line in file_content:
+        if ignore_lineno is None:
+            if br.re_kconfig_ignore.search(line):
+                ignore_lineno = lineno
+        else:
+            if br.re_kconfig_config.search(line):
+                m = br.re_kconfig_symbol.search(line)
+                if m:
+                    symbol = m.group(1)
+                    db.add_symbol_ignored(symbol, filename, lineno)
+            else:
+                db.add_invalid_ignore(filename, ignore_lineno)
+            ignore_lineno = None
+
+
 def populate_db(db, filename, file_content):
     legacy = filename.endswith('.legacy')
     for lineno, line in file_content:
         handle_line(db, filename, lineno, line, legacy)
     handle_config_helper(db, filename, file_content)
     handle_config_choice(db, filename, file_content)
+    handle_ignore(db, filename, file_content)
     if legacy:
         handle_note(db, filename, file_content)
 
diff --git a/utils/checksymbolslib/test_db.py b/utils/checksymbolslib/test_db.py
index 15576fa897..6416324848 100644
--- a/utils/checksymbolslib/test_db.py
+++ b/utils/checksymbolslib/test_db.py
@@ -219,6 +219,7 @@ def test_get_warnings_for_symbols_without_usage():
     db.add_symbol_usage_in_legacy('BR2_k', 'file', 6)
     db.add_symbol_legacy_usage('BR2_k', 'file', 7)
     db.add_symbol_legacy_definition('BR2_l', 'Config.in.legacy', 2)
+    db.add_symbol_ignored('BR2_m', 'm/Config/in', 2)
     assert str(db) == str({
         'BR2_a': {'definition': {'a/Config.in': [1, 2]}, 'normal usage': {'file': [1, 2]}},
         'BR2_b': {'definition': {'b/Config.in': [2]}, 'usage inside legacy': {'file': [1]}},
@@ -238,6 +239,7 @@ def test_get_warnings_for_symbols_without_usage():
             'usage inside legacy': {'file': [6]},
             'legacy usage': {'file': [7]}},
         'BR2_l': {'legacy definition': {'Config.in.legacy': [2]}},
+        'BR2_m': {'definition ignored': {'m/Config/in': [2]}},
         })
     warnings = db.get_warnings_for_symbols_without_usage()
     assert warnings == [
@@ -248,6 +250,21 @@ def test_get_warnings_for_symbols_without_usage():
         ]
 
 
+def test_get_warnings_for_invalid_ignore():
+    db = m.DB()
+    db.add_symbol_ignored('BR2_a', 'a/Config/in', 2)
+    db.add_symbol_usage('BR2_a', 'file', 1)
+    db.add_symbol_ignored('BR2_b', 'b/Config/in', 2)
+    assert str(db) == str({
+        'BR2_a': {'definition ignored': {'a/Config/in': [2]}, 'normal usage': {'file': [1]}},
+        'BR2_b': {'definition ignored': {'b/Config/in': [2]}}
+    })
+    warnings = db.get_warnings_for_invalid_ignore()
+    assert warnings == [
+        ('a/Config/in', 2, 'BR2_a defined and referenced, but ignored')
+    ]
+
+
 def test_get_warnings_for_symbols_with_legacy_note_and_no_comment_on_usage():
     db = m.DB()
     db.add_symbol_legacy_note('BR2_foo', 'Config.in.legacy', 1)
diff --git a/utils/checksymbolslib/test_kconfig.py b/utils/checksymbolslib/test_kconfig.py
index ab2008df6c..fd2a3f5214 100644
--- a/utils/checksymbolslib/test_kconfig.py
+++ b/utils/checksymbolslib/test_kconfig.py
@@ -356,6 +356,52 @@ def test_handle_note(testname, filename, file_content, expected_calls):
     assert_db_calls(db, expected_calls)
 
 
+handle_ignore = [
+    (
+        'definition',
+        'Config.in',
+        [
+            [1, 'config BR2_PACKAGE_FOO']
+        ],
+        {}
+    ),
+    (
+        'ignored definition',
+        'Config.in',
+        [
+            [1, '# check-symbols ignore'],
+            [2, 'config BR2_PACKAGE_FOO']
+        ],
+        {
+            'add_symbol_ignored': [
+                call('BR2_PACKAGE_FOO', 'Config.in', 2)
+            ]
+        }
+    ),
+    (
+        'incorrect ignore directive',
+        'Config.in',
+        [
+            [1, 'config BR2_PACKAGE_FOO'],
+            [2, '# check-symbols ignore'],
+            [3, '\t bool "foo"']
+        ],
+        {
+            'add_invalid_ignore': [
+                call('Config.in', 2)
+            ]
+        }
+    ),
+]
+
+
+@pytest.mark.parametrize('testname,filename,file_content,expected_calls', handle_ignore)
+def test_handle_ignore(testname, filename, file_content, expected_calls):
+    db = Mock()
+    m.handle_ignore(db, filename, file_content)
+    assert_db_calls(db, expected_calls)
+
+
 populate_db = [
     ('legacy',
      'Config.in.legacy',
@@ -377,7 +423,12 @@ populate_db = [
       [5, 'config BR2_PACKAGE_FOO'],
       [6, 'config BR2_PACKAGE_BAR'],
       [7, '\t select BR2_PACKAGE_FOO_BAR'],
-      [10, 'endchoice']],
+      [10, 'endchoice'],
+      [12, '# check-symbol ignore'],
+      [13, 'config BR2_PACKAGE_BUZ'],
+      [15, 'config BR2_PACKAGE_NAH'],
+      [16, '# check-symbol ignore'],
+      [17, '\thelp']],
      {'add_symbol_choice': [
          call('BR2_PACKAGE_FOO', 'package/foo/Config.in', 5),
          call('BR2_PACKAGE_BAR', 'package/foo/Config.in', 6)],
@@ -388,9 +439,15 @@ populate_db = [
       'add_symbol_definition': [
          call('BR2_PACKAGE_BAZ', 'package/foo/Config.in', 1),
          call('BR2_PACKAGE_FOO', 'package/foo/Config.in', 5),
-         call('BR2_PACKAGE_BAR', 'package/foo/Config.in', 6)],
+         call('BR2_PACKAGE_BAR', 'package/foo/Config.in', 6),
+         call('BR2_PACKAGE_BUZ', 'package/foo/Config.in', 13),
+         call('BR2_PACKAGE_NAH', 'package/foo/Config.in', 15)],
       'add_symbol_helper': [
-         call('BR2_PACKAGE_BAR', 'package/foo/Config.in', 6)]}),
+         call('BR2_PACKAGE_BAR', 'package/foo/Config.in', 6)],
+      'add_symbol_ignored': [
+         call('BR2_PACKAGE_BUZ', 'package/foo/Config.in', 13)],
+      'add_invalid_ignore': [
+         call(None, 'package/foo/Config.in', 16)]}),
     ]
 
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
