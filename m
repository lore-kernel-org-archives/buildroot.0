From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 04 Dec 2015 21:37:13 +0100
Subject: [Buildroot] [PATCH] flite: disable ALSA support
In-Reply-To: <1449248389-33123-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Fri, 4 Dec 2015 16:59:49 +0000")
References: <1449248389-33123-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <878u5a9chy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Upstream says that ALSA support in flite is broken for earlier versions:
 > "Seems the alsa code I have breaks on earlier versions I'm not sure what
 > the threshold version is, but made this depend on the one I know -- you
 > can still specific --with-audio=alsa"

But we have the newest alsa-lib release in Buildroot, right?


> So let's disable it. It will prevent failures like this one:

 > /br/output/host/usr/bin/mipsel-linux-gcc -D_LARGEFILE_SOURCE
 > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -Wall -o
 > ../bin/find_sts find_sts_main.o -L../build/mipsel-linux-uclibc/lib
 > -lflite -lm
 > ../build/mipsel-linux-uclibc/lib/libflite.a(audio.o): In function
 > `audio_open':
 > audio.c:(.text+0x1c): undefined reference to `audio_open_oss'

This sounds more like it is building without alsa support. From
flite-1.4-release/src/audio/native_audio.h:

#ifdef CST_AUDIO_LINUX

#define AUDIO_OPEN_NATIVE audio_open_oss
..

#endif

#ifdef CST_AUDIO_ALSA

#define AUDIO_OPEN_NATIVE audio_open_alsa
..

#endif

Could you check config.log why it fails?

-- 
Bye, Peter Korsgaard
