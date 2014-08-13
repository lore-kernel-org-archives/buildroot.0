From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Aug 2014 16:06:14 +0200
Subject: [Buildroot] [PATCH 1/1] dependencies: Reject gcj in
 BR2_NEEDS_HOST_JAVA check
In-Reply-To: <1407356782-3118-1-git-send-email-bernd.kuhls@t-online.de>
References: <1407356782-3118-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140813140614.GE3939@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-08-06 22:26 +0200, Bernd Kuhls spake thusly:
> Xbmc uses the Groovy java package to generate API code, for details see
> http://wiki.xbmc.org/index.php?title=Codegeneration#How_it_works
> 
> Groovy itself is broken when used with gcj:
> http://jira.codehaus.org/browse/GROOVY-3701
> 
> Xbmc recommends to use another java package instead, like openjdk:
> http://forum.xbmc.org/showthread.php?tid=199742
> 
> Until we come up with a host package to provide a java setup and in order to
> make autobuilder happy let?s reject gcj when we check for a java installation
> on the host.
> 
> Currently Xbmc is the only package using BR2_NEEDS_HOST_JAVA so changing the
> behaviour of dependencies.sh has no side effects.
> 
> Fixes
> http://autobuild.buildroot.net/results/213/213d7454a1dc68cfb8f4c8d9508f52ebf8e58e33/
> http://autobuild.buildroot.net/results/639/639cda872cf36c122cbd6139dd76f6b51ac1864e/
> http://autobuild.buildroot.net/results/c9e/c9eb12c95b2939c64590692a82af8d84bbd90956/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  support/dependencies/dependencies.sh |   14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 88e5ad2..b09e376 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -188,7 +188,19 @@ if grep ^BR2_TOOLCHAIN_BUILDROOT=y $BR2_CONFIG > /dev/null && \
>  fi
>  
>  if grep -q ^BR2_NEEDS_HOST_JAVA=y $BR2_CONFIG ; then
> -	check_prog_host "java"
> +	JAVA=$(which java 2> /dev/null)
> +	if [ -z "$JAVA" ] ; then
> +		echo
> +		echo "You must install 'java' on your build machine";
> +		exit 1;
> +	fi;

Well, I'd keep the 'check_prog_host "java"' line, and would just add the
lines below, replacing $JAVA witrh just 'java'.

Regards,
Yann E. MORIN.

> +	JAVA_GCJ=$($JAVA -version 2>&1 | grep gcj)
> +	if [ ! -z "$JAVA_GCJ" ] ; then
> +		echo
> +		echo "$JAVA_GCJ is not sufficient to compile your package selection."
> +		echo "Please install OpenJDK/IcedTea/Oracle Java."
> +		exit 1 ;
> +	fi
>  fi
>  
>  if grep -q ^BR2_NEEDS_HOST_JAVAC=y $BR2_CONFIG ; then
> -- 
> 1.7.10.4
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
