Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF1FC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32F6540884;
	Sun, 14 Aug 2022 23:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32F6540884
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Os1lKcp8HgcH; Sun, 14 Aug 2022 23:46:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52DBC40994;
	Sun, 14 Aug 2022 23:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52DBC40994
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96AF01BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 713A781C93
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 713A781C93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CPtcuaUPUNWn for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:40:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97A5A81BF5
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97A5A81BF5
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:40:43 +0000 (UTC)
Received: by mail-vk1-xa36.google.com with SMTP id w129so2998736vkg.10
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=OPIR+DmZJUe/zhNRtsydrug/gvcpdb7L8520cHkGiu0=;
 b=sQ+jcSPX1DojJGY0dH1GEhj/25rQR7aO08Bs6WbGS8oUOq4vfGLsMb7tfpF9v89gla
 wDR5G/C4BW20tHmv/Jm3a2SF9goGDQAx/hSY8cuwLhvFNQScdROCHLf2n9szs7p/8lui
 422z+yGt6U+CqtWf/CN7C3bwPb07v0LVpxrLEdyVdv+nm+geiX9yKVj1SmG1+5zMrRrA
 2h1ghjVbHAbGE/QG90Dcg/tAUJ8zp7BSiVFP5bXnd8xDENgH49BdiqZTD6TXMKt7MAwI
 2cwDLi8fAVH5CI2cH6MgukfZ3HsjO0lU+5ZchAGAVdHdFSw+j9zX0vKFBlPFOwJwJa/S
 LXYg==
X-Gm-Message-State: ACgBeo0QVNZe8qIpt5OqoksBCufv3CD+ZTPSq/hVvTG0vI5XPQNgh8S8
 w4CHHL+mNS3eZR8bSmuw0ifHF4hDKP4=
X-Google-Smtp-Source: AA6agR77Z0s4s75c2pgWAbadleyDfN16N6FK6ZsiqGI81cosobZ3kPQ4LzON7RtNSNotZN7Pvi4tOA==
X-Received: by 2002:a1f:adc7:0:b0:377:c12:78ef with SMTP id
 w190-20020a1fadc7000000b003770c1278efmr5295619vke.19.1660520442354; 
 Sun, 14 Aug 2022 16:40:42 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:40:41 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:45 -0300
Message-Id: <20220814233845.2247022-34-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=OPIR+DmZJUe/zhNRtsydrug/gvcpdb7L8520cHkGiu0=;
 b=j6f7q0owkmRo3t3uw9iZm99rfG/SiUj9QjXI7LFdk+Tl5OtE1sNOJmHl9h2v3/ARu8
 QemWxhYe6R9s6vOzUDh0S+bbEJkgMNj3WmdP/XaFejC65/DZXmTbQ6bIEDy0hdsEXKA+
 zSVCKoq8ZibQfxq0SI1MkQQrClFrUHpTv0b3/hq3l91nXVoMDOImU8PBJGCwj13zucsm
 yXf78t7dZvwinMMezuNCwNb5Jpfa+CDBYO7sGFgopFnC35K/xcmKZHcs9DYwWLHNKN0A
 gh4JiDWFVZSJEA6eLfrxXmmUvCy4ALzXXxiOlP4Uq0oxDVH0SNpvr0Q3ttkg/Rvw0oRy
 /zJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=j6f7q0ow
Subject: [Buildroot] [PATCH 33/33] utils/check-symbols: new script
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is just a WIP!
- it is ugly
- it was not designed for performance (speed, RAM usage, ...)
- it is poorly covered by unit tests
- it has no help/usage
- it has no debug options
- it uses a hand-made database
- it has a long list of false positives, ignored in the DB class
- it does not support yet:
  - rootfs
  - virtual packages
  - barebox
  - linux extensions

... but it gets some initial results

Someone willing to adopt this patch?

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/613336397

