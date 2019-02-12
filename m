From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Feb 2019 21:33:43 +0100
Subject: [Buildroot] [PATCH] utils/scanpypi: protect against zip-slip
 vulnerability in zip/tar handling
In-Reply-To: <20190211222202.10786-1-peter@korsgaard.com>
References: <20190211222202.10786-1-peter@korsgaard.com>
Message-ID: <20190212203343.GQ3079@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-02-11 23:22 +0100, Peter Korsgaard spake thusly:
> For details, see https://github.com/snyk/zip-slip-vulnerability
> 
> Older python versions do not validate that the extracted files are inside
> the target directory.  Detect and error out on evil paths before extracting
> .zip / .tar file.
> 
> Given the scope of this (zip issue was fixed in python 2.7.4, released
> 2013-04-06, scanpypi is only used by a developer when adding a new python
> package), the security impact is fairly minimal, but it is good to get it
> fixed anyway.
> 
> Reported-by: Bas van Schaik <security-reports@semmle.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  utils/scanpypi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/utils/scanpypi b/utils/scanpypi
> index a75d696222..bdce6924b6 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -225,6 +225,22 @@ class BuildrootPackage():
>          self.filename = self.used_url['filename']
>          self.url = self.used_url['url']
>  
> +    def check_archive(self, members):
> +        """
> +        Check archive content before extracting
> +
> +        Keyword arguments:
> +        members -- list of archive members
> +        """
> +        # Protect against https://github.com/snyk/zip-slip-vulnerability
> +        # Older python versions do not validate that the extracted files are
> +        # inside the target directory. Detect and error out on evil paths
> +        evil = [e for e in members if os.path.relpath(e).startswith(('/', '..'))]

As I said on IRC: I would really prefer if we could reject archive that
do have paths merely containiug /../ components, because those are
already fishy, even if they still point in-tree, e.g. foo/../bar is
still technically OK, but why the heck would it be constructed that way
to begin with? Normal archivers do not do that.

But making the path canonical with relpath() is already better than the
current situation, so:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Yet, a little tiny comment, below:

> +        if evil:
> +            print('ERROR: Refusing to extract {} with suspicious members {}'.format(
> +                self.filename, evil))

I would have sent that to stderr: print(..., file=sys.stderr)

Regards,
Yann E. MORIN.

> +            sys.exit(1)
> +
>      def extract_package(self, tmp_path):
>          """
>          Extract the package contents into a directrory
> @@ -249,6 +265,7 @@ class BuildrootPackage():
>                      print('Removing {pkg}...'.format(pkg=tmp_pkg))
>                      shutil.rmtree(tmp_pkg)
>                      os.makedirs(tmp_pkg)
> +                self.check_archive(as_zipfile.namelist())
>                  as_zipfile.extractall(tmp_pkg)
>                  pkg_filename = self.filename.split(".zip")[0]
>          else:
> @@ -264,6 +281,7 @@ class BuildrootPackage():
>                      print('Removing {pkg}...'.format(pkg=tmp_pkg))
>                      shutil.rmtree(tmp_pkg)
>                      os.makedirs(tmp_pkg)
> +                self.check_archive(as_tarfile.getnames())
>                  as_tarfile.extractall(tmp_pkg)
>                  pkg_filename = self.filename.split(".tar")[0]
>  
> -- 
> 2.11.0
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
