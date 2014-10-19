From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 19 Oct 2014 21:13:18 +0200
Subject: [Buildroot] [PATCH 1/1] autobuild-run: Include the config.log
 file (when it exists) in the tarball
In-Reply-To: <1411826377-17221-1-git-send-email-romain.naour@openwide.fr>
References: <1411826377-17221-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <CAAXf6LU6iynfof4gTFWdsz_KeaW5=zg9MBgKFp7f57NiYCES0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Sat, Sep 27, 2014 at 3:59 PM, Romain Naour <romain.naour@openwide.fr> wrote:
> When a build error occurs, a line like this one is present in the log file:
> make: *** [full_path_to_the_last_package/.stamp_*] Error 2
>
> Simply extract the path to the package build directory and check if a file
> named config.log exists. If this package used autotools then the config.log
> file should be present.
>
> Also, it's likely that the "Error" line is in the log's last lines,
> so read the log from the end.
>
> When the config.log file is found, it only remains to copy it to the
> results directory.
>

I had not seen this patch and independently handled this TODO item,
until Thomas Petazzoni mentioned to me that you had sent an earlier
patch.

Below some comments after having written my own implementation (that
I'm about to send).

> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  scripts/autobuild-run | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 7497001..496e66d 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -50,9 +50,6 @@
>  #
>  # - Add LC_ALL=C where appropriate.
>  #
> -# - Include the config.log file (when it exists) in the tarball for
> -#   failed builds when the failure occurs on an autotools package.
> -#
>  # - Instead of excluding all configurations that have
>  #   BR2_PACKAGE_CLASSPATH=y, improve the script to detect whether the
>  #   necessary host machine requirements are there to build classpath.
> @@ -70,6 +67,7 @@ import sys
>  import hashlib
>  import argparse
>  import ConfigParser
> +import re
>
>  MAX_DURATION = 60 * 60 * 4
>  VERSION = 1
> @@ -399,6 +397,8 @@ def send_results(instance, http_login, http_password, submitter, log, result):
>      outputdir = os.path.abspath(os.path.join(idir, "output"))
>      srcdir = os.path.join(idir, "buildroot")
>      resultdir = os.path.join(outputdir, "results")
> +    logfile = os.path.join(outputdir, "logfile")
> +    packagedir = ''
>
>      os.mkdir(resultdir)
>
> @@ -413,11 +413,25 @@ def send_results(instance, http_login, http_password, submitter, log, result):
>          shutil.copyfile(os.path.join(outputdir, "legal-info", "manifest.csv"),
>                          os.path.join(resultdir, "licenses-manifest.csv"))
>
> +    if result == -1:
> +        # Find the config.log file in the failing package directory
> +        # and copy it (when it exists) to results directory.
> +        f = open(logfile, "r")
> +        for line in reversed(f.readlines()):
> +            if re.match("(.*)/.stamp_(.*)", line):
> +                packagedir = line[line.find("[")+1:line.find("]")]
> +                packagedir = re.sub('\.stamp_(.*)$', '', packagedir)
> +                break

Here you are implementing a new logic to find the failure package. I
haven't checked the details, but it's a different logic than the one
used in the result importing script (web/import.inc.php).  It seems
logical to me to use the same kind of logic.

Note also that here you're reading the entire logfile in a buffer just
to read the last few lines.

Finally, the logfile is not closed, a construct like:

with open(...) as f:
    xxxx

is more pythonic and will automatically close the file at the end of the block.

> +        if os.path.isdir(packagedir):
> +            configfile = os.path.abspath(os.path.join(packagedir, "config.log"))
> +            if os.path.isfile(configfile):
> +                shutil.copyfile(configfile, os.path.join(resultdir, "config.log"))
> +

Here you assume that there is just one config.log file in the root of
the package build directory, but some more complex packages like gdb
actually have multiple config.log files in different directories. As
the information that could help problem analysis could be in any of
these files, they should all be copied.

Best regards,
Thomas
