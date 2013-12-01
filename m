From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 01 Dec 2013 01:17:54 +0100
Subject: [Buildroot] [PATCHv4 1/5] core: introduce the BR2_EXTERNAL
	variable
In-Reply-To: <1385751626-28967-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1385751626-28967-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1385751626-28967-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <529A8032.10606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Lots of feedback on this one :-)

On 29/11/13 20:00, Thomas Petazzoni wrote:
> This commit introduces the BR2_EXTERNAL environment variable, which
> will allow to keep Buildroot customization (board-specific
> configuration files or root filesystem overlays, package Config.in and
> makefiles, as well as defconfigs) outside of the Buildroot tree.
>
> This commit only introduces the variable itself, and ensures that it
> is available within Config.in options, so that string options used to
> specify paths to directories or files can use $BR2_EXTERNAL as a
> reference. For example, one can use
> $BR2_EXTERNAL/board/<someboard>/kernel.config as the
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE value.

  Actually, that's not the reason you need it in Config.in. You only need 
it to be able to source it. Expansions in string values are done by make 
- that's why you need () around them.


> Following patches extend the usage of BR2_EXTERNAL to other areas
> (packages and defconfigs).
>
> In details, this commit:
>
>   * Introduces the BR2_EXTERNAL Kconfig option. This option has no
>     prompt, and is therefore not visible to the user and also not
>     stored in the .config file. It is automatically set to the value of
>     the BR2_EXTERNAL environment variable. The only purpose of this
>     BR2_EXTERNAL Kconfig option is to allow $BR2_EXTERNAL to be
>     properly expanded when used inside Kconfig option values.

  Inside source statements you mean :-)

>
>   * Calculates the BR2_EXTERNAL value to use. If passed on the command
>     line, then this value is taken in priority, and saved to a
>     .br-external hidden file in the output directory. If not passed on
>     the command line, then we read the .br-external file from the
>     output directory. This allows the user to not pass the BR2_EXTERNAL
>     value at each make invocation. If no BR2_EXTERNAL value is passed,
>     we define it to support/dummy-external/, so that the kconfig code
>     finds an existing $(BR2_EXTERNAL)/package/Config.in file to
>     include.
>
>   * Passes the BR2_EXTERNAL into the *config environment, so that its
>     value is found when parsing/evaluating Config.in files and .config
>     values.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   Config.in |  4 ++++
>   Makefile  | 49 ++++++++++++++++++++++++++++++++++++++++++++++++-
>   2 files changed, 52 insertions(+), 1 deletion(-)
>
> diff --git a/Config.in b/Config.in
> index d87e0f0..98726ab 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -14,6 +14,10 @@ config BR2_HOSTARCH
>   	string
>   	option env="HOSTARCH"
>
> +config BR2_EXTERNAL
> +	string
> +	option env="BR2_EXTERNAL"
> +
>   # Hidden boolean selected by pre-built packages for x86, when they
>   # need to run on x86-64 machines (example: pre-built external
>   # toolchains, binary tools like SAM-BA, etc.).
> diff --git a/Makefile b/Makefile
> index b5368a3..5878d44 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -99,6 +99,52 @@ export CDPATH:=
>   BASE_DIR := $(shell mkdir -p $(O) && cd $(O) >/dev/null && pwd)
>   $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
>
> +
> +# Handling of BR2_EXTERNAL. We are handling four cases here:
> +#
> +#  (Case 1) BR2_EXTERNAL is defined in the command line, but has an
> +#           empty value. That's an indication that the user wants to
> +#           remove the BR2_EXTERNAL value. So we use the
> +#           dummy-external directory as BR2_EXTERNAL and remove the
> +#           .br-external file.
> +#  (Case 2) BR2_EXTERNAL is defined in the command line, and has a
> +#           non-empty value. That's an indication that the user wants
> +#           to use the provided location as the BR2_EXTERNAL. We
> +#           verify that the location exists, and if it's the case,
> +#           store it in .br-external.
> +#  (Case 3) BR2_EXTERNAL isn't defined in the command line, and there
> +#           is no .br-external file, so like in (Case 1), we use the
> +#           dummy-external directory as BR2_EXTERNAL.
> +#  (Case 4) BR2_EXTERNAL isn't defined in the command line, but there
> +#           is a .br-external file. We load the value from this file,
> +#           verify that it's an existing location, and use it.

  This is overly complex IMHO. You can just include .br-external before 
the conditions, then you have only two cases: BR2_EXTERNAL is set or it 
is not set. In the first case, you remove .br-external, in the other case 
you create it. It does mean that it is re-created on every invocation of 
make, but I don't think that that's a problem.

> +
> +BR2_EXTERNAL_FILE = $(BASE_DIR)/.br-external
> +
> +ifeq ($(origin BR2_EXTERNAL),command line)
> +ifeq ($(BR2_EXTERNAL),) # Case 1
> +override BR2_EXTERNAL := $(TOPDIR)/support/dummy-external/

  There is no reason to use :=, $(TOPDIR) or a trailing /.

+$(shell rm -f $(BR2_EXTERNAL_FILE))
> +else # Case 2
> +ifeq ($(wildcard $(BR2_EXTERNAL)),)
> +$(error "The specified BR2_EXTERNAL '$(BR2_EXTERNAL)' location doesn't exist")

  This error is kind of pointless: it checks if the directory exists, but 
not if external.mk or Config.in exists. And those two will cause separate 
errors anyway. So I'd just remove this one.

> +endif
> +override BR2_EXTERNAL := $(realpath $(BR2_EXTERNAL))

  No reason to use realpath here.

> +BR2_EXTERNAL_USED = y
> +$(shell echo $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))

  If you use an assignment, you can -include the file directly.


  Since I may not have explained what I mean very well, I've just 
implemented all of it myself and it'll come as a reply to this message. 
Feel free to reuse any of the ideas that you like and abandon the others.

  Regards,
  Arnout

> +endif
> +else
> +ifeq ($(wildcard $(BR2_EXTERNAL_FILE)),) # Case 3
> +override BR2_EXTERNAL := $(TOPDIR)/support/dummy-external/
> +else # Case 4
> +override BR2_EXTERNAL := $(shell cat $(BR2_EXTERNAL_FILE))
> +ifeq ($(wildcard $(BR2_EXTERNAL)),)
> +$(error "The specified BR2_EXTERNAL '$(BR2_EXTERNAL)' location doesn't exist")
> +endif
> +BR2_EXTERNAL_USED = y
> +endif
> +endif
> +
>   BUILD_DIR:=$(BASE_DIR)/build
>   STAMP_DIR:=$(BASE_DIR)/stamps
>   BINARIES_DIR:=$(BASE_DIR)/images
> @@ -619,7 +665,8 @@ COMMON_CONFIG_ENV = \
>   	KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
>   	KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
>   	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
> -	BUILDROOT_CONFIG=$(BUILDROOT_CONFIG)
> +	BUILDROOT_CONFIG=$(BUILDROOT_CONFIG) \
> +	BR2_EXTERNAL=$(BR2_EXTERNAL)
>
>   xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
>   	@mkdir -p $(BUILD_DIR)/buildroot-config
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
