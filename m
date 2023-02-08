Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2E8C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 17:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3715682024;
	Wed,  8 Feb 2023 17:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3715682024
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h2O5nK6ri6Cx; Wed,  8 Feb 2023 17:31:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9536C82025;
	Wed,  8 Feb 2023 17:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9536C82025
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 535C41BF275
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 17:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C6F561161
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 17:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C6F561161
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tbHW-r8O_lhJ for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 17:31:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5E0061160
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5E0061160
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 17:31:36 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id l128so7245482iof.2
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 09:31:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F+VT+rl5aib8c8iN86WcsSfeTiPIXVsKR+GN6CtQjLE=;
 b=iX5qnGR1TffGU9ocI46fJ7IAvYaMAaFKC8KDyI+VgKWhQOO3gOc5uu+eylOMGdgH86
 3Xoi/WC7YdggrAkDvPiV2p9uvqj1tq+wJadUh0d6W17J073F0na/uEHylfrTUkKKekZB
 6kOvP+P/4Pp3ceFSbPBpkmYjok8dEhmN/1Xsu0R95poYBqGnn1ilcnzBUufHG0nyihFu
 dft0BQcPyMkALsMVzJekt0+bDW+/8NPhAefmRlt6/EIQwDMzYLDk+eJv9IQ109GcTg3V
 oowDSeWeVa0LNk+N+qYjcuZeHZFUH0famkL++zLcL2L7grmnt19G2kBBCQURpGuKd8xS
 cm+w==
X-Gm-Message-State: AO0yUKX71/tEcdnLrqP52HW16u9bdHMkesPeBGDRXyJoutf3k2I9Gke9
 KgdcSWsiS4sghbDVmYkPiYhP4FMC4UY=
X-Google-Smtp-Source: AK7set9MRHqIyY7NN9t9CbpOkiV4iXqcKMPuMG5rs6yVVGeLfR4xV9i5Y+T6Td1Og3GpWOsxcSyH/Q==
X-Received: by 2002:a05:6602:1da:b0:716:a260:75d8 with SMTP id
 w26-20020a05660201da00b00716a26075d8mr6128350iot.2.1675877495424; 
 Wed, 08 Feb 2023 09:31:35 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 11-20020a5ea50b000000b0071664d0a4d7sm4889208iog.49.2023.02.08.09.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 09:31:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 10:30:58 -0700
Message-Id: <20230208173058.2118889-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F+VT+rl5aib8c8iN86WcsSfeTiPIXVsKR+GN6CtQjLE=;
 b=UEFu73D/bL8aQCYNVULbu+fFdUuoemBgvaYeOqg/WWSc+eJ06jcv7nSBFnitKCSRr4
 +rtJbuuy/8fkf2Rwny1tN+z9M8JCCfposz6DM/b2QufeL7tKJ4P/bOMzWQMbSctEw2FV
 XUP58FH/onRuIi4XROIu3qOls33ibH19/TJZCLiFe6xvkScpKkihg5DA5o2wx3fNdQSI
 QbXLNFL0yV+PshxrJyBvDurq9ck5/q+rlxudTwMad+3KkfRZtxdHJJEzxTrq+X03xsBV
 cqrK3onecUTwIGzztJ9TqqHL38BDsSSUCfdGOlyReKBwg8a42fNrnhKJq31HldNjlO3E
 AsRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UEFu73D/
Subject: [Buildroot] [buildroot-test 1/1] scripts/autobuild-run: migrate to
 asyncio subprocess calls
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since python2 is no longer supported we can migrate to asyncio
for subprocess handling.

This allows us to replace most multiprocessing and threading with
asyncio tasks.

Also cleanup some unused functions/python2 compatibility shims.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 scripts/autobuild-run | 379 +++++++++++++++++++++---------------------
 1 file changed, 191 insertions(+), 188 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 4987c61..4bed6fc 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -52,8 +52,6 @@
 #   message 'directory not empty' which suggests that someone is writing to the
 #   directory at the time of removal.
 
