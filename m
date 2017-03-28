From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Mar 2017 00:12:56 +0200
Subject: [Buildroot] [PATCH 2/4] core: allow packages to declare a
 permission file
In-Reply-To: <1490564623-26806-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490564623-26806-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490564623-26806-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56824752-a1bd-730a-b9f6-465eec832da7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-03-17 23:43, Thomas Petazzoni wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Currently, packages can define a variable that holds all the permissions
> to set on the files it installs. This can be used to set various
> permissions, like ownership, mode, suid/sgid/sticky bits to individual
> files.
> 
> However, this variable has to contain entries that are known the moment
> we scan the .mk file; it is not possible to conditionally add permisions
                                                                     ^
> for files which presence depend on post-parse conditions.
> 
> This is the case for example for Busybox, for which we don't know whether
> a specific applet will be enabled or not until after the configure
> command has run.
> 
> Introduce a new variable that packages can set to point to a file that
> contains a permission table. That filewill only be used when a filesystem
                                        ^
> image is asembled, so the file can be generated, either at configure or
            ^
> build time, with no problem.
> 
> Since this variable can be empty (when no package provides such a
> permissions file), we must ensure not to cat anything (or that would
> stale, cat-ing stdin). But since this variable is not fully known by the
> time we parse the fs infra (e.g. packages from a br2-external tree are
> not yet parsed), we can not test it with make syntas (ifneq...endif).
                                                     ^
> Teting it with shell syntac is not trivial either, becaue the variable
    ^                       ^                             ^
> would not be mpty (it would be only spaces). sO, we just iterate over
               ^                                ^
> the the files and cat them one by one with a shell-level for-loop, which
> is happy with nothing to iterate over.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  fs/common.mk           | 3 +++
>  package/pkg-generic.mk | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 396b1c2..0bbcca4 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -91,6 +91,9 @@ ifeq ($$(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
>  endif
>  endif
>  	$$(call PRINTF,$$(PACKAGES_PERMISSIONS_TABLE)) >> $$(FULL_DEVICE_TABLE)
> +	for f in $$(PACKAGES_PERMISSIONS_FILES); do \
> +		cat $$$${f} >> $$(FULL_DEVICE_TABLE) || exit 1; \
> +	done

 Actually I think it's simpler to do

	$$(if $$(strip $$(PACKAGES_PERMISSIONS_FILES)),\
		cat $$(PACKAGES_PERMISSIONS_FILES) >> $$(FULL_DEVICE_TABLE))

>  	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
>  	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
>  		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index dd8a1e2..343d1ad 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -915,6 +915,7 @@ PACKAGES += $(1)
>  ifneq ($$($(2)_PERMISSIONS),)
>  PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
>  endif
> +PACKAGES_PERMISSIONS_FILES += $$($(2)_PERMISSIONS_FILE)

 I really don't like having two ways to do the same thing. So I looked at
alternatives, and found this:

define BUSYBOX_PERMISSIONS
	$(foreach app,$(shell \
		for app in `grep -r -e "APPLET.*BB_SUID_REQUIRE\|APPLET.*BB_SUID_MAYBE"
$(BUSYBOX_DIR)/include/applets.h \
			| sed -e 's/,.*//' -e 's/.*(//'`; \
		do \
			grep -w $${app} $(BUSYBOX_DIR)/busybox.links; \
		done #) ),$(app) f 4755 0  0 - - - - -$(sep))
endef

 For that to work, the condition around PACKAGES_PERMISSIONS_TABLES += must be
removed, but that's fine IMO (just adds a lot of empty lines to the device
table, but that doesn't hurt). The #) is a bit ugly but I'm sure a better
solution can be found.

 With that solution, patches 2 and 3 wouldn't be needed.

 Regards,
 Arnout


>  ifneq ($$($(2)_DEVICES),)
>  PACKAGES_DEVICES_TABLE += $$($(2)_DEVICES)$$(sep)
>  endif
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
