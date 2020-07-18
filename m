From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jul 2020 22:55:11 +0200
Subject: [Buildroot] [PATCH buildroot-test] scripts/autobuild-run:
 properly delete output dir even with write-protected folders
In-Reply-To: <20200718201836.2408554-1-thomas.petazzoni@bootlin.com>
References: <20200718201836.2408554-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200718205511.GQ18825@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-07-18 22:18 +0200, Thomas Petazzoni spake thusly:
> We're already deleting the output directory before a new build with
> "rm -rf" so that write protected files are removed as well, which
> shutil.rmtree() doesn't do.
> 
> However "rm -rf" fails on write protected folders.
> 
> So instead, we do a recursive chmod +w, and then use shutil.rmtree()
> since we are now sure that all folders and files will have write
> permissions.
> 
> This solves an autobuild-run failure that occurs when the output
> directory cannot be deleted due to write-protected directories. This
> is happening with mender-artefact Go modules for example.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  scripts/autobuild-run | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index e475ea8..212e751 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -384,13 +384,14 @@ class Builder:
>  
>          # Create an empty output directory. We remove it first, in case a previous build was aborted.
>          if os.path.exists(self.outputdir):
> -            # shutil.rmtree doesn't remove write-protected files
> -            subprocess.call(["rm", "-rf", self.outputdir])
> +            subprocess.call(["chmod", "-R", "+w", self.outputdir])
> +            shutil.rmtree(self.outputdir)

Why can't we do as suggested in the docs:
    https://docs.python.org/3/library/shutil.html#rmtree-example

    def rm_ro(f, p, _):
        os.chmod(p, stat.S_IWRITE)
        f(p)

    shutil.rmtree(self.outputdir, onerror=rm_ro)

This is IMHO cleaner than calling to the shell...

I'm pretty sure a better python developper would write it with a
lambda, which would be even better! ;-)

Regards,
Yann E. MORIN.

>          os.mkdir(self.outputdir)
>  
>          # If it exists, remove the other output directory used for reproducibility testing
>          if os.path.exists(self.outputdir_2):
> -            subprocess.call(["rm", "-rf", self.outputdir_2])
> +            subprocess.call(["chmod", "-R", "+w", self.outputdir_2])
> +            shutil.rmtree(self.outputdir_2)
>          with open(os.path.join(self.outputdir, "branch"), "w") as branchf:
>              branchf.write(branch)
>  
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
