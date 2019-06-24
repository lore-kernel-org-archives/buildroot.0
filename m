From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Jun 2019 23:22:17 +0200
Subject: [Buildroot] [PATCH 01/19] autobuild-run: introduce Builder class
In-Reply-To: <20190621084730.16411-1-itsatharva@gmail.com>
References: <20190621084730.16411-1-itsatharva@gmail.com>
Message-ID: <148549d6-345b-e6fa-4217-095dea5f2454@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/06/2019 10:47, Atharva Lele wrote:
> Various functions in the autobuild-run script use a lot of common data.
> To make it easier to work with, create a Builder class.
> 
> For ease of review, this commit only introduces the Builder class but
> does not actually use it for anything. Subsequent patches will do that.
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Still a small whitespace nit...


> +            log_write(log, "INFO: removing %s from downloads" %
> +                    os.path.relpath(f, dldir))

 Continuation line is no longer properly indented.

> +            os.remove(f)
> +
> +        branch = get_branch()
> +        log_write(log, "INFO: testing branch '%s'" % branch)
> +
> +        # Clone Buildroot. This only happens if the source directory
> +        # didn't exist already.
> +        srcdir = os.path.join(idir, "buildroot")
> +        if not os.path.exists(srcdir):
> +            ret = subprocess.call(["git", "clone", kwargs['repo'], srcdir],
> +                                stdout=log, stderr=log)

 Same here.

[snip]
> +        args = [os.path.join(srcdir, "utils/genrandconfig"),
> +                "-o", outputdir, "-b", srcdir]

 And here.

[snip]
> +    def stop_on_build_hang(self, monitor_thread_hung_build_flag,
> +                        monitor_thread_stop_flag,
> +                        sub_proc, outputdir, log):

 And here.

[snip]
> +        cmd = ["nice", "-n", str(nice),
> +                "make", "O=%s" % outputdir,
> +                "-C", srcdir, "BR2_DL_DIR=%s" % dldir,
> +                "BR2_JLEVEL=%s" % kwargs['njobs']] \

 And here it's indented too much.

> +            + kwargs['make_opts'].split()
> +        sub = subprocess.Popen(cmd, stdout=f, stderr=f)
> +
> +        # Setup hung build monitoring thread
> +        monitor_thread_hung_build_flag = Event()
> +        monitor_thread_stop_flag = Event()
> +        build_monitor = Thread(target=self.stop_on_build_hang,
> +                            args=(monitor_thread_hung_build_flag,

 Not enough again.

> +                                    monitor_thread_stop_flag,
> +                                    sub, outputdir, log))
[snip]
> +        cmd = ["make", "O=%s" % outputdir, "-C", srcdir,
> +                "BR2_DL_DIR=%s" % dldir, "legal-info"] \

 Too much.

> +            + kwargs['make_opts'].split()
> +        ret = subprocess.call(cmd, stdout=f, stderr=f)
> +        if ret != 0:
> +            log_write(log, "INFO: build failed during legal-info")
> +            return -1
> +        log_write(log, "INFO: build successful")
> +        return 0
[snip]
> +            def extract_last_500_lines():
> +                subprocess.call(["tail -500 %s > %s" % \
> +                                (os.path.join(outputdir, "logfile"), resultfile)],

 Here too.

> +                                shell=True)
[snip]
> +        ret = subprocess.call(["tar", "cjf", "results.tar.bz2", "results"],
> +                            cwd=outputdir, stdout=log, stderr=log)

 And here.


 There may be more that I missed...

 Just make sure four spaces are added everywhere.

 Regards,
 Arnout

[snip]
