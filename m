From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 8 Jun 2019 13:40:28 +0200
Subject: [Buildroot] [PATCH v2 2/3] autobuild-run: initial
 implementation of do_reproducible_build()
In-Reply-To: <20190607064657.3571-2-itsatharva@gmail.com>
References: <20190607064657.3571-1-itsatharva@gmail.com>
 <20190607064657.3571-2-itsatharva@gmail.com>
Message-ID: <1c7f8fdb-7e76-7352-f869-13c8c2c90784@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/06/2019 08:46, Atharva Lele wrote:
> This new function will call do_build() twice to produce two builds
> and then check their reproducibility

 This commit message is much more complete :-). Just a missing period at the end.

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - make clean outputs to devnull (suggested by arnout)
>   - remove unnecessary arguments to make clean (suggested by arnout)
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> ---
>  scripts/autobuild-run | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 5d76583..a4ddb5b 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -494,6 +494,46 @@ def do_build(**kwargs):
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
> +
> +    # Clean up build 1
> +    if kwargs['debug']:
> +        devnull = log
> +    else:
> +        devnull = open(os.devnull, "w")
> +    cmd = ["make", "O=%s" % outputdir, "clean"]
> +    subprocess.call(cmd, stdout=devnull, stderr=devnull)
> +
> +    # Start the second build
> +    log_write(log, "INFO: Reproducible Build Test, starting build 2")
> +    ret = do_build(**kwargs)
> +    if ret != 0:
> +        log_write(log, "INFO: build 2 failed")
> +        return ret
> +
> +    # Assuming both have built successfully
> +    ret = check_reproducibility(**kwargs)
> +    return ret
> +
>  def send_results(result, **kwargs):
>      """Prepare and store/send tarball with results
>  
> 
