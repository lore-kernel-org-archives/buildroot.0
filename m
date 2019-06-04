From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jun 2019 16:26:21 +0200
Subject: [Buildroot] [PATCH 3/3] autobuild-run: initial implementation
 of check_reproducibility()
In-Reply-To: <20190603091808.2928-3-itsatharva@gmail.com>
References: <20190603091808.2928-1-itsatharva@gmail.com>
 <20190603091808.2928-3-itsatharva@gmail.com>
Message-ID: <6e5f9452-d277-5fae-908d-470135390980@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Atharva,

On 03/06/2019 11:18, Atharva Lele wrote:
> Find out differences in built images, if any
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> ---
>  scripts/autobuild-run | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 329803a..0e24211 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -394,6 +394,44 @@ def stop_on_build_hang(monitor_thread_hung_build_flag,
>                  break
>          monitor_thread_stop_flag.wait(30)
>  
> +def check_reproducibility(**kwargs):
> +    """Check reproducibility of builds
> +
> +    Use diffoscope on the built images, if diffoscope is not
> +    installed, fallback to cmp
> +    """
> +
> +    log = kwargs['log']
> +    idir = "instance-%d" % kwargs['instance']
> +    outputdir = os.path.join(idir, "output")
> +    diffoscope_output = os.path.join(outputdir, "diffoscope-results.txt")

 Put it directly in the results directory, i.e.
os.path.join(outputdir, "results", "diffoscope.txt")
That way, it becomes part of the results tarball and will get uploaded to the
server. And it may even appear on the website without any further change.

> +    # Using only tar images for now
> +    build_1_image = os.path.join(outputdir, "images-1", "rootfs.tar")
> +    build_2_image = os.path.join(outputdir, "images", "rootfs.tar")

 How can we be sure that a tarball is generated?

> +
> +    # Prefix to point diffoscope towards cross-tools
> +    prefix = subprocess.check_output(["make", "printvars", "VARS=TARGET_CROSS"])

 Don't you need to pass the -C and O= options here?

> +    # Remove TARGET_CROSS= and \n from the string
> +    prefix = prefix[13:-1]
> +
> +    try:
> +        log_write(log, "INFO: running diffoscope on images")
> +        ret = subprocess.call(["diffoscope", build_1_image, build_2_image,
> +                            "--tool-prefix-binutils", prefix,
> +                            "--text", diffoscope_output])

 Use kwargs['sysinfo'].has("diffoscope") to check availability, rather than
handling the exception. Though Yann may havea different opinion on that.

> +    except OSError as e:
> +        if e.errno == errno.ENOENT:
> +            log_write(log, "INFO: diffoscope not installed, falling back to cmp")
> +        ret = subprocess.call(["cmp", "build_1_image", "build_2_image", "-b", ">", diffoscope_output])
> +    
> +    if ret != 0:
> +        log_write(log, "INFO: Build is non-reproducible.")
> +        return -1

 Return -3 here, and handle -3 in send_results. For the time being, it should
still be NOK, but later the web frontend can be updated to also accept NREP or
something like that as a result.

> +    
> +    # rootfs images match byte-for-byte -> reproducible image
> +    log_write(log, "INFO: Build is reproducible!")

 We don't have a "Success" log message for the normal build, so no need to add
one for reproducible I guess.

 Regards,
 Arnout

> +    return 0
> +
>  def do_build(**kwargs):
>      """Run the build itself"""
>  
> 
