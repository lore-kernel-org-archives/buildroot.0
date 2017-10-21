From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 16:30:04 +0200
Subject: [Buildroot] [PATCH 1/3] zstd: install to staging directory
In-Reply-To: <20171016215904.3380-2-judge.packham@gmail.com>
References: <20171016215904.3380-1-judge.packham@gmail.com>
 <20171016215904.3380-2-judge.packham@gmail.com>
Message-ID: <20171021163004.4f8e21cf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Oct 2017 10:59:02 +1300, Chris Packham wrote:
> Install libzstd to the staging directory.
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  package/zstd/zstd.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index 089d654749..f149ad2f91 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -6,6 +6,7 @@
>  
>  ZSTD_VERSION = v1.3.2
>  ZSTD_SITE = $(call github,facebook,zstd,$(ZSTD_VERSION))
> +ZSTD_INSTALL_STAGING = YES
>  ZSTD_LICENSE = BSD-3-Clause, GPL-2.0
>  ZSTD_LICENSE_FILES = LICENSE COPYING
>  
> @@ -46,4 +47,9 @@ define ZSTD_INSTALL_TARGET_CMDS
>  		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
>  endef
>  
> +define ZSTD_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> +		DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D)/lib install
> +endef

This is a bit problematic. Following this, you have the libzstd shared
library installed in staging, which means that when you build a program
with "-lzstd", it gets linked against this shared library.

However, the libzstd shared library is not installed to TARGET_DIR, and
therefore such a program will fail to run on the target. The shared
library is currently not needed on the target, because the zstd program
is directly linked with the individual object files that compose the
library.

So, one option is to simply install the shared library as well on the
target, but that doubles the installation size: ~300 KB for the zstd
tool, and ~275 KB for the shared library.

Two possible solutions:

 - Fix the build system of zstd so that its program is dynamically
   linked against the libzstd shared library.

 - Add a sub-option "BR2_PACKAGE_ZSTD_INSTALL_LIB" that would install
   the library (to both staging and target), and that would be
   selected by the target squashfs package.

It is worth mentioning that your changes to the target squashfs package
most likely don't work correctly, because the mksquashfs on target will
be linked against the shared libzstd, but that library is not present
on the target.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
