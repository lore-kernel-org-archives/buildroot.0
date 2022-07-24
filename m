Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C444C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 05:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 323DB408E3;
	Sun, 24 Jul 2022 05:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 323DB408E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K6TyzWSnP4hG; Sun, 24 Jul 2022 05:51:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4A9F400F1;
	Sun, 24 Jul 2022 05:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4A9F400F1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA77F1BF59B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C368F83A47
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C368F83A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0cKG_D5N8CGh for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 05:50:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5BF383385
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5BF383385
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:50:28 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 g19-20020a9d1293000000b0061c7bfda5dfso6381441otg.1
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=yDZ9oSFb0tReGoediciBLPC8qRwp0yz6c01s/7Ipxv4=;
 b=gQCdRFLA2Dyrnl0SSs7G2Ol8b+4cxmP9/2UtyVkPawHhovJUXF80XIWNMhL2Dwg3P6
 3l5Kd00F+S0360vlksnYDm5WORiNyizwuCfsOM13nde9C7kU2w9E9Ve2Da3ngKS1opE+
 ttLAvhL6MQAX915BElxQjaPXTh/IeS3J8kWo571i7KarUx6qWLN44IjO821P88PhDeG7
 gT6kTQJwPweVp9dNjYLnPXm+e1a7A+n3to5UGd5/Il+d7gCqa20pR8fWNG8ElY2HhS+A
 CFYjs4nZgpi1d/EvDM+jiPBeiCZzG1vfJ5+AmJcNB0jyOOrDzSvPh5e6h8WoXdF7aBnP
 VgDQ==
X-Gm-Message-State: AJIora/McnL2zHDfd7W1ZyPShj6asgK5oAcAp1D+LPlKruKORqSxwwb4
 qHvdIPF5stOz8BFG9Aqf4Vo20xyufjA=
X-Google-Smtp-Source: AGRyM1u4c5bFZPu7bvEbW+PCmMHD5H0c9uVxvzSnWyHsZyEpqdabvWA1ZoLUKrXaTv8ebE8eQHrg8g==
X-Received: by 2002:a05:6830:913:b0:61c:b443:cb0b with SMTP id
 v19-20020a056830091300b0061cb443cb0bmr2844534ott.166.1658641827607; 
 Sat, 23 Jul 2022 22:50:27 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a056870818d00b000f5d8d031b6sm4236969oae.49.2022.07.23.22.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 22:50:26 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 02:48:59 -0300
Message-Id: <20220724054912.2354219-4-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=yDZ9oSFb0tReGoediciBLPC8qRwp0yz6c01s/7Ipxv4=;
 b=Cy+iiLrHumJKxtsTLxfjch9w8laLrGdudGK3psdYTk8oXq4GcZ1avNXEG5NzWHmuK/
 BoVeS6qi/zIRlzt9DTvmQaC5a36ziL4GcafJylsuYmJ7N1L4qW7GsDAr1s8RyjFs97e6
 0gLVK5iKlnTll6KinCWyilB/Tcq4qeYteTyPDoPrM3S8bw7UkU5pFd7iI0J1PYvnRvvF
 CPsqXcGEWczFDhrb47a4pRmfCps57kjTGNN6cX5IUJYo+CbO6f0al4RXLIigY/tBfnNt
 QyGcas3fHh18hbU6xWnn1CHik8+m4MNePgmPeMJVw0iUVpwEEUJYSPB1BSPUUZqAOOSm
 99eQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Cy+iiLrH
Subject: [Buildroot] [PATCH 03/16] utils/check-package: create an ignore list
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
index a4bb5ae599..fabdb939aa 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -251,7 +251,7 @@ class Package:
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
