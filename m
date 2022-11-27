Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58830C46467
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2D6A400B8;
	Sun, 27 Nov 2022 13:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2D6A400B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8VBGttkyfyV0; Sun, 27 Nov 2022 13:13:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D7F6400D0;
	Sun, 27 Nov 2022 13:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D7F6400D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E81201BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D05D3400D0
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D05D3400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yh0SsAPVwZ7Y for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:09:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB3F0400B8
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB3F0400B8
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:09:13 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-14263779059so10208551fac.1
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:09:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pHBmzdBRrQF2F57Gy0ajzPBFownLm6QJoa/qSSQ87fI=;
 b=t3iBIDCR1mvqkysGwrg8rWgDFEjxsBQJbOZaP5hqRmcR+tlVCrpL+03XHy2QKvI6Ih
 NcZiM0JdV4wj8oKkhmpaPeofjpQw0eaFOT1eInz3gRo/7/O25b6OzswV6PkPvAb3fTZE
 Gt+Nt9KnqHTNlpNvD6fDz4aRxq0S1wahFBBWw3urpZCuVWIaZ9sB4SHBWUgD9+3E83hw
 pAkojp4ihD9iHqRCbR9i4FIOoLpTSKwxrpLnzHe6frORVu/PVz9C+nnRY4yGoBX1ljSc
 xwta5R19/1KqFWOLpJBD1mSwxxOz+nxKZIT4hb9Uikcg/x2RnXfsew4gTEYjR96/Cl//
 ES6w==
X-Gm-Message-State: ANoB5plPKzGVzRISHg3wFoufZMaR8CtMEonQrVYowsDAOoX2zIIYuOUN
 djlKPqWo2JT52yuhxZyk7E+l5lhyt78=
X-Google-Smtp-Source: AA0mqf6K31TrGeG1dROxo1fZTS3ax3Q5IWu3OrRmEJqWfv2bYLLtDQvK+x6/9fNwpgtNHsiVftDYcw==
X-Received: by 2002:a05:6870:4b4b:b0:131:be7a:3415 with SMTP id
 ls11-20020a0568704b4b00b00131be7a3415mr14427276oab.269.1669554552804; 
 Sun, 27 Nov 2022 05:09:12 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:09:11 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:39 -0300
Message-Id: <20221127130739.1862398-26-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pHBmzdBRrQF2F57Gy0ajzPBFownLm6QJoa/qSSQ87fI=;
 b=MPuBNC8hJ4f5UR1si/ud91VB7xzNeovDyFznswDkSWplOQg4Y5OOzTTGltM8Pj95HB
 VeWfn0tlRiM3ojD7/oPJEtvTnywNrWolagy1bjOdDpEkbhfdeFs+ngfs+WlJPSptUU4a
 fFgNMB5l0GpuVPOSCMME0IP764wSRcqpphPh2zRZmE7nVCaiTuPMYdZRMSbvjklWK3LD
 IaiQo7wE2L8zymACixi9aLXiCGFvi+0Vf/bqsST4QUgCTSXTGm4KsGfoH2fjXVFN3Hoe
 he9T6kLRq11AWSCMbxhW5KGfnOQFhDDL90DD4F47KUsVlmKJiyLhMJCGEH3AbkHIglxM
 rL0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MPuBNC8h
Subject: [Buildroot] [next 25/25] utils/check-symbols: new script
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

This script checks for inconsistencies on symbols declared in Config.in
and used in .mk files.
Currently it checks only symbols following the pattern BR2_\w+ .

The script first gets the list of all files in the repository (using git
ls-files like 'make check-flake8' already do).

Then it parses all relevant files, searching for symbol definitions and
usages, and add entries into a database.

At the end, the database is searched for inconsistencies:
- symbol that is part of "choice" and is referenced with "select";
- legacy symbol being referenced in packages;
- legacy symbol being redefined in packages;
- symbol referenced but not defined;
- symbol defined but not referenced;
- legacy symbol that has a Note stating it is referenced by a package
  (for legacy handling) but is referenced in the package without a
  comment "# legacy";
- legacy symbol that has a Note stating it is referenced by a package
  but it is not actually referenced.

There is also a debug parameter --search that dumps any filename or
symbol entries from the database that matches a regexp.

Sample usages:
$ utils/check-symbols
$ utils/docker-run utils/check-symbols
$ utils/check-symbols --search 'GETTEXT\b|\/openssl'

At same time the script is created:
- add unit tests for it, they can be run using:
  utils/docker-run python3 -m pytest -v utils/checksymbolslib/
- add two more GitLab CI jobs: check-symbols (to check current tree
  using the script) and check-check-symbols (to check the script against
  its unit tests)

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
This is actually v2 of the script.
v1: http://patchwork.ozlabs.org/project/buildroot/patch/20220814233845.2247022-34-ricardo.martincoski@gmail.com/
But v1 was only a prototype/WIP.
There was so many changes from v1 that I honestly gave up keeping track
of them. Because of that, no changelog on this patch.

All other patches in the series are new, found while developing this
script. Because of that, no changelog in all previous patches.

NOTE 1:
Example usage with only this patch applied to next:
$ time utils/docker-run utils/check-symbols
Config.in.legacy:634: BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2 is part of a "choice" and should not be "select"ed
Config.in.legacy:643: BR2_PACKAGE_SUNXI_MALI_UTGARD_R8P1 is part of a "choice" and should not be "select"ed
Config.in.legacy:705: BR2_PACKAGE_OPENJDK_VERSION_11 is part of a "choice" and should not be "select"ed
Config.in.legacy:713: BR2_PACKAGE_OPENJDK_VERSION_17 is part of a "choice" and should not be "select"ed
Config.in.legacy:2097: BR2_PACKAGE_LUA_5_3 is part of a "choice" and should not be "select"ed
Config.in.legacy:2605: BR2_PACKAGE_TI_SGX_AM335X not referenced but has a comment stating it is
Config.in.legacy:2615: BR2_PACKAGE_TI_SGX_AM437X not referenced but has a comment stating it is
Config.in.legacy:2625: BR2_PACKAGE_TI_SGX_AM4430 not referenced but has a comment stating it is
Config.in.legacy:2635: BR2_PACKAGE_TI_SGX_AM5430 not referenced but has a comment stating it is
Config.in.legacy:3973: BR2_GCC_VERSION_ARC is part of a "choice" and should not be "select"ed
Config.in.legacy:4316: BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB is part of a "choice" and should not be "select"ed
Config.in.legacy:4324: BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB is part of a "choice" and should not be "select"ed
boot/uboot/Config.in:445: BR2_TARGET_XLOADER is a legacy symbol and should not be referenced
package/fwts/Config.in:31: BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE defined but not referenced
package/gitlab-runner/Config.in:14: BR2_PACKAGE_LIBCURL_OPENSSL is part of a "choice" and should not be "select"ed
package/rpi-userland/Config.in:43: BR2_arch64 referenced but not defined
system/Config.in:81: BR2_TARGET_GENERIC_PASSWD_MD5 is a legacy symbol and should not be referenced
real    0m4,703s
user    0m0,057s
sys     0m0,020s

