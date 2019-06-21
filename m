From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 21 Jun 2019 14:17:12 +0530
Subject: [Buildroot] [PATCH 01/19] autobuild-run: introduce Builder class
Message-ID: <20190621084730.16411-1-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Various functions in the autobuild-run script use a lot of common data.
To make it easier to work with, create a Builder class.

For ease of review, this commit only introduces the Builder class but
does not actually use it for anything. Subsequent patches will do that.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 scripts/autobuild-run | 858 +++++++++++++++++++++---------------------
 1 file changed, 430 insertions(+), 428 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 601fb31..254d1b6 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -270,473 +270,474 @@ class SystemInfo:
 
         return not missing_requirements
 
-def prepare_build(**kwargs):
-    """Prepare for the next build of the specified instance
+class Builder:
+    def prepare_build(self, **kwargs):
+        """Prepare for the next build of the specified instance
 
-    This function prepares the build by making sure all the needed
-    directories are created, cloning or updating the Buildroot source
-    code, and cleaning up remaining stuff from previous builds.
-    """
+        This function prepares the build by making sure all the needed
+        directories are created, cloning or updating the Buildroot source
+        code, and cleaning up remaining stuff from previous builds.
+        """
 
-    idir = "instance-%d" % kwargs['instance']
-    log = kwargs['log']
-
-    log_write(log, "INFO: preparing a new build")
-
-    # Create the download directory if it doesn't exist
-    dldir = os.path.join(idir, "dl")
-    if not os.path.exists(dldir):
-        os.mkdir(dldir)
-
-    # recursively find files under root
-    def find_files(root):
-        for r, d, f in os.walk(root):
-            # do not remove individual files from git caches. 'git' can
-            # be either dl/<package>/git or dl/git and we want to
-            # eventually remove tarballs for the git package, so check
-            # for '.git' instead to match only dl/<package>/git/.git .
-            if '.git' in d:
-                del d[:]
-                continue
-            for i in f:
-                yield os.path.join(r, i)
-
-    # Remove 5 random files from the download directory. Removing
-    # random files from the download directory allows to ensure we
-    # regularly re-download files to check that their upstream
-    # location is still correct.
-    for i in range(0, 5):
-        flist = list(find_files(dldir))
-        if not flist:
-            break
-        f = flist[randint(0, len(flist) - 1)]
-        log_write(log, "INFO: removing %s from downloads" %
-                  os.path.relpath(f, dldir))
-        os.remove(f)
-
-    branch = get_branch()
-    log_write(log, "INFO: testing branch '%s'" % branch)
-
-    # Clone Buildroot. This only happens if the source directory
-    # didn't exist already.
-    srcdir = os.path.join(idir, "buildroot")
-    if not os.path.exists(srcdir):
-        ret = subprocess.call(["git", "clone", kwargs['repo'], srcdir],
-                              stdout=log, stderr=log)
+        idir = "instance-%d" % kwargs['instance']
+        log = kwargs['log']
+
+        log_write(log, "INFO: preparing a new build")
+
+        # Create the download directory if it doesn't exist
+        dldir = os.path.join(idir, "dl")
+        if not os.path.exists(dldir):
+            os.mkdir(dldir)
+
+        # recursively find files under root
+        def find_files(root):
+            for r, d, f in os.walk(root):
+                # do not remove individual files from git caches. 'git' can
+                # be either dl/<package>/git or dl/git and we want to
+                # eventually remove tarballs for the git package, so check
+                # for '.git' instead to match only dl/<package>/git/.git .
+                if '.git' in d:
+                    del d[:]
+                    continue
+                for i in f:
+                    yield os.path.join(r, i)
+
+        # Remove 5 random files from the download directory. Removing
+        # random files from the download directory allows to ensure we
+        # regularly re-download files to check that their upstream
+        # location is still correct.
+        for i in range(0, 5):
+            flist = list(find_files(dldir))
+            if not flist:
+                break
+            f = flist[randint(0, len(flist) - 1)]
+            log_write(log, "INFO: removing %s from downloads" %
+                    os.path.relpath(f, dldir))
+            os.remove(f)
+
+        branch = get_branch()
+        log_write(log, "INFO: testing branch '%s'" % branch)
+
+        # Clone Buildroot. This only happens if the source directory
+        # didn't exist already.
+        srcdir = os.path.join(idir, "buildroot")
+        if not os.path.exists(srcdir):
+            ret = subprocess.call(["git", "clone", kwargs['repo'], srcdir],
+                                stdout=log, stderr=log)
+            if ret != 0:
+                log_write(log, "ERROR: could not clone Buildroot sources")
+                return -1
+
+        # Update the Buildroot sources.
+        abssrcdir = os.path.abspath(srcdir)
+        ret = subprocess.call(["git", "fetch", "origin"], cwd=abssrcdir, stdout=log, stderr=log)
         if ret != 0:
