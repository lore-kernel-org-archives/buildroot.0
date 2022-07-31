Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24703C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 19:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8DAB6106C;
	Sun, 31 Jul 2022 19:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8DAB6106C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6uCujaB6S1IY; Sun, 31 Jul 2022 19:36:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 743E061069;
	Sun, 31 Jul 2022 19:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 743E061069
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C5A211BF2EB
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A006460773
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A006460773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CAHLCHkcMenh for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 19:35:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 409DB605EC
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 409DB605EC
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 19:35:48 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id 125so9287525vsd.5
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 12:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=iAcMompqKKKIa6BS30MKgVEqJgedLvD61nDH0qyXSMA=;
 b=NsiIDpqVMhIGhSuTZz6U5mdGHHF0qtOGDHS814gQQPqRcOXa6n3FW6ZKcFaMfHU2g+
 RCzVS6YFc+y3yt88T5HoDwK70DbtjosC6lvM5bEr/Y1ElBBxp63/TP1kXAveSY86SmiH
 ULlDqb+vcEgamYd3/vbvTpxooT0/cbv0GO6+GThO5ym40xK5WPpU6om5hzajsDQYOoRo
 bAogi27mF9HixTM/09rvjQEKFmTlGcT/adkpxpdl8xhmjMmDbDbCzWVAM4d7O0zVgllF
 svfmq7q5XlJY4KM6TouunuThfFjow+0cWEcJ/gu6nwrbMNBuHTFF+jZVSDArvGlRjLoJ
 Vh5A==
X-Gm-Message-State: AJIora8BCYrFLWAR/QPA7c0YxsKj6hxcnMT3mDcEJvIzQSGUiqL/4GjS
 FqGB+qGnpsR5Kdce8unpqtqYTXxCObM=
X-Google-Smtp-Source: AGRyM1vVaSe5YMJtgBfday/xpWxhwJpEoJTJEr0FPi5n1kWkNXCP35FMina0eVX3GMmsp4UX9vlFDA==
X-Received: by 2002:a67:c087:0:b0:357:e56c:81a0 with SMTP id
 x7-20020a67c087000000b00357e56c81a0mr4410805vsi.14.1659296147002; 
 Sun, 31 Jul 2022 12:35:47 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a056102074500b0037ddf9489f2sm1418667vsg.13.2022.07.31.12.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 12:35:45 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 16:35:08 -0300
Message-Id: <20220731193521.1217825-2-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=iAcMompqKKKIa6BS30MKgVEqJgedLvD61nDH0qyXSMA=;
 b=kXOAjXPbSUdAHNDqBnMW6oOLSTwR2qMDn8uDyzYRuxuxc/WRjcbsaP6fuUstVUQqro
 b96/xl1KArxcHiyQGTG0ebUlUV4uWvfVyWqQPr3j7x2lH65y2apLgqgYJfpIIsAx+kxc
 TNjUVpzUYCrZ+BTmz/rFlN7ON2kU7zvdk39VoZdvAzyJBO2u0x2SJ+kRKKsKNCOzSb+P
 PSFqYXi2KqsgC25HQl57rIZzZrz6jJe2IN8Wb7W+BCoa9B3ZFKXSJ68mvJ18vBZRZrOd
 oDmdTBIs0iD7tcaLfca1X9FQwyzJGrjAjSTe0H3TNc7t5NIgsTzJwje999rLuSOfidyZ
 zdzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kXOAjXPb
Subject: [Buildroot] [PATCH v2 01/14] utils/check-package: decouple adding
 rules from fixing all intree files
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When a new check_function is added to check-package, often there are
files in the tree that would generate warnings.

An example is the Sob check_function for patch files:
| $ ./utils/check-package --i Sob $(git ls-files) >/dev/null
| 369301 lines processed
| 46 warnings generated
Currently these warnings are listed when calling check-package directly,
and also at the output of pkg-stats, but the check_function does not run
on 'make check-package' (that is used to catch regressions on GitLab CI
'check-package' job) until all warnings in the tree are fixed.
This (theoretically) allows new .patch files be added without SoB,
without the GitLab CI catching it.

So add a way to check-package itself ignore current warnings, while
still catching new files that do not follow that new check_function.

