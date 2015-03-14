From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2015 23:18:50 +0100
Subject: [Buildroot] [PATCH 01/15] toolchain/helpers: add mandatory
 check for uclibc toolchain options
In-Reply-To: <1426270934-15499-2-git-send-email-gustavo@zacarias.com.ar>
References: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
 <1426270934-15499-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150314221850.GF4009@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-03-13 15:22 -0300, Gustavo Zacarias spake thusly:
> Take 'm' as parameter in $2 (buildroot option name) in
> check_uclibc_feature to indicate that a toolchain option is mandatory,
> and bail out with an appropiate message if that's the case.

I had a hard time figuring out what you were doing here...

What about:

    toolchain/helpers: add check for mandatory uClibc options

    We currently only check that the Buildroot configuration matches
    what is available in the toolchain.

    Since we're going to remove the check for LFS and make it a
    mandatory feature, we will lose the corresponding Buildroot
    option, so we won't be able to use check_uclibc_feature as-is.

    Introduce a special, magic value passed as the Buildroot option
    name to recognise checks for mandatory uClibc options that do not
    have a corresponding option in Buldroot.

    If the Buildroot option name is 'm', then the check is against
    a mandatory uClibc option.

    If a mandatory uClibc option is missing, we reject the toolchain
    as being unusable by Buildroot.

However, I don't think 'm' is the most appropriate. That's what somehow
confused me: wtf are we concerned about tristates? What about making
the check against an empty Buildroot option name, instead? No Buildroot
option name means there's no correlation to be made, and hence is a
mandatory uClibc option...

> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  toolchain/helpers.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 3121da4..ef657ee 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -238,6 +238,7 @@ check_musl = \
>  # Check the conformity of Buildroot configuration with regard to the
>  # uClibc configuration of the external toolchain, for a particular
>  # feature.
> +# If 'Buildroot option name' ($2) = 'm' it means a mandatory option.
>  #
>  # $1: uClibc macro name
>  # $2: Buildroot option name
> @@ -246,6 +247,10 @@ check_musl = \
>  #
>  check_uclibc_feature = \
>  	IS_IN_LIBC=`grep -q "\#define $(1) 1" $(3) && echo y` ; \
> +	if [ "$(2)" = "m" -a "$${IS_IN_LIBC}" != "y" ] ; then \

With my proposal, that'd read:

    if [ -z "$(2)" -a "$${IS_IN_LIBC}" != "y" ] ; then \

Otherwise, code looks good. :-)

Regards,
Yann E. MORIN.

> +		echo "$(4) not available in C library, toolchain unsuitable for Buildroot" ; \
> +		exit 1 ; \
> +	fi ; \
>  	if [ "$($(2))" != "y" -a "$${IS_IN_LIBC}" = "y" ] ; then \
>  		echo "$(4) available in C library, please enable $(2)" ; \
>  		exit 1 ; \
> -- 
> 2.0.5
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