-            log_write(log, "ERROR: could not clone Buildroot sources")
+            log_write(log, "ERROR: could not fetch Buildroot sources")
             return -1
 
-    # Update the Buildroot sources.
-    abssrcdir = os.path.abspath(srcdir)
-    ret = subprocess.call(["git", "fetch", "origin"], cwd=abssrcdir, stdout=log, stderr=log)
-    if ret != 0:
-        log_write(log, "ERROR: could not fetch Buildroot sources")
-        return -1
-
-    ret = subprocess.call(["git", "checkout", "--detach", "origin/%s" % branch], cwd=abssrcdir, stdout=log, stderr=log)
-    if ret != 0:
-        log_write(log, "ERROR: could not check out Buildroot sources")
-        return -1
-
-    # Create an empty output directory. We remove it first, in case a previous build was aborted.
-    outputdir = os.path.join(idir, "output")
-    if os.path.exists(outputdir):
-        # shutil.rmtree doesn't remove write-protected files
-        subprocess.call(["rm", "-rf", outputdir])
-    os.mkdir(outputdir)
-    with open(os.path.join(outputdir, "branch"), "w") as branchf:
-        branchf.write(branch)
-
-    return 0
-
-def gen_config(**kwargs):
-    """Generate a new random configuration."""
-    idir = "instance-%d" % kwargs['instance']
-    log = kwargs['log']
-    outputdir = os.path.abspath(os.path.join(idir, "output"))
-    srcdir = os.path.join(idir, "buildroot")
-
-    log_write(log, "INFO: generate the configuration")
-
-    if kwargs['debug']:
-        devnull = log
-    else:
-        devnull = open(os.devnull, "w")
-
-    args = [os.path.join(srcdir, "utils/genrandconfig"),
-            "-o", outputdir, "-b", srcdir]
-
-    toolchains_csv = kwargs['toolchains_csv']
-    if toolchains_csv:
-        if not os.path.isabs(toolchains_csv):
-            toolchains_csv = os.path.join(srcdir, toolchains_csv)
-        args.extend(["--toolchains-csv", toolchains_csv])
-
-    ret = subprocess.call(args, stdout=devnull, stderr=log)
-    return ret
-
-def stop_on_build_hang(monitor_thread_hung_build_flag,
-                       monitor_thread_stop_flag,
-                       sub_proc, outputdir, log):
-    build_time_logfile = os.path.join(outputdir, "build/build-time.log")
-    while True:
-        if monitor_thread_stop_flag.is_set():
-            return
-        if os.path.exists(build_time_logfile):
-            mtime = datetime.datetime.fromtimestamp(os.stat(build_time_logfile).st_mtime)
-
-            if mtime < datetime.datetime.now() - datetime.timedelta(minutes=HUNG_BUILD_TIMEOUT):
-                if sub_proc.poll() is None:
-                    monitor_thread_hung_build_flag.set() # Used by do_build() to determine build hang
-                    log_write(log, "INFO: build hung")
-                    sub_proc.kill()
-                break
-        monitor_thread_stop_flag.wait(30)
+        ret = subprocess.call(["git", "checkout", "--detach", "origin/%s" % branch], cwd=abssrcdir, stdout=log, stderr=log)
+        if ret != 0:
+            log_write(log, "ERROR: could not check out Buildroot sources")
+            return -1
 
-def check_reproducibility(**kwargs):
-    """Check reproducibility of builds
+        # Create an empty output directory. We remove it first, in case a previous build was aborted.
+        outputdir = os.path.join(idir, "output")
+        if os.path.exists(outputdir):
+            # shutil.rmtree doesn't remove write-protected files
+            subprocess.call(["rm", "-rf", outputdir])
+        os.mkdir(outputdir)
+        with open(os.path.join(outputdir, "branch"), "w") as branchf:
+            branchf.write(branch)
+
+        return 0
+
+    def gen_config(self, **kwargs):
+        """Generate a new random configuration."""
+        idir = "instance-%d" % kwargs['instance']
+        log = kwargs['log']
+        outputdir = os.path.abspath(os.path.join(idir, "output"))
+        srcdir = os.path.join(idir, "buildroot")
 
-    Use diffoscope on the built images, if diffoscope is not
-    installed, fallback to cmp
-    """
+        log_write(log, "INFO: generate the configuration")
 