Add a file named .checkpackageignore to the buildroot topdir.
It contains the list of check_functions that are expected to fail for
each given intree file tested by check-package.
Each entries is in the format:
<filename> <check_function> [<check_function> ...]

These are 2 examples of possible entries:
package/initscripts/init.d/rcK ConsecutiveEmptyLines EmptyLastLine Shellcheck
utils/test-pkg Shellcheck

Keeping such a list allows us to have fine-grained control over which
warning to ignore.

In order to avoid this list to grow indefinitely, containing entries for
files that are already fixed, make each entry an 'expected to fail'
instead of just an 'ignore', and generate a warning if a check_function
that was expect to fail for a given files does not generate that
warning.
Unfortunately one case that do not generate warning is an entry for a
file that is deleted in a later commit.

Add also a new option --ignore-list that can be used:
- by pkg-stats
- by developers willing to reduce the intree ignore list
- by developers of br2-external trees that want its own ignore list
- for debug and tests purposes

When using for a br2-external each entry in the ignore file is relative
to the directory that contains the ignore file. Since calling
check-package -b already uses relative paths to the directory it was
called from, when a developer wants a ignore file for a br2-external
he/she must call check-package from the directory that contains it.
For instance, with these files:
 /path/to/br2-external/.checkpackageignore
 /path/to/br2-external/package/mypackage/mypackage.mk
The file .checkpackageignore must contain entries in the format:
 package/mypackage/mypackage.mk EmptyLastLine
and the developer must call check-package this way:
 $ cd /path/to/br2-external/ && \
   /otherpath/to/check-package \
    --ignore-list=.checkpackageignore \
     -b package/mypackage/mypackage.mk

This is one more step towards standardizing the use of just
'make check-package' before submitting patches to the list.

Cc: Sen Hastings <sen@phobosdpl.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - rename the patch

Is is intentional to NOT add .checkpackageignore to my DEVELOPER entry,
I don't want to be notified for every check-package warning that once
was ignored and then becomes fixed.
---
 .checkpackageignore       |  0
 support/scripts/pkg-stats |  2 +-
 utils/check-package       | 87 ++++++++++++++++++++++++++++++++-------
 3 files changed, 72 insertions(+), 17 deletions(-)
 create mode 100644 .checkpackageignore

diff --git a/.checkpackageignore b/.checkpackageignore
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index d795131cef..8886fb30bc 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -267,7 +267,7 @@ class Package:
         """
         Fills in the .warnings and .status['pkg-check'] fields
         """
-        cmd = [os.path.join(brpath, "utils/check-package")]
+        cmd = [os.path.join(brpath, "utils/check-package"), "--ignore-list="]
         pkgdir = os.path.dirname(os.path.join(brpath, self.path))
         self.status['pkg-check'] = ("error", "Missing")
         for root, dirs, files in os.walk(pkgdir):
diff --git a/utils/check-package b/utils/check-package
index f64daed84c..00be29d02a 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -15,10 +15,37 @@ import checkpackagelib.lib_mk
 import checkpackagelib.lib_patch
 import checkpackagelib.lib_sysv
 
+IGNORE_FILENAME = ".checkpackageignore"
 VERBOSE_LEVEL_TO_SHOW_IGNORED_FILES = 3
 flags = None  # Command line arguments.
 
 
+def get_ignored_parsers_per_file(intree_only, ignore_filename):
+    ignored = dict()
+    entry_base_dir = ''
+
+    if ignore_filename == '':
+        return ignored  # the user explicitly asked to not use any ignore list
+
+    if ignore_filename:
+        filename = os.path.abspath(ignore_filename)
+        if not intree_only:
+            # for br2-external the entries are relative to the path were the ignore list is
+            entry_base_dir = os.path.join(os.path.dirname(filename))
+    else:
+        if not intree_only:
+            return ignored  # do not use the intree ignore list when testing files in a br2-external
+        base_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
+        filename = os.path.join(base_dir, IGNORE_FILENAME)
+
+    with open(filename, "r") as f:
+        for line in f.readlines():
+            filename, warnings_str = line.split(' ', 1)
+            warnings = warnings_str.split()
+            ignored[os.path.join(entry_base_dir, filename)] = warnings
+    return ignored
+
+
 def parse_args():
     parser = argparse.ArgumentParser()
 
