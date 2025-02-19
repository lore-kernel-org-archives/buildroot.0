Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4DDC021B0
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6466E503A3;
	Wed, 19 Feb 2025 08:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Te9XxJYGNj93; Wed, 19 Feb 2025 08:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E6ED503C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E6ED503C0;
	Wed, 19 Feb 2025 08:51:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B86C127
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74A9F4F386
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XcLLss1ayoUr for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 94026503BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94026503BC
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94026503BC
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:55 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38f2cb1ba55so3936261f8f.3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955053; x=1740559853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8ghzsNhi02v8ur5hVz2t7GCIN6TQYVW/+yjrtNgxQmA=;
 b=rqccOROrPz6x4bmoS99wM+r5+UI7uAoD+FThMmQbFoNRYQM4nOTGSF0GoNWuDvKrfW
 DovpcLffrvHP1k03HFS4Bwzx0i0WbHT37mg0XPBNB928mVDHrTDXfafqK/yALYcpdGT9
 K855BM1gqpYkoeZTkG9CLE2vkIAf3tK3+W7+LqurJ3V+2XWkHBr/1Cg2+XI+k+TQ9o/G
 bbzBFvReUSnrXuZyBYfpew7Eiw4oicWKwH59ps4MtCk428uTBgVNa8vi/UIB+AD1u6NW
 BwTlI4TryGJJLfaJto3gYCMeX8pWISc4EmJ7ZdM90xGCtYUWKgEqsHs6KzNcJolv0Inc
 o2KQ==
X-Gm-Message-State: AOJu0Yw3dkjiLx0A2M5Gxc0PKzT8DOheYASIOMJEW6/QsIqmA30ea/Ml
 7slVHDC1dVZVbxnwHtfBW6oba37wHhy3yUo3Puj6VGg9hoRXKDaKhGJtvg==
X-Gm-Gg: ASbGncsGO5Eu7ZsJz6cN5erzVgsxY7ZUgQDUxZ9+36wBPuRmkmoNw1/lgmTcK8qRlCB
 WE22mySJqWE8v+rGE6hgYW9rFpBLXSw2p+BdzlH2SjloU39lBOfd+MI63o0CmecxJcRjZdKRsLu
 8hsUJVSOt7T9kVvMDelG2UdA+MmDXj6D5zjFPqXeJrc4HmDRjMUciD2QDQwR19+ihF1zk7fhiY0
 Yq3BWeI9E+9yN0UceL0qxnApaHOtu0+PBVWMB0Z14J2VuMCdBQ/si9C1H7TluG8iR8J5nGueaSj
 dSYTKA0OYCPTNShfIGi+Ojb7uA==
X-Google-Smtp-Source: AGHT+IFmYcvUlUZ5oM2pqRq7/PsFF/HCFYU+o9GumUMAhYu9XyaurIjxY0kBG8KiPjiY7U7DPk+GKw==
X-Received: by 2002:a05:6000:178c:b0:38f:2173:b7b7 with SMTP id
 ffacd0b85a97d-38f5878ca87mr2368345f8f.18.1739955053345; 
 Wed, 19 Feb 2025 00:50:53 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:52 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Wed, 19 Feb 2025 09:50:31 +0100
Message-ID: <0a2476f05e003d7a23e6de4c080d0902b9902fc8.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955053; x=1740559853; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ghzsNhi02v8ur5hVz2t7GCIN6TQYVW/+yjrtNgxQmA=;
 b=I3g2qHnYyhqg+FcKoW7Mw4yVyHI/JA/tlP2gGx92m3i5w1rW9adot/+t/I6noKUc4W
 sFviUgq3ZMAWxpqoRgPOJ/LCmuFF/6YsCeEcrYgcMkI9XhnMWQtw+UkPJH7tHvqkiUMC
 gEzZCE/BNz8rFwnkEL5bgznt+KAiOhtGvEfVeX1Ian/FnyEZYGOIiTel9WUmaPGw5tei
 4ES0+ZVqVfSvIqnnBYns3Gmg/rJ+5rULPWpP3jTfw55IaiaKXU74SHiw2CjHffF7kZeI
 bIKy6+Z3KhhsQ6gxj8l8K1JK5rtbzspnIu7dPceW438X9B3/tXODVDf6RlUFGy53wo6D
 dGRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=I3g2qHnY
Subject: [Buildroot] [PATCH 16/27] utils/check-symbols: allow ignoring some
 defined-but-unused symbols
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
are defined by not used; we already have a few heuristics for that.

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
                $(if $(BR2_PACKAGE_FOO_$(call UPPER,$(feat))),--enable-$(f),--disable-no-$(f)) \
            )

Although we currently have no such case, we are going to introduce one
in the following comits, for example for boost, where we currently
maintain the list of features (libraries) twice, once each for the
target and host variants, and where we repeat ad nauseam a common
construct. By having a single list with all the Boost libraries, and
reconstructing the corresponding Kconfig symbols, we can more eaily
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

Adapt the test-suite to suite: all cases described above are tested.

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
 utils/checksymbolslib/db.py           | 56 +++++++++++++++++++++++-
 utils/checksymbolslib/kconfig.py      | 18 ++++++++
 utils/checksymbolslib/test_db.py      | 17 ++++++++
 utils/checksymbolslib/test_kconfig.py | 63 +++++++++++++++++++++++++--
 6 files changed, 157 insertions(+), 7 deletions(-)

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
index cb0dfa476f..45b1a4b925 100644
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
@@ -149,6 +174,8 @@ class DB:
     def get_warnings_for_symbols_without_usage(self):
         warnings = []
         for symbol, entries in self.all_symbols.items():
+            if symbol is None:
+                continue
             if usage in entries:
                 continue
             if usage_in_legacy in entries:
@@ -165,6 +192,8 @@ class DB:
                 continue
             if choice in entries:
                 continue
+            if ignored in entries and not self.strict:
+                continue
             all_items = []
             all_items += entries.get(definition, {}).items()
             all_items += entries.get(legacy_definition, {}).items()
@@ -174,6 +203,31 @@ class DB:
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