-    log = kwargs['log']
-    idir = "instance-%d" % kwargs['instance']
-    outputdir = os.path.join(idir, "output")
-    srcdir = os.path.join(idir, "buildroot")
-    reproducible_results = os.path.join(outputdir, "results", "reproducible_results")
-    # Using only tar images for now
-    build_1_image = os.path.join(outputdir, "images-1", "rootfs.tar")
-    build_2_image = os.path.join(outputdir, "images", "rootfs.tar")
-
-    with open(reproducible_results, 'w') as diff:
-        if kwargs['sysinfo'].has("diffoscope"):
-            # Prefix to point diffoscope towards cross-tools
-            prefix = subprocess.check_output(["make", "O=%s" % outputdir, "-C", srcdir, "printvars", "VARS=TARGET_CROSS"])
-            # Remove TARGET_CROSS= and \n from the string
-            prefix = prefix[13:-1]
-            log_write(log, "INFO: running diffoscope on images")
-            subprocess.call(["diffoscope", build_1_image, build_2_image,
-                                "--tool-prefix-binutils", prefix], stdout=diff, stderr=log)
+        if kwargs['debug']:
+            devnull = log
         else:
-            log_write(log, "INFO: diffoscope not installed, falling back to cmp")
-            subprocess.call(["cmp", "-b", build_1_image, build_2_image], stdout=diff, stderr=log)
-
-    if os.stat(reproducible_results).st_size > 0:
-        log_write(log, "INFO: Build is non-reproducible.")
-        return -1
-
-    # rootfs images match byte-for-byte -> reproducible image
-    log_write(log, "INFO: Build is reproducible!")
-    return 0
-
-def do_build(**kwargs):
-    """Run the build itself"""
-
-    idir = "instance-%d" % kwargs['instance']
-    log = kwargs['log']
-    nice = kwargs['nice']
-
-    # We need the absolute path to use with O=, because the relative
-    # path to the output directory here is not relative to the
-    # Buildroot sources, but to the location of the autobuilder
-    # script.
-    dldir = os.path.abspath(os.path.join(idir, "dl"))
-    outputdir = os.path.abspath(os.path.join(idir, "output"))
-    srcdir = os.path.join(idir, "buildroot")
-    f = open(os.path.join(outputdir, "logfile"), "w+")
-    log_write(log, "INFO: build started")
-
-    cmd = ["nice", "-n", str(nice),
-            "make", "O=%s" % outputdir,
-            "-C", srcdir, "BR2_DL_DIR=%s" % dldir,
-            "BR2_JLEVEL=%s" % kwargs['njobs']] \
-          + kwargs['make_opts'].split()
-    sub = subprocess.Popen(cmd, stdout=f, stderr=f)
-
-    # Setup hung build monitoring thread
-    monitor_thread_hung_build_flag = Event()
-    monitor_thread_stop_flag = Event()
-    build_monitor = Thread(target=stop_on_build_hang,
-                           args=(monitor_thread_hung_build_flag,
-                                 monitor_thread_stop_flag,
-                                 sub, outputdir, log))
-    build_monitor.daemon = True
-    build_monitor.start()
-
-    kwargs['buildpid'][kwargs['instance']] = sub.pid
-    ret = sub.wait()
-    kwargs['buildpid'][kwargs['instance']] = 0
-
-    # If build failed, monitor thread would have exited at this point
-    if monitor_thread_hung_build_flag.is_set():
-        log_write(log, "INFO: build timed out [%d]" % ret)
-        return -2
-    else:
-        # Stop monitor thread as this build didn't timeout
-        monitor_thread_stop_flag.set()
-    # Monitor thread should be exiting around this point
-
-    if ret != 0:
-        log_write(log, "INFO: build failed [%d]" % ret)
-        return -1
-
-    cmd = ["make", "O=%s" % outputdir, "-C", srcdir,
-            "BR2_DL_DIR=%s" % dldir, "legal-info"] \
-          + kwargs['make_opts'].split()
-    ret = subprocess.call(cmd, stdout=f, stderr=f)
-    if ret != 0:
-        log_write(log, "INFO: build failed during legal-info")
-        return -1
-    log_write(log, "INFO: build successful")
-    return 0
-
-def do_reproducible_build(**kwargs):
-    """Run the builds for reproducibility testing
-
-    Build twice with the same configuration. Calls do_build() to
-    perform the actual build.
-    """
+            devnull = open(os.devnull, "w")
+
+        args = [os.path.join(srcdir, "utils/genrandconfig"),
+                "-o", outputdir, "-b", srcdir]
 
-    idir = "instance-%d" % kwargs['instance']
-    outputdir = os.path.abspath(os.path.join(idir, "output"))
-    srcdir = os.path.join(idir, "buildroot")
-    log = kwargs['log']
+        toolchains_csv = kwargs['toolchains_csv']
+        if toolchains_csv:
+            if not os.path.isabs(toolchains_csv):
+                toolchains_csv = os.path.join(srcdir, toolchains_csv)
+            args.extend(["--toolchains-csv", toolchains_csv])
 
-    # Start the first build
-    log_write(log, "INFO: Reproducible Build Test, starting build 1")
-    ret = do_build(**kwargs)
-    if ret != 0:
-        log_write(log, "INFO: build 1 failed, skipping build 2")
+        ret = subprocess.call(args, stdout=devnull, stderr=log)
         return ret
 
