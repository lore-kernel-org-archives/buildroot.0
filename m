From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 23 Sep 2015 22:50:51 +0300
Subject: [Buildroot] [PATCH] dependencies.sh: improve the missing perl
 modules detection
In-Reply-To: <1443015861-11295-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1443015861-11295-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150923195051.GA2229@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

On Wed, Sep 23, 2015 at 02:44:21PM +0100, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  support/dependencies/dependencies.sh |   26 +++++++++++++++++++++-----
>  1 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 01ad828..af9aefe 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -236,10 +236,26 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BR2_CONFIG ; then
>  	fi
>  fi
>  
> -# Check that the Perl installation is complete enough to build
> -# host-autoconf.

The information that we need perl for host-autoconf should be preserved, I 
think.

> -if ! perl  -e "require Data::Dumper" > /dev/null 2>&1 ; then
> -	echo "Your Perl installation is not complete enough, at least Data::Dumper is missing."
> -	echo "On Debian/Ubuntu distributions, install the 'perl' package."

You are also removing this bit of valuable information.

Maybe we should split this into two checks, one for perl itself, and then for 
some required modules. That would allow us to give the user a more precise 
diagnosis.

> +# Check that the Perl installation is complete enough for Buildroot.
> +# Here is the space-separated list of the required modules:
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
