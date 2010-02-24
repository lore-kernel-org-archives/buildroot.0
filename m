From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Feb 2010 22:59:32 +0100
Subject: [Buildroot] [git commit master] madplay: add patch to switch to the
	new ALSA API
Message-ID: <20100224220118.0118577798@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=97b392b98468859ab2366995b6bee4140b38e388
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

madplay was failing to build with errors such as :

audio_alsa.o: In function `config':
audio_alsa.c:(.text+0x200): undefined reference to `snd_pcm_hw_params_set_rate_near at ALSA_0.9'
audio_alsa.c:(.text+0x25c): undefined reference to `snd_pcm_hw_params_set_buffer_time_near at ALSA_0.9'
audio_alsa.c:(.text+0x284): undefined reference to `snd_pcm_hw_params_get_buffer_size at ALSA_0.9'
audio_alsa.c:(.text+0x2a4): undefined reference to `snd_pcm_hw_params_set_period_time_near at ALSA_0.9'
audio_alsa.c:(.text+0x2d4): undefined reference to `snd_pcm_hw_params_get_period_size at ALSA_0.9'

The ALSA library uses symbol versioning by default, to handle ABI
changes. However, since uClibc doesn't seem to support symbol
versioning, we disable this when building the ALSA library by passing
--without-versioned.

However, madplay relies on the old ALSA ABI, so even without symbol
versioning, references to versioned symbols are generated (functions
with the same name, but different API, exist in the old and new API).

The easiest solution is to switch madplay to the new API. This is done
thanks to a patch written by Micha Nelissen <micha@neli.hopto.org> and
available at http://article.gmane.org/gmane.comp.audio.mad.devel/729.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../madplay-0.15.2b-switch-to-new-alsa-api.patch   |  173 ++++++++++++++++++++
 1 files changed, 173 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/madplay/madplay-0.15.2b-switch-to-new-alsa-api.patch

diff --git a/package/multimedia/madplay/madplay-0.15.2b-switch-to-new-alsa-api.patch b/package/multimedia/madplay/madplay-0.15.2b-switch-to-new-alsa-api.patch
new file mode 100644
index 0000000..60d7bd3
--- /dev/null
+++ b/package/multimedia/madplay/madplay-0.15.2b-switch-to-new-alsa-api.patch
@@ -0,0 +1,173 @@
+Switch madplay to the new API. This is done thanks to a patch written
+by Micha Nelissen <micha@neli.hopto.org> and available at
+http://article.gmane.org/gmane.comp.audio.mad.devel/729.
+
+--- madplay-0.15.2b/audio_alsa.c	2008-10-18 15:10:16.000000000 +0200
++++ madplay-0.15.2b/audio_alsa.c.new	2008-10-18 15:03:27.000000000 +0200
+@@ -28,31 +28,30 @@
+
+ #include <errno.h>
+
+-#define ALSA_PCM_OLD_HW_PARAMS_API
+-#define ALSA_PCM_OLD_SW_PARAMS_API
+ #include <alsa/asoundlib.h>
+
+ #include <mad.h>
+
+ #include "audio.h"
+
+-char *buf	= NULL;
+-int paused	= 0;
++#define BUFFER_TIME_MAX     500000
+
+-int rate	= -1;
+-int channels	= -1;
+-int bitdepth	= -1;
+-int sample_size	= -1;
+-
+-int buffer_time		= 500000;
+-int period_time		= 100000;
+-char *defaultdev	= "plughw:0,0";
++unsigned char *buf  = NULL;
++int paused	    = 0;
++
++unsigned int rate           = 0;
++unsigned int channels	    = -1;
++unsigned int bitdepth	    = -1;
++unsigned int sample_size    = -1;
++
++unsigned int buffer_time;
++unsigned int period_time;
++char *defaultdev	    = "plughw:0,0";
+
+ snd_pcm_hw_params_t *alsa_hwparams;
+ snd_pcm_sw_params_t *alsa_swparams;
+
+-snd_pcm_sframes_t buffer_size;
+-snd_pcm_sframes_t period_size;
++snd_pcm_uframes_t buffer_size;
+
+ snd_pcm_format_t  alsa_format = -1;
+ snd_pcm_access_t  alsa_access = SND_PCM_ACCESS_MMAP_INTERLEAVED;
+@@ -66,14 +65,20 @@
+ 		 snd_pcm_hw_params_t *params,
+ 		 snd_pcm_access_t access)
+ {
+-	int err, dir;
+-	
++	int err;
++
+ 	/* choose all parameters */
+ 	err = snd_pcm_hw_params_any(handle,params);
+ 	if (err < 0) {
+ 		printf("Access type not available for playback: %s\n", snd_strerror(err));
+ 		return err;
+ 	}
++	/* set the access type */
++	err = snd_pcm_hw_params_set_access(handle, params, alsa_access);
++	if (err < 0) {
++		printf("Sample format not available for playback: %s\n", snd_strerror(err));
++		return err;
++	}
+ 	/* set the sample format */
+ 	err = snd_pcm_hw_params_set_format(handle, params, alsa_format);
+ 	if (err < 0) {
+@@ -87,29 +92,38 @@
+ 		return err;
+ 	}
+ 	/* set the stream rate */
+-	err = snd_pcm_hw_params_set_rate_near(handle, params, rate, 0);
++	err = snd_pcm_hw_params_set_rate(handle, params, rate, 0);
+ 	if (err < 0) {
+ 		printf("Rate %iHz not available for playback: %s\n", rate, snd_strerror(err));
+ 		return err;
+ 	}
+-	if (err != rate) {
+-		printf("Rate doesn't match (requested %iHz, get %iHz)\n", rate, err);
+-		return -EINVAL;
+-	}
++	err = snd_pcm_hw_params_get_buffer_time_max(params, &buffer_time, NULL);
++        if (err < 0) {
++                printf("Unable to retrieve buffer time: %s\n", snd_strerror(err));
++                return err;
++        }
++        if (buffer_time > BUFFER_TIME_MAX)
++                buffer_time = BUFFER_TIME_MAX;
+ 	/* set buffer time */
+-	err = snd_pcm_hw_params_set_buffer_time_near(handle, params, buffer_time, &dir);
++	err = snd_pcm_hw_params_set_buffer_time_near(handle, params, &buffer_time, 0);
+ 	if (err < 0) {
+ 		printf("Unable to set buffer time %i for playback: %s\n", buffer_time, snd_strerror(err));
+ 		return err;
+ 	}
+-	buffer_size = snd_pcm_hw_params_get_buffer_size(params);
++        if (period_time * 4 > buffer_time)
++                period_time = buffer_time / 4;
+ 	/* set period time */
+-	err = snd_pcm_hw_params_set_period_time_near(handle, params, period_time, &dir);
++	err = snd_pcm_hw_params_set_period_time_near(handle, params, &period_time, NULL);
+ 	if (err < 0) {
+ 		printf("Unable to set period time %i for playback: %s\n", period_time, snd_strerror(err));
+ 		return err;
+ 	}
+-	period_size = snd_pcm_hw_params_get_period_size(params, &dir);
++        /* retrieve buffer size */
++	err = snd_pcm_hw_params_get_buffer_size(params, &buffer_size);
++        if (err < 0) {
++                printf("Unable to retrieve buffer size: %s\n", snd_strerror(err));
++                return err;
++        }
+ 	/* write the parameters to device */
+ 	err = snd_pcm_hw_params(handle, params);
+ 	if (err < 0) {
+@@ -123,6 +137,7 @@
+ int set_swparams(snd_pcm_t *handle,
+ 		 snd_pcm_sw_params_t *params)
+ {
++        unsigned int start_threshold;
+ 	int err;
+
+         /* get current swparams */
+@@ -136,13 +151,7 @@
+         if (err < 0) {
+                 printf("Unable to set start threshold mode for playback: %s\n", snd_strerror(err));
+                 return err;
+-										        }
+-        /* allow transfer when@least period_size samples can be processed */
+-        err = snd_pcm_sw_params_set_avail_min(handle, params, period_size);
+-        if (err < 0) {
+-                printf("Unable to set avail min for playback: %s\n", snd_strerror(err));
+-                return err;
+-												        }
++	}
+         /* align all transfers to 1 samples */
+         err = snd_pcm_sw_params_set_xfer_align(handle, params, 1);
+         if (err < 0) {
+@@ -190,7 +199,7 @@
+ 	rate		= config->speed;
+
+ 	if ( bitdepth == 0 )
+-		config->precision = bitdepth = 32;
++		config->precision = bitdepth = 16;
+
+ 	switch (bitdepth)
+ 	{
+@@ -241,7 +250,7 @@
+ 		return -1;
+ 	}
+
+-	buf = malloc(buffer_size);
++	buf = malloc(buffer_size * sample_size);
+ 	if (buf == NULL) {
+ 		audio_error="unable to allocate output buffer table";
+ 		return -1;
+@@ -279,7 +288,7 @@
+ int play(struct audio_play *play)
+ {
+ 	int err, len;
+-	char *ptr;
++	unsigned char *ptr;
+
+ 	ptr = buf;
+ 	len = play->nsamples;
+
-- 
1.6.3.3
