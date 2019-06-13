From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Jun 2019 21:53:34 +0200
Subject: [Buildroot] [PATCH v3 1/3] autobuild-run: initial
 implementation of check_reproducibility()
In-Reply-To: <20190611123416.11533-1-itsatharva@gmail.com>
References: <20190611123416.11533-1-itsatharva@gmail.com>
Message-ID: <20190613195334.GK2647@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Atharva, All,

On 2019-06-11 18:04 +0530, Atharva Lele spake thusly:
> For reproducible builds, we want to find out if there are any differences
> between two builds having the same configuration, and to find the reason behind
> them. The diffoscope tool looks inside different types of files to see where the
> differences lie.
> 
> check_reproducibility() runs diffoscope on two output directories which are
> expected in output/images and output/images-1. Since it uses objdump, it needs
> to be provided the cross-compile prefix which is derived from the TARGET_CROSS
> variable.
> 
> Since diffoscope may not be installed, we fall back to cmp for byte-by-byte
> comparison. We add diffoscope to list of optional programs to avoid repeated
> checking of its presence.
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>

Except for two minor coding rules (see below):

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

However, for the future: it would be wonderfull if we could entice the
diffoscope developers to make it possible to use it directly from
python: diffoscope *is* a python module, after all.

However, it is cutrrently not very amenable at being used as a python
object (yet):

diffoscope.main():
    https://salsa.debian.org/reproducible-builds/diffoscope/blob/master/diffoscope/main.py#L695

which is a glorified wrapper to diffoscope.run_diffoscope():
    https://salsa.debian.org/reproducible-builds/diffoscope/blob/master/diffoscope/main.py#L600

which is itself a further glofied wrapper to diffoscope.compare_root_paths()
and diffoscope.Difference()...

But that's for later.

> ---
> Changes v2 -> v3:
>   - Use file size of reproducible_results to check reproducibility status, rather than
>     exit status of cmp or diff (suggested by arnout)
>   - Rename results file (diffoscope_output.txt -> reproducible_results) to avoid confusion
>   - Change handling of diffoscope output text file using with open()
>   - Changed commit message to have all necessary info (suggested by arnout)
>   - Removed leftover code from when I was using an exception to handle
>     diffoscope presense (thanks to arnout)
> 
> Changes v1 -> v2:
>   - move diffoscope output to results dir (suggested by arnout)
>   - fix make printvars call
>   - Add diffoscope to DEFAULT_OPTIONAL_PROGS
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> ---
>  scripts/autobuild-run | 39 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 190a254..ba5b337 100755
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
> @@ -394,6 +394,43 @@ def stop_on_build_hang(monitor_thread_hung_build_flag,
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
> +    reproducible_results = os.path.join(outputdir, "results", "reproducible_results")
> +    # Using only tar images for now
> +    build_1_image = os.path.join(outputdir, "images-1", "rootfs.tar")
> +    build_2_image = os.path.join(outputdir, "images", "rootfs.tar")
> +
> +    with open(reproducible_results, 'w') as diff:
> +        if kwargs['sysinfo'].has("diffoscope"):
> +            # Prefix to point diffoscope towards cross-tools
> +            prefix = subprocess.check_output(["make", "O=%s" % outputdir, "-C", srcdir, "printvars", "VARS=TARGET_CROSS"])
> +            # Remove TARGET_CROSS= and \n from the string
> +            prefix = prefix[13:-1]
> +            log_write(log, "INFO: running diffoscope on images")
> +            subprocess.call(["diffoscope", build_1_image, build_2_image,
> +                                "--tool-prefix-binutils", prefix], stdout=diff, stderr=log)
> +        else:
> +            log_write(log, "INFO: diffoscope not installed, falling back to cmp")
> +            subprocess.call(["cmp", "-b", "build_1_image", "build_2_image"], stdout=diff, stderr=log)
> +    

They are invisible, but this empty line has 4 spaces.

> +    if os.stat(reproducible_results).st_size > 0:
> +        log_write(log, "INFO: Build is non-reproducible.")
> +        return -1
> +    

Ditto.

Regards,
Yann E. MORIN.

> +    # rootfs images match byte-for-byte -> reproducible image
> +    log_write(log, "INFO: Build is reproducible!")
> +    return 0
> +
>  def do_build(**kwargs):
>      """Run the build itself"""
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
