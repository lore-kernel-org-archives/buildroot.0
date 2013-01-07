From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 07 Jan 2013 08:55:06 +0100
Subject: [Buildroot] [PATCH 2/4] Infrastructure to warn the user about
 missing 32 bits libraries
In-Reply-To: <1fabfe7c83a700bce7a8f77e19a304ace407a96b.1356797653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356797653.git.thomas.petazzoni@free-electrons.com>
 <1fabfe7c83a700bce7a8f77e19a304ace407a96b.1356797653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <50EA7F5A.4070200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/29/12 17:14, Thomas Petazzoni wrote:
> Many users trying to use external toolchains on x86-64 machines get a
> very confusing message:
>
>    "Can't execute cross-compiler"
>
> They get this message because they forgot to install the 32 bits
> compatibility libraries that are needed to run binaries compiled for
> x86 on x86-64 machines.
>
> Since this is the case for both external toolchains and certain
> binary-only tools like SAM-BA, we add a new Kconfig option
> BR2_HOSTARCH_NEEDS_IA32_LIBS, that packages must select if they need

  Since x86_64 is also an IA32, I would rather call it 
BR2_HOSTARCH_NEEDS_I386_LIBS.

> the 32 bits compatibility libraries. When this option is enabled,
> dependencies.sh checks that the 32 bits dynamic library loader is
> present on the system, and if not, it stops and shows an error.
>
> The path and name of the 32 bits dynamic loader is hardcoded because
> it is very unlikely to change, as it would break the ABI for all
> binaries.
>
> Also, it is worth noting that the check will be done even if we're
> running on a 32 bits machine. This is harmless, as 32 bits machines
> necessarily have the 32 bits dynamic loader installed, so the error
> will never show up in this case.

  Perhaps move these two comments to dependencies.sh so we don't forget 
about it?

>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>   Config.in                            |    6 ++++++
>   support/dependencies/dependencies.sh |   11 +++++++++++
>   2 files changed, 17 insertions(+)
>
> diff --git a/Config.in b/Config.in
> index b319ac7..af77a83 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -14,6 +14,12 @@ config BR2_HOSTARCH
>   	string
>   	option env="HOSTARCH"
>
> +# Hidden boolean selected by pre-built packages for x86, when they
> +# need to run on x86-64 machines (example: pre-built external
> +# toolchains, binary tools like SAM-BA, etc.).
> +config BR2_HOSTARCH_NEEDS_IA32_LIBS
> +	bool
> +
>   source "arch/Config.in"
>
>   menu "Build options"
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 7a02512..03e2742 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -166,3 +166,14 @@ if grep -q ^BR2_PACKAGE_CLASSPATH=y $CONFIG_FILE ; then
>   	fi
>       done
>   fi
> +if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $CONFIG_FILE ; then
> +    if test ! -f /lib/ld-linux.so.2 ; then
> +	/bin/echo -e "\nYour Buildroot configuration uses some pre-built tools for the x86 architecture,"
> +	/bin/echo -e "but your build machine uses the x86-64 architecture without the 32 bits compatibility"

  This line is more than 80 columns.

> +	/bin/echo -e "library."
> +	/bin/echo -e "If you're running a Debian/Ubuntu distribution, install the libc:i386 package."
> +	/bin/echo -e "For other distributions, refer to the documentation on how to install the 32 bits"
> +	/bin/echo -e "compatibility libraries."

  "the documentation" sounds as if it is the buildroot documentation, so 
make it "refer to your distribution's documentation"

  Also this is only for relatively recent Debian/Ubuntu with full 
multilib support. Before that it was called libc-i386 IIRC.

  Is there anyone out there with a Redhat/Fedora who can tell us how to 
install it there?

  And finally, it would be good to mention this in
docs/manual/prerequisite.txt


  Regards,
  Arnout

> +	exit 1
> +    fi
> +fi


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
