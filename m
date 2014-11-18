From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Nov 2014 23:36:54 +0100
Subject: [Buildroot] [PATCH 1/2] Avoid misleading error output caused by
 missing shell quotes
In-Reply-To: <1415799105-27566-1-git-send-email-debian@jstimpfle.de>
References: <1415799105-27566-1-git-send-email-debian@jstimpfle.de>
Message-ID: <20141118223653.GS4333@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jens, All,

On 2014-11-12 13:31 +0000, Jens Stimpfle spake thusly:
> Signed-off-by: Jens Stimpfle <debian@jstimpfle.de>
> ---
> 
> Notes:
>     When g++ is not installed, a misleading error message turns up because
>     of a bad combination of an unquoted shell variable and control flow.
>     
>     > ~/buildroot$ make
>     >
>     > You may have to install 'g++' on your build machine
>     > /home/testuser/buildroot/support/dependencies/dependencies.sh: 136: [: -lt: unexpected operator

This should have been part of the commit log, above your Signed-off-by
line.

Whatever is after the --- line is ignored by git when a patch is
applied, but the information you provide is interesting and we want to
keep it in the logs.

What about changing your commit log to:

    support: avoid spurious error output when checking dependencies

    When g++ is not installed, a misleading error message turns up because
    of a bad combination of an unquoted shell variable and control flow.

        $ ~/buildroot$ make
        You may have to install 'g++' on your build machine
        /home/testuser/buildroot/support/dependencies/dependencies.sh: 136: [: -lt: unexpected operator

    Signed-off-by: You

Otherwise, the change looks sane, but see below...

>     This is a nonintrusive workaround.
> 
>  support/dependencies/dependencies.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index a9c5b31..4b8991d 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -118,7 +118,6 @@ CXXCOMPILER=$(which $HOSTCXX_NOCCACHE 2> /dev/null)
>  if [ -z "$CXXCOMPILER" ] ; then
>  	CXXCOMPILER=$(which c++ 2> /dev/null)
>  fi
> -

Spurious empty line removal. Please keep it.

>  if [ -z "$CXXCOMPILER" ] ; then
>  	echo
>  	echo "You may have to install 'g++' on your build machine"
> @@ -130,7 +129,8 @@ if [ ! -z "$CXXCOMPILER" ] ; then
>  		echo
>  		echo "You may have to install 'g++' on your build machine"
>  	fi
> -
> +fi
> +if [ ! -z "$CXXCOMPILER_VERSION" ] ; then

I'd like it if there was an empty line after the 'fi' and before the
'if'.

Also, we prefer positive logic:

    if [ -n "$CXXCOMPILER_VERSION" ] ; then

Regards,
Yann E. MORIN.

>  	CXXCOMPILER_MAJOR=$(echo $CXXCOMPILER_VERSION | sed -e "s/\..*//g")
>  	CXXCOMPILER_MINOR=$(echo $CXXCOMPILER_VERSION | sed -e "s/^$CXXCOMPILER_MAJOR\.//g" -e "s/\..*//g")
>  	if [ $CXXCOMPILER_MAJOR -lt 3 -o $CXXCOMPILER_MAJOR -eq 2 -a $CXXCOMPILER_MINOR -lt 95 ] ; then
> -- 
> 2.1.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
