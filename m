From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Tue, 20 Jan 2009 06:17:13 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/mplayer
Message-ID: <20090120061714.43EBC77108@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2009-01-20 06:17:12 +0000 (Tue, 20 Jan 2009)
New Revision: 24917

Log:
mplayer: add patch to fix compilation against alsa-lib 1.0.18

This adds a patch to fix compilation against alsa-lib 1.0.18. It is basically a
grab of the change from mplayer repository. It also refreshes the other patches
so they apply clean.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Added:
   trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-fix-alsa-output.patch

Modified:
   trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-atmel.3.patch
   trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-index.patch


Changeset:
Modified: trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-atmel.3.patch
===================================================================
--- trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-atmel.3.patch	2009-01-20 02:52:57 UTC (rev 24916)
+++ trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-atmel.3.patch	2009-01-20 06:17:12 UTC (rev 24917)
@@ -33,8 +33,6 @@
  create mode 100644 libswscale/pico-avr32.h
  create mode 100644 libswscale/yuv2rgb_avr32.c
 
-diff --git a/cfg-common.h b/cfg-common.h
-index 780df38..7d878a8 100644
 --- a/cfg-common.h
 +++ b/cfg-common.h
 @@ -235,6 +235,10 @@
@@ -48,8 +46,6 @@
  	// draw by slices or whole frame (useful with libmpeg2/libavcodec)
  	{"slices", &vd_use_slices, CONF_TYPE_FLAG, 0, 0, 1, NULL},
  	{"noslices", &vd_use_slices, CONF_TYPE_FLAG, 0, 1, 0, NULL},
-diff --git a/cfg-mencoder.h b/cfg-mencoder.h
-index 411b748..addf791 100644
 --- a/cfg-mencoder.h
 +++ b/cfg-mencoder.h
 @@ -5,6 +5,10 @@
@@ -63,8 +59,6 @@
  #ifdef USE_FAKE_MONO
  extern int fakemono; // defined in dec_audio.c
  #endif
-diff --git a/cfg-mplayer.h b/cfg-mplayer.h
-index 62b6eac..31499c2 100644
 --- a/cfg-mplayer.h
 +++ b/cfg-mplayer.h
 @@ -4,6 +4,10 @@
@@ -78,8 +72,6 @@
  extern int noconsolecontrols;
  
  #if defined(HAVE_FBDEV)||defined(HAVE_VESA)
-diff --git a/configure b/configure
-index 29002c8..56c6fe4 100755
 --- a/configure
 +++ b/configure
 @@ -1203,6 +1203,15 @@ EOF
@@ -116,8 +108,6 @@
      if test -f "$I/X11/Xlib.h" ; then
        _inc_x11="-I$I"
        _x11_headers="yes"
-diff --git a/libaf/af_format.c b/libaf/af_format.c
-index e5b7cc9..5d7ea6d 100644
 --- a/libaf/af_format.c
 +++ b/libaf/af_format.c
 @@ -20,7 +20,14 @@
@@ -135,11 +125,9 @@
  #else
  #define lrintf(x) ((int)(x))
  #endif
-diff --git a/libavcodec/Makefile b/libavcodec/Makefile
-index 17b6c45..8e1dc96 100644
 --- a/libavcodec/Makefile
 +++ b/libavcodec/Makefile
-@@ -360,6 +360,12 @@ OBJS-$(TARGET_ARCH_SPARC)              += sparc/dsputil_vis.o \
+@@ -360,6 +360,12 @@ OBJS-$(TARGET_ARCH_SPARC)              +
  
  sparc/dsputil_vis.o: CFLAGS += -mcpu=ultrasparc -mtune=ultrasparc
  
