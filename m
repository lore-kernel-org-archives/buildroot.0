From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Apr 2021 21:49:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/zerotier-one: new package
In-Reply-To: <20210324054413.1705067-1-tianyuanhao@aliyun.com>
References: <20210324054413.1705067-1-tianyuanhao@aliyun.com>
Message-ID: <a7bcab84-9426-326c-ad2e-3e611b197f60@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Tian,

 Thanks for this patch. I have a few minor comments. Could you please fix and
resend?

On 24/03/2021 06:44, Tian Yuanhao via buildroot wrote:
> ZeroTier One lets you join ZeroTier virtual networks and have them
> appear as tun/tap ports on your system.
> 
> Adapted from:
> https://github.com/openwrt/packages/tree/openwrt-21.02/net/zerotier
> 
> CC: Moritz Warning <moritzwarning@web.de>
> Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
> ---
>  package/Config.in                             |  1 +
>  ...ind-miniupnpc.h-in-staging-directory.patch | 22 ++++++++++++
>  package/zerotier-one/0002-remove-pie.patch    | 28 +++++++++++++++
>  ...003-remove-arm32-conservative-CFLAGS.patch | 20 +++++++++++
>  .../0004-accept-external-linker-flags.patch   | 20 +++++++++++
>  package/zerotier-one/0005-link-natpmp.patch   | 20 +++++++++++
>  package/zerotier-one/0006-gcc10.patch         | 24 +++++++++++++
>  ...0007-add-cerrno-header-for-str-errno.patch | 23 ++++++++++++
>  ...x-compilation-for-arm_cortex-a7-neon.patch | 23 ++++++++++++
>  package/zerotier-one/0009-auxv.patch          | 11 ++++++
>  package/zerotier-one/Config.in                | 14 ++++++++
>  package/zerotier-one/zerotier-one.hash        |  3 ++
>  package/zerotier-one/zerotier-one.mk          | 35 +++++++++++++++++++
>  13 files changed, 244 insertions(+)
>  create mode 100644 package/zerotier-one/0001-find-miniupnpc.h-in-staging-directory.patch
>  create mode 100644 package/zerotier-one/0002-remove-pie.patch
>  create mode 100644 package/zerotier-one/0003-remove-arm32-conservative-CFLAGS.patch
>  create mode 100644 package/zerotier-one/0004-accept-external-linker-flags.patch
>  create mode 100644 package/zerotier-one/0005-link-natpmp.patch
>  create mode 100644 package/zerotier-one/0006-gcc10.patch
>  create mode 100644 package/zerotier-one/0007-add-cerrno-header-for-str-errno.patch
>  create mode 100644 package/zerotier-one/0008-fix-compilation-for-arm_cortex-a7-neon.patch
>  create mode 100644 package/zerotier-one/0009-auxv.patch
>  create mode 100644 package/zerotier-one/Config.in
>  create mode 100644 package/zerotier-one/zerotier-one.hash
>  create mode 100644 package/zerotier-one/zerotier-one.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index d278e78b68..4dec62fe24 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2323,6 +2323,7 @@ endif
>  	source "package/xinetd/Config.in"
>  	source "package/xl2tp/Config.in"
>  	source "package/xtables-addons/Config.in"
> +	source "package/zerotier-one/Config.in"
>  	source "package/znc/Config.in"
>  
>  endmenu
> diff --git a/package/zerotier-one/0001-find-miniupnpc.h-in-staging-directory.patch b/package/zerotier-one/0001-find-miniupnpc.h-in-staging-directory.patch
> new file mode 100644
> index 0000000000..e9724f01d2
> --- /dev/null
> +++ b/package/zerotier-one/0001-find-miniupnpc.h-in-staging-directory.patch
> @@ -0,0 +1,22 @@
> +From 552cda1ebff6c5182eecdcb35961fd6b441dfa52 Mon Sep 17 00:00:00 2001
> +From: Moritz Warning <moritzwarning@web.de>
> +Date: Mon, 23 Apr 2018 22:12:31 +0200
> +Subject: [PATCH 1/8] find miniupnpc.h in staging directory
> +

 Every patch requires a separate SoB by yourself, even if you're not the author.
This way you validate that it is possible to propagate the patch under the
BUSL-1.1 license.

 Also, please include the provenance of the patch if you didn't create it yourself.

 Finally, please also check if this patch was sent upstream. If yes, please
include a reference to the upstream bug or PR. If not, ideally you should create
an upstream PR, or at least indicate why this is not possible.

 So in this case, there should be:

Patch taken from
https://github.com/openwrt/packages/blob/openwrt-21.02/net/zerotier/patches/0001-find-miniupnpc.h-in-staging-directory.patch

Upstream status: ...

Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>


 (Also, normally we don't want the "1/8" part in the subject line. In this case,
though, it's a straight copy-paste from openwrt so it's OK.)


 The same comments obviously apply to all other patches.

[snip]
> diff --git a/package/zerotier-one/0006-gcc10.patch b/package/zerotier-one/0006-gcc10.patch
> new file mode 100644
> index 0000000000..9550dfdde4
> --- /dev/null
> +++ b/package/zerotier-one/0006-gcc10.patch
> @@ -0,0 +1,24 @@
> +From e0c76c5ccf049d22bc47d723567926346e4d3639 Mon Sep 17 00:00:00 2001
> +From: Moritz Warning <moritzwarning@web.de>
> +Date: Sat, 21 Nov 2020 18:19:21 +0100
> +Subject: [PATCH 6/8] gcc10
> +
> +---
> + osdep/Binder.hpp | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +--- a/osdep/Binder.hpp
> ++++ b/osdep/Binder.hpp
> +@@ -396,9 +396,9 @@ public:
> + 					}
> + #endif // __LINUX__
> + 					if (_bindingCount < ZT_BINDER_MAX_BINDINGS) {
> +-						_bindings[_bindingCount].udpSock = udps;
> +-						_bindings[_bindingCount].tcpListenSock = tcps;
> +-						_bindings[_bindingCount].address = ii->first;
> ++						_bindings[(unsigned int)_bindingCount].udpSock = udps;
> ++						_bindings[(unsigned int)_bindingCount].tcpListenSock = tcps;
> ++						_bindings[(unsigned int)_bindingCount].address = ii->first;
> + 						phy.setIfName(udps,(char*)ii->second.c_str(),(int)ii->second.length());
> + 						++_bindingCount;
> + 					}

 Upstream reject this patch (https://github.com/zerotier/ZeroTierOne/pull/1232)
because it is actually a GCC bug that is fixed in GCC 10.2.0. Since we have that
GCC version in all our releases, we don't need this patch.

 Also note that openwrt copied this patch from an upstream MR, but totally
destroyed the commit message and authorship. Removing authorship is probably a
license violation (I haven't checked BUSL, but giving credit is a pretty
standard license term). So we can't accept this patch. Probably many of the
other patches are in a similar situation.


[snip]
> diff --git a/package/zerotier-one/zerotier-one.hash b/package/zerotier-one/zerotier-one.hash
> new file mode 100644
> index 0000000000..f6892a0cc2
> --- /dev/null
> +++ b/package/zerotier-one/zerotier-one.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  0f45a4050cdfea1018634c88b6c302cbbfcc3f7f93cb94bed840a15e3ffa55ba  zerotier-one-1.6.4.tar.gz
> +sha256  ef3edeecd9fa4fb5eff7a74afe964a02b7d9136bd07c4b4cd3864432d6890515  LICENSE.txt
> diff --git a/package/zerotier-one/zerotier-one.mk b/package/zerotier-one/zerotier-one.mk
> new file mode 100644
> index 0000000000..f7262e875d
> --- /dev/null
> +++ b/package/zerotier-one/zerotier-one.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# zerotier-one
> +#
> +################################################################################
> +
> +ZEROTIER_ONE_VERSION = 1.6.4
> +ZEROTIER_ONE_SITE = $(call github,zerotier,ZeroTierOne,$(ZEROTIER_ONE_VERSION))
> +ZEROTIER_ONE_DEPENDENCIES = libminiupnpc libnatpmp
> +ZEROTIER_ONE_LICENSE = BUSL-1.1
> +ZEROTIER_ONE_LICENSE_FILES = LICENSE.txt
> +
> +define ZEROTIER_ONE_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +endef
> +
> +define ZEROTIER_ONE_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +endef
> +
> +define ZEROTIER_ONE_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 644 $(@D)/debian/zerotier-one.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/zerotier-one.service
> +endef
> +
> +define ZEROTIER_ONE_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 755 $(@D)/debian/zerotier-one.init \
> +		$(TARGET_DIR)/etc/init.d/S60zerotier-one
> +endef
> +
> +define ZEROTIER_ONE_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)

 Is this the only kernel option needed?

 Regards,
 Arnout

> +endef
> +
> +$(eval $(generic-package))
> 
