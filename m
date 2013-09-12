From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Sep 2013 23:46:22 +0200
Subject: [Buildroot] [PATCH 3/3] docs/manual: add explanations about
	BR2_EXTERNAL
In-Reply-To: <1378646129-4167-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378646129-4167-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5232362E.60107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/09/13 15:15, Thomas Petazzoni wrote:
> This commit updates the manual to add details on how to use the
> BR2_EXTERNAL feature.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   docs/manual/customize-outside-br.txt | 110 +++++++++++++++++++++++++++++++++++
>   docs/manual/customize.txt            |   2 +
>   2 files changed, 112 insertions(+)
>   create mode 100644 docs/manual/customize-outside-br.txt
>
> diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
> new file mode 100644
> index 0000000..81a8911
> --- /dev/null
> +++ b/docs/manual/customize-outside-br.txt
> @@ -0,0 +1,110 @@
> +// -*- mode:doc -*- ;
> +
> +[[outside-br-custom]]
> +Keeping customization outside Buildroot
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +While the Buildroot community recommends and encourages upstreaming to
> +the official Buildroot version the packages and boards support that
> +are written by developers, it is sometimes not possible or desirable,
> +due to these packages or boards being highly specific or proprietary.
> +
> +In this case, Buildroot users are offered two choices:
> +
> + * They can add their packages, board support and configuration files
> +   directly within the Buildroot tree, and maintain them by using
> +   branches in a version control system.
> +
> + * They can use the +BR2_EXTERNAL+ mechanism, which allows to keep
> +   package recipes, board support and configuration files outside of
> +   the Buildroot tree, while still having them nicely integrated in
> +   the build logic. The following paragraphs give details on how to
> +   use +BR2_EXTERNAL+.
> +
> ++BR2_EXTERNAL+ is an environment variable that one can use to point to
> +a directory that contains Buildroot customizations. This environment
> +variable must be passed everytime a Buildroot +make+ command is
> +invoked, be it at configuration time (+make menuconfig+, +make
> +xconfig+, etc.), at build time (+make+) or any other Buildroot command
> +(+make source+, +make legal-info+, etc.).

  Hang on... It's stored in the .config, right? So no need to pass it 
every time?

  In fact, if the config option would get a prompt, you could even enter 
it through the config instead of through the environment. The only reason 
to pass it through the environment is to be able to list the available 
defconfigs.

  Or am I missing something?

> +
> +Examples:
> +
> +-----
> + buildroot/ $ make BR2_EXTERNAL=../company menuconfig
> + buildroot/ $ make BR2_EXTERNAL=../company
> +-----
> +
> +This +BR2_EXTERNAL+ then allows three different things:
> +
> + * One can store all the board-specific configuration files here, such
> +   as the kernel configuration, the root filesystem overlay, or any
> +   other configuration file for which Buildroot allows to set its
> +   location. The +BR2_EXTERNAL+ value is available within the
> +   Buildroot configuration using +$(BR2_EXTERNAL)+. As an example, one
> +   could set the +BR2_ROOTFS_OVERLAY+ Buildroot option to
> +   +$(BR2_EXTERNAL)/board/someboard/overlay/+ (to specify a root
> +   filesystem overlay), or the +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+
> +   Buildroot option to +$(BR2_EXTERNAL)/board/someboard/kernel.config+
> +   (to specify the location of the kernel configuration file).
> ++
> +To achieve this, it is recommended but not mandatory, to store those
> +   details in directories called +board/<boardname>/+ under

  You use someboard instead of <boardname> earlier.

> +   +BR2_EXTERNAL+.
> +
> + * One can store package recipes (i.e +Config.in+ and
> +   +<packagename>.mk+), or even custom configuration options and make
> +   logic. Buildroot automatically includes +BR2_EXTERNAL/Config.in+ to
> +   make it appear in the top-level configuration menu, and includes
> +   +BR2_EXTERNAL/external.mk+ with the rest of the makefile logic.
> ++
> +The main usage of this would be to store package recipes. The
> +   recommended way to do this is to write a +BR2_EXTERNAL/Config.in+
> +   that looks like:
> ++
> +------
> +menu "<somecompany> packages"
> +
> +source "$BR2_EXTERNAL/package/package1/Config.in"
> +source "$BR2_EXTERNAL/package/package2/Config.in"

  Wow, does this work? Then actually, you don't need that generated 
Config.in at all... Instead, you can add

source "$BR2_EXTERNAL/package/Config.in"

to the top of package/Config.in. And set a non-empty default for 
BR2_EXTERNAL, e.g. $(TOPDIR)/support/dummy_external, which contains an 
empty package/Config.in.

  Regards,
  Arnout

> +
> +endmenu
> +------
> ++
> +Then, have a +BR2_EXTERNAL/external.mk' file that looks like:
> ++
> +------
> +include $(BR2_EXTERNAL)/package/*/*.mk
> +------
> ++
> +And then in +BR2_EXTERNAL/package/package1+ and
> +   +BR2_EXTERNAL/package/package2+ create normal Buildroot package
> +   recipes, as explained in xref:adding-packages[].
> +
> + * One can store Buildroot defconfigs in the +configs+ subdirectory of
> +   +BR2_EXTERNAL+. Buildroot will automatically show them in the
> +   output of +make help+ and allow them to be loaded with the normal
> +   +make <name>_defconfig+ command.
> +
> +In the end, a typical +BR2_EXTERNAL+ directory organization would
> +generally be:
> +
> +-----
> +??? Config.in
> +??? external.mk
> +??? board/
> +?   ??? <someboard>/
> +?       ??? overlay/
> +?           ??? etc/
> +?               ??? <some file>
> +??? configs/
> +?   ??? <some board>_defconfig
> +??? package/
> +    ??? Config.in
> +    ??? package1/
> +        ??? Config.in
> +        ??? package1.mk
> +    ??? package2/
> +        ??? Config.in
> +        ??? package2.mk
> +------
> diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
> index 0456ef1..7e46fd8 100644
> --- a/docs/manual/customize.txt
> +++ b/docs/manual/customize.txt
> @@ -17,3 +17,5 @@ include::customize-toolchain.txt[]
>   include::customize-store.txt[]
>
>   include::customize-packages.txt[]
> +
> +include::customize-outside-br.txt[]
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