-    # First build has been built, move files and start build 2
-    os.rename(os.path.join(outputdir, "images"), os.path.join(outputdir, "images-1"))
+    def stop_on_build_hang(self, monitor_thread_hung_build_flag,
+                        monitor_thread_stop_flag,
+                        sub_proc, outputdir, log):
+        build_time_logfile = os.path.join(outputdir, "build/build-time.log")
+        while True:
+            if monitor_thread_stop_flag.is_set():
+                return
+            if os.path.exists(build_time_logfile):
+                mtime = datetime.datetime.fromtimestamp(os.stat(build_time_logfile).st_mtime)
+
+                if mtime < datetime.datetime.now() - datetime.timedelta(minutes=HUNG_BUILD_TIMEOUT):
+                    if sub_proc.poll() is None:
+                        monitor_thread_hung_build_flag.set() # Used by do_build() to determine build hang
+                        log_write(log, "INFO: build hung")
+                        sub_proc.kill()
+                    break
+            monitor_thread_stop_flag.wait(30)
+
+    def check_reproducibility(self, **kwargs):
+        """Check reproducibility of builds
+
+        Use diffoscope on the built images, if diffoscope is not
+        installed, fallback to cmp
+        """
 
-    # Clean up build 1
-    f = open(os.path.join(outputdir, "logfile"), "w+")
-    subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir, "clean"], stdout=f, stderr=f)
+        log = kwargs['log']
+        idir = "instance-%d" % kwargs['instance']
+        outputdir = os.path.join(idir, "output")
+        srcdir = os.path.join(idir, "buildroot")
+        reproducible_results = os.path.join(outputdir, "results", "reproducible_results")
+        # Using only tar images for now
+        build_1_image = os.path.join(outputdir, "images-1", "rootfs.tar")
+        build_2_image = os.path.join(outputdir, "images", "rootfs.tar")
+
+        with open(reproducible_results, 'w') as diff:
+            if kwargs['sysinfo'].has("diffoscope"):
+                # Prefix to point diffoscope towards cross-tools
+                prefix = subprocess.check_output(["make", "O=%s" % outputdir, "-C", srcdir, "printvars", "VARS=TARGET_CROSS"])
+                # Remove TARGET_CROSS= and \n from the string
+                prefix = prefix[13:-1]
+                log_write(log, "INFO: running diffoscope on images")
+                subprocess.call(["diffoscope", build_1_image, build_2_image,
+                                    "--tool-prefix-binutils", prefix], stdout=diff, stderr=log)
+            else:
+                log_write(log, "INFO: diffoscope not installed, falling back to cmp")
+                subprocess.call(["cmp", "-b", build_1_image, build_2_image], stdout=diff, stderr=log)
 
-    # Start the second build
-    log_write(log, "INFO: Reproducible Build Test, starting build 2")
-    ret = do_build(**kwargs)
-    if ret != 0:
-        log_write(log, "INFO: build 2 failed")
-        return ret
+        if os.stat(reproducible_results).st_size > 0:
+            log_write(log, "INFO: Build is non-reproducible.")
+            return -1
 
-    # Assuming both have built successfully
-    ret = check_reproducibility(**kwargs)
-    return ret
+        # rootfs images match byte-for-byte -> reproducible image
+        log_write(log, "INFO: Build is reproducible!")
+        return 0
 
-def send_results(result, **kwargs):
-    """Prepare and store/send tarball with results
+    def do_build(self, **kwargs):
+        """Run the build itself"""
 
-    This function prepares the tarball with the results, and either
-    submits them to the official server (if the appropriate credentials
-    are available) or stores them locally as tarballs.
-    """
+        idir = "instance-%d" % kwargs['instance']
+        log = kwargs['log']
+        nice = kwargs['nice']
 