-from __future__ import print_function
-
 epilog = """
 Format of the configuration file:
 
@@ -71,55 +69,33 @@ Format of the configuration file:
    no-toolchains-csv
 """
 
+import asyncio
 import contextlib
 import csv
 import argparse
-import errno
 import hashlib
+from importlib.machinery import SourceFileLoader
+from importlib.util import module_from_spec, spec_from_loader
+import inspect
 import mmap
-import multiprocessing
 import os
 import pathlib
 from random import randint
 import re
 import shutil
 import signal
-import subprocess
 import stat
 import sys
-from time import localtime, strftime, sleep
-from distutils.version import StrictVersion
-import platform
-from threading import Thread, Event
+from time import localtime, strftime
 import datetime
-
-if sys.hexversion >= 0x3000000:
-    import configparser
-    import urllib.request as _urllib
-    import urllib.parse as urlparse
-    from urllib.error import URLError
-else:
-    import ConfigParser as configparser
-    import urllib2 as _urllib
-    import urlparse
-    from urllib2 import URLError
+import configparser
+import urllib.request as _urllib
+import urllib.parse as urlparse
+from urllib.error import URLError
 
 urlopen = _urllib.urlopen
 urlopen_closing = lambda uri: contextlib.closing(urlopen(uri))
 
-if sys.hexversion >= 0x3000000:
-    def decode_bytes(b):
-        return b.decode()
-
-    def encode_str(s):
-        return s.encode()
-else:
-    def _identity(e):
-        return e
-
-    decode_bytes = _identity
-    encode_str = _identity
-
 # A number of packages can take > 60mins of build time (e.g
 # gst-ffmpeg, qt5webkit, mimic)
 HUNG_BUILD_TIMEOUT = 120 # mins
@@ -161,7 +137,7 @@ class SystemInfo:
         # --
         return None
 
-    def has(self, prog):
+    async def has(self, prog):
 
         """Checks whether a program is available.
         Lazily evaluates missing entries.
@@ -176,15 +152,19 @@ class SystemInfo:
         have_it = self.find_prog(prog)
         # java[c] needs special care
         if have_it and prog in ('java', 'javac'):
-            with open(os.devnull, "w") as devnull:
-                if subprocess.call("%s -version | grep gcj" % prog, shell=True,
-                                   stdout=devnull, stderr=devnull) != 1:
-                    have_it = False
+            proc = await asyncio.create_subprocess_shell(
+                "%s -version | grep gcj" % prog,
+                stdout=asyncio.subprocess.DEVNULL,
+                stderr=asyncio.subprocess.DEVNULL
+            )
+            ret = await proc.wait()
+            if ret != 1:
+                have_it = False
         # --
         self.progs[prog] = have_it
         return have_it
 
-    def check_requirements(self):
+    async def check_requirements(self):
         """Checks program dependencies.
 
         Returns: True if all mandatory programs are present, else False.
@@ -193,14 +173,14 @@ class SystemInfo:
 
         missing_requirements = False
         for prog in self.needed_progs:
-            if not do_check_has_prog(prog):
+            if not await do_check_has_prog(prog):
                 print("ERROR: your system lacks the '%s' program" % prog)
                 missing_requirements = True
 
         # check optional programs here,
         # else they'd get checked by each worker instance
         for prog in self.optional_progs:
-            do_check_has_prog(prog)
+            await do_check_has_prog(prog)
 
         return not missing_requirements
 
@@ -208,7 +188,7 @@ class Builder:
     def __init__(self, instance, njobs, sysinfo,
                  http_url, http_login, http_password,
                  submitter, make_opts, nice, toolchains_csv,
-                 repo, upload, buildpid, debug):
+                 repo, upload, debug):
         self.instance = instance
         self.njobs = njobs
         self.sysinfo = sysinfo
