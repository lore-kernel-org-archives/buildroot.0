From: Gururaja Hebbar K R <gururajakr@sanyo.co.in>
Date: Thu, 21 Feb 2008 06:52:58 +0530
Subject: [Buildroot] aplay fails because of alsa-lib build issue with uclibc
	and versioned symbols - (Solution included)
References: <mailman.1.1203278405.28189.buildroot@uclibc.org>
Message-ID: <5BF78BCE8D9BF14A83F836BD9E3916BA053E63@blrms.slti.sanyo.co.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

i had tried aplay before built statically with CodeSourcery toolchain
and it worked successfully on my arm board.

when i tried aplay built shared with buildroot uclibc arm926ejs
toolchain it failed with below error

mnt/mmc # aplay /home/default/10Sec_44.1K.wav
Playing WAVE '/home/default/10Sec_44.1K.wav' : Signed 16 bit Little
Endian, Rate 44100 Hz, Stereo
aplay: set_params:1012: unable to install sw params:
start_mode: DATA
xrun_mode: STOP
tstamp_mode: NONE
period_step: 1
sleep_min: 0
avail_min: 0
xfer_align: 10
silence_threshold: 0
silence_size: 0
boundary: 1073741824
/mnt/mmc #

When i searched on the internet for below error, i found that this error
is mainly related to alsa-lib and uclibc and it requires adding
--with-versioned=no as an option to alsa-lib ./configure.

http://article.gmane.org/gmane.linux.alsa.devel/50595

i added the same to alsa-lib.mk and now its working fine.

		./configure \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--prefix=/usr \
		--with-versioned=no \
		--sysconfdir=/etc \
		--enable-shared \
		--enable-static \
		--disable-docs \
		$(DISABLE_NLS) \


Kindly can someone shed some light on this and if required can someone
add patch to alsa-lib make file.

Thanks in advance

Regards
Gururaja