-    idir = "instance-%d" % kwargs['instance']
-    log = kwargs['log']
-
-    outputdir = os.path.abspath(os.path.join(idir, "output"))
-    srcdir = os.path.join(idir, "buildroot")
-    resultdir = os.path.join(outputdir, "results")
-
-    shutil.copyfile(os.path.join(outputdir, ".config"),
-                    os.path.join(resultdir, "config"))
-    shutil.copyfile(os.path.join(outputdir, "defconfig"),
-                    os.path.join(resultdir, "defconfig"))
-    shutil.copyfile(os.path.join(outputdir, "branch"),
-                    os.path.join(resultdir, "branch"))
-
-    def copy_if_exists(directory, src, dst=None):
-        if os.path.exists(os.path.join(outputdir, directory, src)):
-            shutil.copyfile(os.path.join(outputdir, directory, src),
-                            os.path.join(resultdir, src if dst is None else dst))
-
-    copy_if_exists("build", "build-time.log")
-    copy_if_exists("build", "packages-file-list.txt")
-    copy_if_exists("build", "packages-file-list-host.txt")
-    copy_if_exists("build", "packages-file-list-staging.txt")
-    copy_if_exists("legal-info", "manifest.csv", "licenses-manifest.csv")
-
-    subprocess.call(["git log -n 1 --pretty=format:%%H > %s" % \
-                     os.path.join(resultdir, "gitid")],
-                    shell=True, cwd=srcdir)
-
-    # Return True if the result should be rejected, False otherwise
-    def reject_results():
-        lastlines = decode_bytes(subprocess.Popen(
-            ["tail", "-n", "3", os.path.join(outputdir, "logfile")],
-            stdout=subprocess.PIPE).communicate()[0]).splitlines()
-
-	# Reject results where qemu-user refused to build
-	regexp = re.compile(r'^package/qemu/qemu.mk:.*Refusing to build qemu-user')
-	for line in lastlines:
-	    if regexp.match(line):
-		return True
-
-	return False
-
-    if reject_results():
-        return
-
-    def get_failure_reason():
-        # Output is a tuple (package, version), or None.
-        lastlines = decode_bytes(subprocess.Popen(
-            ["tail", "-n", "3", os.path.join(outputdir, "logfile")],
-            stdout=subprocess.PIPE).communicate()[0]).splitlines()
-
-        regexp = re.compile(r'make: \*\*\* .*/(?:build|toolchain)/([^/]*)/')
-        for line in lastlines:
-            m = regexp.search(line)
-            if m:
-                return m.group(1).rsplit('-', 1)
-
-        # not found
-        return None
+        # We need the absolute path to use with O=, because the relative
+        # path to the output directory here is not relative to the
+        # Buildroot sources, but to the location of the autobuilder
+        # script.
+        dldir = os.path.abspath(os.path.join(idir, "dl"))
+        outputdir = os.path.abspath(os.path.join(idir, "output"))
+        srcdir = os.path.join(idir, "buildroot")
+        f = open(os.path.join(outputdir, "logfile"), "w+")
+        log_write(log, "INFO: build started")
+
+        cmd = ["nice", "-n", str(nice),
+                "make", "O=%s" % outputdir,
+                "-C", srcdir, "BR2_DL_DIR=%s" % dldir,
+                "BR2_JLEVEL=%s" % kwargs['njobs']] \
+            + kwargs['make_opts'].split()
+        sub = subprocess.Popen(cmd, stdout=f, stderr=f)
+
+        # Setup hung build monitoring thread
+        monitor_thread_hung_build_flag = Event()
+        monitor_thread_stop_flag = Event()
+        build_monitor = Thread(target=self.stop_on_build_hang,
+                            args=(monitor_thread_hung_build_flag,
+                                    monitor_thread_stop_flag,
+                                    sub, outputdir, log))
+        build_monitor.daemon = True
+        build_monitor.start()
+
+        kwargs['buildpid'][kwargs['instance']] = sub.pid
+        ret = sub.wait()
+        kwargs['buildpid'][kwargs['instance']] = 0
+
+        # If build failed, monitor thread would have exited at this point
+        if monitor_thread_hung_build_flag.is_set():
+            log_write(log, "INFO: build timed out [%d]" % ret)
+            return -2
+        else:
+            # Stop monitor thread as this build didn't timeout
+            monitor_thread_stop_flag.set()
+        # Monitor thread should be exiting around this point
 
-    def extract_end_log(resultfile):
-        """Save the last part of the build log, starting from the failed package"""
+        if ret != 0:
+            log_write(log, "INFO: build failed [%d]" % ret)
+            return -1
 
-        def extract_last_500_lines():
-            subprocess.call(["tail -500 %s > %s" % \
-                             (os.path.join(outputdir, "logfile"), resultfile)],
-                            shell=True)
+        cmd = ["make", "O=%s" % outputdir, "-C", srcdir,
+                "BR2_DL_DIR=%s" % dldir, "legal-info"] \
+            + kwargs['make_opts'].split()
+        ret = subprocess.call(cmd, stdout=f, stderr=f)
+        if ret != 0:
+            log_write(log, "INFO: build failed during legal-info")
+            return -1
+        log_write(log, "INFO: build successful")
+        return 0
 
-        reason = get_failure_reason()
-        if not reason:
-            extract_last_500_lines()
-        else:
-            f = open(os.path.join(outputdir, "logfile"), 'r')
-            mf = mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ)
-            mf.seek(0)
-            # Search for first action on the failed package
-            offset = mf.find(encode_str('>>> %s' % ' '.join(reason)))
-            if offset != -1:
-                with open(resultfile, "w") as endlog:
-                    endlog.write(decode_bytes(mf[offset:]))
-            else:
-                # not found, use last 500 lines as fallback
-                extract_last_500_lines()
+    def do_reproducible_build(self, **kwargs):
+        """Run the builds for reproducibility testing
 
-            mf.close()
-            f.close()
+        Build twice with the same configuration. Calls do_build() to
+        perform the actual build.
+        """
 