@@ -221,7 +201,6 @@ class Builder:
         self.toolchains_csv = toolchains_csv
         self.repo = repo
         self.upload = upload
-        self.buildpid = buildpid
         self.debug = debug
         self.build_parallel = False
 
@@ -250,10 +229,10 @@ class Builder:
 
     def check_version(self):
         with urlopen_closing(urlparse.urljoin(self.http_url, 'version')) as r:
-            version = int(decode_bytes(r.readline()).strip())
+            version = int(r.readline().decode().strip())
         if version > VERSION:
-            print("ERROR: script version too old, please upgrade.")
-            sys.exit(1)
+            return False
+        return True
 
     def get_branch(self):
         """Returns the branch that should be built. It fetches a CSV file from
@@ -267,14 +246,14 @@ class Builder:
         csv_branches = []
         with urlopen_closing(urlparse.urljoin(self.http_url, 'branches')) as r:
             for l in r.readlines():
-                csv_branches.append(decode_bytes(l))
+                csv_branches.append(l.decode())
         branches = []
         for branch in csv.reader(csv_branches):
             branches += [branch[0]] * int(branch[1])
 
         return branches[randint(0, len(branches) - 1)]
 
-    def prepare_build(self):
+    async def prepare_build(self):
         """Prepare for the next build of the specified instance
 
         This function prepares the build by making sure all the needed
@@ -314,26 +293,35 @@ class Builder:
                       os.path.relpath(f, self.dldir))
             os.remove(f)
 
-        branch = self.get_branch()
+        loop = asyncio.get_event_loop()
+        branch = await loop.run_in_executor(None, self.get_branch)
         log_write(self.log, "INFO: testing branch '%s'" % branch)
 
         # Clone Buildroot. This only happens if the source directory
         # didn't exist already.
         if not os.path.exists(self.srcdir):
-            ret = subprocess.call(["git", "clone", self.repo, self.srcdir],
-                                  stdout=self.log, stderr=self.log)
+            proc = await asyncio.create_subprocess_exec(
+                "git", "clone", self.repo, self.srcdir,
+                stdout=self.log, stderr=self.log)
+            ret = await proc.wait()
             if ret != 0:
                 log_write(self.log, "ERROR: could not clone Buildroot sources")
                 return -1
 
         # Update the Buildroot sources.
         abssrcdir = os.path.abspath(self.srcdir)
-        ret = subprocess.call(["git", "fetch", "-t", self.repo, branch], cwd=abssrcdir, stdout=self.log, stderr=self.log)
+        proc = await asyncio.create_subprocess_exec(
+            "git", "fetch", "-t", self.repo, branch,
+            cwd=abssrcdir, stdout=self.log, stderr=self.log)
+        ret = await proc.wait()
         if ret != 0:
             log_write(self.log, "ERROR: could not fetch Buildroot sources")
             return -1
 
-        ret = subprocess.call(["git", "checkout", "FETCH_HEAD"], cwd=abssrcdir, stdout=self.log, stderr=self.log)
+        proc = await asyncio.create_subprocess_exec(
+            "git", "checkout", "-f", "FETCH_HEAD",
+            cwd=abssrcdir, stdout=self.log, stderr=self.log)
+        ret = await proc.wait()
         if ret != 0:
             log_write(self.log, "ERROR: could not check out Buildroot sources")
             return -1
@@ -351,18 +339,21 @@ class Builder:
 
         return 0
 
-    def gen_config(self):
+    def load_gen_config(self, genrandconfig):
+        spec = spec_from_loader("genrandconfig", SourceFileLoader("genrandconfig", genrandconfig))
+        mod = module_from_spec(spec)
+        spec.loader.exec_module(mod)
+        return mod.gen_config
+
+    async def gen_config(self):
         """Generate a new random configuration."""
 
         log_write(self.log, "INFO: generate the configuration")
 
