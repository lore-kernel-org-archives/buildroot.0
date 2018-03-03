From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Mar 2018 17:07:11 +0100
Subject: [Buildroot] [PATCH 2/2] support/dependencies/dependencies.sh:
 check for Python argparse module
In-Reply-To: <20180303143620.16859-2-thomas.petazzoni@bootlin.com>
References: <20180303143620.16859-1-thomas.petazzoni@bootlin.com>
 <20180303143620.16859-2-thomas.petazzoni@bootlin.com>
Message-ID: <20180303160711.GB20055@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-03-03 15:36 +0100, Thomas Petazzoni spake thusly:
> The script support/scripts/check-uniq-files uses the argparse Python
> module. In most recent Python versions (starting with 2.7), the
> argparse module is part of the standard library, and we already check
> for the availability of Python in
> support/dependencies/dependencies.sh.
> 
> However, when running on an ancient distribution with Python 2.6, the
> argparse module is not part of the Python standard library, but
> available as an external module. Without this module, the build fails,
> because check-uniq-files, which is used in target-finalize, fails to
> run.
> 
> To avoid this failure, this commit adds a check in
> support/dependencies/dependencies.sh to verify that the argparse
> module is available.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  support/dependencies/dependencies.sh | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 1804e85508..423fed8110 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -288,3 +288,8 @@ if [ -n "$missing_perl_modules" ] ; then
>  	echo
>  	exit 1
>  fi
> +
> +if ! python -c "import argparse" > /dev/null 2>&1 ; then
> +	echo "Your Python installation is not complete enough: argparse module is missing"
> +	exit 1
> +fi
> -- 
> 2.14.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
