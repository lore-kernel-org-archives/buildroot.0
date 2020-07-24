From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Jul 2020 22:11:44 +0200
Subject: [Buildroot] [PATCH 09/11] support/testing/infra: add
 log_file_path() function
In-Reply-To: <20200430095249.782597-10-thomas.petazzoni@bootlin.com>
References: <20200430095249.782597-1-thomas.petazzoni@bootlin.com>
 <20200430095249.782597-10-thomas.petazzoni@bootlin.com>
Message-ID: <20200724201144.GJ2296@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Some pythonery below...

On 2020-04-30 11:52 +0200, Thomas Petazzoni spake thusly:
> Some tests will need to grep through the build log to verify that some
> features are working are expected. In order to allow them to open the
> build log, we provide a new function called log_file_path(), which
> returns the path to the log file if available.
> 
> We also use this function in open_log_file().
> 
> Note that open_log_file() cannot be used directly to grep through the
> log file at the end of a build: because it opens in "a+" mode, it
> greps starting from the end of the file.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/testing/infra/__init__.py | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
> index 6392aa679b..aaee055ee6 100644
> --- a/support/testing/infra/__init__.py
> +++ b/support/testing/infra/__init__.py
> @@ -10,14 +10,23 @@ ARTIFACTS_URL = "http://autobuild.buildroot.net/artefacts/"
>  BASE_DIR = os.path.realpath(os.path.join(os.path.dirname(__file__), "../../.."))
>  
>  
> +def log_file_path(builddir, stage, logtofile=True):
> +    """Return path to log file"""
> +    if logtofile:
> +        return "{}-{}.log".format(builddir, stage)
> +    else:
> +        return None

    def log_file_path(builddir, stage, logtofile=True):
        """
        blabla
        """
        return "{}-{}.log".format(builddir, stage) if logtofile else None

>  def open_log_file(builddir, stage, logtofile=True):
>      """
>      Open a file for logging and return its handler.
>      If logtofile is True, returns sys.stdout. Otherwise opens a file
>      with a suitable name in the build directory.
>      """
> -    if logtofile:
> -        fhandle = open("{}-{}.log".format(builddir, stage), 'a+')
> +    logf = log_file_path(builddir, stage, logtofile)
> +    if logf:
> +        fhandle = open(logf, 'a+')
>      else:
>          fhandle = sys.stdout
>      return fhandle

    def open_log_file(builddir, stage, logtofile=True):
        """
        blabla
        """
        return open(log_file_path(builddir, stage, logtofile), 'a+') if logtofile else sys.stdout

Regards,
Yann E. MORIN.

> -- 
> 2.25.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