-        if self.debug:
-            devnull = self.log
-        else:
-            devnull = open(os.devnull, "w")
-
-        args = [os.path.join(self.srcdir, "utils/genrandconfig"),
-                "-o", self.outputdir, "-b", self.srcdir]
+        args = {
+            'outputdir': os.path.abspath(self.outputdir),
+            'buildrootdir': os.path.abspath(self.srcdir),
+        }
 
         with open(os.path.join(self.outputdir, "branch"), "r") as branchf:
             branch = branchf.read().strip()
@@ -371,32 +362,40 @@ class Builder:
         if toolchains_csv:
             if not os.path.isabs(toolchains_csv):
                 toolchains_csv = os.path.join(self.srcdir, toolchains_csv)
-            args.extend(["--toolchains-csv", toolchains_csv])
-        elif branch != "2022.02.x":
-            args.extend(["--no-toolchains-csv"])
+            args['toolchains_csv'] = toolchains_csv
+        elif branch == "2022.02.x":
+            toolchains_csv = os.path.join(
+                self.srcdir,
+                'support/config-fragments/autobuild/toolchain-configs.csv'
+            )
+            args['toolchains_csv'] = toolchains_csv
+        else:
+            args['toolchains_csv'] = False
+
+        gen_config = self.load_gen_config(os.path.join(self.srcdir, "utils/genrandconfig"))
+
+        if inspect.iscoroutinefunction(gen_config):
+            ret = await gen_config(argparse.Namespace(**args))
+        else:
+            loop = asyncio.get_event_loop()
+            ret = await loop.run_in_executor(None, gen_config, argparse.Namespace(**args))
 
-        ret = subprocess.call(args, stdout=devnull, stderr=self.log)
         return ret
 
-    def stop_on_build_hang(self, monitor_thread_hung_build_flag,
-                           monitor_thread_stop_flag, sub_proc,
-                           outputdir):
+    async def stop_on_build_hang(self, sub_proc, outputdir):
         build_time_logfile = os.path.join(outputdir, "build/build-time.log")
         while True:
-            if monitor_thread_stop_flag.is_set():
-                return
             if os.path.exists(build_time_logfile):
                 mtime = datetime.datetime.fromtimestamp(os.stat(build_time_logfile).st_mtime)
 
                 if mtime < datetime.datetime.now() - datetime.timedelta(minutes=HUNG_BUILD_TIMEOUT):
-                    if sub_proc.poll() is None:
-                        monitor_thread_hung_build_flag.set() # Used by do_build() to determine build hang
+                    if sub_proc.returncode is None:
                         log_write(self.log, "INFO: build hung")
                         sub_proc.kill()
                     break
-            monitor_thread_stop_flag.wait(30)
+            await asyncio.sleep(30)
 
