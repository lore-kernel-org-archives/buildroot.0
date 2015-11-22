From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 14:29:51 +0100
Subject: [Buildroot] [PATCH 3/3] package/zmqpp: fix static build issues
In-Reply-To: <1448052881-29222-3-git-send-email-joerg.krause@embedded.rocks>
References: <1448052881-29222-1-git-send-email-joerg.krause@embedded.rocks>
 <1448052881-29222-3-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151122142951.5d5b86d5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg,

On Fri, 20 Nov 2015 21:54:41 +0100, J?rg Krause wrote:

> diff --git a/package/zmqpp/0002-Add-minimal-support-for-disabling-shared-library.patch b/package/zmqpp/0002-Add-minimal-support-for-disabling-shared-library.patch
> new file mode 100644
> index 0000000..c0d4e8f
> --- /dev/null
> +++ b/package/zmqpp/0002-Add-minimal-support-for-disabling-shared-library.patch
> @@ -0,0 +1,75 @@
> +From 547d707370c128f223a6147de6b012a83a9fc3f3 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
> +Date: Fri, 20 Nov 2015 19:51:50 +0100
> +Subject: [PATCH 2/2] Add minimal support for disabling shared library
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> +---
> + Makefile | 13 +++++++++----
> + 1 file changed, 9 insertions(+), 4 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 7d63077..2e9aed3 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -71,7 +71,7 @@ ifneq (,$(findstring $(CONFIG),release loadtest))
> + 	CONFIG_FLAGS = -O3 -funroll-loops -ffast-math -finline-functions -fomit-frame-pointer -DNO_DEBUG_LOG -DNO_TRACE_LOG -DNDEBUG
> + endif
> + 
> +-COMMON_FLAGS = -MMD -std=c++0x -pipe -Wall -fPIC \
> ++COMMON_FLAGS = -MMD -std=c++0x -pipe -Wall \
> + 	-DBUILD_ENV=$(CONFIG) \
> + 	-DBUILD_VERSION='"$(APP_VERSION)"' \
> + 	-DBUILD_VERSION_MAJOR=$(VERSION_MAJOR) \
> +@@ -82,6 +82,10 @@ COMMON_FLAGS = -MMD -std=c++0x -pipe -Wall -fPIC \
> + 	-DBUILD_CLIENT_NAME='"$(CLIENT_TARGET)"' \
> + 	-I$(SRC_PATH)
> + 
> ++ifeq ($(BUILD_SHARED),yes)
> ++COMMON_FLAGS += -fPIC
> ++endif

I think the approach is probably OK, but in order for the patch to be
potentially acceptable upstream, it should preserve the existing
behavior. This means that by default, both the static and shared
variants should be built, so you should probably no:

BUILD_SHARED ?= yes

in the Makefile. And then, in the package .mk file, explicitly pass
BUILD_SHARED=no or BUILD_SHARED=yes depending on BR2_STATIC_LIBS.


> +ifeq ($(BR2_SHARED_LIBS),y)
> +TARGET_CONFIGURE_OPTS += BUILD_SHARED=yes
> +endif

This is not good since we also want the shared library in the
BR2_SHARED_STATIC_LIBS case.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