I don't know what to do with this symbol:
package/fwts/Config.in:config BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
package/fwts/fwts.mk:ifdef BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
maybe one of below?
1) make the script to accept 'ifdef' as a valid usage for a menuconfig symbol
2) rework the package to use 'ifeq' like the other ones.
---
 support/misc/gitlab-ci.yml.in          |   8 ++
 support/scripts/generate-gitlab-ci-yml |   2 +-
 utils/check-symbols                    |  50 ++++++++++
 utils/checksymbolslib/__init__.py      |   0
 utils/checksymbolslib/db.py            |  63 +++++++++++++
 utils/checksymbolslib/file.py          |  75 +++++++++++++++
 utils/checksymbolslib/kconfig.py       | 126 +++++++++++++++++++++++++
 utils/checksymbolslib/makefile.py      |  47 +++++++++
 utils/checksymbolslib/test_db.py       |  34 +++++++
 utils/checksymbolslib/test_file.py     |  61 ++++++++++++
 utils/checksymbolslib/test_kconfig.py  |  46 +++++++++
 11 files changed, 511 insertions(+), 1 deletion(-)
 create mode 100755 utils/check-symbols
 create mode 100644 utils/checksymbolslib/__init__.py
 create mode 100644 utils/checksymbolslib/db.py
 create mode 100644 utils/checksymbolslib/file.py
 create mode 100644 utils/checksymbolslib/kconfig.py
 create mode 100644 utils/checksymbolslib/makefile.py
 create mode 100644 utils/checksymbolslib/test_db.py
 create mode 100644 utils/checksymbolslib/test_file.py
 create mode 100644 utils/checksymbolslib/test_kconfig.py

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 3ac988a519..0ccf36665e 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -2,6 +2,10 @@
     script:
         - python3 -m pytest -v utils/checkpackagelib/
 
+.check-check-symbol_base:
+    script:
+        - python3 -m pytest -v utils/checksymbolslib/
+
 .check-DEVELOPERS_base:
     script:
         - utils/get-developers -v
@@ -14,6 +18,10 @@
     script:
         - make check-package
 
