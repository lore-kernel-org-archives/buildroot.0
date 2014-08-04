From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Date: Mon, 04 Aug 2014 17:28:26 +0200
Subject: [Buildroot] [PATCH v2] bcache-tools: Adding package.
In-Reply-To: <20140803185340.GI4052@free.fr>
References: <1406839219-10929-1-git-send-email-jcd@tribudubois.net>
 <20140803185340.GI4052@free.fr>
Message-ID: <53DFA69A.5020709@tribudubois.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

Thanks for the feedback/review.

Few questions below.

JC

Le 08/03/2014 08:53 PM, Yann E. MORIN a ?crit :
> Jean-Christophe, All,
>
> On 2014-07-31 22:40 +0200, Jean-Christophe DUBOIS spake thusly:
>> This patch adds the bcache-tools package to buildroot.
> This line above is not needed: it is obvious this is adding the package
> to Buildroot! ;-)
OK
>> This is the bcache tools, required to setup the linux bcache
>> feature of the Linux kernel.
>>
>> Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>
>> ---
>> diff --git a/package/bcache-tools/Config.in b/package/bcache-tools/Config.in
>> new file mode 100644
>> index 0000000..fbe4158
>> --- /dev/null
>> +++ b/package/bcache-tools/Config.in
>> @@ -0,0 +1,11 @@
>> +config BR2_PACKAGE_BCACHE_TOOLS
>> +	bool "bcache tools"
>> +	depends on BR2_PACKAGE_HAS_UDEV
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> Since you select sub-options of util-linux, you must also select the
> package itself:
>      select BR2_PACKAGE_UTIL_LINUX
>
> But you must also inherit its dependencies:
>      depends on BR2_LARGEFILE # util-linux
>      depends on BR2_USE_WCHAR # util-linux
>
> But you must also inherit from the sub-options' dependencies, too:
>      depends on BR2_USE_MMU # util-linux (libblkid)
Sorry I am new to buildroot, but wouldn't be expected that selecting 
LIBUUID and LIBBLKID would automatically select the LIBUUID and LIBBLKID 
dependencies and therefore it does not have to be explicitly selected by 
all packages depending on these features ?

If one day the util-linux dependency is changing, will it be expected to 
change the dependency of all package using linux-util?
>> +	help
>> +	  This is the bcache tools, required to setup the linux bcache
>> +	  feature of the Linux kernel.
>> +
>> +comment "bcache-tools needs udev /dev management"
>> +        depends on !BR2_PACKAGE_HAS_UDEV
> And you must adapt the comment to the dependencies above, like:
>      bcache needs udev /dev management and a toolchain w/ largefile, wchar
>
>> diff --git a/package/bcache-tools/bcache-tools.mk b/package/bcache-tools/bcache-tools.mk
>> new file mode 100644
>> index 0000000..8b0b061
>> --- /dev/null
>> +++ b/package/bcache-tools/bcache-tools.mk
>> @@ -0,0 +1,34 @@
>> +################################################################################
>> +#
>> +# bcache-tools
>> +#
>> +################################################################################
>> +
>> +BCACHE_TOOLS_VERSION = 1.0.7
>> +BCACHE_TOOLS_SITE = $(call github,g2p,bcache-tools,v$(BCACHE_TOOLS_VERSION))
>> +BCACHE_TOOLS_SOURCE = v$(BCACHE_TOOLS_VERSION).zip
>> +BCACHE_TOOLS_LICENSE = GPLv2
>> +BCACHE_TOOLS_LICENSE_FILES = COPYING
>> +BCACHE_TOOLS_DEPENDENCIES = host-pkgconf util-linux eudev
>> +BCACHE_TOOLS_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
>> +
>> +define BCACHE_TOOLS_EXTRACT_CMDS
>> +	unzip -d $(BUILD_DIR) $(DL_DIR)/$(BCACHE_TOOLS_SOURCE)
>> +endef
>> +
>> +define BCACHE_TOOLS_FIX_PKGCONFIG
>> +	$(SED) 's^`pkg-config^`$(PKG_CONFIG_HOST_BINARY)^' \
>> +		$(BCACHE_TOOLS_DIR)/Makefile
>> +endef
> This should probably be a post-extract hook. See:
>      http://buildroot.net/downloads/manual/manual.html#hooks
I'll look into this. I copied this from the dnsmasq package.
>> +define BCACHE_TOOLS_BUILD_CMDS
>> +	$(BCACHE_TOOLS_FIX_PKGCONFIG)
>> +	$(BCACHE_TOOLS_MAKE_ENV) $(MAKE) -C $(@D)
> This should probably be:
>      $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
>
> TARGET_CONFIGURE_OPTS contains the CC= assignment.
>
> Thus, the BCACHE_TOOLS_MAKE_ENV no longer makes sense, so you can remove
> it.
OK, this is also coming from dnsmasq package.
>
>> +endef
>> +
>> +define BCACHE_TOOLS_INSTALL_TARGET_CMDS
>> +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/share/man/man8
>> +	$(BCACHE_TOOLS_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> Ditto:
>      $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
>          DESTDIR=$(TARGET_DIR) install
>
> Regards,
> Yann E. MORIN.
>
>> +endef
>> +
>> +$(eval $(generic-package))
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