NOTE 2:
Example usage with the whole series applied to next:
$ time utils/check-symbols --search 'GETTEXT\b|\/openssl'
========== filenames found with pattern "GETTEXT\b|\/openssl": 2
package/openssl/Config.in
package/openssl/openssl.mk
========== ignored filenames with pattern "GETTEXT\b|\/openssl": 0
========== symbols with pattern "GETTEXT\b|\/openssl": 8
BR2_PACKAGE_GETTEXT {'normal usage': {'package/ecryptfs-utils/Config.in'
: [13], 'package/gettext/gettext.mk': [9], 'system/Config.in': [478]}, '
selected': {'package/ecryptfs-utils/Config.in': [13], 'system/Config.in'
: [478]}, 'definition': {'package/gettext/Config.in': [1]}, 'possible co
nfig helper': {'package/gettext/Config.in': [1]}, 'virtual': {'package/g
ettext/gettext.mk': [9]}}
BR2_PACKAGE_HAS_GETTEXT {'normal usage': {'package/gettext-gnu/Config.in
': [4], 'package/gettext-tiny/Config.in': [3], 'package/gettext/gettext.
mk': [9]}, 'selected': {'package/gettext-gnu/Config.in': [4], 'package/g
ettext-tiny/Config.in': [3]}, 'definition': {'package/gettext/Config.in'
: [11]}}
BR2_PACKAGE_PROVIDES_GETTEXT {'definition': {'package/gettext-gnu/Config
.in': [18], 'package/gettext-tiny/Config.in': [12], 'package/gettext/Con
fig.in': [14]}, 'normal usage': {'package/gettext/gettext.mk': [9]}}
BR2_PACKAGE_PROVIDES_HOST_GETTEXT {'definition': {'package/gettext-gnu/C
onfig.in': [23], 'package/gettext-tiny/Config.in': [17], 'package/gettex
t/Config.in': [17]}, 'normal usage': {'package/gettext/gettext.mk': [10]
}}
BR2_TOOLCHAIN_HAS_FULL_GETTEXT {'normal usage': {'package/gettext/Config
.in': [9], 'system/Config.in': [478], 'toolchain/Config.in': [14]}, 'sel
ected': {'toolchain/Config.in': [14]}, 'definition': {'toolchain/Config.
in': [313]}}
BR2_PACKAGE_HOST_GETTEXT {'normal usage': {'package/gettext/gettext.mk':
 [10]}}
BR2_PACKAGE_HAS_HOST_GETTEXT {'normal usage': {'package/gettext/gettext.
mk': [10]}}
BR2_PACKAGE_PHP_EXT_GETTEXT {'definition': {'package/php/Config.ext': [2
11]}, 'normal usage': {'package/php/php.mk': [164]}}
========== warnings:
real    0m1,337s
user    0m1,270s
sys     0m0,068s

NOTE 3:
The new GitLab CI jobs can be seen here:
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/706073924
---
 DEVELOPERS                             |   2 +
 support/misc/gitlab-ci.yml.in          |   8 +
 support/scripts/generate-gitlab-ci-yml |   2 +-
 utils/check-symbols                    |  78 +++++
 utils/checksymbolslib/__init__.py      |   0
 utils/checksymbolslib/br.py            | 140 ++++++++
 utils/checksymbolslib/db.py            | 205 ++++++++++++
 utils/checksymbolslib/file.py          |  83 +++++
 utils/checksymbolslib/kconfig.py       | 139 ++++++++
 utils/checksymbolslib/makefile.py      | 100 ++++++
 utils/checksymbolslib/test_db.py       | 286 ++++++++++++++++
 utils/checksymbolslib/test_file.py     | 152 +++++++++
 utils/checksymbolslib/test_kconfig.py  | 438 +++++++++++++++++++++++++
 utils/checksymbolslib/test_makefile.py | 304 +++++++++++++++++
 utils/checksymbolslib/test_util.py     |  15 +
 15 files changed, 1951 insertions(+), 1 deletion(-)
 create mode 100755 utils/check-symbols
 create mode 100644 utils/checksymbolslib/__init__.py
 create mode 100644 utils/checksymbolslib/br.py
 create mode 100644 utils/checksymbolslib/db.py
 create mode 100644 utils/checksymbolslib/file.py
 create mode 100644 utils/checksymbolslib/kconfig.py
 create mode 100644 utils/checksymbolslib/makefile.py
 create mode 100644 utils/checksymbolslib/test_db.py
 create mode 100644 utils/checksymbolslib/test_file.py
 create mode 100644 utils/checksymbolslib/test_kconfig.py
 create mode 100644 utils/checksymbolslib/test_makefile.py
 create mode 100644 utils/checksymbolslib/test_util.py

diff --git a/DEVELOPERS b/DEVELOPERS
index ab9cfe5ee9..889d622cdb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2522,7 +2522,9 @@ F:	support/testing/run-tests
 F:	support/testing/tests/package/test_atop.py
 F:	support/testing/tests/utils/test_check_package.py
 F:	utils/check-package
+F:	utils/check-symbols
 F:	utils/checkpackagelib/
+F:	utils/checksymbolslib/
 F:	utils/docker-run
 
 N:	Richard Braun <rbraun@sceen.net>
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
index 27f586f1b6..e2fb2228b3 100755
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
index 0000000000..ba2e760b59
--- /dev/null
+++ b/utils/check-symbols
@@ -0,0 +1,78 @@
+#!/usr/bin/env python3
+
+import argparse
+import os
+import sys
+
+import checksymbolslib.file as file
+from checksymbolslib.db import DB
+
+
+def parse_args():
+    parser = argparse.ArgumentParser()
+    parser.add_argument('--search', action='store', default=None,
+                        help='print all symbols matching a given regular expression')
+    return parser.parse_args()
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
+        file.populate_db_from_file(db, f)
+    return db
+
+
+def print_filenames_with_pattern(all_files, files_to_process, pattern):
+    ignored_filenames = file.get_list_of_filenames_with_pattern(all_files, files_to_process, pattern)
+    processed_filenames = file.get_list_of_filenames_with_pattern(files_to_process, [], pattern)
+    print('========== filenames found with pattern "{}": {}'.format(pattern, len(processed_filenames)))
+    for f in processed_filenames:
+        print(f)
+    print('========== ignored filenames with pattern "{}": {}'.format(pattern, len(ignored_filenames)))
+    for f in ignored_filenames:
+        print(f)
+
+
+def print_symbols_with_pattern(db, pattern):
+    symbols = db.get_symbols_with_pattern(pattern)
+    print('========== symbols with pattern "{}": {}'.format(pattern, len(symbols)))
+    for s in symbols:
+        print(s, str(symbols[s]))
+
+
+def __main__():
+    flags = parse_args()
+
+    change_current_dir()
+    all_files = file.get_list_of_files_in_the_repo()
+    files_to_process = file.get_list_of_files_to_process(all_files)
+    db = get_full_db(files_to_process)
+
+    if flags.search:
+        print_filenames_with_pattern(all_files, files_to_process, flags.search)
+        print_symbols_with_pattern(db, flags.search)
+        print('========== warnings:')
+
+    warnings = []
+    warnings += db.get_warnings_for_choices_selected()
+    warnings += db.get_warnings_for_legacy_symbols_being_defined()
+    warnings += db.get_warnings_for_legacy_symbols_being_used()
+    warnings += db.get_warnings_for_symbols_with_legacy_note_and_no_comment_on_usage()
+    warnings += db.get_warnings_for_symbols_with_legacy_note_and_no_usage()
+    warnings += db.get_warnings_for_symbols_without_definition()
+    warnings += db.get_warnings_for_symbols_without_usage()
+
+    for filename, lineno, msg in sorted(warnings):
+        print('{}:{}: {}'.format(filename, lineno, msg))
+
+    if len(warnings) > 0:
+        sys.exit(1)
+
+
+if __name__ == '__main__':
+    __main__()
diff --git a/utils/checksymbolslib/__init__.py b/utils/checksymbolslib/__init__.py
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/utils/checksymbolslib/br.py b/utils/checksymbolslib/br.py
new file mode 100644
index 0000000000..846a609829
--- /dev/null
+++ b/utils/checksymbolslib/br.py
@@ -0,0 +1,140 @@
+import os
+import re
+
+
+ignored_directories = [
+    'support/testing/',
+]
+# Makefile
+symbols_used_only_in_source_code = [
+    'BR2_USE_CCACHE',
+]
+# package/skeleton/Config.in
+symbols_used_only_for_host_variant = [
+    'BR2_PACKAGE_SKELETON',
+]
+# Makefile
+# package/pkg-generic.mk
+symbols_defined_only_at_command_line = [
+    'BR2_GRAPH_ALT',
+    'BR2_GRAPH_DEPS_OPTS',
+    'BR2_GRAPH_DOT_OPTS',
+    'BR2_GRAPH_OUT',
+    'BR2_GRAPH_SIZE_OPTS',
+    'BR2_INSTRUMENTATION_SCRIPTS',
+]
+# Makefile
+symbols_defined_only_when_using_br2_external = [
+    'BR2_EXTERNAL',
+    'BR2_EXTERNAL_DIRS',
+    'BR2_EXTERNAL_MKS',
+    'BR2_EXTERNAL_NAMES',
+]
+# boot/barebox/barebox.mk
+symbols_defined_only_for_barebox_variant = [
+    'BR2_TARGET_BAREBOX_AUX_BAREBOXENV',
+]
+# toolchain/toolchain/toolchain.mk
+# toolchain/toolchain-buildroot/toolchain-buildroot.mk
+symbols_not_defined_for_fake_virtual_packages = [
+    'BR2_PACKAGE_HAS_TOOLCHAIN',
+    'BR2_PACKAGE_HAS_TOOLCHAIN_BUILDROOT',
+    'BR2_PACKAGE_PROVIDES_TOOLCHAIN',
+    'BR2_PACKAGE_PROVIDES_TOOLCHAIN_BUILDROOT',
+]
+# fs/common.mk
+suffixes_not_defined_for_all_rootfs_types = [
+    '_BZIP2',
+    '_GZIP',
+    '_LZ4',
+    '_LZMA',
+    '_LZO',
+    '_XZ',
+    '_ZSTD',
+]
+# fs/common.mk
+rootfs_prefix = 'BR2_TARGET_ROOTFS_'
+# package/pkg-generic.mk
+package_prefix = 'BR2_PACKAGE_'
+# package/pkg-generic.mk
+boot_prefix = 'BR2_TARGET_'
+# package/pkg-generic.mk
+toolchain_prefix = 'BR2_'
+# boot/barebox/barebox.mk
+barebox_infra_suffixes = [
+    '',
+    '_BAREBOXENV',
+    '_BOARD_DEFCONFIG',
+    '_CONFIG_FRAGMENT_FILES',
+    '_CUSTOM_CONFIG_FILE',
+    '_CUSTOM_EMBEDDED_ENV_PATH',
+    '_CUSTOM_ENV',
+    '_CUSTOM_ENV_PATH',
+    '_IMAGE_FILE',
+    '_USE_CUSTOM_CONFIG',
+    '_USE_DEFCONFIG',
+]
+re_kconfig_symbol = re.compile(r'\b(BR2_\w+)\b')
+# Example lines to be handled:
+# config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+# menuconfig BR2_PACKAGE_GST1_PLUGINS_BASE
+re_kconfig_config = re.compile(r'^\s*(menu|)config\s+(BR2_\w+)')
+# Example lines to be handled:
+# default "uclibc" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
+# default BR2_TARGET_GRUB2_BUILTIN_MODULES if BR2_TARGET_GRUB2_BUILTIN_MODULES != ""
+# default y if BR2_HOSTARCH = "powerpc"
+re_kconfig_default = re.compile(r'^\s*default\s')
+re_kconfig_default_before_conditional = re.compile(r'^.*\bif\b')
+re_kconfig_default_legacy_comment = re.compile(r'#\s*legacy')
+# Example lines to be handled:
+# depends on !(BR2_TOOLCHAIN_USES_GLIBC && BR2_TOOLCHAIN_USES_MUSL)
+# depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+re_kconfig_depends = re.compile(r'^\s*depends on\s')
+# Example lines to be handled:
+# select BR2_PACKAGE_HOST_NODEJS if BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL != ""
+# select BR2_PACKAGE_LIBDRM if !(BR2_arm && BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB)
+# select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
+re_kconfig_select = re.compile(r'^\s*select\s')
+re_kconfig_select_conditional = re.compile(r'\bif\s.*')
+# Example lines to be handled:
+# if !BR2_SKIP_LEGACY
+# if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
+# if BR2_PACKAGE_HAS_LUAINTERPRETER && !BR2_STATIC_LIBS
+# if BR2_PACKAGE_QEMU_CUSTOM_TARGETS = ""
+re_kconfig_if = re.compile(r'^\s*if\s')
+# Example lines to be handled:
+# source "$BR2_BASE_DIR/.br2-external.in.jpeg"
+re_kconfig_source = re.compile(r'^\s*source\b')
+
+re_kconfig_choice = re.compile(r'^\s*choice\b')
+re_kconfig_endchoice = re.compile(r'^\s*endchoice\b')
+re_makefile_eval = re.compile(r'^\s*\$\(eval\b')
+re_menu = re.compile(r'^\s*menu\b')
+re_endmenu = re.compile(r'^\s*endmenu\b')
+re_comments = re.compile(r'#.*$')
+re_legacy_special_comment = re.compile(r'#.*(BR2_\w+)\s.*still referenced')
+re_host_symbol = re.compile(r'(BR2_PACKAGE_HOST_\w+|BR2_PACKAGE_HAS_HOST_\w+)')
+re_makefile_symbol_usage = re.compile(r'\$\((BR2_\w+)\)')
+re_makefile_symbol_export = re.compile(r'export\s*(BR2_\w+)')
+re_makefile_symbol_attribution = re.compile(r'^\s*(BR2_\w+)\s*[?:=]')
+
+
+def get_package_from_filename(filename):
+    package = os.path.basename(filename)[:-3].upper().replace('-', '_')
+    return package
+
+
+def is_an_optional_symbol_for_a_roofts(symbol):
+    if not symbol.startswith(rootfs_prefix):
+        return False
+    for sufix in suffixes_not_defined_for_all_rootfs_types:
+        if symbol.endswith(sufix):
+            return True
+    return False
+
+
+def file_belongs_to_an_ignored_diretory(filename):
+    for d in ignored_directories:
+        if filename.startswith(d):
+            return True
+    return False
diff --git a/utils/checksymbolslib/db.py b/utils/checksymbolslib/db.py
new file mode 100644
index 0000000000..71b1e9e816
--- /dev/null
+++ b/utils/checksymbolslib/db.py
@@ -0,0 +1,205 @@
+import re
+
+import checksymbolslib.br as br
+
+
+choice = 'part of a choice'
+definition = 'definition'
+helper = 'possible config helper'
+legacy_definition = 'legacy definition'
+legacy_note = 'legacy note'
+legacy_usage = 'legacy usage'
+select = 'selected'
+usage = 'normal usage'
+usage_in_legacy = 'usage inside legacy'
+virtual = 'virtual'
+
+
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
+    def add_symbol_choice(self, symbol, filename, lineno):
+        self.add_symbol_entry(symbol, filename, lineno, choice)
+
+    def add_symbol_definition(self, symbol, filename, lineno):
+        self.add_symbol_entry(symbol, filename, lineno, definition)
+
+    def add_symbol_helper(self, symbol, filename, lineno):
+        self.add_symbol_entry(symbol, filename, lineno, helper)
+
+    def add_symbol_legacy_definition(self, symbol, filename, lineno):
+        self.add_symbol_entry(symbol, filename, lineno, legacy_definition)
+
+    def add_symbol_legacy_note(self, symbol, filename, lineno):
+        self.add_symbol_entry(symbol, filename, lineno, legacy_note)
+
+    def add_symbol_legacy_usage(self, symbol, filename, lineno):
+        self.add_symbol_entry(symbol, filename, lineno, legacy_usage)
+
+    def add_symbol_select(self, symbol, filename, lineno):
+        self.add_symbol_entry(symbol, filename, lineno, select)
+
+    def add_symbol_usage(self, symbol, filename, lineno):
+        self.add_symbol_entry(symbol, filename, lineno, usage)
+
+    def add_symbol_usage_in_legacy(self, symbol, filename, lineno):
+        self.add_symbol_entry(symbol, filename, lineno, usage_in_legacy)
+
+    def add_symbol_virtual(self, symbol, filename, lineno):
+        self.add_symbol_entry(symbol, filename, lineno, virtual)
+
+    def get_symbols_with_pattern(self, pattern):
+        re_pattern = re.compile(r'{}'.format(pattern))
+        found_symbols = {}
+        for symbol, entries in self.all_symbols.items():
+            if not re_pattern.search(symbol):
+                continue
+            found_symbols[symbol] = entries
+        return found_symbols
+
+    def get_warnings_for_choices_selected(self):
+        warnings = []
+        for symbol, entries in self.all_symbols.items():
+            if choice not in entries:
+                continue
+            if select not in entries:
+                continue
+            all_items = []
+            all_items += entries.get(select, {}).items()
+            for filename, linenos in all_items:
+                for lineno in linenos:
+                    msg = '{} is part of a "choice" and should not be "select"ed'.format(symbol)
+                    warnings.append((filename, lineno, msg))
+        return warnings
+
+    def get_warnings_for_legacy_symbols_being_used(self):
+        warnings = []
+        for symbol, entries in self.all_symbols.items():
+            if legacy_definition not in entries:
+                continue
+            if usage not in entries:
+                continue
+            all_items = []
+            all_items += entries.get(usage, {}).items()
+            for filename, linenos in all_items:
+                for lineno in linenos:
+                    msg = '{} is a legacy symbol and should not be referenced'.format(symbol)
+                    warnings.append((filename, lineno, msg))
+        return warnings
+
+    def get_warnings_for_legacy_symbols_being_defined(self):
+        warnings = []
+        for symbol, entries in self.all_symbols.items():
+            if legacy_definition not in entries:
+                continue
+            if definition not in entries:
+                continue
+            all_items = []
+            all_items += entries.get(definition, {}).items()
+            for filename, linenos in all_items:
+                for lineno in linenos:
+                    msg = '{} is a legacy symbol and should not be redefined'.format(symbol)
+                    warnings.append((filename, lineno, msg))
+        return warnings
+
+    def get_warnings_for_symbols_without_definition(self):
+        warnings = []
+        for symbol, entries in self.all_symbols.items():
+            if definition in entries:
+                continue
+            if legacy_definition in entries:
+                continue
+            if br.re_host_symbol.search(symbol):
+                continue
+            if br.is_an_optional_symbol_for_a_roofts(symbol):
+                continue
+            if symbol in br.symbols_defined_only_at_command_line:
+                continue
+            if symbol in br.symbols_defined_only_when_using_br2_external:
+                continue
+            if symbol in br.symbols_defined_only_for_barebox_variant:
+                continue
+            if symbol in br.symbols_not_defined_for_fake_virtual_packages:
+                continue
+            if virtual in entries:
+                continue
+            all_items = []
+            all_items += entries.get(usage, {}).items()
+            all_items += entries.get(legacy_usage, {}).items()
+            all_items += entries.get(usage_in_legacy, {}).items()
+            for filename, linenos in all_items:
+                for lineno in linenos:
+                    msg = '{} referenced but not defined'.format(symbol)
+                    warnings.append((filename, lineno, msg))
+        return warnings
+
+    def get_warnings_for_symbols_without_usage(self):
+        warnings = []
+        for symbol, entries in self.all_symbols.items():
+            if usage in entries:
+                continue
+            if usage_in_legacy in entries:
+                continue
+            if legacy_usage in entries:
+                continue
+            if symbol in br.symbols_used_only_in_source_code:
+                continue
+            if symbol in br.symbols_used_only_for_host_variant:
+                continue
+            if helper in entries:
+                continue
+            if choice in entries:
+                continue
+            all_items = []
+            all_items += entries.get(definition, {}).items()
+            all_items += entries.get(legacy_definition, {}).items()
+            for filename, linenos in all_items:
+                for lineno in linenos:
+                    msg = '{} defined but not referenced'.format(symbol)
+                    warnings.append((filename, lineno, msg))
+        return warnings
+
+    def get_warnings_for_symbols_with_legacy_note_and_no_comment_on_usage(self):
+        warnings = []
+        for symbol, entries in self.all_symbols.items():
+            if legacy_note not in entries:
+                continue
+            if legacy_usage in entries:
+                continue
+            all_items = []
+            all_items += entries.get(usage, {}).items()
+            for filename, linenos in all_items:
+                for lineno in linenos:
+                    msg = '{} missing "# legacy"'.format(symbol)
+                    warnings.append((filename, lineno, msg))
+        return warnings
+
+    def get_warnings_for_symbols_with_legacy_note_and_no_usage(self):
+        warnings = []
+        for symbol, entries in self.all_symbols.items():
+            if legacy_note not in entries:
+                continue
+            if legacy_usage in entries:
+                continue
+            if usage in entries:
+                continue
+            all_items = []
+            all_items += entries.get(legacy_note, {}).items()
+            for filename, linenos in all_items:
+                for lineno in linenos:
+                    msg = '{} not referenced but has a comment stating it is'.format(symbol)
+                    warnings.append((filename, lineno, msg))
+        return warnings
diff --git a/utils/checksymbolslib/file.py b/utils/checksymbolslib/file.py
new file mode 100644
index 0000000000..0d3315bdc7
--- /dev/null
+++ b/utils/checksymbolslib/file.py
@@ -0,0 +1,83 @@
+import re
+import subprocess
+
+import checksymbolslib.br as br
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
+        if br.file_belongs_to_an_ignored_diretory(f):
+            continue
+        for t in file_types:
+            if t.check_filename(f):
+                files_to_process.append(f)
+                break
+    return files_to_process
+
+
+def get_list_of_filenames_with_pattern(all_files, exclude_list, pattern):
+    re_pattern = re.compile(r'{}'.format(pattern))
+    matching_filenames = []
+    for filename in all_files:
+        if re_pattern.search(filename):
+            if filename not in exclude_list:
+                matching_filenames.append(filename)
+    return matching_filenames
+
+
+def read_file(filename):
+    file_content_raw = []
+    with open(filename, 'r', errors='surrogateescape') as f:
+        for lineno, text in enumerate(f.readlines()):
+            file_content_raw.append([lineno + 1, text])
+    return file_content_raw
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
+        clean_line = line.rstrip('\n')
+        if clean_line.endswith('\\'):
+            continuation = True
+            last_line = clean_line.rstrip('\\')
+            first_lineno = lineno
+            continue
+        cleaned_up_content.append([lineno, clean_line])
+    return cleaned_up_content
+
+
+def populate_db_from_file(db, filename):
+    file_content_raw = read_file(filename)
+    file_content_to_process = cleanup_file_content(file_content_raw)
+    for t in file_types:
+        if t.check_filename(filename):
+            t.populate_db(db, filename, file_content_to_process)
diff --git a/utils/checksymbolslib/kconfig.py b/utils/checksymbolslib/kconfig.py
new file mode 100644
index 0000000000..9ad6030305
--- /dev/null
+++ b/utils/checksymbolslib/kconfig.py
@@ -0,0 +1,139 @@
+import os
+
+import checksymbolslib.br as br
+
+
+def all_symbols_from(line):
+    clean_line = br.re_comments.sub('', line)
+    symbols = br.re_kconfig_symbol.findall(clean_line)
+    return symbols
+
+
+def handle_definition(db, filename, lineno, line, legacy):
+    for symbol in all_symbols_from(line):
+        if legacy:
+            db.add_symbol_legacy_definition(symbol, filename, lineno)
+        else:
+            db.add_symbol_definition(symbol, filename, lineno)
+
+
+def handle_usage(db, filename, lineno, line, legacy):
+    for symbol in all_symbols_from(line):
+        if legacy:
+            db.add_symbol_usage_in_legacy(symbol, filename, lineno)
+        else:
+            db.add_symbol_usage(symbol, filename, lineno)
+
+
+def handle_default(db, filename, lineno, line, legacy):
+    if legacy:
+        handle_usage(db, filename, lineno, line, legacy)
+        return
+    if not br.re_kconfig_default_legacy_comment.search(line):
+        handle_usage(db, filename, lineno, line, legacy)
+        return
+    after = br.re_kconfig_default_before_conditional.sub('', line)
+    for symbol in all_symbols_from(after):
+        db.add_symbol_legacy_usage(symbol, filename, lineno)
+
+
+def handle_select(db, filename, lineno, line, legacy):
+    handle_usage(db, filename, lineno, line, legacy)
+    before = br.re_kconfig_select_conditional.sub('', line)
+    for symbol in all_symbols_from(before):
+        db.add_symbol_select(symbol, filename, lineno)
+
+
+line_type_handlers = {
+    br.re_kconfig_config: handle_definition,
+    br.re_kconfig_default: handle_default,
+    br.re_kconfig_depends: handle_usage,
+    br.re_kconfig_if: handle_usage,
+    br.re_kconfig_select: handle_select,
+    br.re_kconfig_source: handle_usage,
+}
+
+
+def handle_line(db, filename, lineno, line, legacy):
+    if not br.re_kconfig_symbol.search(line):
+        return
+
+    for regexp, line_type_handler in line_type_handlers.items():
+        if regexp.search(line):
+            line_type_handler(db, filename, lineno, line, legacy)
+
+
+def handle_config_helper(db, filename, file_content):
+    symbol = None
+    lineno = None
+    state = 'none'
+    for cur_lineno, line in file_content:
+        if state == 'none':
+            m = br.re_kconfig_config.search(line)
+            if m is not None:
+                symbol = m.group(2)
+                lineno = cur_lineno
+                state = 'config'
+            continue
+        if state == 'config':
+            if br.re_kconfig_select.search(line):
+                db.add_symbol_helper(symbol, filename, lineno)
+                state = 'none'
+                continue
+            m = br.re_kconfig_config.search(line)
+            if m is not None:
+                symbol = m.group(2)
+                lineno = cur_lineno
+            continue
+
+
+def handle_config_choice(db, filename, file_content):
+    state = 'none'
+    for lineno, line in file_content:
+        if state == 'none':
+            if br.re_kconfig_choice.search(line):
+                state = 'choice'
+                continue
+        if state == 'choice':
+            if br.re_kconfig_endchoice.search(line):
+                state = 'none'
+                continue
+            m = br.re_kconfig_config.search(line)
+            if m is not None:
+                symbol = m.group(2)
+                db.add_symbol_choice(symbol, filename, lineno)
+                continue
+
+
+def handle_note(db, filename, file_content):
+    state = 'none'
+    for lineno, line in file_content:
+        if state == 'none':
+            if br.re_menu.search(line):
+                state = 'menu'
+                continue
+        if state == 'menu':
+            if br.re_endmenu.search(line):
+                state = 'none'
+                continue
+            m = br.re_legacy_special_comment.search(line)
+            if m is not None:
+                symbol = m.group(1)
+                db.add_symbol_legacy_note(symbol, filename, lineno)
+                continue
+
+
+def populate_db(db, filename, file_content):
+    legacy = filename.endswith('.legacy')
+    for lineno, line in file_content:
+        handle_line(db, filename, lineno, line, legacy)
+    handle_config_helper(db, filename, file_content)
+    handle_config_choice(db, filename, file_content)
+    if legacy:
+        handle_note(db, filename, file_content)
+
+
+def check_filename(filename):
+    if os.path.basename(filename).startswith('Config.'):
+        return True
+    return False
diff --git a/utils/checksymbolslib/makefile.py b/utils/checksymbolslib/makefile.py
new file mode 100644
index 0000000000..e3894dd1f9
--- /dev/null
+++ b/utils/checksymbolslib/makefile.py
@@ -0,0 +1,100 @@
+import checksymbolslib.br as br
+
+
+def handle_eval(db, filename, lineno, line):
+    def add_multiple_symbol_usages(package, prefixes=None, suffixes=None):
+        for prefix in prefixes or ['']:
+            for sufix in suffixes or ['']:
+                symbol = prefix + package + sufix
+                db.add_symbol_usage(symbol, filename, lineno)
+
+    package = br.get_package_from_filename(filename)
+    if '$(rootfs)' in line:
+        suffixes = [''] + br.suffixes_not_defined_for_all_rootfs_types
+        add_multiple_symbol_usages(package, prefixes=[br.rootfs_prefix], suffixes=suffixes)
+        return
+    if '$(kernel-module)' in line:
+        add_multiple_symbol_usages(package, prefixes=[br.package_prefix])
+        return
+    if '$(barebox-package)' in line:
+        add_multiple_symbol_usages(package, prefixes=[br.boot_prefix], suffixes=br.barebox_infra_suffixes)
+        return
+
+    if '-package)' not in line:
+        return
+    if package == 'LINUX':
+        # very special case at package/pkg-generic.mk
+        add_multiple_symbol_usages('BR2_LINUX_KERNEL')
+        return
+
+    # mimic package/pkg-generic.mk and package/pkg-virtual.mk
+    if '$(virtual-' in line:
+        prefixes = ['BR2_PACKAGE_PROVIDES_', 'BR2_PACKAGE_HAS_']
+        if filename.startswith('toolchain/'):
+            prefix = br.toolchain_prefix
+        else:
+            prefix = br.package_prefix
+        symbol = prefix + package
+        db.add_symbol_virtual(symbol, filename, lineno)
+        prefixes.append(prefix)
+    elif '$(host-virtual-' in line:
+        prefixes = ['BR2_PACKAGE_HOST_', 'BR2_PACKAGE_PROVIDES_HOST_', 'BR2_PACKAGE_HAS_HOST_']
+    elif '$(host-' in line:
+        prefixes = ['BR2_PACKAGE_HOST_']
+    elif filename.startswith('boot/'):
+        prefixes = [br.boot_prefix]
+    elif filename.startswith('toolchain/'):
+        prefixes = [br.toolchain_prefix]
+    elif '$(toolchain-' in line:
+        prefixes = [br.toolchain_prefix]
+    else:
+        prefixes = [br.package_prefix]
+
+    add_multiple_symbol_usages(package, prefixes=prefixes)
+
+
+def handle_definition(db, filename, lineno, line, legacy):
+    symbols = br.re_makefile_symbol_attribution.findall(line)
+    symbols += br.re_makefile_symbol_export.findall(line)
+    for symbol in symbols:
+        if legacy:
+            db.add_symbol_legacy_definition(symbol, filename, lineno)
+        else:
+            db.add_symbol_definition(symbol, filename, lineno)
+
+
+def handle_usage(db, filename, lineno, line, legacy):
+    if br.re_makefile_eval.search(line):
+        handle_eval(db, filename, lineno, line)
+        return
+
+    symbols = br.re_makefile_symbol_usage.findall(line)
+    for symbol in symbols:
+        if legacy:
+            db.add_symbol_usage_in_legacy(symbol, filename, lineno)
+        else:
+            db.add_symbol_usage(symbol, filename, lineno)
+
+
+def populate_db(db, filename, file_content):
+    legacy = filename.endswith('.legacy')
+    for lineno, raw_line in file_content:
+        line = br.re_comments.sub('', raw_line)
+        handle_definition(db, filename, lineno, line, legacy)
+        handle_usage(db, filename, lineno, line, legacy)
+
+
+def check_filename(filename):
+    if filename.endswith('.mk'):
+        return True
+    if filename.endswith('.mk.in'):
+        return True
+    if filename.startswith('arch/arch.mk.'):
+        return True
+    if filename in [
+            'Makefile',
+            'Makefile.legacy',
+            'package/Makefile.in'
+            ]:
+        return True
+    return False
diff --git a/utils/checksymbolslib/test_db.py b/utils/checksymbolslib/test_db.py
new file mode 100644
index 0000000000..15576fa897
--- /dev/null
+++ b/utils/checksymbolslib/test_db.py
@@ -0,0 +1,286 @@
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
+        'BR2_foo': {'definition': {'foo/Config.in': [7]}},
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
+        'BR2_bar': {'definition': {'bar/Config.in': [5]}},
+        })
+
+
+def test_definition_and_usage():
+    db = m.DB()
+    db.add_symbol_definition('BR2_foo', 'foo/Config.in', 7)
+    db.add_symbol_usage('BR2_foo', 'foo/Config.in', 9)
+    assert str(db) == str({
+        'BR2_foo': {'definition': {'foo/Config.in': [7]}, 'normal usage': {'foo/Config.in': [9]}},
+        })
+
+
+def test_all_entry_types():
+    db = m.DB()
+    db.add_symbol_choice('BR2_foo', 'foo/Config.in', 7)
+    db.add_symbol_definition('BR2_foo', 'foo/Config.in', 7)
+    db.add_symbol_definition('BR2_bar', 'bar/Config.in', 700)
+    db.add_symbol_helper('BR2_bar', 'bar/Config.in', 700)
+    db.add_symbol_legacy_definition('BR2_baz', 'Config.in.legacy', 7000)
+    db.add_symbol_legacy_note('BR2_baz', 'Config.in.legacy', 7001)
+    db.add_symbol_legacy_usage('BR2_bar', 'Config.in.legacy', 7001)
+    db.add_symbol_select('BR2_bar', 'Config.in.legacy', 7001)
+    db.add_symbol_usage('BR2_foo', 'foo/Config.in', 9)
+    db.add_symbol_usage_in_legacy('BR2_bar', 'Config.in.legacy', 9)
+    db.add_symbol_virtual('BR2_foo', 'foo/Config.in', 7)
+    assert str(db) == str({
+        'BR2_foo': {
+            'part of a choice': {'foo/Config.in': [7]},
+            'definition': {'foo/Config.in': [7]},
+            'normal usage': {'foo/Config.in': [9]},
+            'virtual': {'foo/Config.in': [7]}},
+        'BR2_bar': {
+            'definition': {'bar/Config.in': [700]},
+            'possible config helper': {'bar/Config.in': [700]},
+            'legacy usage': {'Config.in.legacy': [7001]},
+            'selected': {'Config.in.legacy': [7001]},
+            'usage inside legacy': {'Config.in.legacy': [9]}},
+        'BR2_baz': {
+            'legacy definition': {'Config.in.legacy': [7000]},
+            'legacy note': {'Config.in.legacy': [7001]}},
+        })
+
+
+def test_get_symbols_with_pattern():
+    db = m.DB()
+    db.add_symbol_definition('BR2_foo', 'foo/Config.in', 7)
+    db.add_symbol_usage('BR2_foo', 'foo/Config.in', 9)
+    db.add_symbol_definition('BR2_bar', 'bar/Config.in', 5)
+    assert str(db) == str({
+        'BR2_foo': {'definition': {'foo/Config.in': [7]}, 'normal usage': {'foo/Config.in': [9]}},
+        'BR2_bar': {'definition': {'bar/Config.in': [5]}},
+        })
+    symbols = db.get_symbols_with_pattern('foo')
+    assert str(symbols) == str({
+        'BR2_foo': {'definition': {'foo/Config.in': [7]}, 'normal usage': {'foo/Config.in': [9]}},
+        })
+    symbols = db.get_symbols_with_pattern('FOO')
+    assert str(symbols) == str({
+        })
+    symbols = db.get_symbols_with_pattern('foo|FOO')
+    assert str(symbols) == str({
+        'BR2_foo': {'definition': {'foo/Config.in': [7]}, 'normal usage': {'foo/Config.in': [9]}},
+        })
+    symbols = db.get_symbols_with_pattern('^foo')
+    assert str(symbols) == str({
+        })
+    symbols = db.get_symbols_with_pattern('foo|bar')
+    assert str(symbols) == str({
+        'BR2_foo': {'definition': {'foo/Config.in': [7]}, 'normal usage': {'foo/Config.in': [9]}},
+        'BR2_bar': {'definition': {'bar/Config.in': [5]}},
+        })
+
+
+def test_get_warnings_for_choices_selected():
+    db = m.DB()
+    db.add_symbol_choice('BR2_foo', 'foo/Config.in', 1)
+    db.add_symbol_choice('BR2_bar', 'bar/Config.in', 1)
+    db.add_symbol_select('BR2_foo', 'bar/Config.in', 2)
+    assert str(db) == str({
+        'BR2_foo': {'part of a choice': {'foo/Config.in': [1]}, 'selected': {'bar/Config.in': [2]}},
+        'BR2_bar': {'part of a choice': {'bar/Config.in': [1]}},
+        })
+    warnings = db.get_warnings_for_choices_selected()
+    assert warnings == [
+        ('bar/Config.in', 2, 'BR2_foo is part of a "choice" and should not be "select"ed'),
+        ]
+
+
+def test_get_warnings_for_legacy_symbols_being_used():
+    db = m.DB()
+    db.add_symbol_legacy_definition('BR2_foo', 'Config.in.legacy', 1)
+    db.add_symbol_usage('BR2_foo', 'bar/Config.in', 2)
+    db.add_symbol_legacy_definition('BR2_bar', 'Config.in.legacy', 10)
+    db.add_symbol_usage_in_legacy('BR2_bar', 'Config.in.legacy', 11)
+    assert str(db) == str({
+        'BR2_foo': {'legacy definition': {'Config.in.legacy': [1]}, 'normal usage': {'bar/Config.in': [2]}},
+        'BR2_bar': {'legacy definition': {'Config.in.legacy': [10]}, 'usage inside legacy': {'Config.in.legacy': [11]}},
+        })
+    warnings = db.get_warnings_for_legacy_symbols_being_used()
+    assert warnings == [
+        ('bar/Config.in', 2, 'BR2_foo is a legacy symbol and should not be referenced'),
+        ]
+
+
+def test_get_warnings_for_legacy_symbols_being_defined():
+    db = m.DB()
+    db.add_symbol_legacy_definition('BR2_foo', 'Config.in.legacy', 1)
+    db.add_symbol_legacy_definition('BR2_bar', 'Config.in.legacy', 10)
+    db.add_symbol_definition('BR2_foo', 'foo/Config.in', 7)
+    db.add_symbol_definition('BR2_foo', 'foo/Config.in', 8)
+    assert str(db) == str({
+        'BR2_foo': {'legacy definition': {'Config.in.legacy': [1]}, 'definition': {'foo/Config.in': [7, 8]}},
+        'BR2_bar': {'legacy definition': {'Config.in.legacy': [10]}},
+        })
+    warnings = db.get_warnings_for_legacy_symbols_being_defined()
+    assert warnings == [
+        ('foo/Config.in', 7, 'BR2_foo is a legacy symbol and should not be redefined'),
+        ('foo/Config.in', 8, 'BR2_foo is a legacy symbol and should not be redefined'),
+        ]
+
+
+def test_get_warnings_for_symbols_without_definition():
+    db = m.DB()
+    db.add_symbol_definition('BR2_foo', 'foo/Config.in', 7)
+    db.add_symbol_legacy_definition('BR2_bar', 'Config.in.legacy', 10)
+    db.add_symbol_virtual('BR2_baz', 'baz/Config.in', 7)
+    db.add_symbol_usage('BR2_foo', 'file', 1)
+    db.add_symbol_usage('BR2_bar', 'file', 1)
+    db.add_symbol_usage('BR2_baz', 'file', 1)
+    db.add_symbol_usage('BR2_undef1', 'file', 1)
+    db.add_symbol_legacy_usage('BR2_undef2', 'file', 2)
+    db.add_symbol_usage_in_legacy('BR2_undef3', 'file', 3)
+    db.add_symbol_usage('BR2_undef3', 'another', 1)
+    db.add_symbol_legacy_usage('BR2_undef3', 'another', 2)
+    db.add_symbol_usage('BR2_PACKAGE_HOST_undef', 'file', 1)
+    db.add_symbol_usage('BR2_PACKAGE_HAS_HOST_undef', 'file', 1)
+    db.add_symbol_usage('BR2_TARGET_ROOTFS_undef_XZ', 'file', 1)
+    db.add_symbol_usage('BR2_GRAPH_ALT', 'file', 1)
+    db.add_symbol_usage('BR2_EXTERNAL', 'file', 1)
+    db.add_symbol_usage('BR2_TARGET_BAREBOX_AUX_BAREBOXENV', 'file', 1)
+    db.add_symbol_usage('BR2_PACKAGE_HAS_TOOLCHAIN_BUILDROOT', 'file', 1)
+    assert str(db) == str({
+        'BR2_foo': {'definition': {'foo/Config.in': [7]}, 'normal usage': {'file': [1]}},
+        'BR2_bar': {'legacy definition': {'Config.in.legacy': [10]}, 'normal usage': {'file': [1]}},
+        'BR2_baz': {'virtual': {'baz/Config.in': [7]}, 'normal usage': {'file': [1]}},
+        'BR2_undef1': {'normal usage': {'file': [1]}},
+        'BR2_undef2': {'legacy usage': {'file': [2]}},
+        'BR2_undef3': {'usage inside legacy': {'file': [3]}, 'normal usage': {'another': [1]}, 'legacy usage': {'another': [2]}},
+        'BR2_PACKAGE_HOST_undef': {'normal usage': {'file': [1]}},
+        'BR2_PACKAGE_HAS_HOST_undef': {'normal usage': {'file': [1]}},
+        'BR2_TARGET_ROOTFS_undef_XZ': {'normal usage': {'file': [1]}},
+        'BR2_GRAPH_ALT': {'normal usage': {'file': [1]}},
+        'BR2_EXTERNAL': {'normal usage': {'file': [1]}},
+        'BR2_TARGET_BAREBOX_AUX_BAREBOXENV': {'normal usage': {'file': [1]}},
+        'BR2_PACKAGE_HAS_TOOLCHAIN_BUILDROOT': {'normal usage': {'file': [1]}},
+        })
+    warnings = db.get_warnings_for_symbols_without_definition()
+    assert warnings == [
+        ('file', 1, 'BR2_undef1 referenced but not defined'),
+        ('file', 2, 'BR2_undef2 referenced but not defined'),
+        ('another', 1, 'BR2_undef3 referenced but not defined'),
+        ('another', 2, 'BR2_undef3 referenced but not defined'),
+        ('file', 3, 'BR2_undef3 referenced but not defined'),
+        ]
+
+
+def test_get_warnings_for_symbols_without_usage():
+    db = m.DB()
+    db.add_symbol_definition('BR2_a', 'a/Config.in', 1)
+    db.add_symbol_definition('BR2_a', 'a/Config.in', 2)
+    db.add_symbol_usage('BR2_a', 'file', 1)
+    db.add_symbol_usage('BR2_a', 'file', 2)
+    db.add_symbol_definition('BR2_b', 'b/Config.in', 2)
+    db.add_symbol_usage_in_legacy('BR2_b', 'file', 1)
+    db.add_symbol_definition('BR2_c', 'c/Config.in', 2)
+    db.add_symbol_legacy_usage('BR2_c', 'file', 1)
+    db.add_symbol_definition('BR2_USE_CCACHE', 'file', 1)
+    db.add_symbol_definition('BR2_PACKAGE_SKELETON', 'file', 1)
+    db.add_symbol_definition('BR2_d', 'd/Config.in', 2)
+    db.add_symbol_helper('BR2_d', 'd/Config.in', 2)
+    db.add_symbol_definition('BR2_e', 'e/Config.in', 2)
+    db.add_symbol_choice('BR2_e', 'e/Config.in', 2)
+    db.add_symbol_definition('BR2_f', 'f/Config.in', 2)
+    db.add_symbol_definition('BR2_g', 'g/Config.in', 2)
+    db.add_symbol_definition('BR2_g', 'g/Config.in', 3)
+    db.add_symbol_legacy_definition('BR2_h', 'Config.in.legacy', 1)
+    db.add_symbol_usage('BR2_h', 'file', 2)
+    db.add_symbol_usage('BR2_h', 'file', 3)
+    db.add_symbol_legacy_definition('BR2_i', 'Config.in.legacy', 2)
+    db.add_symbol_usage_in_legacy('BR2_i', 'file', 2)
+    db.add_symbol_legacy_definition('BR2_j', 'Config.in.legacy', 2)
+    db.add_symbol_legacy_usage('BR2_j', 'file', 2)
+    db.add_symbol_legacy_definition('BR2_k', 'Config.in.legacy', 2)
+    db.add_symbol_usage('BR2_k', 'file', 5)
+    db.add_symbol_usage_in_legacy('BR2_k', 'file', 6)
+    db.add_symbol_legacy_usage('BR2_k', 'file', 7)
+    db.add_symbol_legacy_definition('BR2_l', 'Config.in.legacy', 2)
+    assert str(db) == str({
+        'BR2_a': {'definition': {'a/Config.in': [1, 2]}, 'normal usage': {'file': [1, 2]}},
+        'BR2_b': {'definition': {'b/Config.in': [2]}, 'usage inside legacy': {'file': [1]}},
+        'BR2_c': {'definition': {'c/Config.in': [2]}, 'legacy usage': {'file': [1]}},
+        'BR2_USE_CCACHE': {'definition': {'file': [1]}},
+        'BR2_PACKAGE_SKELETON': {'definition': {'file': [1]}},
+        'BR2_d': {'definition': {'d/Config.in': [2]}, 'possible config helper': {'d/Config.in': [2]}},
+        'BR2_e': {'definition': {'e/Config.in': [2]}, 'part of a choice': {'e/Config.in': [2]}},
+        'BR2_f': {'definition': {'f/Config.in': [2]}},
+        'BR2_g': {'definition': {'g/Config.in': [2, 3]}},
+        'BR2_h': {'legacy definition': {'Config.in.legacy': [1]}, 'normal usage': {'file': [2, 3]}},
+        'BR2_i': {'legacy definition': {'Config.in.legacy': [2]}, 'usage inside legacy': {'file': [2]}},
+        'BR2_j': {'legacy definition': {'Config.in.legacy': [2]}, 'legacy usage': {'file': [2]}},
+        'BR2_k': {
+            'legacy definition': {'Config.in.legacy': [2]},
+            'normal usage': {'file': [5]},
+            'usage inside legacy': {'file': [6]},
+            'legacy usage': {'file': [7]}},
+        'BR2_l': {'legacy definition': {'Config.in.legacy': [2]}},
+        })
+    warnings = db.get_warnings_for_symbols_without_usage()
+    assert warnings == [
+        ('f/Config.in', 2, 'BR2_f defined but not referenced'),
+        ('g/Config.in', 2, 'BR2_g defined but not referenced'),
+        ('g/Config.in', 3, 'BR2_g defined but not referenced'),
+        ('Config.in.legacy', 2, 'BR2_l defined but not referenced'),
+        ]
+
+
+def test_get_warnings_for_symbols_with_legacy_note_and_no_comment_on_usage():
+    db = m.DB()
+    db.add_symbol_legacy_note('BR2_foo', 'Config.in.legacy', 1)
+    db.add_symbol_legacy_usage('BR2_foo', 'package/bar/Config.in', 2)
+    db.add_symbol_legacy_note('BR2_baz', 'Config.in.legacy', 7001)
+    db.add_symbol_usage('BR2_baz', 'package/foo/Config.in', 1)
+    assert str(db) == str({
+        'BR2_foo': {'legacy note': {'Config.in.legacy': [1]}, 'legacy usage': {'package/bar/Config.in': [2]}},
+        'BR2_baz': {'legacy note': {'Config.in.legacy': [7001]}, 'normal usage': {'package/foo/Config.in': [1]}},
+        })
+    warnings = db.get_warnings_for_symbols_with_legacy_note_and_no_comment_on_usage()
+    assert warnings == [
+        ('package/foo/Config.in', 1, 'BR2_baz missing "# legacy"'),
+        ]
+
+
+def test_get_warnings_for_symbols_with_legacy_note_and_no_usage():
+    db = m.DB()
+    db.add_symbol_legacy_note('BR2_foo', 'Config.in.legacy', 1)
+    db.add_symbol_legacy_usage('BR2_foo', 'package/bar/Config.in', 2)
+    db.add_symbol_legacy_note('BR2_bar', 'Config.in.legacy', 1)
+    db.add_symbol_usage_in_legacy('BR2_bar', 'Config.in.legacy', 7001)
+    db.add_symbol_legacy_note('BR2_baz', 'Config.in.legacy', 7001)
+    db.add_symbol_legacy_note('BR2_no_comment', 'Config.in.legacy', 1)
+    db.add_symbol_usage('BR2_no_comment', 'package/bar/Config.in', 2)
+    assert str(db) == str({
+        'BR2_foo': {'legacy note': {'Config.in.legacy': [1]}, 'legacy usage': {'package/bar/Config.in': [2]}},
+        'BR2_bar': {'legacy note': {'Config.in.legacy': [1]}, 'usage inside legacy': {'Config.in.legacy': [7001]}},
+        'BR2_baz': {'legacy note': {'Config.in.legacy': [7001]}},
+        'BR2_no_comment': {'legacy note': {'Config.in.legacy': [1]}, 'normal usage': {'package/bar/Config.in': [2]}},
+        })
+    warnings = db.get_warnings_for_symbols_with_legacy_note_and_no_usage()
+    assert warnings == [
+        ('Config.in.legacy', 1, 'BR2_bar not referenced but has a comment stating it is'),
+        ('Config.in.legacy', 7001, 'BR2_baz not referenced but has a comment stating it is'),
+        ]
diff --git a/utils/checksymbolslib/test_file.py b/utils/checksymbolslib/test_file.py
new file mode 100644
index 0000000000..3b4ee108d1
--- /dev/null
+++ b/utils/checksymbolslib/test_file.py
@@ -0,0 +1,152 @@
+import os
+import pytest
+import tempfile
+import checksymbolslib.file as m
+
+
+def test_get_list_of_files_in_the_repo():
+    all_files = m.get_list_of_files_in_the_repo()
+    assert 'Makefile' in all_files
+    assert 'package/Config.in' in all_files
+    assert len(all_files) > 1000
+
+
+get_list_of_files_to_process = [
+    ('unknown file type',
+     ['a/file/Config.in',
+      'another/file.mk',
+      'unknown/file/type'],
+     ['a/file/Config.in',
+      'another/file.mk']),
+    ('runtime test infra fixtures',
+     ['a/file/Config.in',
+      'support/testing/a/broken/Config.in',
+      'another/file.mk'],
+     ['a/file/Config.in',
+      'another/file.mk']),
+    ]
+
+
+@pytest.mark.parametrize('testname,all_files,expected', get_list_of_files_to_process)
+def test_get_list_of_files_to_process(testname, all_files, expected):
+    files_to_process = m.get_list_of_files_to_process(all_files)
+    assert files_to_process == expected
+
+
+get_list_of_filenames_with_pattern = [
+    ('ignored directories',
+     ['a/file/Config.in',
+      'support/testing/a/broken/file/Config.in',
+      'not/found.mk',
+      'another/file.mk'],
+     ['a/file/Config.in',
+      'not/found.mk',
+      'another/file.mk'],
+     'file',
+     ['support/testing/a/broken/file/Config.in']),
+    ('processed files',
+     ['a/file/Config.in',
+      'not/found.mk',
+      'another/file.mk'],
+     [],
+     'file',
+     ['a/file/Config.in',
+      'another/file.mk']),
+    ('case sensitive',
+     ['a/file/Config.in',
+      'not/found.mk',
+      'another/file.mk'],
+     [],
+     'FILE',
+     []),
+    ('or',
+     ['a/file/Config.in',
+      'not/found.mk',
+      'another/file.mk'],
+     [],
+     'file|FILE',
+     ['a/file/Config.in',
+      'another/file.mk']),
+    ('complex regexp',
+     ['a/file/Config.in',
+      'not/found.mk',
+      'another/file.mk'],
+     [],
+     '^n[oO]+t.*mk$',
+     ['not/found.mk']),
+    ]
+
+
+@pytest.mark.parametrize('testname,all_files,files_to_process,pattern,expected', get_list_of_filenames_with_pattern)
+def test_get_list_of_filenames_with_pattern(testname, all_files, files_to_process, pattern, expected):
+    files_to_process = m.get_list_of_filenames_with_pattern(all_files, files_to_process, pattern)
+    assert files_to_process == expected
+
+
+read_file = [
+    ('indent',
+     'file1',
+     ' content1\n'
+     '\t# comment1',
+     [[1, ' content1\n'],
+      [2, '\t# comment1']]),
+    ('trailing space',
+     'file2',
+     'content2 \n'
+     '# comment2\t\n',
+     [[1, 'content2 \n'],
+      [2, '# comment2\t\n']]),
+    ('empty line',
+     'file3',
+     '\n'
+     '\n',
+     [[1, '\n'],
+      [2, '\n']]),
+    ('missing newline at EOF',
+     'file4',
+     '\n'
+     ' text\t',
+     [[1, '\n'],
+      [2, ' text\t']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,content,,expected', read_file)
+def test_read_file(testname, filename, content, expected):
+    with tempfile.TemporaryDirectory(suffix='-checksymbolslib-test-file') as workdir:
+        full_filename = os.path.join(workdir, filename)
+        with open(full_filename, 'wb') as f:
+            f.write(content.encode())
+        read_file_content = m.read_file(full_filename)
+    assert read_file_content == expected
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
+     [[3, '    ']]),
+    ('trailing tab',
+     [[3, '\t\n']],
+     [[3, '\t']]),
+    ('1 continuation',
+     [[1, 'foo \\\n'],
+      [2, 'bar\n']],
+     [[1, 'foo bar']]),
+    ('2 continuations',
+     [[1, 'foo \\\n'],
+      [2, 'bar  \\\n'],
+      [3, 'baz\n']],
+     [[1, 'foo bar  baz']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,file_content_raw,expected', cleanup_file_content)
+def test_cleanup_file_content(testname, file_content_raw, expected):
+    cleaned_up_content = m.cleanup_file_content(file_content_raw)
+    assert cleaned_up_content == expected
diff --git a/utils/checksymbolslib/test_kconfig.py b/utils/checksymbolslib/test_kconfig.py
new file mode 100644
index 0000000000..ab2008df6c
--- /dev/null
+++ b/utils/checksymbolslib/test_kconfig.py
@@ -0,0 +1,438 @@
+import pytest
+from unittest.mock import Mock
+from unittest.mock import call
+from checksymbolslib.test_util import assert_db_calls
+import checksymbolslib.kconfig as m
+
+
+all_symbols_from = [
+    ('no prefix',
+     'config PACKAGE_FOO',
+     []),
+    ('simple',
+     'config BR2_PACKAGE_FOO',
+     ['BR2_PACKAGE_FOO']),
+    ('ignore comment',
+     'config BR2_PACKAGE_FOO # BR2_PACKAGE_BAR',
+     ['BR2_PACKAGE_FOO']),
+    ('ignore whitespace',
+     '\tconfig  BR2_PACKAGE_FOO\t # BR2_PACKAGE_BAR',
+     ['BR2_PACKAGE_FOO']),
+    ('2 occurrences',
+     '\tdefault BR2_PACKAGE_FOO_BAR if BR2_PACKAGE_FOO_BAR != ""',
+     ['BR2_PACKAGE_FOO_BAR', 'BR2_PACKAGE_FOO_BAR']),
+    ]
+
+
+@pytest.mark.parametrize('testname,line,expected', all_symbols_from)
+def test_all_symbols_from(testname, line, expected):
+    symbols = m.all_symbols_from(line)
+    assert symbols == expected
+
+
+handle_definition = [
+    ('config',
+     'package/foo/Config.in',
+     5,
+     'config BR2_PACKAGE_FOO',
+     False,
+     {'add_symbol_definition': [call('BR2_PACKAGE_FOO', 'package/foo/Config.in', 5)]}),
+    ('ignore comment',
+     'package/foo/Config.in',
+     5,
+     'config BR2_PACKAGE_FOO # BR2_PACKAGE_BAR',
+     False,
+     {'add_symbol_definition': [call('BR2_PACKAGE_FOO', 'package/foo/Config.in', 5)]}),
+    ('ignore whitespace',
+     'package/foo/Config.in',
+     5,
+     '\tconfig  BR2_PACKAGE_FOO\t # BR2_PACKAGE_BAR',
+     False,
+     {'add_symbol_definition': [call('BR2_PACKAGE_FOO', 'package/foo/Config.in', 5)]}),
+    ('menuconfig',
+     'package/gd/Config.in',
+     1,
+     'menuconfig BR2_PACKAGE_GD',
+     False,
+     {'add_symbol_definition': [call('BR2_PACKAGE_GD', 'package/gd/Config.in', 1)]}),
+    ('menu',
+     'package/Config.in',
+     100,
+     'menu "Database"',
+     False,
+     {}),
+    ('legacy config',
+     'Config.in.legacy',
+     50,
+     'config BR2_PACKAGE_FOO',
+     True,
+     {'add_symbol_legacy_definition': [call('BR2_PACKAGE_FOO', 'Config.in.legacy', 50)]}),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,lineno,line,legacy,expected_calls', handle_definition)
+def test_handle_definition(testname, filename, lineno, line, legacy, expected_calls):
+    db = Mock()
+    m.handle_definition(db, filename, lineno, line, legacy)
+    assert_db_calls(db, expected_calls)
+
+
+handle_usage = [
+    ('default with comparison',
+     'package/openblas/Config.in',
+     60,
+     '\tdefault y if BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET != ""',
+     False,
+     {'add_symbol_usage': [call('BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET', 'package/openblas/Config.in', 60)]}),
+    ('default with logical operators',
+     'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options',
+     47,
+     '\tdefault y if BR2_i386 && !BR2_x86_i486 && !BR2_x86_i586 && !BR2_x86_x1000 && !BR2_x86_pentium_mmx && !BR2_x86_geode '
+     '&& !BR2_x86_c3 && !BR2_x86_winchip_c6 && !BR2_x86_winchip2',
+     False,
+     {'add_symbol_usage': [
+         call('BR2_i386', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+         call('BR2_x86_c3', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+         call('BR2_x86_geode', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+         call('BR2_x86_i486', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+         call('BR2_x86_i586', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+         call('BR2_x86_pentium_mmx', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+         call('BR2_x86_winchip2', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+         call('BR2_x86_winchip_c6', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+         call('BR2_x86_x1000', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47)]}),
+    ('legacy depends on',
+     'Config.in.legacy',
+     3000,
+     '\tdepends on BR2_LINUX_KERNEL',
+     True,
+     {'add_symbol_usage_in_legacy': [call('BR2_LINUX_KERNEL', 'Config.in.legacy', 3000)]}),
+    ('legacy if',
+     'Config.in.legacy',
+     97,
+     'if !BR2_SKIP_LEGACY',
+     True,
+     {'add_symbol_usage_in_legacy': [call('BR2_SKIP_LEGACY', 'Config.in.legacy', 97)]}),
+    ('source',
+     'system/Config.in',
+     152,
+     'source "$BR2_BASE_DIR/.br2-external.in.init"',
+     False,
+     {'add_symbol_usage': [call('BR2_BASE_DIR', 'system/Config.in', 152)]}),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,lineno,line,legacy,expected_calls', handle_usage)
+def test_handle_usage(testname, filename, lineno, line, legacy, expected_calls):
+    db = Mock()
+    m.handle_usage(db, filename, lineno, line, legacy)
+    assert_db_calls(db, expected_calls)
+
+
+handle_default = [
+    ('default with comparison',
+     'package/openblas/Config.in',
+     60,
+     '\tdefault y if BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET != ""',
+     False,
+     {'add_symbol_usage': [call('BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET', 'package/openblas/Config.in', 60)]}),
+    ('default with logical operators',
+     'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options',
+     47,
+     '\tdefault y if BR2_i386 && !BR2_x86_i486 && !BR2_x86_i586 && !BR2_x86_x1000 && !BR2_x86_pentium_mmx && !BR2_x86_geode '
+     '&& !BR2_x86_c3 && !BR2_x86_winchip_c6 && !BR2_x86_winchip2',
+     False,
+     {'add_symbol_usage': [
+         call('BR2_i386', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+         call('BR2_x86_c3', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+         call('BR2_x86_geode', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+         call('BR2_x86_i486', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+         call('BR2_x86_i586', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+         call('BR2_x86_pentium_mmx', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+         call('BR2_x86_winchip2', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+         call('BR2_x86_winchip_c6', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47),
+         call('BR2_x86_x1000', 'toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options', 47)]}),
+    ('legacy default',
+     'Config.in.legacy',
+     3000,
+     'default y if BR2_PACKAGE_REFPOLICY_POLICY_VERSION != ""',
+     True,
+     {'add_symbol_usage_in_legacy': [call('BR2_PACKAGE_REFPOLICY_POLICY_VERSION', 'Config.in.legacy', 3000)]}),
+    ('legacy handling on package',
+     'package/uboot-tools/Config.in.host',
+     105,
+     '\tdefault BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE if BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE != "" # legacy',
+     False,
+     {'add_symbol_legacy_usage': [call('BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE', 'package/uboot-tools/Config.in.host', 105)]}),
+    ('default on package',
+     'package/uboot-tools/Config.in.host',
+     105,
+     '\tdefault BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE if BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE != ""',
+     False,
+     {'add_symbol_usage': [
+         call('BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE', 'package/uboot-tools/Config.in.host', 105),
+         call('BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE', 'package/uboot-tools/Config.in.host', 105)]}),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,lineno,line,legacy,expected_calls', handle_default)
+def test_handle_default(testname, filename, lineno, line, legacy, expected_calls):
+    db = Mock()
+    m.handle_default(db, filename, lineno, line, legacy)
+    assert_db_calls(db, expected_calls)
+
+
+handle_select = [
+    ('select with comparison',
+     'package/bcusdk/Config.in',
+     6,
+     '\tselect BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL',
+     False,
+     {'add_symbol_select': [call('BR2_PACKAGE_ARGP_STANDALONE', 'package/bcusdk/Config.in', 6)],
+      'add_symbol_usage': [
+          call('BR2_PACKAGE_ARGP_STANDALONE', 'package/bcusdk/Config.in', 6),
+          call('BR2_TOOLCHAIN_USES_UCLIBC', 'package/bcusdk/Config.in', 6),
+          call('BR2_TOOLCHAIN_USES_MUSL', 'package/bcusdk/Config.in', 6)]}),
+    ('legacy select',
+     'Config.in.legacy',
+     100,
+     '\tselect BR2_PACKAGE_WPA_SUPPLICANT_DBUS if BR2_TOOLCHAIN_HAS_THREADS',
+     True,
+     {'add_symbol_select': [call('BR2_PACKAGE_WPA_SUPPLICANT_DBUS', 'Config.in.legacy', 100)],
+      'add_symbol_usage_in_legacy': [
+          call('BR2_PACKAGE_WPA_SUPPLICANT_DBUS', 'Config.in.legacy', 100),
+          call('BR2_TOOLCHAIN_HAS_THREADS', 'Config.in.legacy', 100)]}),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,lineno,line,legacy,expected_calls', handle_select)
+def test_handle_select(testname, filename, lineno, line, legacy, expected_calls):
+    db = Mock()
+    m.handle_select(db, filename, lineno, line, legacy)
+    assert_db_calls(db, expected_calls)
+
+
+handle_line = [
+    ('select with comparison',
+     'package/bcusdk/Config.in',
+     6,
+     '\tselect BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL',
+     False,
+     {'add_symbol_select': [call('BR2_PACKAGE_ARGP_STANDALONE', 'package/bcusdk/Config.in', 6)],
+      'add_symbol_usage': [
+         call('BR2_PACKAGE_ARGP_STANDALONE', 'package/bcusdk/Config.in', 6),
+         call('BR2_TOOLCHAIN_USES_UCLIBC', 'package/bcusdk/Config.in', 6),
+         call('BR2_TOOLCHAIN_USES_MUSL', 'package/bcusdk/Config.in', 6)]}),
+    ('legacy select',
+     'Config.in.legacy',
+     100,
+     '\tselect BR2_PACKAGE_WPA_SUPPLICANT_DBUS if BR2_TOOLCHAIN_HAS_THREADS',
+     True,
+     {'add_symbol_select': [call('BR2_PACKAGE_WPA_SUPPLICANT_DBUS', 'Config.in.legacy', 100)],
+      'add_symbol_usage_in_legacy': [
+          call('BR2_PACKAGE_WPA_SUPPLICANT_DBUS', 'Config.in.legacy', 100),
+          call('BR2_TOOLCHAIN_HAS_THREADS', 'Config.in.legacy', 100)]}),
+    ('comment with symbol',
+     'Config.in',
+     6,
+     '\tselect # BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL',
+     False,
+     {}),
+    ('comment',
+     'Config.in',
+     6,
+     '# just a comment',
+     False,
+     {}),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,lineno,line,legacy,expected_calls', handle_line)
+def test_handle_line(testname, filename, lineno, line, legacy, expected_calls):
+    db = Mock()
+    m.handle_line(db, filename, lineno, line, legacy)
+    assert_db_calls(db, expected_calls)
+
+
+handle_config_helper = [
+    ('no select',
+     'package/foo/Config.in',
+     [[5, 'config BR2_PACKAGE_FOO']],
+     {}),
+    ('select',
+     'package/foo/Config.in',
+     [[5, 'config BR2_PACKAGE_FOO'],
+      [6, '\tselect BR2_PACKAGE_BAR']],
+     {'add_symbol_helper': [call('BR2_PACKAGE_FOO', 'package/foo/Config.in', 5)]}),
+    ('ignore comment',
+     'package/foo/Config.in',
+     [[5, 'config BR2_PACKAGE_FOO # BR2_PACKAGE_BAR'],
+      [6, '\tselect BR2_PACKAGE_BAR # BR2_PACKAGE_FOO']],
+     {'add_symbol_helper': [call('BR2_PACKAGE_FOO', 'package/foo/Config.in', 5)]}),
+    ('correct symbol',
+     'package/foo/Config.in',
+     [[5, 'config BR2_PACKAGE_FOO'],
+      [6, 'config BR2_PACKAGE_BAR'],
+      [7, '\tselect BR2_PACKAGE_BAZ']],
+     {'add_symbol_helper': [call('BR2_PACKAGE_BAR', 'package/foo/Config.in', 6)]}),
+    ('2 selects',
+     'package/foo/Config.in',
+     [[5, 'config BR2_PACKAGE_FOO'],
+      [6, '\tselect BR2_PACKAGE_BAR'],
+      [7, ' select BR2_PACKAGE_BAR']],
+     {'add_symbol_helper': [call('BR2_PACKAGE_FOO', 'package/foo/Config.in', 5)]}),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,file_content,expected_calls', handle_config_helper)
+def test_handle_config_helper(testname, filename, file_content, expected_calls):
+    db = Mock()
+    m.handle_config_helper(db, filename, file_content)
+    assert_db_calls(db, expected_calls)
+
+
+handle_config_choice = [
+    ('no choice',
+     'package/foo/Config.in',
+     [[5, 'config BR2_PACKAGE_FOO']],
+     {}),
+    ('after',
+     'package/foo/Config.in',
+     [[3, 'choice'],
+      [4, '\tprompt "your choice"'],
+      [5, 'config BR2_PACKAGE_FOO'],
+      [6, 'config BR2_PACKAGE_BAR'],
+      [10, 'endchoice'],
+      [19, 'config BR2_PACKAGE_BAZ']],
+     {'add_symbol_choice': [
+         call('BR2_PACKAGE_FOO', 'package/foo/Config.in', 5),
+         call('BR2_PACKAGE_BAR', 'package/foo/Config.in', 6)]}),
+    ('before',
+     'package/foo/Config.in',
+     [[1, 'config BR2_PACKAGE_BAZ'],
+      [3, 'choice'],
+      [4, '\tprompt "your choice"'],
+      [5, 'config BR2_PACKAGE_FOO'],
+      [6, 'config BR2_PACKAGE_BAR'],
+      [10, 'endchoice']],
+     {'add_symbol_choice': [
+         call('BR2_PACKAGE_FOO', 'package/foo/Config.in', 5),
+         call('BR2_PACKAGE_BAR', 'package/foo/Config.in', 6)]}),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,file_content,expected_calls', handle_config_choice)
+def test_handle_config_choice(testname, filename, file_content, expected_calls):
+    db = Mock()
+    m.handle_config_choice(db, filename, file_content)
+    assert_db_calls(db, expected_calls)
+
+
+handle_note = [
+    ('example',
+     'Config.in.legacy',
+     [[51, '#   # Note: BR2_FOO_1 is still referenced from package/foo/Config.in']],
+     {}),
+    ('ok',
+     'Config.in.legacy',
+     [[112, 'menu "Legacy config options"'],
+      [2132, '# Note: BR2_PACKAGE_FOO is still referenced from package/foo/Config.in'],
+      [4958, 'endmenu']],
+     {'add_symbol_legacy_note': [call('BR2_PACKAGE_FOO', 'Config.in.legacy', 2132)]}),
+    ('before and after',
+     'Config.in.legacy',
+     [[100, '# Note: BR2_PACKAGE_BAR is still referenced from package/foo/Config.in'],
+      [112, 'menu "Legacy config options"'],
+      [2132, '# Note: BR2_PACKAGE_FOO is still referenced from package/foo/Config.in'],
+      [4958, 'endmenu'],
+      [5000, '# Note: BR2_PACKAGE_BAR is still referenced from package/foo/Config.in']],
+     {'add_symbol_legacy_note': [call('BR2_PACKAGE_FOO', 'Config.in.legacy', 2132)]}),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,file_content,expected_calls', handle_note)
+def test_handle_note(testname, filename, file_content, expected_calls):
+    db = Mock()
+    m.handle_note(db, filename, file_content)
+    assert_db_calls(db, expected_calls)
+
+
+populate_db = [
+    ('legacy',
+     'Config.in.legacy',
+     [[112, 'menu "Legacy config options"'],
+      [2100, 'config BR2_PACKAGE_FOO'],
+      [2101, '\tselect BR2_PACKAGE_BAR'],
+      [2132, '# Note: BR2_PACKAGE_FOO is still referenced from package/foo/Config.in'],
+      [4958, 'endmenu']],
+     {'add_symbol_legacy_note': [call('BR2_PACKAGE_FOO', 'Config.in.legacy', 2132)],
+      'add_symbol_helper': [call('BR2_PACKAGE_FOO', 'Config.in.legacy', 2100)],
+      'add_symbol_legacy_definition': [call('BR2_PACKAGE_FOO', 'Config.in.legacy', 2100)],
+      'add_symbol_usage_in_legacy': [call('BR2_PACKAGE_BAR', 'Config.in.legacy', 2101)],
+      'add_symbol_select': [call('BR2_PACKAGE_BAR', 'Config.in.legacy', 2101)]}),
+    ('normal',
+     'package/foo/Config.in',
+     [[1, 'config BR2_PACKAGE_BAZ'],
+      [3, 'choice'],
+      [4, '\tprompt "your choice"'],
+      [5, 'config BR2_PACKAGE_FOO'],
+      [6, 'config BR2_PACKAGE_BAR'],
+      [7, '\t select BR2_PACKAGE_FOO_BAR'],
+      [10, 'endchoice']],
+     {'add_symbol_choice': [
+         call('BR2_PACKAGE_FOO', 'package/foo/Config.in', 5),
+         call('BR2_PACKAGE_BAR', 'package/foo/Config.in', 6)],
+      'add_symbol_usage': [
+         call('BR2_PACKAGE_FOO_BAR', 'package/foo/Config.in', 7)],
+      'add_symbol_select': [
+         call('BR2_PACKAGE_FOO_BAR', 'package/foo/Config.in', 7)],
+      'add_symbol_definition': [
+         call('BR2_PACKAGE_BAZ', 'package/foo/Config.in', 1),
+         call('BR2_PACKAGE_FOO', 'package/foo/Config.in', 5),
+         call('BR2_PACKAGE_BAR', 'package/foo/Config.in', 6)],
+      'add_symbol_helper': [
+         call('BR2_PACKAGE_BAR', 'package/foo/Config.in', 6)]}),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,file_content,expected_calls', populate_db)
+def test_populate_db(testname, filename, file_content, expected_calls):
+    db = Mock()
+    m.populate_db(db, filename, file_content)
+    assert_db_calls(db, expected_calls)
+
+
+check_filename = [
+    ('Config.in',
+     'Config.in',
+     True),
+    ('Config.in.legacy',
+     'Config.in.legacy',
+     True),
+    ('arch/Config.in.microblaze',
+     'arch/Config.in.microblaze',
+     True),
+    ('package/php/Config.ext',
+     'package/php/Config.ext',
+     True),
+    ('package/pru-software-support/Config.in.host',
+     'package/pru-software-support/Config.in.host',
+     True),
+    ('toolchain/toolchain-external/toolchain-external-custom/Config.in.options',
+     'toolchain/toolchain-external/toolchain-external-custom/Config.in.options',
+     True),
+    ('package/foo/0001-Config.patch',
+     'package/foo/0001-Config.patch',
+     False),
+    ('package/pkg-generic.mk',
+     'package/pkg-generic.mk',
+     False),
+    ('Makefile',
+     'Makefile',
+     False),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,expected', check_filename)
+def test_check_filename(testname, filename, expected):
+    symbols = m.check_filename(filename)
+    assert symbols == expected
diff --git a/utils/checksymbolslib/test_makefile.py b/utils/checksymbolslib/test_makefile.py
new file mode 100644
index 0000000000..14d07eaa45
--- /dev/null
+++ b/utils/checksymbolslib/test_makefile.py
@@ -0,0 +1,304 @@
+import pytest
+from unittest.mock import Mock
+from unittest.mock import call
+from checksymbolslib.test_util import assert_db_calls
+import checksymbolslib.makefile as m
+
+
+handle_eval = [
+    ('generic',
+     'package/foo/foo.mk',
+     5,
+     '$(eval $(generic-package))',
+     {'add_symbol_usage': [call('BR2_PACKAGE_FOO', 'package/foo/foo.mk', 5)]}),
+    ('ignore trailing whitespace',
+     'package/foo/foo.mk',
+     5,
+     '$(eval $(generic-package)) ',
+     {'add_symbol_usage': [call('BR2_PACKAGE_FOO', 'package/foo/foo.mk', 5)]}),
+    ('ignore indent',
+     'package/foo/foo.mk',
+     5,
+     '\t$(eval $(generic-package))',
+     {'add_symbol_usage': [call('BR2_PACKAGE_FOO', 'package/foo/foo.mk', 5)]}),
+    ('rootfs',
+     'fs/foo/foo.mk',
+     5,
+     '$(eval $(rootfs))',
+     {'add_symbol_usage': [
+         call('BR2_TARGET_ROOTFS_FOO', 'fs/foo/foo.mk', 5),
+         call('BR2_TARGET_ROOTFS_FOO_BZIP2', 'fs/foo/foo.mk', 5),
+         call('BR2_TARGET_ROOTFS_FOO_GZIP', 'fs/foo/foo.mk', 5),
+         call('BR2_TARGET_ROOTFS_FOO_LZ4', 'fs/foo/foo.mk', 5),
+         call('BR2_TARGET_ROOTFS_FOO_LZMA', 'fs/foo/foo.mk', 5),
+         call('BR2_TARGET_ROOTFS_FOO_LZO', 'fs/foo/foo.mk', 5),
+         call('BR2_TARGET_ROOTFS_FOO_XZ', 'fs/foo/foo.mk', 5),
+         call('BR2_TARGET_ROOTFS_FOO_ZSTD', 'fs/foo/foo.mk', 5)]}),
+    ('kernel module',
+     'package/foo/foo.mk',
+     6,
+     '$(eval $(kernel-module))',
+     {'add_symbol_usage': [call('BR2_PACKAGE_FOO', 'package/foo/foo.mk', 6)]}),
+    ('not an eval for package infra',
+     'docs/manual/manual.mk',
+     10,
+     '$(eval $(call asciidoc-document))',
+     {}),
+    ('linux',
+     'linux/linux.mk',
+     617,
+     '$(eval $(kconfig-package))',
+     {'add_symbol_usage': [call('BR2_LINUX_KERNEL', 'linux/linux.mk', 617)]}),
+    ('virtual toolchain',
+     'toolchain/toolchain-external/toolchain-external.mk',
+     18,
+     '$(eval $(virtual-package))',
+     {'add_symbol_usage': [
+         call('BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL', 'toolchain/toolchain-external/toolchain-external.mk', 18),
+         call('BR2_PACKAGE_HAS_TOOLCHAIN_EXTERNAL', 'toolchain/toolchain-external/toolchain-external.mk', 18),
+         call('BR2_TOOLCHAIN_EXTERNAL', 'toolchain/toolchain-external/toolchain-external.mk', 18)],
+      'add_symbol_virtual': [call('BR2_TOOLCHAIN_EXTERNAL', 'toolchain/toolchain-external/toolchain-external.mk', 18)]}),
+    ('virtual package',
+     'package/foo/foo.mk',
+     18,
+     '$(eval $(virtual-package))',
+     {'add_symbol_usage': [
+         call('BR2_PACKAGE_PROVIDES_FOO', 'package/foo/foo.mk', 18),
+         call('BR2_PACKAGE_HAS_FOO', 'package/foo/foo.mk', 18),
+         call('BR2_PACKAGE_FOO', 'package/foo/foo.mk', 18)],
+      'add_symbol_virtual': [call('BR2_PACKAGE_FOO', 'package/foo/foo.mk', 18)]}),
+    ('host virtual package',
+     'package/foo/foo.mk',
+     18,
+     '$(eval $(host-virtual-package))',
+     {'add_symbol_usage': [
+         call('BR2_PACKAGE_PROVIDES_HOST_FOO', 'package/foo/foo.mk', 18),
+         call('BR2_PACKAGE_HAS_HOST_FOO', 'package/foo/foo.mk', 18),
+         call('BR2_PACKAGE_HOST_FOO', 'package/foo/foo.mk', 18)]}),
+    ('host generic package',
+     'package/foo/foo.mk',
+     18,
+     '$(eval $(host-package))',
+     {'add_symbol_usage': [call('BR2_PACKAGE_HOST_FOO', 'package/foo/foo.mk', 18)]}),
+    ('boot package',
+     'boot/foo/foo.mk',
+     18,
+     '$(eval $(generic-package))',
+     {'add_symbol_usage': [call('BR2_TARGET_FOO', 'boot/foo/foo.mk', 18)]}),
+    ('toolchain package',
+     'toolchain/foo/foo.mk',
+     18,
+     '$(eval $(generic-package))',
+     {'add_symbol_usage': [call('BR2_FOO', 'toolchain/foo/foo.mk', 18)]}),
+    ('generic package',
+     'package/foo/foo.mk',
+     18,
+     '$(eval $(generic-package))',
+     {'add_symbol_usage': [call('BR2_PACKAGE_FOO', 'package/foo/foo.mk', 18)]}),
+    ('cmake package',
+     'package/foo/foo.mk',
+     18,
+     '$(eval $(cmake-package))',
+     {'add_symbol_usage': [call('BR2_PACKAGE_FOO', 'package/foo/foo.mk', 18)]}),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,lineno,line,expected_calls', handle_eval)
+def test_handle_eval(testname, filename, lineno, line, expected_calls):
+    db = Mock()
+    m.handle_eval(db, filename, lineno, line)
+    assert_db_calls(db, expected_calls)
+
+
+handle_definition = [
+    ('legacy attribution',
+     'Makefile.legacy',
+     9,
+     'BR2_LEGACY_FOO := foo',
+     True,
+     {'add_symbol_legacy_definition': [call('BR2_LEGACY_FOO', 'Makefile.legacy', 9)]}),
+    ('attribution 1',
+     'Makefile',
+     9,
+     'BR2_FOO ?= foo',
+     False,
+     {'add_symbol_definition': [call('BR2_FOO', 'Makefile', 9)]}),
+    ('attribution 2',
+     'Makefile',
+     9,
+     'BR2_FOO = $(BR2_BAR)',
+     False,
+     {'add_symbol_definition': [call('BR2_FOO', 'Makefile', 9)]}),
+    ('attribution 3',
+     'Makefile',
+     9,
+     'BR2_FOO := foo',
+     False,
+     {'add_symbol_definition': [call('BR2_FOO', 'Makefile', 9)]}),
+    ('normal export',
+     'Makefile',
+     90,
+     'export BR2_FOO',
+     False,
+     {'add_symbol_definition': [call('BR2_FOO', 'Makefile', 90)]}),
+    ('legacy export',
+     'Makefile.legacy',
+     90,
+     'export BR2_FOO',
+     True,
+     {'add_symbol_legacy_definition': [call('BR2_FOO', 'Makefile.legacy', 90)]}),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,lineno,line,legacy,expected_calls', handle_definition)
+def test_handle_definition(testname, filename, lineno, line, legacy, expected_calls):
+    db = Mock()
+    m.handle_definition(db, filename, lineno, line, legacy)
+    assert_db_calls(db, expected_calls)
+
+
+handle_usage = [
+    ('legacy',
+     'Makefile.legacy',
+     8,
+     'ifeq ($(BR2_LEGACY),y)',
+     True,
+     {'add_symbol_usage_in_legacy': [call('BR2_LEGACY', 'Makefile.legacy', 8)]}),
+    ('attribution',
+     'Makefile',
+     9,
+     'BR2_FOO = $(BR2_BAR)',
+     False,
+     {'add_symbol_usage': [call('BR2_BAR', 'Makefile', 9)]}),
+    ('host virtual package',
+     'package/foo/foo.mk',
+     18,
+     '$(eval $(host-virtual-package))',
+     False,
+     {'add_symbol_usage': [
+         call('BR2_PACKAGE_PROVIDES_HOST_FOO', 'package/foo/foo.mk', 18),
+         call('BR2_PACKAGE_HAS_HOST_FOO', 'package/foo/foo.mk', 18),
+         call('BR2_PACKAGE_HOST_FOO', 'package/foo/foo.mk', 18)]}),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,lineno,line,legacy,expected_calls', handle_usage)
+def test_handle_usage(testname, filename, lineno, line, legacy, expected_calls):
+    db = Mock()
+    m.handle_usage(db, filename, lineno, line, legacy)
+    assert_db_calls(db, expected_calls)
+
+
+populate_db = [
+    ('legacy',
+     'Makefile.legacy',
+     [[8, 'ifeq ($(BR2_LEGACY),y)'],
+      [9, 'BR2_LEGACY_FOO := foo'],
+      [34, 'ifneq ($(BUILDROOT_CONFIG),$(BR2_CONFIG))']],
+     {'add_symbol_usage_in_legacy': [
+         call('BR2_LEGACY', 'Makefile.legacy', 8),
+         call('BR2_CONFIG', 'Makefile.legacy', 34)],
+      'add_symbol_legacy_definition': [call('BR2_LEGACY_FOO', 'Makefile.legacy', 9)]}),
+    ('attribution',
+     'Makefile',
+     [[9, 'BR2_FOO = $(BR2_BAR)']],
+     {'add_symbol_definition': [call('BR2_FOO', 'Makefile', 9)],
+      'add_symbol_usage': [call('BR2_BAR', 'Makefile', 9)]}),
+    ('legacy attribution',
+     'Makefile.legacy',
+     [[9, 'BR2_FOO = $(BR2_BAR)']],
+     {'add_symbol_legacy_definition': [call('BR2_FOO', 'Makefile.legacy', 9)],
+      'add_symbol_usage_in_legacy': [call('BR2_BAR', 'Makefile.legacy', 9)]}),
+    ('generic',
+     'package/foo/foo.mk',
+     [[3, 'ifeq ($(BR2_PACKAGE_FOO_BAR):$(BR2_BAR),y:)'],
+      [4, 'export BR2_PACKAGE_FOO_BAZ'],
+      [5, '$(eval $(generic-package))']],
+     {'add_symbol_usage': [
+         call('BR2_PACKAGE_FOO_BAR', 'package/foo/foo.mk', 3),
+         call('BR2_BAR', 'package/foo/foo.mk', 3),
+         call('BR2_PACKAGE_FOO', 'package/foo/foo.mk', 5)],
+      'add_symbol_definition': [call('BR2_PACKAGE_FOO_BAZ', 'package/foo/foo.mk', 4)]}),
+    ('rootfs',
+     'fs/foo/foo.mk',
+     [[4, 'ifeq ($(BR2_TARGET_ROOTFS_FOO_LZ4),y)'],
+      [5, '$(eval $(rootfs))']],
+     {'add_symbol_usage': [
+         call('BR2_TARGET_ROOTFS_FOO', 'fs/foo/foo.mk', 5),
+         call('BR2_TARGET_ROOTFS_FOO_BZIP2', 'fs/foo/foo.mk', 5),
+         call('BR2_TARGET_ROOTFS_FOO_GZIP', 'fs/foo/foo.mk', 5),
+         call('BR2_TARGET_ROOTFS_FOO_LZ4', 'fs/foo/foo.mk', 4),
+         call('BR2_TARGET_ROOTFS_FOO_LZ4', 'fs/foo/foo.mk', 5),
+         call('BR2_TARGET_ROOTFS_FOO_LZMA', 'fs/foo/foo.mk', 5),
+         call('BR2_TARGET_ROOTFS_FOO_LZO', 'fs/foo/foo.mk', 5),
+         call('BR2_TARGET_ROOTFS_FOO_XZ', 'fs/foo/foo.mk', 5),
+         call('BR2_TARGET_ROOTFS_FOO_ZSTD', 'fs/foo/foo.mk', 5)]}),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,file_content,expected_calls', populate_db)
+def test_populate_db(testname, filename, file_content, expected_calls):
+    db = Mock()
+    m.populate_db(db, filename, file_content)
+    assert_db_calls(db, expected_calls)
+
+
+check_filename = [
+    ('arch/arch.mk.riscv',
+     'arch/arch.mk.riscv',
+     True),
+    ('boot/lpc32xxcdl/lpc32xxcdl.mk',
+     'boot/lpc32xxcdl/lpc32xxcdl.mk',
+     True),
+    ('fs/cramfs/cramfs.mk',
+     'fs/cramfs/cramfs.mk',
+     True),
+    ('linux/linux-ext-fbtft.mk',
+     'linux/linux-ext-fbtft.mk',
+     True),
+    ('package/ace/ace.mk',
+     'package/ace/ace.mk',
+     True),
+    ('package/linux-tools/linux-tool-hv.mk.in',
+     'package/linux-tools/linux-tool-hv.mk.in',
+     True),
+    ('package/pkg-generic.mk',
+     'package/pkg-generic.mk',
+     True),
+    ('package/x11r7/xlib_libXt/xlib_libXt.mk',
+     'package/x11r7/xlib_libXt/xlib_libXt.mk',
+     True),
+    ('support/dependencies/check-host-make.mk',
+     'support/dependencies/check-host-make.mk',
+     True),
+    ('toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk',
+     'toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk',
+     True),
+    ('Makefile.legacy',
+     'Makefile.legacy',
+     True),
+    ('boot/common.mk',
+     'boot/common.mk',
+     True),
+    ('fs/common.mk',
+     'fs/common.mk',
+     True),
+    ('Makefile',
+     'Makefile',
+     True),
+    ('package/Makefile.in',
+     'package/Makefile.in',
+     True),
+    ('Config.in',
+     'Config.in',
+     False),
+    ('package/foo/0001-Makefile.patch',
+     'package/foo/0001-Makefile.patch',
+     False),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,expected', check_filename)
+def test_check_filename(testname, filename, expected):
+    symbols = m.check_filename(filename)
+    assert symbols == expected
diff --git a/utils/checksymbolslib/test_util.py b/utils/checksymbolslib/test_util.py
new file mode 100644
index 0000000000..166785ba1d
--- /dev/null
+++ b/utils/checksymbolslib/test_util.py
@@ -0,0 +1,15 @@
+def assert_calls(method, expected_calls):
+    method.assert_has_calls(expected_calls, any_order=True)
+    assert method.call_count == len(expected_calls)
+
+
+def assert_db_calls(db, expected_calls):
+    assert_calls(db.add_symbol_legacy_definition, expected_calls.get('add_symbol_legacy_definition', []))
+    assert_calls(db.add_symbol_definition, expected_calls.get('add_symbol_definition', []))
+    assert_calls(db.add_symbol_usage_in_legacy, expected_calls.get('add_symbol_usage_in_legacy', []))
+    assert_calls(db.add_symbol_usage, expected_calls.get('add_symbol_usage', []))
+    assert_calls(db.add_symbol_legacy_usage, expected_calls.get('add_symbol_legacy_usage', []))
+    assert_calls(db.add_symbol_select, expected_calls.get('add_symbol_select', []))
+    assert_calls(db.add_symbol_helper, expected_calls.get('add_symbol_helper', []))
+    assert_calls(db.add_symbol_legacy_note, expected_calls.get('add_symbol_legacy_note', []))
+    assert_calls(db.add_symbol_virtual, expected_calls.get('add_symbol_virtual', []))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
