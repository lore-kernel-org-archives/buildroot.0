From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Jun 2019 22:13:58 +0200
Subject: [Buildroot] [PATCH v3 2/3] autobuild-run: initial
 implementation of do_reproducible_build()
In-Reply-To: <20190611123416.11533-2-itsatharva@gmail.com>
References: <20190611123416.11533-1-itsatharva@gmail.com>
 <20190611123416.11533-2-itsatharva@gmail.com>
Message-ID: <20190613201358.GL2647@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Atharva, All,

On 2019-06-11 18:04 +0530, Atharva Lele spake thusly:
> This new function will call do_build() twice to produce two builds
> and then check their reproducibility.
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Yet, a few comments, see below...

> ---
> Changes v2 -> v3:
>   - make clean outputs to logfile, similar to other make calls (suggested by y_morin)
>   - Output dir needs abspath (suggested by y_morin)
>   - Directly use make clean as arguments rather than putting it into a variable
>   - Added missing period at end of commit message (suggested by arnout)
> 
> Changes v1 -> v2:
>   - make clean outputs to devnull (suggested by arnout)
>   - remove unnecessary arguments to make clean (suggested by arnout)
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> ---
>  scripts/autobuild-run | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index ba5b337..5ba6092 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -492,6 +492,43 @@ def do_build(**kwargs):
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
> +    outputdir = os.path.abspath(os.path.join(idir, "output"))
> +    srcdir = os.path.join(idir, "buildroot")
> +    log = kwargs['log']
> +    

Empty line made of spaces.

> +    # Start the first build
> +    log_write(log, "INFO: Reproducible Build Test, starting build 1")
> +    ret = do_build(**kwargs)
> +    if ret != 0:
> +        log_write(log, "INFO: build 1 failed, skipping build 2")
> +        return ret
> +    

Ditto.

> +    # First build has been built, move files and start build 2
> +    os.rename(os.path.join(outputdir, "images"), os.path.join(outputdir, "images-1"))
> +
> +    # Clean up build 1
> +    f = open(os.path.join(outputdir, "logfile"), "w+")
> +    subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir, "clean"], stdout=f, stderr=f)

Since we do create a small Makefile wrapper in $(O), you could simplify
this a little with:

    subprocess.call(["make", "-C", outputdir, "clean"], stdout=f, stderr=f)

Ditto in the existing do_build() function. Can be improved upon when you
introduce the Builder class.

Regards,
Yann E. MORIN.

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
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