-    extract_end_log(os.path.join(resultdir, "build-end.log"))
+        idir = "instance-%d" % kwargs['instance']
+        outputdir = os.path.abspath(os.path.join(idir, "output"))
+        srcdir = os.path.join(idir, "buildroot")
+        log = kwargs['log']
 
-    def copy_config_log_files():
-        """Recursively copy any config.log files from the failing package"""
+        # Start the first build
+        log_write(log, "INFO: Reproducible Build Test, starting build 1")
+        ret = self.do_build(**kwargs)
+        if ret != 0:
+            log_write(log, "INFO: build 1 failed, skipping build 2")
+            return ret
 
-        reason = get_failure_reason()
-        if not reason:
-            return
+        # First build has been built, move files and start build 2
+        os.rename(os.path.join(outputdir, "images"), os.path.join(outputdir, "images-1"))
 
-        srcroot = os.path.join(outputdir, "build", '-'.join(reason))
-        destroot = os.path.join(resultdir, '-'.join(reason))
-        config_files = ('config.log', 'CMakeCache.txt', 'CMakeError.log',
-            'CMakeOutput.log')
-
-        for root, dirs, files in os.walk(srcroot):
-            dest = os.path.join(destroot, os.path.relpath(root, srcroot))
-
-            for fname in files:
-                if fname in config_files:
-                    if not os.path.exists(dest):
-                        os.makedirs(dest)
-                    shutil.copy(os.path.join(root, fname), os.path.join(dest, fname))
-
-    copy_config_log_files()
-
-    resultf = open(os.path.join(resultdir, "status"), "w+")
-    if result == 0:
-        resultf.write("OK")
-    elif result == -1:
-        resultf.write("NOK")
-    elif result == -2:
-        resultf.write("TIMEOUT")
-    resultf.close()
-
-    with open(os.path.join(resultdir, "submitter"), "w+") as submitterf:
-        submitterf.write(kwargs['submitter'])
-
-    # Yes, shutil.make_archive() would be nice, but it doesn't exist
-    # in Python 2.6.
-    ret = subprocess.call(["tar", "cjf", "results.tar.bz2", "results"],
-                          cwd=outputdir, stdout=log, stderr=log)
-    if ret != 0:
-        log_write(log, "ERROR: could not make results tarball")
-        sys.exit(1)
+        # Clean up build 1
+        f = open(os.path.join(outputdir, "logfile"), "w+")
+        subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir, "clean"], stdout=f, stderr=f)
 
-    if kwargs['upload']:
-        # Submit results. Yes, Python has some HTTP libraries, but
-        # none of the ones that are part of the standard library can
-        # upload a file without writing dozens of lines of code.
-        ret = subprocess.call(["curl", "-u",
-                               "%s:%s" % (kwargs['http_login'], kwargs['http_password']),
-                               "-H", "Expect:",
-                               "-F", "uploadedfile=@%s" % os.path.join(outputdir, "results.tar.bz2"),
-                               "-F", "uploadsubmit=1",
-                               kwargs['http_url']],
-                              stdout=log, stderr=log)
+        # Start the second build
+        log_write(log, "INFO: Reproducible Build Test, starting build 2")
+        ret = self.do_build(**kwargs)
         if ret != 0:
-            log_write(log, "INFO: results could not be submitted, %d" % ret)
-        else:
-            log_write(log, "INFO: results were submitted successfully")
-    else:
-        # No http login/password, keep tarballs locally
-        with open(os.path.join(outputdir, "results.tar.bz2"), 'rb') as f:
-            sha1 = hashlib.sha1(f.read()).hexdigest()
-        resultfilename = "instance-%d-%s.tar.bz2" % (kwargs['instance'], sha1)
-        os.rename(os.path.join(outputdir, "results.tar.bz2"), resultfilename)
-        log_write(log, "INFO: results saved as %s" % resultfilename)
-
-def run_instance(**kwargs):
-    """Main per-instance loop
-
-    Prepare the build, generate a configuration, run the build, and submit the
-    results.
-    """
+            log_write(log, "INFO: build 2 failed")
+            return ret
 
-    idir = "instance-%d" % kwargs['instance']
+        # Assuming both have built successfully
+        ret = self.check_reproducibility(**kwargs)
+        return ret
 