-    def check_reproducibility(self):
+    async def check_reproducibility(self):
         """Check reproducibility of builds
 
         Use diffoscope on the built images, if diffoscope is not
@@ -412,18 +411,32 @@ class Builder:
         with open(reproducible_results, 'w') as diff:
             if self.sysinfo.has("diffoscope"):
                 # Prefix to point diffoscope towards cross-tools
-                prefix = subprocess.check_output(["make", "--no-print-directory", "O=%s" % self.outputdir,
-                                                  "-C", self.srcdir, "printvars", "VARS=TARGET_CROSS"])
+                proc = await asyncio.create_subprocess_exec(
+                    "make", "--no-print-directory", "O=%s" % self.outputdir,
+                    "-C", self.srcdir, "printvars", "VARS=TARGET_CROSS",
+                    stdout=asyncio.subprocess.PIPE)
+                prefix, _ = await proc.communicate()
+                if proc.returncode:
+                    return -1
                 # Remove TARGET_CROSS= and \n from the string
                 prefix = prefix[13:-1]
                 log_write(self.log, "INFO: running diffoscope on images")
-                subprocess.call(["diffoscope", build_1_image, build_2_image,
-                                 "--tool-prefix-binutils", prefix, "--json", reproducible_results,
-                                 "--text", reproducible_results_txt, "--max-text-report-size", "40000"],
-                                stderr=self.log)
+                proc = await asyncio.create_subprocess_exec(
+                    "diffoscope", build_1_image, build_2_image,
+                    "--tool-prefix-binutils", prefix,
+                    "--json", reproducible_results,
+                    "--text", reproducible_results_txt,
+                    "--max-text-report-size", "40000",
+                    stderr=self.log
+                )
+                await proc.wait()
             else:
                 log_write(self.log, "INFO: diffoscope not installed, falling back to cmp")
-                subprocess.call(["cmp", "-b", build_1_image, build_2_image], stdout=diff, stderr=self.log)
+                proc = await asyncio.create_subprocess_exec(
+                    "cmp", "-b", build_1_image, build_2_image,
+                    stdout=diff, stderr=self.log
+                )
+                await proc.wait()
 
         if os.stat(reproducible_results).st_size > 0:
             log_write(self.log, "INFO: Build is non-reproducible.")
@@ -433,11 +446,11 @@ class Builder:
         log_write(self.log, "INFO: Build is reproducible!")
         return 0
 
-    def do_build(self, outputdir):
+    async def do_build(self, outputdir):
         """Run the build itself"""
 
         f = open(os.path.join(outputdir, "logfile"), "w+")
-        log_write(self.log, "INFO: build started")
+        log_write(self.log, "INFO: %d build started" % self.instance)
 
         cmd = ["nice", "-n", str(self.nice),
                "make", "O=%s" % outputdir,
@@ -451,30 +464,22 @@ class Builder:
         if self.build_parallel:
             cmd.append("-j%s" % self.njobs)
 
-        sub = subprocess.Popen(cmd, stdout=f, stderr=f)
+        sub = await asyncio.create_subprocess_exec(*cmd, stdout=f, stderr=f)
 
-        # Setup hung build monitoring thread
-        monitor_thread_hung_build_flag = Event()
-        monitor_thread_stop_flag = Event()
-        build_monitor = Thread(target=self.stop_on_build_hang,
-                               args=(monitor_thread_hung_build_flag,
-                                     monitor_thread_stop_flag,
-                                     sub, outputdir))
-        build_monitor.daemon = True
-        build_monitor.start()
+        # Setup hung build monitoring task
+        build_monitor = asyncio.create_task(
+            self.stop_on_build_hang(sub, outputdir))
 
-        self.buildpid[self.instance] = sub.pid
-        ret = sub.wait()
-        self.buildpid[self.instance] = 0
+        ret = await sub.wait()
 
-        # If build failed, monitor thread would have exited at this point
-        if monitor_thread_hung_build_flag.is_set():
+        # If build failed, monitor task would have exited at this point
+        if build_monitor.done():
             log_write(self.log, "INFO: build timed out [%d]" % ret)
             return -2
         else:
-            # Stop monitor thread as this build didn't timeout
-            monitor_thread_stop_flag.set()
-        # Monitor thread should be exiting around this point
+            # Stop monitor task as this build didn't timeout
+            build_monitor.cancel()
+        # Monitor task should be exiting around this point
 
         if ret != 0:
             log_write(self.log, "INFO: build failed [%d]" % ret)
@@ -483,14 +488,15 @@ class Builder:
         cmd = ["make", "O=%s" % outputdir, "-C", self.srcdir,
                "BR2_DL_DIR=%s" % self.dldir, "legal-info"] \
             + self.make_opts.split()
-        ret = subprocess.call(cmd, stdout=f, stderr=f)
+        proc = await asyncio.create_subprocess_exec(*cmd, stdout=f, stderr=f)
+        ret = await proc.wait()
         if ret != 0:
             log_write(self.log, "INFO: build failed during legal-info")
             return -1
         log_write(self.log, "INFO: build successful")
         return 0
 
-    def do_reproducible_build(self):
+    async def do_reproducible_build(self):
         """Run the builds for reproducibility testing
 
         Build twice with the same configuration. Calls do_build() to
