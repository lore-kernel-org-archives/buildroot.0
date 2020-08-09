From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Aug 2020 11:40:58 +0200
Subject: [Buildroot] [PATCH buildroot-test v2] scripts/autobuild-run:
 properly delete output dir even with write-protected folders
In-Reply-To: <20200808211712.1013417-1-thomas.petazzoni@bootlin.com>
References: <20200808211712.1013417-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200809094058.GQ2186@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-08-08 23:17 +0200, Thomas Petazzoni spake thusly:
> We're already deleting the output directory before a new build with
> "rm -rf" so that write protected files are removed as well, which
> shutil.rmtree() doesn't do.
> 
> However "rm -rf" fails on write protected folders.
> 
> So instead, switch back to using shutil.rmtree(), with an error
> handling function that takes care of setting write permissions if
> needed.

    ... that takes care of setting permissions sufficient to allow removal:

      - rwx on directories, so we can readdir() and traverse directories,
        and remove them,

      - rw on files, so we can remove them.

But see also a comment later on [0]...

> This solves an autobuild-run failure that occurs when the output
> directory cannot be deleted due to write-protected directories. This
> is happening with mender-artefact Go modules for example.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> 
> Changes since v1:
> 
> - Instead of calling "chmod +x" as a shell command, use the "onerror"

'chmod +r', not '+x' ;-) No worries, that's not in the commit log.

>   callback of shutil.rmtree() to properly set permissions. Compared to
>   what Yann E. Morin had suggested, we need to not just set the write
>   permission, but also other permissions: if only the write permission
>   is there, we can't enter a directory.
> 
>   Note that we considered reading the existing permission with
>   os.stat(), and then adding just the write permission on top of
>   that. But during our testing, we ended up with a folder with only
>   write permissions (due to testing a previous version that was only
>   setting the write permission) and that was causing shutil.rmtree()
>   to fail. So to be on the safe side, we simply reset the permissions
>   to something we know we will be able to delete.
> 
>  scripts/autobuild-run | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index e475ea8..856c1bf 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -139,6 +139,7 @@ import re
>  import shutil
>  import signal
>  import subprocess
> +import stat
>  import sys
>  from time import localtime, strftime
>  from distutils.version import StrictVersion
> @@ -176,6 +177,14 @@ else:
>  HUNG_BUILD_TIMEOUT = 120 # mins
>  VERSION = 1
>  
> +def rm_ro(f, p, _):
> +    os.chmod(os.path.dirname(p), stat.S_IREAD | stat.S_IWRITE | stat.S_IEXEC)
> +    if os.path.isdir(p):
> +        os.chmod(p, stat.S_IREAD | stat.S_IWRITE | stat.S_IEXEC)
> +    else:
> +        os.chmod(p, stat.S_IREAD | stat.S_IWRITE)
> +    f(p)

[0] we don't care if the files end up with the 'x' bit set before we
remove them, so you could simplify the code by always setting rwx, and
not care whether this is a directory or a file.

Also, you could use stat.S_IRWXU, which is a combination of
stat.S_IREAD, stat.S_IWRITE, and stat.S_IEXEC.

    def rm_ro(f, p, _):
        os.chmod(os.path.dirname(p), stat.S_IRWXU)
        os.chmod(p, stat.S_IRWXU)
        f(p)

And you could have defined the function just above the code that uses
it, i.e. ...

>  def log_write(logf, msg):
>      logf.write("[%s] %s\n" % (strftime("%a, %d %b %Y %H:%M:%S", localtime()), msg))
>      logf.flush()
> @@ -384,13 +393,12 @@ class Builder:
>  

... right here, as a sub-function of prepare_build(), but this is a
minor detail.

Regards,
Yann E. MORIN.

>          # Create an empty output directory. We remove it first, in case a previous build was aborted.
>          if os.path.exists(self.outputdir):
> -            # shutil.rmtree doesn't remove write-protected files
> -            subprocess.call(["rm", "-rf", self.outputdir])
> +            shutil.rmtree(self.outputdir, onerror=rm_ro)
>          os.mkdir(self.outputdir)
>  
>          # If it exists, remove the other output directory used for reproducibility testing
>          if os.path.exists(self.outputdir_2):
> -            subprocess.call(["rm", "-rf", self.outputdir_2])
> +            shutil.rmtree(self.outputdir_2, onerror=rm_ro)
>          with open(os.path.join(self.outputdir, "branch"), "w") as branchf:
>              branchf.write(branch)
>  
> -- 
> 2.26.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