@@ -29,6 +56,8 @@ def parse_args():
 
     parser.add_argument("--br2-external", "-b", dest='intree_only', action="store_false",
                         help="do not apply the pathname filters used for intree files")
+    parser.add_argument("--ignore-list", dest='ignore_filename', action="store",
+                        help='override the default list of ignored warnings')
 
     parser.add_argument("--manual-url", action="store",
                         default="http://nightly.buildroot.org/",
@@ -44,7 +73,11 @@ def parse_args():
     parser.add_argument("--dry-run", action="store_true", help="print the "
                         "functions that would be called for each file (debug)")
 
-    return parser.parse_args()
+    flags = parser.parse_args()
+
+    flags.ignore_list = get_ignored_parsers_per_file(flags.intree_only, flags.ignore_filename)
+
+    return flags
 
 
 CONFIG_IN_FILENAME = re.compile(r"Config\.\S*$")
@@ -120,21 +153,25 @@ def is_external_tool(m):
     return common_inspect_rules(m)
 
 
-def print_warnings(warnings):
+def print_warnings(warnings, xfail):
     # Avoid the need to use 'return []' at the end of every check function.
     if warnings is None:
-        return 0  # No warning generated.
+        return 0, 0  # No warning generated.
 
+    if xfail:
+        return 0, 1  # Warning not generated, fail expected for this file.
     for level, message in enumerate(warnings):
         if flags.verbose >= level:
             print(message.replace("\t", "< tab  >").rstrip())
-    return 1  # One more warning to count.
+    return 1, 1  # One more warning to count.
 
 
 def check_file_using_lib(fname):
     # Count number of warnings generated and lines processed.
     nwarnings = 0
     nlines = 0
+    xfail = flags.ignore_list.get(fname, [])
+    failed = set()
 
     lib = get_lib_from_filename(fname)
     if not lib:
@@ -150,10 +187,13 @@ def check_file_using_lib(fname):
         print("{}: would run: {}".format(fname, functions_to_run))
         return nwarnings, nlines
 
-    objects = [c[1](fname, flags.manual_url) for c in internal_functions]
+    objects = [[c[0], c[1](fname, flags.manual_url)] for c in internal_functions]
 
-    for cf in objects:
-        nwarnings += print_warnings(cf.before())
+    for name, cf in objects:
+        warn, fail = print_warnings(cf.before(), name in xfail)
+        if fail > 0:
+            failed.add(name)
+        nwarnings += warn
     if six.PY3:
         f = open(fname, "r", errors="surrogateescape")
     else:
@@ -161,19 +201,34 @@ def check_file_using_lib(fname):
     lastline = ""
     for lineno, text in enumerate(f.readlines()):
         nlines += 1
-        for cf in objects:
+        for name, cf in objects:
             if cf.disable.search(lastline):
                 continue
-            nwarnings += print_warnings(cf.check_line(lineno + 1, text))
+            warn, fail = print_warnings(cf.check_line(lineno + 1, text), name in xfail)
+            if fail > 0:
+                failed.add(name)
+            nwarnings += warn
         lastline = text
     f.close()
-    for cf in objects:
-        nwarnings += print_warnings(cf.after())
-
-    tools = [c[1](fname) for c in external_tools]
-
-    for tool in tools:
-        nwarnings += print_warnings(tool.run())
+    for name, cf in objects:
+        warn, fail = print_warnings(cf.after(), name in xfail)
+        if fail > 0:
+            failed.add(name)
+        nwarnings += warn
+
+    tools = [[c[0], c[1](fname)] for c in external_tools]
+
+    for name, tool in tools:
+        warn, fail = print_warnings(tool.run(), name in xfail)
+        if fail > 0:
+            failed.add(name)
+        nwarnings += warn
+
+    for should_fail in xfail:
+        if should_fail not in failed:
+            print("{}:0: {} was expected to fail, did you fixed the file and forgot to update {}?"
+                  .format(fname, should_fail, IGNORE_FILENAME))
+            nwarnings += 1
 
     return nwarnings, nlines
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