@@ -499,7 +505,7 @@ class Builder:
 
         # Start the first build
         log_write(self.log, "INFO: Reproducible Build Test, starting build 1")
-        ret = self.do_build(self.outputdir)
+        ret = await self.do_build(self.outputdir)
         if ret != 0:
             log_write(self.log, "INFO: build 1 failed, skipping build 2")
             return ret
@@ -514,16 +520,16 @@ class Builder:
 
         # Start the second build
         log_write(self.log, "INFO: Reproducible Build Test, starting build 2")
-        ret = self.do_build(self.outputdir_2)
+        ret = await self.do_build(self.outputdir_2)
         if ret != 0:
             log_write(self.log, "INFO: build 2 failed")
             return ret
 
         # Assuming both have built successfully
-        ret = self.check_reproducibility()
+        ret = await self.check_reproducibility()
         return ret
 
-    def send_results(self, result):
+    async def send_results(self, result):
         """Prepare and store/send tarball with results
 
         This function prepares the tarball with the results, and either
@@ -549,15 +555,19 @@ class Builder:
         copy_if_exists("build", "packages-file-list-staging.txt")
         copy_if_exists("legal-info", "manifest.csv", "licenses-manifest.csv")
 
-        subprocess.call(["git log -n 1 --pretty=format:%%H > %s" % \
-                         os.path.join(self.resultdir, "gitid")],
-                        shell=True, cwd=self.srcdir)
+        proc = await asyncio.create_subprocess_shell(
+            "git log -n 1 --pretty=format:%%H > %s" %
+            os.path.join(self.resultdir, "gitid"),
+            cwd=self.srcdir)
+        await proc.wait()
 
         # Return True if the result should be rejected, False otherwise
-        def reject_results():
-            lastlines = decode_bytes(subprocess.Popen(
-                ["tail", "-n", "3", os.path.join(self.outputdir, "logfile")],
-                stdout=subprocess.PIPE).communicate()[0]).splitlines()
+        async def reject_results():
+            proc = await asyncio.create_subprocess_exec(
+                "tail", "-n", "3", os.path.join(self.outputdir, "logfile"),
+                stdout=asyncio.subprocess.PIPE)
+            stdout, _ = await proc.communicate()
+            lastlines = stdout.decode().splitlines()
 
             # Reject results where qemu-user refused to build
             regexp = re.compile(r'^package/qemu/qemu.mk:.*Refusing to build qemu-user')
@@ -567,14 +577,16 @@ class Builder:
 
             return False
 
-        if reject_results():
+        if await reject_results():
             return
 
-        def get_failure_reason():
+        async def get_failure_reason():
             # Output is a tuple (package, version), or None.
-            lastlines = decode_bytes(subprocess.Popen(
-                ["tail", "-n", "3", os.path.join(self.outputdir, "logfile")],
-                stdout=subprocess.PIPE).communicate()[0]).splitlines()
+            proc = await asyncio.create_subprocess_exec(
+                "tail", "-n", "3", os.path.join(self.outputdir, "logfile"),
+                stdout=asyncio.subprocess.PIPE)
+            stdout, _ = await proc.communicate()
+            lastlines = stdout.decode().splitlines()
 
             regexp = re.compile(r'make: \*\*\* .*/(?:build|toolchain)/([^/]*)/')
             for line in lastlines:
@@ -585,38 +597,39 @@ class Builder:
             # not found
             return None
 
-        reason = get_failure_reason()
+        reason = await get_failure_reason()
         if reason:
             with open(os.path.join(self.resultdir, "reason"), "w+") as reasonf:
                 reasonf.write("-".join(reason))
 
-        def extract_end_log(resultfile):
+        async def extract_end_log(resultfile):
             """Save the last part of the build log, starting from the failed package"""
 
-            def extract_last_500_lines():
-                subprocess.call(["tail -500 %s > %s" % \
-                                 (os.path.join(self.outputdir, "logfile"), resultfile)],
-                                shell=True)
+            async def extract_last_500_lines():
+                proc = await asyncio.create_subprocess_shell(
+                    "tail -500 %s > %s" %
+                    (os.path.join(self.outputdir, "logfile"), resultfile))
+                await proc.wait()
 
             if not reason:
-                extract_last_500_lines()
+                await extract_last_500_lines()
             else:
                 f = open(os.path.join(self.outputdir, "logfile"), 'r')
                 mf = mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ)
                 mf.seek(0)
                 # Search for first action on the failed package
-                offset = mf.find(encode_str('>>> %s' % ' '.join(reason)))
+                offset = mf.find('>>> %s' % ' '.join(reason).encode())
                 if offset != -1:
                     with open(resultfile, "w") as endlog:
-                        endlog.write(decode_bytes(mf[offset:]))
+                        endlog.write(mf[offset:].decode())
                 else:
                     # not found, use last 500 lines as fallback
-                    extract_last_500_lines()
+                    await extract_last_500_lines()
 
                 mf.close()
                 f.close()
 
-        extract_end_log(os.path.join(self.resultdir, "build-end.log"))
+        await extract_end_log(os.path.join(self.resultdir, "build-end.log"))
 
         def copy_config_log_files():
             """Recursively copy any config.log files from the failing package"""
@@ -671,8 +684,11 @@ class Builder:
 
         # Yes, shutil.make_archive() would be nice, but it doesn't exist
         # in Python 2.6.
-        ret = subprocess.call(["tar", "cjf", "results.tar.bz2", "results"],
-                              cwd=self.outputdir, stdout=self.log, stderr=self.log)
+        proc = await asyncio.create_subprocess_exec(
+            "tar", "cjf", "results.tar.bz2", "results",
+            cwd=self.outputdir, stdout=self.log, stderr=self.log
+        )
+        ret = await proc.wait()
         if ret != 0:
             log_write(self.log, "ERROR: could not make results tarball")
             sys.exit(1)
@@ -681,13 +697,14 @@ class Builder:
             # Submit results. Yes, Python has some HTTP libraries, but
             # none of the ones that are part of the standard library can
             # upload a file without writing dozens of lines of code.
-            ret = subprocess.call(["curl", "-u",
-                                   "%s:%s" % (self.http_login, self.http_password),
-                                   "-H", "Expect:",
-                                   "-F", "uploadedfile=@%s" % os.path.join(self.outputdir, "results.tar.bz2"),
-                                   "-F", "uploadsubmit=1",
-                                   urlparse.urljoin(self.http_url, 'submit/')],
-                                  stdout=self.log, stderr=self.log)
+            proc = await asyncio.create_subprocess_exec(
+                "curl", "-u", "%s:%s" % (self.http_login, self.http_password),
+                "-H", "Expect:",
+                "-F", "uploadedfile=@%s" % os.path.join(self.outputdir, "results.tar.bz2"),
+                "-F", "uploadsubmit=1",
+                urlparse.urljoin(self.http_url, 'submit/'),
+                stdout=self.log, stderr=self.log)
+            ret = await proc.wait()
             if ret != 0:
                 log_write(self.log, "INFO: results could not be submitted, %d" % ret)
             else:
@@ -704,16 +721,20 @@ class Builder:
 
             log_write(self.log, "INFO: results saved as %s" % resultfilename)
 
-    def run_one_build(self):
-        self.check_version()
+    async def run_one_build(self):
+        loop = asyncio.get_event_loop()
+        ret = await loop.run_in_executor(None, self.check_version)
+        if not ret:
+            print("ERROR: script version too old, please upgrade.")
+            sys.exit(1)
 
-        ret = self.prepare_build()
+        ret = await self.prepare_build()
         if ret != 0:
             return
 
         os.mkdir(self.resultdir)
 
-        ret = self.gen_config()
+        ret = await self.gen_config()
         if ret != 0:
             log_write(self.log, "WARN: failed to generate configuration")
             return
@@ -727,13 +748,13 @@ class Builder:
         self.build_parallel = per_package and randint(0, 1) == 0
 
         if reproducible:
-            ret = self.do_reproducible_build()
+            ret = await self.do_reproducible_build()
         else:
-            ret = self.do_build(self.outputdir)
+            ret = await self.do_build(self.outputdir)
 
-        self.send_results(ret)
+        await self.send_results(ret)
 
-    def run_instance(self):
+    async def run_instance(self):
         """Main per-instance loop
 
         Prepare the build, generate a configuration, run the build, and submit the