@@ -160,9 +148,6 @@
  	   armv4l/*.o armv4l/*~ \
  	   mlib/*.o mlib/*~ \
  	   alpha/*.o alpha/*~ \
-diff --git a/libavcodec/avr32/dsputil_avr32.c b/libavcodec/avr32/dsputil_avr32.c
-new file mode 100644
-index 0000000..200284d
 --- /dev/null
 +++ b/libavcodec/avr32/dsputil_avr32.c
 @@ -0,0 +1,2678 @@
@@ -2844,9 +2829,6 @@
 +}
 +#endif
 +
-diff --git a/libavcodec/avr32/fdct.S b/libavcodec/avr32/fdct.S
-new file mode 100644
-index 0000000..be45b86
 --- /dev/null
 +++ b/libavcodec/avr32/fdct.S
 @@ -0,0 +1,541 @@
@@ -3391,9 +3373,6 @@
 +
 +
 +
-diff --git a/libavcodec/avr32/h264idct.S b/libavcodec/avr32/h264idct.S
-new file mode 100644
-index 0000000..4b23e2d
 --- /dev/null
 +++ b/libavcodec/avr32/h264idct.S
 @@ -0,0 +1,451 @@
@@ -3848,9 +3827,6 @@
 +		
 +//    }
 +//}
-diff --git a/libavcodec/avr32/idct.S b/libavcodec/avr32/idct.S
-new file mode 100644
-index 0000000..e7551ec
 --- /dev/null
 +++ b/libavcodec/avr32/idct.S
 @@ -0,0 +1,829 @@
@@ -4683,9 +4659,6 @@
 +	.short	- FIX_1_961570560, - FIX_0_390180644, FIX_0_298631336, FIX_2_053119869
 +	.short	FIX_3_072711026, FIX_1_501321110, - FIX_0_899976223, - FIX_2_562915447
 +	
-diff --git a/libavcodec/avr32/mc.S b/libavcodec/avr32/mc.S
-new file mode 100644
-index 0000000..07a002d
 --- /dev/null
 +++ b/libavcodec/avr32/mc.S
 @@ -0,0 +1,434 @@
@@ -5123,9 +5096,6 @@
 +avg_pixels8_avr32:
 +avg_no_rnd_pixels8_avr32:
 +	pixels8	0	
-diff --git a/libavcodec/avr32/pico.h b/libavcodec/avr32/pico.h
-new file mode 100644
-index 0000000..32201ba
 --- /dev/null
 +++ b/libavcodec/avr32/pico.h
 @@ -0,0 +1,260 @@
@@ -5389,8 +5359,6 @@
 +
 +#endif
 +
-diff --git a/libavcodec/bitstream.h b/libavcodec/bitstream.h
-index 26b4f8d..1f8fabf 100644
 --- a/libavcodec/bitstream.h
 +++ b/libavcodec/bitstream.h
 @@ -171,7 +171,7 @@ typedef struct RL_VLC_ELEM {
@@ -5513,11 +5481,9 @@
  
  /**
   * parses a vlc code, faster then get_vlc()
-diff --git a/libavcodec/dsputil.c b/libavcodec/dsputil.c
-index 56c42b9..8fc10c6 100644
 --- a/libavcodec/dsputil.c
 +++ b/libavcodec/dsputil.c
-@@ -4197,6 +4197,9 @@ void dsputil_init(DSPContext* c, AVCodecContext *avctx)
+@@ -4197,6 +4197,9 @@ void dsputil_init(DSPContext* c, AVCodec
  #ifdef ARCH_BFIN
      dsputil_init_bfin(c,avctx);
  #endif
@@ -5527,8 +5493,6 @@
  
      for(i=0; i<64; i++){
          if(!c->put_2tap_qpel_pixels_tab[0][i])
-diff --git a/libavcodec/h264.c b/libavcodec/h264.c
-index 865e80a..8f7c3f1 100644
 --- a/libavcodec/h264.c
 +++ b/libavcodec/h264.c
 @@ -3258,7 +3258,12 @@ static void free_tables(H264Context *h){
@@ -5544,7 +5508,7 @@
      h->dequant8_coeff[0] = h->dequant8_buffer[0];
      h->dequant8_coeff[1] = h->dequant8_buffer[1];
  
-@@ -3281,7 +3286,13 @@ static void init_dequant8_coeff_table(H264Context *h){
+@@ -3281,7 +3286,13 @@ static void init_dequant8_coeff_table(H2
  
  static void init_dequant4_coeff_table(H264Context *h){
      int i,j,q,x;
@@ -5558,7 +5522,7 @@
      for(i=0; i<6; i++ ){
          h->dequant4_coeff[i] = h->dequant4_buffer[i];
          for(j=0; j<i; j++){
-@@ -4663,7 +4674,11 @@ static int decode_slice_header(H264Context *h){
+@@ -4663,7 +4674,11 @@ static int decode_slice_header(H264Conte
          if (MPV_common_init(s) < 0)
              return -1;
  
@@ -5570,11 +5534,9 @@
              memcpy(h->zigzag_scan, zigzag_scan, 16*sizeof(uint8_t));
              memcpy(h-> field_scan,  field_scan, 16*sizeof(uint8_t));
          }else{
-diff --git a/libavutil/common.h b/libavutil/common.h
-index 3ae5971..7e52b90 100644
 --- a/libavutil/common.h
 +++ b/libavutil/common.h
-@@ -283,23 +283,39 @@ static inline int mid_pred(int a, int b, int c)
+@@ -283,23 +283,39 @@ static inline int mid_pred(int a, int b,
   * @param amax maximum value of the clip range
   * @return cliped value
   */
