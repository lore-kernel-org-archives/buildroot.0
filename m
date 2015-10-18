From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 23:24:14 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/kodi-visualisation-goom: new
 package
In-Reply-To: <1445170286-12871-1-git-send-email-bernd.kuhls@t-online.de>
References: <1445170286-12871-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151018232414.72103d46@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun, 18 Oct 2015 14:11:25 +0200, Bernd Kuhls wrote:

> diff --git a/package/kodi-visualisation-goom/0001-cross-compile.patch b/package/kodi-visualisation-goom/0001-cross-compile.patch
> new file mode 100644
> index 0000000..3b051f2
> --- /dev/null
> +++ b/package/kodi-visualisation-goom/0001-cross-compile.patch
> @@ -0,0 +1,29 @@
> +Fix cross-compilation
> +
> +Use the cross-compiler and not the host version.
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +diff -uNr visualization.goom-fb5933ba5b2143d055cc7749dc60a82f6002b305.org/CMakeLists.txt visualization.goom-fb5933ba5b2143d055cc7749dc60a82f6002b305/CMakeLists.txt
> +--- visualization.goom-fb5933ba5b2143d055cc7749dc60a82f6002b305.org/CMakeLists.txt	2014-10-31 11:34:21.000000000 +0100
> ++++ visualization.goom-fb5933ba5b2143d055cc7749dc60a82f6002b305/CMakeLists.txt	2015-07-19 19:49:43.340054342 +0200
> +@@ -13,6 +13,10 @@
> +                     ${KODI_INCLUDE_DIR}
> +                     ${PROJECT_SOURCE_DIR}/lib/goom2k4-0/src)
> + 
> ++get_filename_component( COMPILER_FILENAME "${CMAKE_C_COMPILER}" NAME )
> ++string( REGEX REPLACE "-[^-]+$" ""
> ++        TOOLCHAIN_NAME "${COMPILER_FILENAME}" )

Yerk, this is really horrible. But I guess you don't have much choice
here: a CMake build system that calls into an autotools build system
has high chances of requiring ugly things. But ok, we can take your
proposal (did you submit it upstream?).


> +KODI_VISUALISATION_GOOM_VERSION = 98137474683e7a4e18c61cd3710ea4bfebad9759
> +KODI_VISUALISATION_GOOM_SITE = $(call github,notspiff,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
> +KODI_VISUALISATION_GOOM_LICENSE = GPLv2+

Yes according to src/Main.cpp

> +KODI_VISUALISATION_GOOM_LICENSE_FILES = COPYING

But this file contains the text of the GPLv3. Can you report the issue
upstream?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
