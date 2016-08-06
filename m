From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 6 Aug 2016 17:48:54 +0200
Subject: [Buildroot] [PATCH 11/16 v3] docs/manual: document the
 br2-external ID
In-Reply-To: <1668718ade9cb831725de8eed23056eefa7879c6.1468750623.git.yann.morin.1998@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <1668718ade9cb831725de8eed23056eefa7879c6.1468750623.git.yann.morin.1998@free.fr>
Message-ID: <75fb349e-9e9b-fe93-0626-ac23a217df89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 17/07/2016 ? 12:34, Yann E. MORIN a ?crit :
> Update the manual with the new external.id mandatory file.
> 
> Take the opportunity to add a section listing all mandatory files,
> Config.in, external.mk and the new external.id, instead of just hinting
> about them in the external package recipes section.
> 
> Change the example to use the ID-suffixed variable instead of the raw
> BR2_EXTERNAL variable. Even though it is still possible to write a
> br2-external tree that is not multi-aware, we only document it with an
> ID.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Jeremy Rosen <jeremy.rosen@openwide.fr>
> 
> ---
> Changes v2 -> v3:
>   - better document the content of the ID file  (Jeremy)
> ---
>  docs/manual/customize-outside-br.txt | 59 ++++++++++++++++++++++++++----------
>  1 file changed, 43 insertions(+), 16 deletions(-)
> 
> diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
> index 9ad177d..839d1b1 100644
> --- a/docs/manual/customize-outside-br.txt
> +++ b/docs/manual/customize-outside-br.txt
> @@ -57,19 +57,50 @@ Or disable the usage of external definitions:
>  buildroot/ $ make BR2_EXTERNAL= xconfig
>  -----
>  
> -+BR2_EXTERNAL+ allows three different things:
> +A +BR2_EXTERNAL+ tree must contain at least those three files:
> +
> ++external.id+::
> +   That file should contain the ID for the +BR2_EXTERNAL+ tree.
> +   That ID is used to construct the +BR2_EXTERNAL_$(ID)+ variable,
> +   available in +Config.in+ and +external.mk+ (see below), so that ID
> +   must be a valid make and Kconfig variable. Buildroot sets
> +   +BR2_EXTERNAL_$(ID)+ to the path of the +BR2_EXTERNAL+ tree.
> +   The format for this file is a single line with the ID.
> ++
> +Examples of an +external.mk+ file that declares the ID +FOO+:
> ++
> +----
> +$ cat external.mk
> +FOO
> +----
> ++
> +Examples of IDs and the corresponding +BR2_EXTERNAL_$(ID)+ variable:
> ++
> +  * +FOO+ -> +BR2_EXTERNAL_FOO+
> +  * +BAR_42+ -> +BR2_EXTERNAL_BAR_42+
> +  * ...
> +
> +
> ++Config.in+::
> ++external.mk+::
> +   Those files (which may each be empty) can be used to define package
> +   recipes, like for packages bundled in Buildroot itself, or other
> +   custom configuration options.
> +
> +Using +BR2_EXTERNAL+ then allows three different things:
>  
>   * One can store all the board-specific configuration files there,
>     such as the kernel configuration, the root filesystem overlay, or
>     any other configuration file for which Buildroot allows to set its
> -   location. The +BR2_EXTERNAL+ value is available within the
> -   Buildroot configuration using +$(BR2_EXTERNAL)+. As an example, one
> -   could set the +BR2_ROOTFS_OVERLAY+ Buildroot option to
> -   +$(BR2_EXTERNAL)/board/<boardname>/overlay/+ (to specify a root
> +   location. The location of the +BR2_EXTERNAL+ tree is available in the
> +   Buildroot configuration using the +BR2_EXTERNAL_$(ID)+ variable. As
> +   an example, (considering the ID +BAR_42+), one could set the
> +   +BR2_ROOTFS_OVERLAY+ Buildroot option to
> +   +$(BR2_EXTERNAL_BAR_42)/board/<boardname>/overlay/+ (to specify a root
>     filesystem overlay), or the +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+
>     Buildroot option to
> -   +$(BR2_EXTERNAL)/board/<boardname>/kernel.config+ (to specify the
> -   location of the kernel configuration file).
> +   +$(BR2_EXTERNAL_BAR_42)/board/<boardname>/kernel.config+ (to specify
> +   the location of the kernel configuration file).
>  
>   * One can store package recipes (i.e. +Config.in+ and
>     +<packagename>.mk+), or even custom configuration options and make
> @@ -77,27 +108,23 @@ buildroot/ $ make BR2_EXTERNAL= xconfig
>     make it appear in the top-level configuration menu, and includes
>     +$(BR2_EXTERNAL)/external.mk+ with the rest of the makefile logic.
>  +
> -.Note
> -Providing +Config.in+ and +external.mk+ is mandatory, but they can be
> -   empty.
> -+
>  The main usage of this is to store package recipes. The recommended
>     way to do this is to write a +$(BR2_EXTERNAL)/Config.in+ file that
>     looks like:
>  +
>  ------
> -source "$BR2_EXTERNAL/package/package1/Config.in"
> -source "$BR2_EXTERNAL/package/package2/Config.in"
> +source "$BR2_EXTERNAL_BAR_42/package/package1/Config.in"
> +source "$BR2_EXTERNAL_BAR_42/package/package2/Config.in"
>  ------
>  +
>  Then, have a +$(BR2_EXTERNAL)/external.mk+ file that looks like:
>  +
>  ------
> -include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))
> +include $(sort $(wildcard $(BR2_EXTERNAL_BAR_42)/package/*/*.mk))
>  ------
>  +
> -And then in +$(BR2_EXTERNAL)/package/package1+ and
> -   +$(BR2_EXTERNAL)/package/package2+ create normal Buildroot
> +And then in +$(BR2_EXTERNAL_FOO_42)/package/package1+ and
> +   +$(BR2_EXTERNAL_FOO_42)/package/package2+ create normal Buildroot

Here BR2_EXTERNAL_FOO or BR2_EXTERNAL_BAR_42 ?
BR2_EXTERNAL_BAR_42 it seems ;-)

Best regards,
Romain

>     package recipes, as explained in xref:adding-packages[].
>     If you prefer, you can also group the packages in subdirectories
>     called <boardname> and adapt the above paths accordingly.
> 