@@ -744,9 +765,9 @@ class Builder:
 
         while True:
             try:
-                self.run_one_build()
-            except URLError as e:
-                sleep(30)
+                await self.run_one_build()
+            except URLError:
+                await asyncio.sleep(30)
 
 class Formatter(argparse.ArgumentDefaultsHelpFormatter, argparse.RawDescriptionHelpFormatter):
     pass
@@ -763,7 +784,7 @@ class LoadConfigFile(argparse.Action):
                 value = False
             setattr(namespace, key, value)
 
-def main():
+async def main():
 
     # Avoid locale settings of autobuilder machine leaking in, for example
     # showing error messages in another language.
@@ -843,7 +864,7 @@ def main():
         print("WARN: due to the lack of http login/password details, results will not be submitted")
         print("WARN: tarballs of results will be kept locally only")
 
-    if not sysinfo.check_requirements():
+    if not await sysinfo.check_requirements():
         sys.exit(1)
 
     # Enforce the sanest umask here, to avoid buildroot doing it on its
@@ -851,35 +872,7 @@ def main():
     # in case of failures.
     os.umask(0o022)
 
-    def sigterm_handler(signum, frame):
-        """Kill all children"""
-
-        # uninstall signal handler to prevent being called for all subprocesses
-        signal.signal(signal.SIGINT, signal.SIG_IGN)
-        signal.signal(signal.SIGTERM, signal.SIG_DFL)
-
-        # stop all instances to prevent new children to be spawned
-        for p in processes:
-            p.terminate()
-
-        # kill build processes started with timeout (that puts its children
-        # explicitly in a separate process group)
-        for pid in buildpid:
-            if pid == 0:
-                continue
-            try:
-                os.kill(pid, signal.SIGTERM)
-            except OSError as e:
-                if e.errno != errno.ESRCH: # No such process, ignore
-                    raise
-
-        # kill any remaining children in our process group
-        os.killpg(os.getpgid(os.getpid()), signal.SIGTERM)
-
-        sys.exit(1)
-
-    buildpid = multiprocessing.Array('i', int(args.ninstances))
-    processes = []
+    tasks = []
     for i in range(0, int(args.ninstances)):
         builder = Builder(
             instance = i,
@@ -894,17 +887,27 @@ def main():
             toolchains_csv = args.toolchains_csv,
             repo = args.repo,
             upload = upload,
-            buildpid = buildpid,
             debug = args.debug)
-        p = multiprocessing.Process(target=builder.run_instance)
-        p.start()
-        processes.append(p)
+        t = asyncio.create_task(builder.run_instance())
+        tasks.append(t)
+
+    buildtasks = asyncio.gather(*tasks, return_exceptions=False)
+
+    def sigterm_handler(signum, frame):
+        """Kill all children"""
+        buildtasks.cancel()
 
     signal.signal(signal.SIGINT, sigterm_handler)
     signal.signal(signal.SIGTERM, sigterm_handler)
 
-    for p in processes:
-        p.join()
+    try:
+        await buildtasks
+    except asyncio.CancelledError:
+        pass
 
 if __name__ == '__main__':
-    main()
+    if sys.version_info < (3, 7):
+        loop = asyncio.get_event_loop()
+        loop.run_until_complete(main())
+    else:
+        asyncio.run(main())
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