+.check-symbol_base:
+    script:
+        - utils/check-symbols
+
 .defconfig_check:
     before_script:
         - DEFCONFIG_NAME=$(echo ${CI_JOB_NAME} | sed -e 's,_check$,,g')
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index aa43aac019..051b1b5382 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -26,7 +26,7 @@ gen_tests() {
     local do_basics do_defconfigs do_runtime do_testpkg
     local defconfigs_ext cfg tst
 
-    basics=( check-package DEVELOPERS flake8 package )
+    basics=( check-package check-symbol DEVELOPERS flake8 package symbol )
 
     defconfigs=( $(cd configs; LC_ALL=C ls -1 *_defconfig) )
 
diff --git a/utils/check-symbols b/utils/check-symbols
new file mode 100755
index 0000000000..bf55ba915b
--- /dev/null
+++ b/utils/check-symbols
@@ -0,0 +1,50 @@
+#!/usr/bin/env python3
+
+import os
+import sys
+
+import checksymbolslib.file
+from checksymbolslib.db import DB
+
+
+def change_current_dir():
+    base_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
+    os.chdir(base_dir)
+
+
+def get_full_db(files_to_process):
+    db = DB()
+    for f in files_to_process:
+        checksymbolslib.file.populate_db_from_file(db, f)
+    return db
+
+
+def print_symbols_without_usage(db):
+    no_usage = db.get_symbols_without_usage()
+    print('no usage ==========')
+    for s in no_usage:
+        print(s, str(no_usage[s]))
+    return len(no_usage)
+
+
+def print_symbols_without_definition(db):
+    no_definition = db.get_symbols_without_definition()
+    print('no definition ==========')
+    for s in no_definition:
+        print(s, str(no_definition[s]))
+    return len(no_definition)
+
+
+def __main__():
+    change_current_dir()
+    all_files = checksymbolslib.file.get_list_of_files_in_the_repo()
+    files_to_process = checksymbolslib.file.get_list_of_files_to_process(all_files)
+    db = get_full_db(files_to_process)
+    w1 = print_symbols_without_usage(db)
+    w2 = print_symbols_without_definition(db)
+    if w1 + w2 > 0:
+        sys.exit(1)
+
+
+if __name__ == '__main__':
+    __main__()
diff --git a/utils/checksymbolslib/__init__.py b/utils/checksymbolslib/__init__.py
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/utils/checksymbolslib/db.py b/utils/checksymbolslib/db.py
new file mode 100644
index 0000000000..71ee9c63ac
--- /dev/null
+++ b/utils/checksymbolslib/db.py
@@ -0,0 +1,63 @@
+class DB:
+    def __init__(self):
+        self.all_symbols = {}
+
+    def __str__(self):
+        return str(self.all_symbols)
+
+    def add_symbol_entry(self, symbol, filename, lineno, entry_type):
+        if symbol not in self.all_symbols:
+            self.all_symbols[symbol] = {}
+        if entry_type not in self.all_symbols[symbol]:
+            self.all_symbols[symbol][entry_type] = {}
+        if filename not in self.all_symbols[symbol][entry_type]:
+            self.all_symbols[symbol][entry_type][filename] = []
+        self.all_symbols[symbol][entry_type][filename].append(lineno)
+
+    def add_symbol_definition(self, symbol, filename, lineno):
+        self.add_symbol_entry(symbol, filename, lineno, 'definition')
+
+    def add_symbol_usage(self, symbol, filename, lineno):
+        self.add_symbol_entry(symbol, filename, lineno, 'usage')
+
+    def add_symbol_helper(self, symbol, filename, lineno):
+        self.add_symbol_entry(symbol, filename, lineno, 'helper')
+
+    def add_symbol_choice(self, symbol, filename, lineno):
+        self.add_symbol_entry(symbol, filename, lineno, 'choice')
+
+    def get_symbols_without_usage(self):
+        found_symbols = {}
+        for symbol in self.all_symbols:
+            if 'usage' not in self.all_symbols[symbol]:
+                if 'helper' in self.all_symbols[symbol]:
+                    continue
+                if 'choice' in self.all_symbols[symbol]:
+                    continue
+                if symbol.startswith('BR2_ROOTFS_'):
+                    continue
+                if symbol in ['BR2_FORCE_HOST_BUILD', 'BR2_PACKAGE_SKELETON', 'BR2_TOOLCHAIN', 'BR2_PACKAGE_HOST_LINUX_HEADERS']:
+                    continue
+                if 'BR2_PACKAGE_PROVIDES_' in symbol:
+                    continue
+                if 'BR2_PACKAGE_HAS_' in symbol:
+                    continue
+                found_symbols[symbol] = self.all_symbols[symbol]['definition']
+        return found_symbols
+
+    def get_symbols_without_definition(self):
+        found_symbols = {}
+        for symbol in self.all_symbols:
+            if 'definition' not in self.all_symbols[symbol]:
+                if 'HOST_' in symbol:
+                    continue
+                if symbol.startswith('BR2_EXTERNAL'):
+                    continue
+                if symbol.startswith('BR2_GRAPH'):
+                    continue
+                if symbol.startswith('BR2_TARGET_ROOTFS_'):
+                    continue
+                if symbol in ['BR2_VERSION_FULL', 'BR2_MAKE', 'BR2_TARGET_BAREBOX', 'BR2_INSTRUMENTATION_SCRIPTS']:
+                    continue
+                found_symbols[symbol] = self.all_symbols[symbol]['usage']
+        return found_symbols
diff --git a/utils/checksymbolslib/file.py b/utils/checksymbolslib/file.py
new file mode 100644
index 0000000000..77891f53de
--- /dev/null
+++ b/utils/checksymbolslib/file.py
@@ -0,0 +1,75 @@
+import re
+import subprocess
+
+import checksymbolslib.kconfig as kconfig
+import checksymbolslib.makefile as makefile
+
+
+file_types = [
+    kconfig,
+    makefile,
+]
+
+
+def get_list_of_files_in_the_repo():
+    cmd = ['git', 'ls-files']
+    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+    stdout = p.communicate()[0]
+    processed_output = [str(line.decode().rstrip()) for line in stdout.splitlines() if line]
+    return processed_output
+
+
+def get_list_of_files_to_process(all_files):
+    files_to_process = []
+    for f in all_files:
+        if f.startswith('support/testing/'):
+            continue
+        if f.startswith('boot/barebox/'):
+            continue
+        if f.startswith('fs/'):
+            continue
+        for t in file_types:
+            if t.check_filename(f):
+                files_to_process.append(f)
+    return files_to_process
+
+
+def cleanup_file_content(file_content_raw):
+    cleaned_up_content = []
+    continuation = False
+    last_line = None
+    first_lineno = None
+    for cur_lineno, cur_line in file_content_raw:
+        if continuation:
+            line = last_line + cur_line
+            lineno = first_lineno
+        else:
+            line = cur_line
+            lineno = cur_lineno
+        continuation = False
+        last_line = None
+        first_lineno = None
+        # remove comments
+        line = re.sub(r'^([^#]*)(#.*)$', r'\1', line)
+        # remove trailing space and indentation
+        line = line.rstrip()
+        if line.endswith('\\'):
+            continuation = True
+            # remove \
+            last_line = re.sub(r'\\', '', line)
+            first_lineno = lineno
+            continue
+        cleaned_up_content.append([lineno, line])
+    return cleaned_up_content
+
+
+def populate_db_from_file(db, filename):
+    file_content_raw = []
+    with open(filename, 'r', errors='surrogateescape') as f:
+        for lineno, text in enumerate(f.readlines()):
+            file_content_raw.append([lineno + 1, text])
+
+    file_content = cleanup_file_content(file_content_raw)
+    for t in file_types:
+        if t.check_filename(filename):
+            t.populate_db(db, filename, file_content)
diff --git a/utils/checksymbolslib/kconfig.py b/utils/checksymbolslib/kconfig.py
new file mode 100644
index 0000000000..baef571e0f
--- /dev/null
+++ b/utils/checksymbolslib/kconfig.py
@@ -0,0 +1,126 @@
+import re
+
+
+def handle_config_line(db, filename, lineno, line):
+    m = re.search(r'^\W*(menu|)config\W+(\w+)\W*$', line)
+    symbol = m.group(2)
+    db.add_symbol_definition(symbol, filename, lineno)
+
+
+def handle_default_line(db, filename, lineno, line):
+    symbols = re.findall(r'(BR2_\w+)', line)
+    for symbol in symbols:
+        db.add_symbol_usage(symbol, filename, lineno)
+
+
+def handle_depends_on_line(db, filename, lineno, line):
+    line = re.sub(r'[!|()&]', '', line)
+    line = re.sub(r'=\W*"\w*"', '', line)
+    line = re.sub(r'^\W*depends on\W', '', line)
+    symbols = line.split()
+    for symbol in symbols:
+        db.add_symbol_usage(symbol, filename, lineno)
+
+
+def handle_if_line(db, filename, lineno, line):
+    line = re.sub(r'[!|()&]', '', line)
+    line = re.sub(r'=\W*"\w*"', '', line)
+    line = re.sub(r'^\W*if\W', '', line)
+    symbols = line.split()
+    for symbol in symbols:
+        db.add_symbol_usage(symbol, filename, lineno)
+
+
+def handle_select_line(db, filename, lineno, line):
+    line = re.sub(r'[!|()&]', '', line)
+    line = re.sub(r'=\W*"\w*"', '', line)
+    line = re.sub(r'^\W*select\W', '', line)
+    line = re.sub(r'\bif\W', '', line)
+    symbols = line.split()
+    for symbol in symbols:
+        db.add_symbol_usage(symbol, filename, lineno)
+
+
+def handle_source_line(db, filename, lineno, line):
+    symbols = re.findall(r'\$(BR2_\w+)', line)
+    for symbol in symbols:
+        db.add_symbol_usage(symbol, filename, lineno)
+
+
+def handle_line(db, filename, lineno, line):
+    line_type_handlers = {
+      r'^\w*(menu|)config\W': handle_config_line,
+      r'^\W*default\W': handle_default_line,
+      r'^\W*depends on\W': handle_depends_on_line,
+      r'^\W*if\W': handle_if_line,
+      r'^\W*select\W': handle_select_line,
+      r'^\W*source\W': handle_source_line,
+    }
+
+    if 'BR2_' not in line:
+        return
+
+    line_type = None
+    # determine line type
+    for possible_type in line_type_handlers.keys():
+        if re.search(possible_type, line):
+            line_type = possible_type
+    # process known line types
+    if line_type:
+        line_type_handlers[line_type](db, filename, lineno, line)
+
+
+def handle_config_helper(db, filename, file_content):
+    state = 'none'
+    symbol = None
+    for lineno, line in file_content:
+        if state == 'none':
+            m = re.search(r'^\W*config\W+(BR2_\w+)', line)
+            if m is None:
+                continue
+            symbol = m.group(1)
+            state = 'config'
+            continue
+        if state == 'config':
+            m = re.search(r'^\W*config\W+(BR2_\w+)', line)
+            if m is not None:
+                symbol = m.group(1)
+                continue
+            if re.search(r'^\t(help)\b', line):
+                state = 'none'
+                symbol = None
+                continue
+            if re.search(r'^\t(select)\b', line):
+                db.add_symbol_helper(symbol, filename, lineno)
+            continue
+
+
+def handle_config_choice(db, filename, file_content):
+    state = 'none'
+    for lineno, line in file_content:
+        if state == 'none':
+            if re.search(r'^\W*choice\W*$', line):
+                state = 'choice'
+                continue
+        if state == 'choice':
+            if re.search(r'^\W*endchoice\W*$', line):
+                state = 'none'
+                continue
+            m = re.search(r'^\W*config\W+(BR2_\w+)', line)
+            if m is not None:
+                symbol = m.group(1)
+                db.add_symbol_choice(symbol, filename, lineno)
+                continue
+
+
+def populate_db(db, filename, file_content):
+    for lineno, line in file_content:
+        handle_line(db, filename, lineno, line)
+    handle_config_helper(db, filename, file_content)
+    handle_config_choice(db, filename, file_content)
+
+
+def check_filename(filename):
+    if 'Config.' in filename:
+        return True
+    return False
diff --git a/utils/checksymbolslib/makefile.py b/utils/checksymbolslib/makefile.py
new file mode 100644
index 0000000000..51cf238bdd
--- /dev/null
+++ b/utils/checksymbolslib/makefile.py
@@ -0,0 +1,47 @@
+import os
+import re
+
+
+def populate_db(db, filename, file_content):
+    for lineno, line in file_content:
+        if line.startswith('$(eval') and line.endswith('-package))'):
+            if filename.startswith('linux/'):
+                continue
+            if '$(virtual-' in line:
+                continue
+            if '$(toolchain-' in line:
+                prefix = 'BR2_'
+            elif filename.startswith('boot/'):
+                prefix = 'BR2_TARGET_'
+            elif '$(host-' in line:
+                prefix = 'BR2_PACKAGE_HOST_'
+            else:
+                prefix = 'BR2_PACKAGE_'
+            package = os.path.basename(filename)[:-3].upper().replace('-', '_')
+            symbol = prefix + package
+            db.add_symbol_usage(symbol, filename, lineno)
+            continue
+        if '$(BR2_' in line:
+            symbols = re.findall(r'\$\((BR2_\w+)\)', line)
+            for symbol in symbols:
+                db.add_symbol_usage(symbol, filename, lineno)
+            continue
+        if line.startswith('BR2_'):
+            if '=' not in line:
+                continue
+            symbols = re.findall(r'(BR2_\w+)\W*[:=]', line)
+            for symbol in symbols:
+                db.add_symbol_definition(symbol, filename, lineno)
+            continue
+
+
+def check_filename(filename):
+    if filename.endswith('.mk'):
+        return True
+    if filename.endswith('.mk.in'):
+        return True
+    if filename.startswith('arch/arch.mk.'):
+        return True
+    if filename in ['Makefile', 'package/Makefile.in']:
+        return True
+    return False
diff --git a/utils/checksymbolslib/test_db.py b/utils/checksymbolslib/test_db.py
new file mode 100644
index 0000000000..9f34435e7a
--- /dev/null
+++ b/utils/checksymbolslib/test_db.py
@@ -0,0 +1,34 @@
+import checksymbolslib.db as m
+
+
+def test_empty_db():
+    db = m.DB()
+    assert str(db) == '{}'
+
+
+def test_one_definition():
+    db = m.DB()
+    db.add_symbol_definition('BR2_foo', 'foo/Config.in', 7)
+    assert str(db) == str({
+        'BR2_foo': {'definition': {'foo/Config.in': [7]}}
+        })
+
+
+def test_three_definitions():
+    db = m.DB()
+    db.add_symbol_definition('BR2_foo', 'foo/Config.in', 7)
+    db.add_symbol_definition('BR2_foo', 'foo/Config.in', 9)
+    db.add_symbol_definition('BR2_bar', 'bar/Config.in', 5)
+    assert str(db) == str({
+        'BR2_foo': {'definition': {'foo/Config.in': [7, 9]}},
+        'BR2_bar': {'definition': {'bar/Config.in': [5]}}
+        })
+
+
+def test_definition_and_usage():
+    db = m.DB()
+    db.add_symbol_definition('BR2_foo', 'foo/Config.in', 7)
+    db.add_symbol_usage('BR2_foo', 'foo/Config.in', 9)
+    assert str(db) == str({
+        'BR2_foo': {'definition': {'foo/Config.in': [7]}, 'usage': {'foo/Config.in': [9]}}
+        })
diff --git a/utils/checksymbolslib/test_file.py b/utils/checksymbolslib/test_file.py
new file mode 100644
index 0000000000..8b4067bb8f
--- /dev/null
+++ b/utils/checksymbolslib/test_file.py
@@ -0,0 +1,61 @@
+import pytest
+import checksymbolslib.file as m
+
+
+def test_get_list_of_files_in_the_repo():
+    all_files = m.get_list_of_files_in_the_repo()
+    assert 'Makefile' in all_files
+    assert 'package/Config.in' in all_files
+
+
+def test_get_list_of_files_to_process_unknown_file_type():
+    all_files = ['a/file/Config.in', 'another/file.mk', 'unknown/file/type']
+    files_to_process = m.get_list_of_files_to_process(all_files)
+    assert ['a/file/Config.in', 'another/file.mk'] == files_to_process
+
+
+def test_get_list_of_files_to_process_runtime_test_infra_fixtures():
+    all_files = ['a/file/Config.in', 'support/testing/a/broken/Config.in', 'another/file.mk']
+    files_to_process = m.get_list_of_files_to_process(all_files)
+    assert ['a/file/Config.in', 'another/file.mk'] == files_to_process
+
+
+cleanup_file_content = [
+    ('empty file',
+     [],
+     []),
+    ('empty line',
+     [[5, '\n']],
+     [[5, '']]),
+    ('trailing space',
+     [[3, '    \n']],
+     [[3, '']]),
+    ('trailing tab',
+     [[3, '\t\n']],
+     [[3, '']]),
+    ('remove comment',
+     [[1, 'foo # very useful comment\n']],
+     [[1, 'foo']]),
+    ('1 continuation',
+     [[1, 'foo \\\n'],
+      [2, 'bar\n']],
+     [[1, 'foo bar']]),
+    ('2 continuations',
+     [[1, 'foo \\\n'],
+      [2, 'bar  \\\n'],
+      [3, 'baz\n']],
+     [[1, 'foo bar  baz']]),
+    ('remove long comments',
+     [[1, '#' * 80 + '\n'],
+      [2, '#' * 80 + '\n'],
+      [3, '\ttext\n']],
+     [[1, ''],
+      [2, ''],
+      [3, '\ttext']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,file_content_raw,expected', cleanup_file_content)
+def test_cleanup_file_content(testname, file_content_raw, expected):
+    cleaned_up_content = m.cleanup_file_content(file_content_raw)
+    assert cleaned_up_content == expected
diff --git a/utils/checksymbolslib/test_kconfig.py b/utils/checksymbolslib/test_kconfig.py
new file mode 100644
index 0000000000..ec43806b7e
--- /dev/null
+++ b/utils/checksymbolslib/test_kconfig.py
@@ -0,0 +1,46 @@
+import pytest
+from unittest.mock import Mock
+from unittest.mock import call
+import checksymbolslib.kconfig as m
+
+
+def test_handle_config_line_config():
+    db = Mock()
+    m.handle_config_line(db, 'Config.in', 5, 'config BR2_FOO')
+    db.add_symbol_definition.assert_called_with('BR2_FOO', 'Config.in', 5)
+
+
+def test_handle_config_line_menuconfig():
+    db = Mock()
+    m.handle_config_line(db, 'Config.in', 7, 'menuconfig BR2_FOO')
+    db.add_symbol_definition.assert_called_with('BR2_FOO', 'Config.in', 7)
+
+
+handle_default_line = [
+    ('with comparison',
+     'package/uboot-tools/Config.in.host',
+     105,
+     '\tdefault BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE if BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE != ""',
+     [call('BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE', 'package/uboot-tools/Config.in.host', 105)]),
+    ('with logical operators',
+     'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options',
+     47,
+     '\tdefault y if BR2_i386 && !BR2_x86_i486 && !BR2_x86_i586 && !BR2_x86_x1000 && !BR2_x86_pentium_mmx && !BR2_x86_geode '
+     '&& !BR2_x86_c3 && !BR2_x86_winchip_c6 && !BR2_x86_winchip2',
+     [call('BR2_i386', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+      call('BR2_x86_c3', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+      call('BR2_x86_geode', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+      call('BR2_x86_i486', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+      call('BR2_x86_i586', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+      call('BR2_x86_pentium_mmx', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+      call('BR2_x86_winchip2', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+      call('BR2_x86_winchip_c6', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+      call('BR2_x86_x1000', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47)]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,lineno,line,expected_calls', handle_default_line)
+def test_handle_default_line(testname, filename, lineno, line, expected_calls):
+    db = Mock()
+    m.handle_default_line(db, filename, lineno, line)
+    db.add_symbol_usage.assert_has_calls(expected_calls, any_order=True)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
