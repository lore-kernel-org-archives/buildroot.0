From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 21 Jan 2014 09:08:49 +0100
Subject: [Buildroot] [PATCH 2/2] Prefer 'printf' over 'echo -e' (for
	portability)
In-Reply-To: <1388421102-29198-2-git-send-email-bjorn.forsman@gmail.com>
References: <1388421102-29198-1-git-send-email-bjorn.forsman@gmail.com>
 <1388421102-29198-2-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <CAAXf6LXy=maSi1ytsQcEMeVwvV4KvTiRPHOPMe+b12TrS1FDeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bj?rn,

On Mon, Dec 30, 2013 at 5:31 PM, Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
> support/dependencies/dependencies.sh uses #!/bin/sh shebang. It is not
> guaranteed that /bin/sh provides an 'echo' implementation that
> understands the '-e' flag (interpret backslash escape chars). For
> example, dash doesn't.
>
> 'printf' is more portable (it must interpret backslash escape chars,
> according to POSIX), so use that.
>
> NOTE: Before the previous commit, the dependencies.sh script used
> /bin/echo instead of the shell built-in. That's probably why this hasn't
> come up before.
>
> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
> ---
>  support/dependencies/dependencies.sh | 82 ++++++++++++++++++------------------
>  1 file changed, 41 insertions(+), 41 deletions(-)
>
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index d1ce918..8cfbcf6 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -7,7 +7,7 @@ export LC_ALL=C
>  # Verify that grep works
>  echo "WORKS" | grep "WORKS" >/dev/null 2>&1
>  if test $? != 0 ; then
> -       echo -e "\ngrep doesn't work\n"
> +       printf "\ngrep doesn't work\n"
>         exit 1
>  fi
>
> @@ -19,8 +19,8 @@ if test -n "$LD_LIBRARY_PATH" ; then
>         echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | grep ':\.TRiGGER_end' >/dev/null 2>&1 ||
>         echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | grep 'TRiGGER_start\.TRiGGER_end' >/dev/null 2>&1
>         if test $? = 0; then
> -               echo -e "\nYou seem to have the current working directory in your"
> -               echo -e "LD_LIBRARY_PATH environment variable. This doesn't work.\n"
> +               printf "\nYou seem to have the current working directory in your"
> +               printf "LD_LIBRARY_PATH environment variable. This doesn't work.\n"
>                 exit 1;
>         fi
>  fi;
> @@ -34,46 +34,46 @@ if test -n "$PATH" ; then
>         echo TRiGGER_start"$PATH"TRiGGER_end | grep ':\.TRiGGER_end' >/dev/null 2>&1 ||
>         echo TRiGGER_start"$PATH"TRiGGER_end | grep 'TRiGGER_start\.TRiGGER_end' >/dev/null 2>&1
>         if test $? = 0; then
> -               echo -e "\nYou seem to have the current working directory in your"
> -               echo -e "PATH environment variable. This doesn't work.\n"
> +               printf "\nYou seem to have the current working directory in your"
> +               printf "PATH environment variable. This doesn't work.\n"
>                 exit 1;
>         fi
>  fi;
>
>  if test -n "$PERL_MM_OPT" ; then
> -    echo -e "\nYou have PERL_MM_OPT defined because Perl local::lib"
> -    echo -e "is installed on your system. Please unset this variable"
> -    echo -e "before starting Buildroot, otherwise the compilation of"
> -    echo -e "Perl related packages will fail"
> +    printf "\nYou have PERL_MM_OPT defined because Perl local::lib"
> +    echo "is installed on your system. Please unset this variable"
> +    echo "before starting Buildroot, otherwise the compilation of"
> +    echo "Perl related packages will fail"
>      exit 1
>  fi

I find it very strange that we're mixing printf and echo in this same
file. I would suggest to either use echo only, or printf only. The
statement
echo -e '\nblaat'
is functionally equivalent to:
echo
echo blaat

Your point about printf being more portable is valid, and has been
raised in the past by Yann (I believe) as well.
This means that moving to printf iso echo makes sense, but then this
patch should be reworked as to fix the entire file.

Note that this is just my opinion, I can't speak for the entire community.

Best regards,
Thomas