@@ -5614,8 +5576,6 @@
  
  /* math */
  int64_t ff_gcd(int64_t a, int64_t b);
-diff --git a/libavutil/internal.h b/libavutil/internal.h
-index 285d304..a8b0718 100644
 --- a/libavutil/internal.h
 +++ b/libavutil/internal.h
 @@ -210,6 +210,15 @@ if((y)<(x)){\
@@ -5634,8 +5594,6 @@
  #ifndef HAVE_LRINTF
  /* XXX: add ISOC specific test to avoid specific BSD testing. */
  /* better than nothing implementation. */
-diff --git a/libfaad2/common.h b/libfaad2/common.h
-index f809042..6c5fb21 100644
 --- a/libfaad2/common.h
 +++ b/libfaad2/common.h
 @@ -67,7 +67,7 @@ extern "C" {
@@ -5647,8 +5605,6 @@
  #define FIXED_POINT
  #endif
  
-diff --git a/libmpcodecs/ad_libmad.c b/libmpcodecs/ad_libmad.c
-index 076359a..51b77fe 100644
 --- a/libmpcodecs/ad_libmad.c
 +++ b/libmpcodecs/ad_libmad.c
 @@ -86,6 +86,11 @@ static int init(sh_audio_t *sh){
@@ -5663,9 +5619,6 @@
    sh->samplesize=2;
    
    return 1;
-diff --git a/libswscale/pico-avr32.h b/libswscale/pico-avr32.h
-new file mode 100644
-index 0000000..7ac6200
 --- /dev/null
 +++ b/libswscale/pico-avr32.h
 @@ -0,0 +1,137 @@
@@ -5806,8 +5759,6 @@
 +
 +#endif
 +
-diff --git a/libswscale/swscale_internal.h b/libswscale/swscale_internal.h
-index ecd28f5..3221d0c 100644
 --- a/libswscale/swscale_internal.h
 +++ b/libswscale/swscale_internal.h
 @@ -173,7 +173,7 @@ typedef struct SwsContext{
@@ -5819,8 +5770,6 @@
  
  //FIXME replace this with something faster
  #define isPlanarYUV(x) ((x)==PIX_FMT_YUV410P || (x)==PIX_FMT_YUV420P	\
-diff --git a/libswscale/yuv2rgb.c b/libswscale/yuv2rgb.c
-index 71759bc..fa83985 100644
 --- a/libswscale/yuv2rgb.c
 +++ b/libswscale/yuv2rgb.c
 @@ -44,6 +44,10 @@
@@ -5834,7 +5783,7 @@
  #define DITHER1XBPP // only for mmx
  
  const uint8_t  __attribute__((aligned(8))) dither_2x2_4[2][8]={
-@@ -601,6 +605,12 @@ SwsFunc yuv2rgb_get_func_ptr (SwsContext *c)
+@@ -601,6 +605,12 @@ SwsFunc yuv2rgb_get_func_ptr (SwsContext
  	if(t) return t;
      }
  #endif
@@ -5847,7 +5796,7 @@
  #ifdef HAVE_ALTIVEC
      if (c->flags & SWS_CPU_CAPS_ALTIVEC)
      {
-@@ -678,6 +688,10 @@ int yuv2rgb_c_init_tables (SwsContext *c, const int inv_table[4], int fullRange,
+@@ -678,6 +688,10 @@ int yuv2rgb_c_init_tables (SwsContext *c
  //printf("%lld %lld %lld %lld %lld\n", cy, crv, cbu, cgu, cgv);
      oy -= 256*brightness;
  
@@ -5858,9 +5807,6 @@
      for (i = 0; i < 1024; i++) {
  	int j;
  
-diff --git a/libswscale/yuv2rgb_avr32.c b/libswscale/yuv2rgb_avr32.c
-new file mode 100644
-index 0000000..4a8341e
 --- /dev/null
 +++ b/libswscale/yuv2rgb_avr32.c
 @@ -0,0 +1,416 @@
@@ -6280,8 +6226,6 @@
 +
 +
 +#undef RGB
-diff --git a/libvo/vo_fbdev2.c b/libvo/vo_fbdev2.c
-index 053c193..7017770 100644
 --- a/libvo/vo_fbdev2.c
 +++ b/libvo/vo_fbdev2.c
 @@ -22,6 +22,9 @@
@@ -6310,7 +6254,7 @@
  	fb_bpp = fb_vinfo.bits_per_pixel;
  
  	/* 16 and 15 bpp is reported as 16 bpp */
-@@ -289,6 +301,10 @@ static int config(uint32_t width, uint32_t height, uint32_t d_width,
+@@ -289,6 +301,10 @@ static int config(uint32_t width, uint32
  		mp_msg(MSGT_VO, MSGL_ERR, "[fbdev2] Can't malloc next_frame: %s\n", strerror(errno));
  		return 1;
  	}
@@ -6423,7 +6367,7 @@
  }
  
  static void uninit(void)
-@@ -403,6 +478,10 @@ static int control(uint32_t request, void *data, ...)
+@@ -403,6 +478,10 @@ static int control(uint32_t request, voi
    switch (request) {
    case VOCTRL_QUERY_FORMAT:
      return query_format(*((uint32_t*)data));
@@ -6434,8 +6378,6 @@
    }
    return VO_NOTIMPL;
  }
-diff --git a/version.sh b/version.sh
-index 44b5c5d..cf22a68 100755
 --- a/version.sh
 +++ b/version.sh
 @@ -1,2 +1,2 @@

Added: trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-fix-alsa-output.patch
===================================================================
--- trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-fix-alsa-output.patch	                        (rev 0)
+++ trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-fix-alsa-output.patch	2009-01-20 06:17:12 UTC (rev 24917)
@@ -0,0 +1,150 @@
+--- a/libao2/ao_alsa.c
++++ b/libao2/ao_alsa.c
+@@ -263,48 +263,49 @@ static int str_maxlen(strarg_t *str) {
+   return 1;
+ }
+ 
+-/* change a PCM definition for correct AC-3 playback */
+-static void set_non_audio(snd_config_t *root, const char *name_with_args)
++static int try_open_device(const char *device, int open_mode, int try_ac3)
+ {
+-  char *name, *colon, *old_value_str;
+-  snd_config_t *config, *args, *aes0, *old_def, *def;
+-  int value, err;
+-
+-  /* strip the parameters from the PCM name */
+-  if ((name = strdup(name_with_args)) != NULL) {
+-    if ((colon = strchr(name, ':')) != NULL)
+-      *colon = '\0';
+-    /* search the PCM definition that we'll later use */
+-    if (snd_config_search_alias_hooks(root, strchr(name, '.') ? NULL : "pcm",
+-				      name, &config) >= 0) {
+-      /* does this definition have an "AES0" parameter? */
+-      if (snd_config_search(config, "@args", &args) >= 0 &&
+-	  snd_config_search(args, "AES0", &aes0) >= 0) {
+-	/* read the old default value */
+-	value = IEC958_AES0_CON_NOT_COPYRIGHT |
+-		IEC958_AES0_CON_EMPHASIS_NONE;
+-	if (snd_config_search(aes0, "default", &old_def) >= 0) {
+-	  /* don't use snd_config_get_integer() because alsa-lib <= 1.0.12
+-	   * parses hex numbers as strings */
+-	  if (snd_config_get_ascii(old_def, &old_value_str) >= 0) {
+-	    sscanf(old_value_str, "%i", &value);
+-	    free(old_value_str);
+-	  }
+-	} else
+-	  old_def = NULL;
+-	/* set the non-audio bit */
+-	value |= IEC958_AES0_NONAUDIO;
+-	/* set the new default value */
+-	if (snd_config_imake_integer(&def, "default", value) >= 0) {
+-	  if (old_def)
+-	    snd_config_substitute(old_def, def);
+-	  else
+-	    snd_config_add(aes0, def);
+-	}
++  int err, len;
++  char *ac3_device, *args;
++
++  if (try_ac3) {
++    /* to set the non-audio bit, use AES0=6 */
++    len = strlen(device);
++    ac3_device = malloc(len + 7 + 1);
++    if (!ac3_device)
++      return -ENOMEM;
++    strcpy(ac3_device, device);
++    args = strchr(ac3_device, ':');
++    if (!args) {
++      /* no existing parameters: add it behind device name */
++      strcat(ac3_device, ":AES0=6");
++    } else {
++      do
++	++args;
++      while (isspace(*args));
++      if (*args == '\0') {
++	/* ":" but no parameters */
++	strcat(ac3_device, "AES0=6");
++      } else if (*args != '{') {
++	/* a simple list of parameters: add it at the end of the list */
++	strcat(ac3_device, ",AES0=6");
++      } else {
++	/* parameters in config syntax: add it inside the { } block */
++	do
++	  --len;
++	while (len > 0 && isspace(ac3_device[len]));
++	if (ac3_device[len] == '}')
++	  strcpy(ac3_device + len, " AES0=6}");
+       }
+     }
+-    free(name);
++    err = snd_pcm_open(&alsa_handler, ac3_device, SND_PCM_STREAM_PLAYBACK,
++		       open_mode);
++    free(ac3_device);
+   }
++  if (!try_ac3 || err < 0)
++    err = snd_pcm_open(&alsa_handler, device, SND_PCM_STREAM_PLAYBACK,
++		       open_mode);
++  return err;
+ }
+ 
+ /*
+@@ -316,7 +317,6 @@ static int init(int rate_hz, int channel
+     int err;
+     int block;
+     strarg_t device;
+-    snd_config_t *my_config;
+     snd_pcm_uframes_t bufsize;
+     snd_pcm_uframes_t boundary;
+     opt_t subopts[] = {
+@@ -496,24 +496,12 @@ static int init(int rate_hz, int channel
+     }
+ 
+     if (!alsa_handler) {
+-      if ((err = snd_config_update()) < 0) {
+-	mp_msg(MSGT_AO,MSGL_ERR,"alsa-init: cannot read ALSA configuration: %s\n", snd_strerror(err));
+-	return 0;
+-      }
+-      if ((err = snd_config_copy(&my_config, snd_config)) < 0) {
+-	mp_msg(MSGT_AO,MSGL_ERR,"alsa-init: cannot copy configuration: %s\n", snd_strerror(err));
+-	return 0;
+-      }
+-      if (format == AF_FORMAT_AC3)
+-	set_non_audio(my_config, alsa_device);
+       //modes = 0, SND_PCM_NONBLOCK, SND_PCM_ASYNC
+-      if ((err = snd_pcm_open_lconf(&alsa_handler, alsa_device,
+-				    SND_PCM_STREAM_PLAYBACK, open_mode, my_config)) < 0)
++      if ((err = try_open_device(alsa_device, open_mode, format == AF_FORMAT_AC3)) < 0)
+ 	{
+ 	  if (err != -EBUSY && ao_noblock) {
+ 	    mp_msg(MSGT_AO,MSGL_INFO,"alsa-init: open in nonblock-mode failed, trying to open in block-mode\n");
+-	    if ((err = snd_pcm_open_lconf(&alsa_handler, alsa_device,
+-					  SND_PCM_STREAM_PLAYBACK, 0, my_config)) < 0) {
++	    if ((err = try_open_device(alsa_device, 0, format == AF_FORMAT_AC3)) < 0) {
+ 	      mp_msg(MSGT_AO,MSGL_ERR,"alsa-init: playback open error: %s\n", snd_strerror(err));
+ 	      return(0);
+ 	    }
+@@ -522,12 +510,11 @@ static int init(int rate_hz, int channel
+ 	    return(0);
+ 	  }
+ 	}
+-      snd_config_delete(my_config);
+ 
+       if ((err = snd_pcm_nonblock(alsa_handler, 0)) < 0) {
+          mp_msg(MSGT_AO,MSGL_ERR,"alsa-init: error set block-mode %s\n", snd_strerror(err));
+       } else {
+-	mp_msg(MSGT_AO,MSGL_V,"alsa-init: pcm opend in blocking mode\n");
++	mp_msg(MSGT_AO,MSGL_V,"alsa-init: pcm opened in blocking mode\n");
+       }
+ 
+       snd_pcm_hw_params_alloca(&alsa_hwparams);
+@@ -879,8 +866,8 @@ static int get_space(void)
+     }
+     
+     ret = snd_pcm_status_get_avail(status) * bytes_per_sample;
+-    if (ret > MAX_OUTBURST)
+-	    ret = MAX_OUTBURST;
++    if (ret > ao_data.buffersize)  // Buffer underrun?
++	ret = ao_data.buffersize;
+     return(ret);
+ }
+ 

Modified: trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-index.patch
===================================================================
--- trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-index.patch	2009-01-20 02:52:57 UTC (rev 24916)
+++ trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-index.patch	2009-01-20 06:17:12 UTC (rev 24917)
@@ -1,7 +1,6 @@
-diff -urN MPlayer-1.0rc1-0rig/stream/stream_dvb.c MPlayer-1.0rc1/stream/stream_dvb.c
---- MPlayer-1.0rc1-0rig/stream/stream_dvb.c	2006-10-23 00:32:25.000000000 +0200
-+++ MPlayer-1.0rc1/stream/stream_dvb.c	2007-09-25 08:37:54.000000000 +0200
-@@ -37,9 +37,7 @@
+--- a/stream/stream_dvb.c
++++ b/stream/stream_dvb.c
+@@ -37,9 +37,7 @@ Foundation, Inc., 675 Mass Ave, Cambridg
  #include <sys/poll.h>
  #include <unistd.h>
  #include <fcntl.h>
@@ -11,7 +10,7 @@
  
  #include "stream.h"
  #include "libmpdemux/demuxer.h"
-@@ -168,7 +166,7 @@
+@@ -168,7 +166,7 @@ static dvb_channels_list *dvb_get_channe
  		if((line[0] == '#') || (strlen(line) == 0))
  			continue;
  
