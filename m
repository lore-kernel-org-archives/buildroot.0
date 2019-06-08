From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 8 Jun 2019 13:37:48 +0200
Subject: [Buildroot] [PATCH v2 1/3] autobuild-run: initial
 implementation of check_reproducibility()
In-Reply-To: <20190607064657.3571-1-itsatharva@gmail.com>
References: <20190607064657.3571-1-itsatharva@gmail.com>
Message-ID: <6771e19f-9ec2-4698-00b0-85944ade60c4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Atharva,

On 07/06/2019 08:46, Atharva Lele wrote:
> Find out differences in built images, if any
> 
> Add diffoscope to list of optional programs

 The commit message could use a little more love. For sure, sentences should be
sentences, so end with a period. But also the flow could be improved a bit, like:

For reproducible builds, we want to be able to tell there are differences
between two builds of the same configuration, and also to pinpoint why these
differences happen. The diffoscope tool looks inside different kinds of files
and identifies exactly where the differences come from.

check_reproduciblity() runs the diffoscope tool on two output directories, which
are expected to be in output/images and output/images-1. diffoscope uses
objdump, so it needs to the cross-compile prefix; this is retrieved from the
TARGET_CROSS variable.

Since the diffoscope tool may not be installed, fall back to cmp if it isn't.
Add diffoscope to the list of optional programs to avoid checking for its
presence over and over.

> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - move diffoscope output to results dir (suggested by arnout)
>   - fix make printvars call
>   - Add diffoscope to DEFAULT_OPTIONAL_PROGS
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> ---
>  scripts/autobuild-run | 41 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index ef2f2a5..5d76583 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -204,7 +204,7 @@ def get_branch():
>  
>  class SystemInfo:
>      DEFAULT_NEEDED_PROGS = ["make", "git", "gcc"]
> -    DEFAULT_OPTIONAL_PROGS = ["bzr", "java", "javac", "jar"]
> +    DEFAULT_OPTIONAL_PROGS = ["bzr", "diffoscope", "java", "javac", "jar"]
>  
>      def __init__(self):
>          self.needed_progs = list(self.__class__.DEFAULT_NEEDED_PROGS)
> @@ -394,6 +394,45 @@ def stop_on_build_hang(monitor_thread_hung_build_flag,
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
> +    srcdir = os.path.join(idir, "buildroot")
> +    diffoscope_output = os.path.join(outputdir, "results", "diffoscope-results.txt")
> +    # Using only tar images for now

 Actually, why? We could just pass the entire directory to diffoscope, no? Some
packages install additional images which we also want to compare, e.g. xen.

 Hm, that would make the cmp part more difficult though... So let's keep it like
this for the time being.


> +    build_1_image = os.path.join(outputdir, "images-1", "rootfs.tar")
> +    build_2_image = os.path.join(outputdir, "images", "rootfs.tar")
> +
> +    # Prefix to point diffoscope towards cross-tools
> +    prefix = subprocess.check_output(["make", "O=%s" % outputdir, "-C", srcdir, "printvars", "VARS=TARGET_CROSS"])
> +    # Remove TARGET_CROSS= and \n from the string
> +    prefix = prefix[13:-1]

 Since this is only used for diffoscope, move it inside the condition.

> +
> +    if kwargs['sysinfo'].has("diffoscope"):
> +        log_write(log, "INFO: running diffoscope on images")
> +        ret = subprocess.call(["diffoscope", build_1_image, build_2_image,
> +                            "--tool-prefix-binutils", prefix,
> +                            "--text", diffoscope_output])
> +    else:
> +        if e.errno == errno.ENOENT:

 Please test your patch before submitting :-) This is a leftover from when you
used an exception. It is no longer valid.

> +            log_write(log, "INFO: diffoscope not installed, falling back to cmp")
> +        ret = subprocess.call(["cmp", "build_1_image", "build_2_image", "-b", ">", diffoscope_output])

 Again, you haven't tested this. If you want to use shell redirection, you have
to add shell=True argument. However, you shouldn't do that; instead, use
stdout=open(diffoscope_output, 'w'). So:

        ret = subprocess.coll(["cmp", "-b", build_1_image, build_2_image],
                              stdout=open(diffoscope_output, 'w'))

 Even better would be to do it with a 'with' construct for opening the output file.

 Regards,
 Arnout

> +    
> +    if ret != 0:
> +        log_write(log, "INFO: Build is non-reproducible.")
> +        return -1
> +    
> +    # rootfs images match byte-for-byte -> reproducible image
> +    log_write(log, "INFO: Build is reproducible!")
> +    return 0
> +
>  def do_build(**kwargs):
>      """Run the build itself"""
>  
> 
