From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jun 2019 16:11:24 +0200
Subject: [Buildroot] [PATCH 2/3] autobuild-run: initial implementation
 of do_reproducible_build()
In-Reply-To: <20190603091808.2928-2-itsatharva@gmail.com>
References: <20190603091808.2928-1-itsatharva@gmail.com>
 <20190603091808.2928-2-itsatharva@gmail.com>
Message-ID: <05ad9712-a908-5739-d97c-f774e85cea2b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/06/2019 11:18, Atharva Lele wrote:
> This new function will call do_build() twice to produce two builds
> and then check their reproducibility
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> ---
>  scripts/autobuild-run | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 9f8aabb..329803a 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -455,6 +455,44 @@ def do_build(**kwargs):
>      log_write(log, "INFO: build successful")
>      return 0
>  
> +def do_reproducible_build(**kwargs):
> +    """Run the builds for reproducibility testing
> +
> +    Build twice with the same configuration. Calls do_build() to
> +    perform the actual build.
> +    """
> +
> +    idir = "instance-%d" % kwargs['instance']
> +    outputdir = os.path.join(idir, "output")
> +    f = open(os.path.join(outputdir, "logfile"), "w+")
> +    log = kwargs['log']
> +    
> +    # Start the first build
> +    log_write(log, "INFO: Reproducible Build Test, starting build 1")
> +    ret = do_build(**kwargs)
> +    if ret != 0:
> +        log_write(log, "INFO: build 1 failed, skipping build 2")
> +        return ret
> +    
> +    # First build has been built, move files and start build 2
> +    os.rename(os.path.join(outputdir, "images"), os.path.join(outputdir, "images-1"))

 I would actually prefer to do the second build in a different output directory,
so we have at least two differences that can be checked (time and path).

 It could be done my adding outputdir to kwargs and calculating it once in the
prepare step. Note that because kwargs is a dict, it is possible for the
prepare_build function to update it and it will become visible to the other
functions.

 However, that can be done in a later patch. Or if you want to do it now, it
should be done as a first patch (moving outputdir into kwargs).

> +
> +    # Clean up build 1
> +    cmd = ["make", "O=%s" % outputdir, "clean"] \
> +          + kwargs['make_opts'].split()

 Too much copying from do_build() :-) make_opts isn't needed here.

> +    subprocess.call(cmd, stdout=f, stderr=f)

 Better move the opening of the logfile here, and do it with with:. Yes,
do_build doesn't do it that way, but it should :-). Actually, I'd prefer this to
be redirected to devnull like is done in gen_config(): make clean doesn't
generate interesting output.

 Note that if the second build would be done in a different output dir, this
wouldn't be needed. It should be sufficient to copy the .config file to the new
output dir and run do_build again. But then, of course, the second output dir
should also be removed by prepare.


> +    # Start the second build
> +    log_write(log, "INFO: Reproducible Build Test, starting build 2")
> +    ret = do_build(**kwargs)

 It probably isn't needed for the second build to repeat legal-info. But that
shouldn't make much of a difference anyway, so OK.

 Regards,
 Arnout

> +    if ret != 0:
> +        log_write(log, "INFO: build 2 failed")
> +        return ret
> +
> +    # Assuming both have built successfully
> +    ret = check_reproducibility()
> +    return ret
> +
>  def send_results(result, **kwargs):
>      """Prepare and store/send tarball with results
>  
> 
