From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 21:48:37 +0200
Subject: [Buildroot] [PATCH v4 1/7] libpjsip: Add Alsa option
In-Reply-To: <20180326214602.03744d9c@windsurf.home>
References: <20180312092953.24258-1-aduskett@gmail.com>
 <20180326214602.03744d9c@windsurf.home>
Message-ID: <20180326214827.600f6e89@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Mar 2018 21:46:02 +0200, Thomas Petazzoni wrote:

> The second problem is that the following defconfig fails to build:
> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.11-rc1.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> # BR2_PACKAGE_ALSA_LIB_ALOAD is not set
> # BR2_PACKAGE_ALSA_LIB_RAWMIDI is not set
> # BR2_PACKAGE_ALSA_LIB_HWDEP is not set
> # BR2_PACKAGE_ALSA_LIB_SEQ is not set
> # BR2_PACKAGE_ALSA_LIB_ALISP is not set
> # BR2_PACKAGE_ALSA_LIB_OLD_SYMBOLS is not set
> BR2_PACKAGE_LIBPJSIP=y
> BR2_PACKAGE_LIBPJSIP_ALSA=y
> BR2_PACKAGE_LIBPJSIP_CODEC_G711=y
> BR2_PACKAGE_LIBPJSIP_CODEC_G722=y
> BR2_PACKAGE_LIBPJSIP_CODEC_G7221=y
> BR2_PACKAGE_LIBPJSIP_CODEC_ILBC=y
> BR2_PACKAGE_LIBPJSIP_CODEC_L16=y
> BR2_PACKAGE_LIBPJSIP_CODEC_BCG729=y
> BR2_PACKAGE_LIBPJSIP_CODEC_GSM=y
> BR2_PACKAGE_LIBPJSIP_CODEC_OPENCORE_AMR=y
> BR2_PACKAGE_LIBPJSIP_CODEC_OPUS=y
> BR2_PACKAGE_LIBPJSIP_CODEC_SPEEX=y
> # BR2_TARGET_ROOTFS_TAR is not set

It fails like this:

if test ! -d ../bin; then mkdir -p ../bin; fi
/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -o ../bin/pjmedia-test-arm-buildroot-linux-uclibcgnueabi \
     output/pjmedia-test-arm-buildroot-linux-uclibcgnueabi/codec_vectors.o  output/pjmedia-test-arm-buildroot-linux-uclibcgnueabi/jbuf_test.o  output/pjmedia-test-arm-buildroot-linux-uclibcgnueabi/main.o  output/pjmedia-test-arm-buildroot-linux-uclibcgnueabi/mips_test.o  output/pjmedia-test-arm-buildroot-linux-uclibcgnueabi/vid_codec_test.o  output/pjmedia-test-arm-buildroot-linux-uclibcgnueabi/vid_dev_test.o  output/pjmedia-test-arm-buildroot-linux-uclibcgnueabi/vid_port_test.o  output/pjmedia-test-arm-buildroot-linux-uclibcgnueabi/rtp_test.o  output/pjmedia-test-arm-buildroot-linux-uclibcgnueabi/test.o  output/pjmedia-test-arm-buildroot-linux-uclibcgnueabi/sdp_neg_test.o -lpjmedia-codec -lpjmedia-videodev -lpjmedia-audiodev -lpjmedia -lpjnath -lpjlib-util -lpj  -lilbccodec -lg7221codec  -lsrtp -lgsm -lspeex -lspeexdsp