-    # If it doesn't exist, create the instance directory
-    if not os.path.exists(idir):
-        os.mkdir(idir)
+    def send_results(self, result, **kwargs):
+        """Prepare and store/send tarball with results
 
-    if kwargs['debug']:
-        kwargs['log'] = sys.stdout
-    else:
-        kwargs['log'] = open(os.path.join(idir, "instance.log"), "a+")
-    log_write(kwargs['log'], "INFO: instance started")
+        This function prepares the tarball with the results, and either
+        submits them to the official server (if the appropriate credentials
+        are available) or stores them locally as tarballs.
+        """
 
-    while True:
-        check_version()
+        idir = "instance-%d" % kwargs['instance']
+        log = kwargs['log']
 
-        ret = prepare_build(**kwargs)
-        if ret != 0:
-            continue
+        outputdir = os.path.abspath(os.path.join(idir, "output"))
+        srcdir = os.path.join(idir, "buildroot")
+        resultdir = os.path.join(outputdir, "results")
+
+        shutil.copyfile(os.path.join(outputdir, ".config"),
+                        os.path.join(resultdir, "config"))
+        shutil.copyfile(os.path.join(outputdir, "defconfig"),
+                        os.path.join(resultdir, "defconfig"))
+        shutil.copyfile(os.path.join(outputdir, "branch"),
+                        os.path.join(resultdir, "branch"))
+
+        def copy_if_exists(directory, src, dst=None):
+            if os.path.exists(os.path.join(outputdir, directory, src)):
+                shutil.copyfile(os.path.join(outputdir, directory, src),
+                                os.path.join(resultdir, src if dst is None else dst))
+
+        copy_if_exists("build", "build-time.log")
+        copy_if_exists("build", "packages-file-list.txt")
+        copy_if_exists("build", "packages-file-list-host.txt")
+        copy_if_exists("build", "packages-file-list-staging.txt")
+        copy_if_exists("legal-info", "manifest.csv", "licenses-manifest.csv")
+
+        subprocess.call(["git log -n 1 --pretty=format:%%H > %s" % \
+                        os.path.join(resultdir, "gitid")],
+                        shell=True, cwd=srcdir)
+
+        # Return True if the result should be rejected, False otherwise
+        def reject_results():
+            lastlines = decode_bytes(subprocess.Popen(
+                ["tail", "-n", "3", os.path.join(outputdir, "logfile")],
+                stdout=subprocess.PIPE).communicate()[0]).splitlines()
+
+            # Reject results where qemu-user refused to build
+            regexp = re.compile(r'^package/qemu/qemu.mk:.*Refusing to build qemu-user')
+            for line in lastlines:
+                if regexp.match(line):
+                    return True
+
+            return False
+
+        if reject_results():
+            return
+
+        def get_failure_reason():
+            # Output is a tuple (package, version), or None.
+            lastlines = decode_bytes(subprocess.Popen(
+                ["tail", "-n", "3", os.path.join(outputdir, "logfile")],
+                stdout=subprocess.PIPE).communicate()[0]).splitlines()
 
-        resultdir = os.path.join(idir, "output", "results")
-        os.mkdir(resultdir)
+            regexp = re.compile(r'make: \*\*\* .*/(?:build|toolchain)/([^/]*)/')
+            for line in lastlines:
+                m = regexp.search(line)
+                if m:
+                    return m.group(1).rsplit('-', 1)
 
-        ret = gen_config(**kwargs)
+            # not found
+            return None
+
+        def extract_end_log(resultfile):
+            """Save the last part of the build log, starting from the failed package"""
+
+            def extract_last_500_lines():
+                subprocess.call(["tail -500 %s > %s" % \
+                                (os.path.join(outputdir, "logfile"), resultfile)],
+                                shell=True)
+
+            reason = get_failure_reason()
+            if not reason:
+                extract_last_500_lines()
+            else:
+                f = open(os.path.join(outputdir, "logfile"), 'r')
+                mf = mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ)
+                mf.seek(0)
+                # Search for first action on the failed package
+                offset = mf.find(encode_str('>>> %s' % ' '.join(reason)))
+                if offset != -1:
+                    with open(resultfile, "w") as endlog:
+                        endlog.write(decode_bytes(mf[offset:]))
+                else:
+                    # not found, use last 500 lines as fallback
+                    extract_last_500_lines()
+
+                mf.close()
+                f.close()
+
+        extract_end_log(os.path.join(resultdir, "build-end.log"))
+
+        def copy_config_log_files():
+            """Recursively copy any config.log files from the failing package"""
+
+            reason = get_failure_reason()
+            if not reason:
+                return
+
+            srcroot = os.path.join(outputdir, "build", '-'.join(reason))
+            destroot = os.path.join(resultdir, '-'.join(reason))
+            config_files = ('config.log', 'CMakeCache.txt', 'CMakeError.log',
+                'CMakeOutput.log')
+
+            for root, dirs, files in os.walk(srcroot):
+                dest = os.path.join(destroot, os.path.relpath(root, srcroot))
+
+                for fname in files:
+                    if fname in config_files:
+                        if not os.path.exists(dest):
+                            os.makedirs(dest)
+                        shutil.copy(os.path.join(root, fname), os.path.join(dest, fname))
+
+        copy_config_log_files()
+
+        resultf = open(os.path.join(resultdir, "status"), "w+")
+        if result == 0:
+            resultf.write("OK")
+        elif result == -1:
+            resultf.write("NOK")
+        elif result == -2:
+            resultf.write("TIMEOUT")
+        resultf.close()
+
+        with open(os.path.join(resultdir, "submitter"), "w+") as submitterf:
+            submitterf.write(kwargs['submitter'])
+
+        # Yes, shutil.make_archive() would be nice, but it doesn't exist
+        # in Python 2.6.
+        ret = subprocess.call(["tar", "cjf", "results.tar.bz2", "results"],
+                            cwd=outputdir, stdout=log, stderr=log)
         if ret != 0:
