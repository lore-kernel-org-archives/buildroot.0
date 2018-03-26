From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 21:46:02 +0200
Subject: [Buildroot] [PATCH v4 1/7] libpjsip: Add Alsa option
In-Reply-To: <20180312092953.24258-1-aduskett@gmail.com>
References: <20180312092953.24258-1-aduskett@gmail.com>
Message-ID: <20180326214602.03744d9c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Mar 2018 05:29:47 -0400, Adam Duskett wrote:
> This is the first patch in a series that will enable audio support
> for libpjsip. This patch does the following:
> 
> - Turn libpjsip into a menuconfig option
> - Add a option for alsa support
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

I've applied your patches, did a few tweaks, but I have some issues.
Could you restart from what I've done at:

  https://git.bootlin.com/users/thomas-petazzoni/buildroot/log/?h=pjsip-improvements

The improvements I've done are:

 - Tweak the commit titles

 - Use the --enable-<foo> options for the dependency-less codecs, since
   those options definitely exist.

 - Minor other formatting tweaks.

 - Select BR2_PACKAGE_ALSA_LIB_MIXER in the first patch, otherwise the
   build fails when this option is disabled.

Unfortunately, with all this, I see two problems. The first problem is
that the link command line contains flags like -Lyes/lib. This is due
to constructs such as:

                    LDFLAGS="$LDFLAGS -L$with_opencore_amr/lib"

So when you pass --with-opencore-amr, $with_opencore_amr has the value
"yes". You should change such options to
--with-opencore-amr=$(STAGING_DIR)/usr instead.

The second problem is that the following defconfig fails to build:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.11-rc1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_PACKAGE_ALSA_LIB_ALOAD is not set
# BR2_PACKAGE_ALSA_LIB_RAWMIDI is not set
# BR2_PACKAGE_ALSA_LIB_HWDEP is not set
# BR2_PACKAGE_ALSA_LIB_SEQ is not set
# BR2_PACKAGE_ALSA_LIB_ALISP is not set
# BR2_PACKAGE_ALSA_LIB_OLD_SYMBOLS is not set
BR2_PACKAGE_LIBPJSIP=y
BR2_PACKAGE_LIBPJSIP_ALSA=y
BR2_PACKAGE_LIBPJSIP_CODEC_G711=y
BR2_PACKAGE_LIBPJSIP_CODEC_G722=y
BR2_PACKAGE_LIBPJSIP_CODEC_G7221=y
BR2_PACKAGE_LIBPJSIP_CODEC_ILBC=y
BR2_PACKAGE_LIBPJSIP_CODEC_L16=y
BR2_PACKAGE_LIBPJSIP_CODEC_BCG729=y
BR2_PACKAGE_LIBPJSIP_CODEC_GSM=y
BR2_PACKAGE_LIBPJSIP_CODEC_OPENCORE_AMR=y
BR2_PACKAGE_LIBPJSIP_CODEC_OPUS=y
BR2_PACKAGE_LIBPJSIP_CODEC_SPEEX=y
# BR2_TARGET_ROOTFS_TAR is not set

Could you have a look, fix those problems, and send an updated version ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
