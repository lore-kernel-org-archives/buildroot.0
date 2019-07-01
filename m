From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Jul 2019 00:16:06 +0200
Subject: [Buildroot] [PATCH 01/27] autobuild-run: introduce Builder class
In-Reply-To: <20190629050214.17852-1-itsatharva@gmail.com>
References: <20190629050214.17852-1-itsatharva@gmail.com>
Message-ID: <6d6d9083-d38f-88da-2d73-3f3b5eaa04ce@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/06/2019 07:01, Atharva Lele wrote:
> Various functions in the autobuild-run script use a lot of common data.
> To make it easier to work with, create a Builder class.
> 
> For ease of review, this commit only introduces the Builder class but
> does not actually use it for anything. Subsequent patches will do that.
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
[snip]
> -    cmd = ["nice", "-n", str(nice),
> -            "make", "O=%s" % outputdir,
> -            "-C", srcdir, "BR2_DL_DIR=%s" % dldir,
> -            "BR2_JLEVEL=%s" % kwargs['njobs']] \
> -          + kwargs['make_opts'].split()
> +        cmd = ["nice", "-n", str(nice),
> +               "make", "O=%s" % outputdir,
> +               "-C", srcdir, "BR2_DL_DIR=%s" % dldir,
> +               "BR2_JLEVEL=%s" % kwargs['njobs']] \
> +            + kwargs['make_opts'].split()

 Here the original whitespace was not good and you fix it in the same patch.
Fair enough.

[snip]
> -    cmd = ["make", "O=%s" % outputdir, "-C", srcdir,
> -            "BR2_DL_DIR=%s" % dldir, "legal-info"] \
> -          + kwargs['make_opts'].split()
> +        cmd = ["make", "O=%s" % outputdir, "-C", srcdir,
> +               "BR2_DL_DIR=%s" % dldir, "legal-info"] \
> +            + kwargs['make_opts'].split()

 Same here.

[snip]
> -    subprocess.call(["git log -n 1 --pretty=format:%%H > %s" % \
> -                     os.path.join(resultdir, "gitid")],
> -                    shell=True, cwd=srcdir)
> +        subprocess.call(["git log -n 1 --pretty=format:%%H > %s" % \
> +                        os.path.join(resultdir, "gitid")],
> +                        shell=True, cwd=srcdir)

 Still a small whitespace error here...

[snip]
> -	# Reject results where qemu-user refused to build
> -	regexp = re.compile(r'^package/qemu/qemu.mk:.*Refusing to build qemu-user')
> -	for line in lastlines:
> -	    if regexp.match(line):
> -		return True
> -
> -	return False
> +            # Reject results where qemu-user refused to build
> +            regexp = re.compile(r'^package/qemu/qemu.mk:.*Refusing to build qemu-user')
> +            for line in lastlines:
> +                if regexp.match(line):
> +                    return True
> +
> +            return False

 Here also the original was wrong, using tabs instead of spaces.

[snip]
> -        def extract_last_500_lines():
> -            subprocess.call(["tail -500 %s > %s" % \
> -                             (os.path.join(outputdir, "logfile"), resultfile)],
> -                            shell=True)
> +            def extract_last_500_lines():
> +                subprocess.call(["tail -500 %s > %s" % \
> +                                (os.path.join(outputdir, "logfile"), resultfile)],
> +                                shell=True)

 Another whitespace error you introduced.

> -        ret = subprocess.call(["curl", "-u",
> -                               "%s:%s" % (kwargs['http_login'], kwargs['http_password']),
> -                               "-H", "Expect:",
> -                               "-F", "uploadedfile=@%s" % os.path.join(outputdir, "results.tar.bz2"),
> -                               "-F", "uploadsubmit=1",
> -                               kwargs['http_url']],
> -                              stdout=log, stderr=log)
> +            ret = subprocess.call(["curl", "-u",
> +                                   "%s:%s" % (kwargs['http_login'], kwargs['http_password']),
> +                                   "-H", "Expect:",
> +                                   "-F", "uploadedfile=@%s" % os.path.join(outputdir, "results.tar.bz2"),
> +                                   "-F", "uploadsubmit=1",
> +                                   kwargs['http_url']],
> +                                   stdout=log, stderr=log)


 And another whitespace error you introduced.


 Thomas, perhaps you can fix those three while applying?

 With the three whitespace errors fixed:
 Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout
