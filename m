From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 27 Oct 2015 12:09:59 +0000
Subject: [Buildroot] [PATCH 1/1] rfkill: new package
In-Reply-To: <1445943904-1089-1-git-send-email-sv99@inbox.ru>
References: <1445943904-1089-1-git-send-email-sv99@inbox.ru>
Message-ID: <562F6997.8080203@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Viacheslav Volkov,

first of all, thanks a lot for your contribution. I have added some
comments inlined with your code. Please scroll down.

On 10/27/2015 11:05 AM, Viacheslav Volkov wrote:
> Add rfkill utility.
> 
> Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
> ---
>  package/Config.in          |  1 +
>  package/rfkill/Config.in   |  6 ++++++
>  package/rfkill/rfkill.hash |  2 ++
>  package/rfkill/rfkill.mk   | 26 ++++++++++++++++++++++++++
>  4 files changed, 35 insertions(+)
>  create mode 100644 package/rfkill/Config.in
>  create mode 100644 package/rfkill/rfkill.hash
>  create mode 100644 package/rfkill/rfkill.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 10ff94e..9933514 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -403,6 +403,7 @@ endif
>  	source "package/pps-tools/Config.in"
>  	source "package/pulseview/Config.in"
>  	source "package/read-edid/Config.in"
> +	source "package/rfkill/Config.in"
>  	source "package/rng-tools/Config.in"
>  	source "package/rpi-userland/Config.in"
>  	source "package/rtl8188eu/Config.in"
> diff --git a/package/rfkill/Config.in b/package/rfkill/Config.in
> new file mode 100644
> index 0000000..e627a99
> --- /dev/null
> +++ b/package/rfkill/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_RFKILL
> +	bool "rfkill"
> +	help
> +	  rfkill

I'm pretty sure this help text can be improved.

> +
> +	  https://www.kernel.org/pub/software/network/rfkill/

I think this one would be a better site to put here:

https://wireless.wiki.kernel.org/en/users/documentation/rfkill

It also contains a good description that could be used in the above help
text. Perhaps not complete, but a summary of it, for instance.

Remember the help text should be wrapper at 72 characters length, taking
into account that one tab is 8 characters wide.

> diff --git a/package/rfkill/rfkill.hash b/package/rfkill/rfkill.hash
> new file mode 100644
> index 0000000..34b35d7
> --- /dev/null
> +++ b/package/rfkill/rfkill.hash
> @@ -0,0 +1,2 @@
> +# from https://www.kernel.org/pub/software/network/rfkill/sha256sums.asc:

We normally do it like this:

# From: <URL>

With capital F, a colon after "From", then a space, and then the URL
without a trailing colon.

> +sha256	83532027f919f5a3cc185c821a69f16d0efcf7c91aaf6bdc2a0c83fb6bacf2b0  rfkill-0.5.tar.gz
> diff --git a/package/rfkill/rfkill.mk b/package/rfkill/rfkill.mk
> new file mode 100644
> index 0000000..7e8cdf5
> --- /dev/null
> +++ b/package/rfkill/rfkill.mk
> @@ -0,0 +1,26 @@
> +#############################################################

This line should contain 80 characters.

> +#
> +# rfkill
> +#
> +#############################################################

Same here.

> +
> +RFKILL_VERSION = 0.5
> +# RFKILL_SOURCE = rfkill-$(RFKILL_VERSION).tar.gz

If it's not used, then remove it. However, there is an .xz tarball
available, so I would use this:

RFKILL_SOURCE = rfkill-$(RFKILL_VERSION).tar.xz

Then you will need to modify the rfkill.hash file accordingly.

> +RFKILL_SITE = https://www.kernel.org/pub/software/network/rfkill
> +
> +define RFKILL_BUILD_CMDS
> +	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)" \
> +		V=1 VERSION_SUFFIX="-br"

Various things here. First, always add $(TARGET_MAKE_ENV) before
$(MAKE). Second, if you append the CFLAGS to the compiler command, then
the Makefile will override the Buildroot CFLAGS, resulting with
something like this:

-Os -O2

Only -O2 will be used.

So, if I were you, I would do this:

define RFKILL_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
		VERSION_SUFFIX="-br"

The $(TARGET_CONFIGURE_OPTS) will define the CC and CFLAGS variables,
among other stuff.

I have also removed the V=1 because that's an option you were using for
debugging. I like verbose build logs, however, let's keep the default
behavior.

> +endef
> +
> +define RFKILL_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/usr/bin

You shouldn't need to do that. That directory is part of the skeleton,
so it should already exist at that point. Anyway, the comment below will
make this unnecessary.

> +	cp -a $(@D)/rfkill $(TARGET_DIR)/usr/bin/rfkill

What about using $(INSTALL), so you could set the permissions at the
same time? Like this:

$(INSTALL) -D -m 755 $(@D)/rfkill $(TARGET_DIR)/usr/bin/rfkill

Also the -D option will create $(TARGET_DIR)/usr/bin/ if it doesn't
exist, just like your "mkdir -p" command.

> +endef
> +
> +define RFKILL_CLEAN_CMDS
> +	rm -f $(TARGET_DIR)/usr/bin/rfkill
> +endef

This is not needed, so please remove it.

Regards,

Vincent.

> +
> +
> +$(eval $(generic-package))
> 
