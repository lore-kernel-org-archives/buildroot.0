From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 12 Apr 2015 09:51:30 +0200
Subject: [Buildroot] [PATCH v2 08/10] autobuild-run: encapsulate
 subprocess calls
In-Reply-To: <1426693843-28792-9-git-send-email-dywi@mailerd.de>
References: <1426693843-28792-1-git-send-email-dywi@mailerd.de>
 <1426693843-28792-9-git-send-email-dywi@mailerd.de>
Message-ID: <CAHXCMMKOiZbjbiPK3R0SLfVZZdoQTae2BMEdgGzundOoOy+Baw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andr?, Thomas, all,

On Wed, Mar 18, 2015 at 4:50 PM, Andr? Erdmann <dywi@mailerd.de> wrote:
> Preparation step for passing LANG to worker (sub-)processes,
> allows to redirect stdin/stdout/stderr, which all default to devnull now
> unless specified otherwise.
> This makes the "yes"-pipe in "make oldconfig" redundant.
>
> Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
[...]
>
>      return 0
> @@ -459,6 +480,7 @@ def gen_config(**kwargs):
>
>      idir = "instance-%d" % kwargs['instance']
>      log = kwargs['log']
> +    sysinfo = kwargs['sysinfo']
>
>      # We need the absolute path to use with O=, because the relative
>      # path to the output directory here is not relative to the
> @@ -493,10 +515,7 @@ def gen_config(**kwargs):
>      with open(os.path.join(outputdir, ".config"), "w+") as configf:
>          configf.writelines(configlines)
>
> -    devnull = open(os.devnull, "w")
> -
> -    ret = subprocess.call(["yes '' 2>/dev/null| make O=%s -C %s oldconfig" % \
> -                           (outputdir, srcdir)], shell=True, stdout=devnull, stderr=devnull)
> +    ret = sysinfo.run_cmd(["make", "O=%s" % outputdir, "-C", srcdir, "oldconfig"])
Any reason to drop the yes pipe in the command?

>      if ret != 0:
>          log_write(log, "ERROR: cannot oldconfig")
>          return -1
> @@ -504,23 +523,20 @@ def gen_config(**kwargs):
>      # Now, generate the random selection of packages, and fixup
>      # things if needed.
>      while True:
> -        ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir,
> -                               "KCONFIG_PROBABILITY=%d" % randint(1,30), "randpackageconfig"],
> -                              stdout=devnull, stderr=devnull)
> +        ret = sysinfo.run_cmd(["make", "O=%s" % outputdir, "-C", srcdir,
> +                               "KCONFIG_PROBABILITY=%d" % randint(1,30), "randpackageconfig"])
>          if ret != 0:
>              log_write(log, "ERROR: cannot generate random configuration")
>              return -1
>          if fixup_config(**kwargs):
>              break
>
> -    ret = subprocess.call(["yes '' 2>/dev/null| make O=%s -C %s oldconfig" % \
> -                           (outputdir, srcdir)], shell=True, stdout=devnull, stderr=devnull)
> +    ret = sysinfo.run_cmd(["make", "O=%s" % outputdir, "-C", srcdir, "oldconfig"])
ditto

>      if ret != 0:
>          log_write(log, "ERROR: cannot oldconfig")
>          return -1
>
> -    ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir, "savedefconfig"],
> -                          stdout=devnull, stderr=devnull)
> +    ret = sysinfo.run_cmd(["make", "O=%s" % outputdir, "-C", srcdir, "savedefconfig"])
>      if ret != 0:
>          log_write(log, "ERROR: cannot savedefconfig")
>          return -1
[...]
> @@ -595,15 +613,14 @@ def send_results(result, **kwargs):
>          shutil.copyfile(os.path.join(outputdir, "legal-info", "manifest.csv"),
>                          os.path.join(resultdir, "licenses-manifest.csv"))
>
> -    subprocess.call(["git log master -n 1 --pretty=format:%%H > %s" % \
> +    sysinfo.run_cmd(["git log master -n 1 --pretty=format:%%H > %s" % \
>                       os.path.join(resultdir, "gitid")],
> -                    shell=True, cwd=srcdir)
> +                    shell=True, cwd=srcdir, stderr=None)
IIRC, stderr=None dumps the error output in the process error output,
so only available for the autobuilder owner.
So, how about log stderr in the log file using
sysinfo.run_cmd_get_output (stdout would be anyway redirected to
gitid, and stderr would be part of the log)?

>
>      def get_failure_reason():
>          # Output is a tuple (package, version), or None.
> -        lastlines = decode_bytes(subprocess.Popen(
> -            ["tail", "-n", "3", os.path.join(outputdir, "logfile")],
> -            stdout=subprocess.PIPE).communicate()[0]).splitlines()
> +        lastlines = sysinfo.run_cmd_get_stdout(
> +            ["tail", "-n", "3", os.path.join(outputdir, "logfile")])[1].splitlines()
>
>          regexp = re.compile(r'make: \*\*\* .*/(?:build|toolchain)/([^/]*)/')
>          for line in lastlines:
> @@ -618,9 +635,9 @@ def send_results(result, **kwargs):
>          """Save the last part of the build log, starting from the failed package"""
>
>          def extract_last_500_lines():
> -            subprocess.call(["tail -500 %s > %s" % \
> +            sysinfo.run_cmd(["tail -500 %s > %s" % \
>                               (os.path.join(outputdir, "logfile"), resultfile)],
> -                            shell=True)
> +                            shell=True, stderr=None)
ditto

>
>          reason = get_failure_reason()
>          if not reason:
> @@ -677,8 +694,8 @@ def send_results(result, **kwargs):
>
>      # Yes, shutil.make_archive() would be nice, but it doesn't exist
>      # in Python 2.6.
> -    ret = subprocess.call(["tar", "cjf", "results.tar.bz2", "results"],
> -                          cwd=outputdir, stdout=log, stderr=log)
> +    ret = sysinfo.run_cmd_write_to(
> +        log, ["tar", "cjf", "results.tar.bz2", "results"], cwd=outputdir)
>      if ret != 0:
>          log_write(log, "ERROR: could not make results tarball")
>          sys.exit(1)
> @@ -687,13 +704,14 @@ def send_results(result, **kwargs):
>          # Submit results. Yes, Python has some HTTP libraries, but
>          # none of the ones that are part of the standard library can
>          # upload a file without writing dozens of lines of code.
> -        ret = subprocess.call(["curl", "-u",
> -                               "%s:%s" % (kwargs['http_login'], kwargs['http_password']),
> -                               "-H", "Expect:",
> -                               "-F", "uploadedfile=@%s" % os.path.join(outputdir, "results.tar.bz2"),
> -                               "-F", "uploadsubmit=1",
> -                               "http://autobuild.buildroot.org/submit/"],
> -                              stdout=log, stderr=log)
> +        ret = sysinfo.run_cmd_write_to(
> +            log,
> +            ["curl", "-u",
> +             "%s:%s" % (kwargs['http_login'], kwargs['http_password']),
> +             "-H", "Expect:",
> +             "-F", "uploadedfile=@%s" % os.path.join(outputdir, "results.tar.bz2"),
> +             "-F", "uploadsubmit=1",
> +             "http://autobuild.buildroot.org/submit/"])
>          if ret != 0:
>              log_write(log, "INFO: results could not be submitted, %d" % ret)
>          else:
> --
> 2.3.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