-L/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib  -Lyes/lib -lbcg729 -lopus -lm -lrt -lpthread  -lasound -lopencore-amrnb -lopencore-amrwb   -L/home/thomas/projets/buildroot/output/build/libpjsip-2.7.2/pjlib/lib -L/home/thomas/projets/buildroot/output/build/libpjsip-2.7.2/pjlib-util/lib -L/home/thomas/projets/buildroot/output/build/libpjsip-2.7.2/pjnath/lib -L/home/thomas/projets/buildroot/output/build/libpjsip-2.7.2/pjmedia/lib -L/home/thomas/projets/buildroot/output/build/libpjsip-2.7.2/pjsip/lib -L/home/thomas/projets/buildroot/output/build/libpjsip-2.7.2/third_party/lib         -L/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib  -Lyes/lib     
output/pjmedia-test-arm-buildroot-linux-uclibcgnueabi/mips_test.o: In function `amr_encode_decode':
mips_test.c:(.text+0x1ba8): undefined reference to `pjmedia_codec_opencore_amrnb_init'
mips_test.c:(.text+0x1bac): undefined reference to `pjmedia_codec_opencore_amrnb_deinit'
output/pjmedia-test-arm-buildroot-linux-uclibcgnueabi/mips_test.o: In function `speex16_encode_decode':
mips_test.c:(.text+0x1bfc): undefined reference to `pjmedia_codec_speex_init_default'
mips_test.c:(.text+0x1c00): undefined reference to `pjmedia_codec_speex_deinit'
output/pjmedia-test-arm-buildroot-linux-uclibcgnueabi/mips_test.o: In function `speex8_encode_decode':
mips_test.c:(.text+0x1c50): undefined reference to `pjmedia_codec_speex_init_default'
mips_test.c:(.text+0x1c54): undefined reference to `pjmedia_codec_speex_deinit'
output/pjmedia-test-arm-buildroot-linux-uclibcgnueabi/mips_test.o: In function `gsm_encode_decode':
mips_test.c:(.text+0x1d10): undefined reference to `pjmedia_codec_gsm_init'
mips_test.c:(.text+0x1d14): undefined reference to `pjmedia_codec_gsm_deinit'
output/pjmedia-test-arm-buildroot-linux-uclibcgnueabi/mips_test.o: In function `create_stream_amr':
mips_test.c:(.text+0x21b0): undefined reference to `pjmedia_codec_opencore_amrnb_init'
mips_test.c:(.text+0x21b4): undefined reference to `pjmedia_codec_opencore_amrnb_deinit'
output/pjmedia-test-arm-buildroot-linux-uclibcgnueabi/mips_test.o: In function `create_stream_gsm_srtp80_with_auth':
mips_test.c:(.text+0x2228): undefined reference to `pjmedia_codec_gsm_init'
mips_test.c:(.text+0x222c): undefined reference to `pjmedia_codec_gsm_deinit'
output/pjmedia-test-arm-buildroot-linux-uclibcgnueabi/mips_test.o: In function `create_stream_gsm_srtp80_no_auth':
mips_test.c:(.text+0x22a4): undefined reference to `pjmedia_codec_gsm_init'
mips_test.c:(.text+0x22a8): undefined reference to `pjmedia_codec_gsm_deinit'
output/pjmedia-test-arm-buildroot-linux-uclibcgnueabi/mips_test.o: In function `create_stream_gsm_srtp32_with_auth':
mips_test.c:(.text+0x231c): undefined reference to `pjmedia_codec_gsm_init'
mips_test.c:(.text+0x2320): undefined reference to `pjmedia_codec_gsm_deinit'
output/pjmedia-test-arm-buildroot-linux-uclibcgnueabi/mips_test.o: In function `create_stream_gsm_srtp32_no_auth':
mips_test.c:(.text+0x2398): undefined reference to `pjmedia_codec_gsm_init'
mips_test.c:(.text+0x239c): undefined reference to `pjmedia_codec_gsm_deinit'
output/pjmedia-test-arm-buildroot-linux-uclibcgnueabi/mips_test.o: In function `create_stream_gsm':
mips_test.c:(.text+0x2410): undefined reference to `pjmedia_codec_gsm_init'
mips_test.c:(.text+0x2414): undefined reference to `pjmedia_codec_gsm_deinit'
collect2: error: ld returned 1 exit status
make[4]: *** [/home/thomas/projets/buildroot/output/build/libpjsip-2.7.2/build/rules.mak:125: ../bin/pjmedia-test-arm-buildroot-linux-uclibcgnueabi] Error 1
make[3]: *** [Makefile:243: pjmedia-test-arm-buildroot-linux-uclibcgnueabi] Error 2
make[2]: *** [Makefile:14: all] Error 1
make[1]: *** [package/pkg-generic.mk:224: /home/thomas/projets/buildroot/output/build/libpjsip-2.7.2/.stamp_built] Error 2
make: *** [Makefile:79: _all] Error 2

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