-            log_write(kwargs['log'], "WARN: failed to generate configuration")
-            continue
+            log_write(log, "ERROR: could not make results tarball")
+            sys.exit(1)
+
+        if kwargs['upload']:
+            # Submit results. Yes, Python has some HTTP libraries, but
+            # none of the ones that are part of the standard library can
+            # upload a file without writing dozens of lines of code.
+            ret = subprocess.call(["curl", "-u",
+                                "%s:%s" % (kwargs['http_login'], kwargs['http_password']),
+                                "-H", "Expect:",
+                                "-F", "uploadedfile=@%s" % os.path.join(outputdir, "results.tar.bz2"),
+                                "-F", "uploadsubmit=1",
+                                kwargs['http_url']],
+                                stdout=log, stderr=log)
+            if ret != 0:
+                log_write(log, "INFO: results could not be submitted, %d" % ret)
+            else:
+                log_write(log, "INFO: results were submitted successfully")
+        else:
+            # No http login/password, keep tarballs locally
+            with open(os.path.join(outputdir, "results.tar.bz2"), 'rb') as f:
+                sha1 = hashlib.sha1(f.read()).hexdigest()
+            resultfilename = "instance-%d-%s.tar.bz2" % (kwargs['instance'], sha1)
+            os.rename(os.path.join(outputdir, "results.tar.bz2"), resultfilename)
+            log_write(log, "INFO: results saved as %s" % resultfilename)
+
+    def run_instance(self, **kwargs):
+        """Main per-instance loop
+
+        Prepare the build, generate a configuration, run the build, and submit the
+        results.
+        """
 
-        # Check if the build test is supposed to be a reproducible test
-        outputdir = os.path.abspath(os.path.join(idir, "output"))
-        with open(os.path.join(outputdir, ".config"), "r") as fconf:
-            reproducible = "BR2_REPRODUCIBLE=y\n" in fconf.read()
-        if reproducible:
-            ret = do_reproducible_build(**kwargs)
+        idir = "instance-%d" % kwargs['instance']
+
+        # If it doesn't exist, create the instance directory
+        if not os.path.exists(idir):
+            os.mkdir(idir)
+
+        if kwargs['debug']:
+            kwargs['log'] = sys.stdout
         else:
-            ret = do_build(**kwargs)
+            kwargs['log'] = open(os.path.join(idir, "instance.log"), "a+")
+        log_write(kwargs['log'], "INFO: instance started")
+
+        while True:
+            check_version()
+
+            ret = self.prepare_build(**kwargs)
+            if ret != 0:
+                continue
+
+            resultdir = os.path.join(idir, "output", "results")
+            os.mkdir(resultdir)
+
+            ret = self.gen_config(**kwargs)
+            if ret != 0:
+                log_write(kwargs['log'], "WARN: failed to generate configuration")
+                continue
+
+            # Check if the build test is supposed to be a reproducible test
+            outputdir = os.path.abspath(os.path.join(idir, "output"))
+            with open(os.path.join(outputdir, ".config"), "r") as fconf:
+                reproducible = "BR2_REPRODUCIBLE=y\n" in fconf.read()
+            if reproducible:
+                ret = self.do_reproducible_build(**kwargs)
+            else:
+                ret = self.do_build(**kwargs)
 
-        send_results(ret, **kwargs)
+            self.send_results(ret, **kwargs)
 
 # args / config file merging inspired by:
 # https://github.com/docopt/docopt/blob/master/examples/config_file_example.py
@@ -839,7 +840,8 @@ def main():
     buildpid = multiprocessing.Array('i', int(args['--ninstances']))
     processes = []
     for i in range(0, int(args['--ninstances'])):
-        p = multiprocessing.Process(target=run_instance, kwargs=dict(
+        builder = Builder()
+        p = multiprocessing.Process(target=builder.run_instance, kwargs=dict(
                 instance = i,
                 njobs = args['--njobs'],
                 sysinfo = sysinfo,
-- 
2.20.1
