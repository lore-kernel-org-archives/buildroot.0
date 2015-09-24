From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 24 Sep 2015 07:08:40 +0300
Subject: [Buildroot] [PATCHv2] dependencies.sh: improve the missing perl
 modules detection
In-Reply-To: <1443042786-28226-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1443042786-28226-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150924040839.GB2229@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

On Wed, Sep 23, 2015 at 10:13:06PM +0100, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v1 -> v2:
>   - Check first for perl itself, and then the modules. Also keep the
>     comment which says that perl is needed to build host-autoconf.
>     (Suggested by Baruch Siach)
> 
>  support/dependencies/dependencies.sh | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 01ad828..177292e 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -236,10 +236,30 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BR2_CONFIG ; then
>  	fi
>  fi
>  
> -# Check that the Perl installation is complete enough to build
> -# host-autoconf.
> -if ! perl  -e "require Data::Dumper" > /dev/null 2>&1 ; then
> -	echo "Your Perl installation is not complete enough, at least Data::Dumper is missing."
> -	echo "On Debian/Ubuntu distributions, install the 'perl' package."
> +# Verify that Perl is installed. Is needed to buid host-autoconf among
> +# many other packages.
> +check_prog_host "perl"
> +
> +# Check that the Perl installation is complete enough for Buildroot.
> +# Here is the space-separated list of the required modules:

The original comment implied that Data::Dumper is a dependency of 
host-autoconf. I guess the same is true for Thread:Queue. This is useful 
information that IMO should be preserved. Maybe some thing like the following:

# Verify that some Perl modules that host-autoconf requires are installed.

> +required_perl_modules="Data::Dumper Thread:Queue"
> +
> +# This variable will keep the modules that are missing in your system:
> +missing_perl_modules=""
> +
> +for pm in $required_perl_modules ; do
> +	if ! perl  -e "require $pm" > /dev/null 2>&1 ; then
> +		missing_perl_modules="$missing_perl_modules $pm"
> +	fi
> +done
> +
> +if [ -n "$missing_perl_modules" ] ; then
> +	echo "Your Perl installation is not complete enough; at least the following"
> +	echo "modules are missing:"
> +	echo ""
> +	for pm in $missing_perl_modules ; do
> +		echo -e "\t $pm"
> +	done
> +	echo ""
>  	exit 1
>  fi

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
