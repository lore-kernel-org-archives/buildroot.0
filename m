From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 22:46:04 +0100
Subject: [Buildroot] [PATCH 1/1 v4] ubus: new package
In-Reply-To: <1413382225-31276-1-git-send-email-swexru@gmail.com>
References: <1413382225-31276-1-git-send-email-swexru@gmail.com>
Message-ID: <20141027224604.2e6593ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Mednyy,

On Wed, 15 Oct 2014 18:10:25 +0400, Alexey Mednyy wrote:

>  ...c-dependency-Werror-off-build-examples-of.patch | 49 ++++++++++++++++++++++
>  package/ubus/Config.in                             | 14 +++++++
>  package/ubus/ubus-01-json-definition-fix.patch     | 27 ++++++++++++

Your package does not build, as the two patches you've put in
package/ubus/ conflict with each other:

>>> ubus 4c4f35cf2230d70b9ddd87638ca911e8a563f2f3 Patching

Applying 0001-fixed-json-c-dependency-Werror-off-build-examples-of.patch using patch: 
patching file CMakeLists.txt

Applying ubus-01-json-definition-fix.patch using patch: 
patching file CMakeLists.txt
Hunk #1 FAILED at 25.
1 out of 1 hunk FAILED -- saving rejects to file CMakeLists.txt.rej
Patch failed!  Please fix ubus-01-json-definition-fix.patch!
make: *** [/home/thomas/projets/buildroot/output/build/ubus-4c4f35cf2230d70b9ddd87638ca911e8a563f2f3/.stamp_patched] Erreur 1

The two patches aren't identical, and I don't know which one to choose.

> diff --git a/package/ubus/0001-fixed-json-c-dependency-Werror-off-build-examples-of.patch b/package/ubus/0001-fixed-json-c-dependency-Werror-off-build-examples-of.patch
> new file mode 100644
> index 0000000..9c46a63
> --- /dev/null
> +++ b/package/ubus/0001-fixed-json-c-dependency-Werror-off-build-examples-of.patch
> @@ -0,0 +1,49 @@
> +From ea67d1fc6621abee5451e343e2d1a2303b4176f9 Mon Sep 17 00:00:00 2001
> +From: Alexey Mednyy <swexru@gmail.com>
> +Date: Wed, 15 Oct 2014 03:58:17 +0400
> +Subject: [PATCH 1/1] fixed json-c dependency, Werror-off, build examples-off
> +
> +Signed-off-by: Alexey Mednyy <swexru@gmail.com>
> +---
> + CMakeLists.txt | 14 ++++++++++----
> + 1 file changed, 10 insertions(+), 4 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index cb2f420..bd47c37 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -1,10 +1,10 @@
> + cmake_minimum_required(VERSION 2.6)
> + 
> + PROJECT(ubus C)
> +-ADD_DEFINITIONS(-Os -Wall -Werror --std=gnu99 -g3 -Wmissing-declarations)
> ++ADD_DEFINITIONS(-Os -Wall --std=gnu99 -g3 -Wmissing-declarations)
> + 
> + OPTION(BUILD_LUA "build Lua plugin" ON)
> +-OPTION(BUILD_EXAMPLES "build examples" ON)
> ++OPTION(BUILD_EXAMPLES "build examples" OFF)

This part is not needed, as the cmake-package infrastructure now passes
-DBUILD_EXAMPLES=OFF (this is a recent change).

> diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
> new file mode 100644
> index 0000000..7728a0c
> --- /dev/null
> +++ b/package/ubus/ubus.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# UBUS

ubus, in small letters.

> +#
> +################################################################################
> +
> +UBUS_VERSION = 4c4f35cf2230d70b9ddd87638ca911e8a563f2f3
> +UBUS_SITE = git://nbd.name/luci2/ubus.git
> +UBUS_LICENSE = LGPLv2.1
> +UBUS_DEPENDENCIES = json-c libubox
> +
> +ifeq ($(BR2_PACKAGE_LUA_5_1),y)
> +UBUS_DEPENDENCIES += lua
> +UBUS_CONF_OPTS += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
> +	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include \
> +	-DBUILD_LUA=ON
> +else
> +UBUS_CONF_OPTS += -DBUILD_LUA=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +UBUS_DEPENDENCIES += systemd
> +UBUS_CONF_OPTS += -DENABLE_SYSTEMD=ON
> +else
> +UBUS_CONF_OPTS += -DENABLE_SYSTEMD=OFF
> +endif
> +
> +$(eval $(cmake-package))

Other than that, looks good to me. Can you resubmit an updated version
that takes into account those comments?

In the mean time, I'll mark your patch as "Changes Requested" in our
patch tracking system.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
