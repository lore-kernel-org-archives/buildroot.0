From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 May 2020 16:52:48 +0200
Subject: [Buildroot] [PATCH 2/6] package/odb: new package
In-Reply-To: <20200514143325.1009253-3-kamel.bouhara@bootlin.com>
References: <20200514143325.1009253-1-kamel.bouhara@bootlin.com>
 <20200514143325.1009253-3-kamel.bouhara@bootlin.com>
Message-ID: <20200514165248.5c749d13@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 May 2020 16:33:21 +0200
Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:

> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> [Kamel: Fixe incorrect odb license, Add a hidden boolean

Fixe -> Fix

> BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT, Add a check in in
> support/dependencies/dependencies.sh to verify that gcc plugins can be
> built for the host gcc.]

Would be nice to have that as a bullet list:

[Kamel:
 - do this
 - do that
 - do this other thing]

> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
>  Config.in                                     |   4 +
>  DEVELOPERS                                    |   1 +
>  package/Config.in.host                        |   1 +
>  package/odb/Config.in.host                    |  11 +
>  .../GCC_6_input_location_translation.patch    |  34 ++
>  package/odb/GCC_6_port_part1.patch            | 312 ++++++++++++
>  package/odb/GCC_6_port_part2.patch            |  48 ++
>  package/odb/GCC_8_adaptation.patch            |  32 ++
>  package/odb/GCC_8_port.patch                  | 226 +++++++++
>  .../odb/add_initial_support_for_GCC_9.patch   | 233 +++++++++
>  ...espace_aliases_when_parsing_GCC_tree.patch |  30 ++
>  package/odb/no_need_of_tm.h.patch             |  23 +
>  package/odb/odb.hash                          |   6 +
>  package/odb/odb.mk                            |  20 +
>  package/odb/remove_gratuitous_classes.patch   | 444 ++++++++++++++++++
>  package/odb/series                            |  10 +
>  package/odb/switch_to_C++11.patch             | 352 ++++++++++++++
>  support/dependencies/dependencies.sh          |  10 +
>  18 files changed, 1797 insertions(+)
>  create mode 100644 package/odb/Config.in.host
>  create mode 100644 package/odb/GCC_6_input_location_translation.patch
>  create mode 100644 package/odb/GCC_6_port_part1.patch
>  create mode 100644 package/odb/GCC_6_port_part2.patch
>  create mode 100644 package/odb/GCC_8_adaptation.patch
>  create mode 100644 package/odb/GCC_8_port.patch
>  create mode 100644 package/odb/add_initial_support_for_GCC_9.patch
>  create mode 100644 package/odb/handle_namespace_aliases_when_parsing_GCC_tree.patch
>  create mode 100644 package/odb/no_need_of_tm.h.patch

All patches should be named 0001-...patch 0002-...patch, etc. I.e
please import them in Git, and use "git format-patch -N" to generate
them.


> diff --git a/Config.in b/Config.in
> index 48fd36ff98..269f9d5594 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -79,6 +79,10 @@ config BR2_HOSTARCH_NEEDS_IA32_COMPILER
>  # UTF8 locale.
>  config BR2_NEEDS_HOST_UTF8_LOCALE
>  	bool

Missing blank line.

> +# Hidden boolean selected by packages that need the host to install the
> +# gcc-plugin-devel package

Description should not really be about installing the gcc-plugin-devel
package, but about having support for building gcc plugins.

> +config BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT
> +	bool

Also, this change, and the change in
support/dependencies/dependencies.sh should be in a separate commit.

> diff --git a/package/odb/Config.in.host b/package/odb/Config.in.host
> new file mode 100644
> index 0000000000..a0d551ccd1
> --- /dev/null
> +++ b/package/odb/Config.in.host
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_HOST_ODB
> +	bool "host-odb"
> +	default n

Not needed, default n is the default.

> +	select BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT
> +	help
> +	  This is a compiler that takes a specially crafted c++ header
> +	  file and auto-generates a schema that works with libodb and
> +	  the subsequent libodb-database library.
> +
> +comment "Host ODB compiler"

Why do we have this comment ?


> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 98469bd70c..3f212c5845 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -240,6 +240,16 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BR2_CONFIG ; then
>  	fi
>  fi
>  
> +if grep ^BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT=y $BR2_CONFIG ; then
> +	if ! gcc -print-file-name=plugin > /dev/null ; then

Are you sure this is a good test? I just removed the gcc-plugin-devel
package on my distro, and this still returns a "valid" value:

thomas at windsurf:~$ gcc -print-file-name=plugin
/usr/lib/gcc/x86_64-redhat-linux/10/plugin
thomas at windsurf:~$ echo $?
0
thomas at windsurf:~$ rpm -qa | grep "gcc.*plugin"
thomas at windsurf:~$ 

Something like this:

echo "#include <gcc-plugin.h>" | g++ -I$(g++ -print-file-name=plugin)/include -x c++ -c - -o /dev/null

will instead test if <gcc-plugin.h> is really installed. On my system,
it fails when gcc-plugin-devel is not installed, and it succeeds when
it's there. Of course, don't use g++ directly, but $(HOSTCXX).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
