From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 Apr 2010 23:44:39 +0200
Subject: [Buildroot] [PATCH 1/1] libaio: convert to the GENTARGETS
	infrastructure
In-Reply-To: <0254addf9b7aee9429122d5d6934adbe88b904d4.1270499953.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Mon, 5 Apr 2010 22:39:19 +0200")
References: <cover.1270499953.git.thomas.petazzoni@free-electrons.com>
	<cover.1270499953.git.thomas.petazzoni@free-electrons.com>
	<0254addf9b7aee9429122d5d6934adbe88b904d4.1270499953.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87mxxhshfc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/libaio/libaio.mk |   52 +++++++++++----------------------------------
 Thomas>  1 files changed, 13 insertions(+), 39 deletions(-)

 Thomas> diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
 Thomas> index f1bb603..58cdf6c 100644
 Thomas> --- a/package/libaio/libaio.mk
 Thomas> +++ b/package/libaio/libaio.mk
 Thomas> @@ -3,48 +3,22 @@
 Thomas>  # libaio
 Thomas>  #
 Thomas>  #############################################################
 Thomas> -LIBAIO_VERSION=0.3.106-avr32
 Thomas> +LIBAIO_VERSION=0.3.109
 Thomas>  LIBAIO_SOURCE=libaio-$(LIBAIO_VERSION).tar.bz2
 Thomas> -LIBAIO_SITE=http://avr32linux.org/twiki/pub/Main/LibAio/
 Thomas> -LIBAIO_DIR=$(BUILD_DIR)/libaio-$(LIBAIO_VERSION)
 Thomas> -LIBAIO_SOVER=1.0.1
 Thomas> +LIBAIO_SITE=ftp://ftp.kernel.org/pub/linux/libs/aio/

We have BR2_KERNEL_MIRROR, might be good to use.

 Thomas> +define LIBAIO_INSTALL_STAGING_CMDS
 Thomas> +  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
 Thomas> +endef

Are you missing a patch? I don't see any DESTDIR handling in the libaio
build system, and I get:

make[1]: Entering directory `/tmp/br/build/libaio-0.3.109'
make[2]: Entering directory `/tmp/br/build/libaio-0.3.109/src'
install -D -m 644 libaio.h /usr/include/libaio.h
install: cannot create regular file `/usr/include/libaio.h': Permission denied
make[2]: *** [install] Error 1
make[2]: Leaving directory `/tmp/br/build/libaio-0.3.109/src'
make[1]: *** [install] Error 2
make[1]: Leaving directory `/tmp/br/build/libaio-0.3.109'
make: *** [/tmp/br/build/libaio-0.3.109/.stamp_staging_installed] Error 2

-- 
Bye, Peter Korsgaard
