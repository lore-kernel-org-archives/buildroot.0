From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Dec 2012 22:26:45 +0100
Subject: [Buildroot] [PATCH 1/2] target: add option to set the root
 password
In-Reply-To: <751d161336cd6e35187e2faa67f456335908222c.1356728899.git.yann.morin.1998@free.fr>
References: <cover.1356728899.git.yann.morin.1998@free.fr>
 <751d161336cd6e35187e2faa67f456335908222c.1356728899.git.yann.morin.1998@free.fr>
Message-ID: <20121228222645.5cb9835f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 28 Dec 2012 22:20:53 +0100, Yann E. MORIN wrote:
> Add an option in the menuconfig to specify a root password.
> 
> If set to empty, no root password is created; otherwise, the password is
> encrypted using MD5 (MD5 is not the default for crypt(3), DES-56 is, but
> MD5 is widely available, not-so-strong, but not-so-weak either).
> 
> Add a check for 'mkpasswd' as a new dependency.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
> Switched to using MD5 as per Arnout's suggestion:
>     http://lists.busybox.net/pipermail/buildroot/2012-September/058712.html
> ---
>  support/dependencies/dependencies.sh |    9 +++++++++
>  system/Config.in                     |   21 +++++++++++++++++++++
>  system/system.mk                     |   14 ++++++++++++++
>  3 files changed, 44 insertions(+), 0 deletions(-)
> 
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 7a02512..c86a5d0 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -158,6 +158,7 @@ if grep ^BR2_TOOLCHAIN_BUILDROOT=y $CONFIG_FILE > /dev/null && \
>         exit 1 ;
>     fi
>  fi
> +
>  if grep -q ^BR2_PACKAGE_CLASSPATH=y $CONFIG_FILE ; then
>      for prog in javac jar; do
>  	if ! which $prog > /dev/null ; then
> @@ -166,3 +167,11 @@ if grep -q ^BR2_PACKAGE_CLASSPATH=y $CONFIG_FILE ; then
>  	fi
>      done
>  fi
> +
> +if grep -E '^TARGET_GENERIC_ROOT_PASSWD=".+"$' $CONFIG_FILE > /dev/null 2>&1; then

I guess it should be BR2_TARGET_GENERIC_ROOT_PASSWD since you have a ^
at the beginning of the regexp.

> +    if ! which mkpasswd > /dev/null 2>&1; then
> +        /bin/echo -e "\nYou need the 'mkpasswd' utility to set the root password\n"

Also mention that mkpasswd is typically bundled within the whois
package in distros (at least in Debian/Ubuntu), because it may not be
very obvious.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
