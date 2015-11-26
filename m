From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 07:16:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/audiofile: add patch to fix
	static linking issue
In-Reply-To: <1448400166-4487-1-git-send-email-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?= Krause"'s message of "Tue, 24 Nov 2015 22:22:46
 +0100")
References: <1448400166-4487-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <87si3twaj4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Static linking userspace programs such as MPD against libaudiofile fails if
 > FLAC is available, because libaudiofile is linked against FLAC, but this isn't
 > expressed in the pkg-config file:

 > [..]
 > arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libaudiofile.a(FLAC.o): In function `FLACDecoder::reset2()':
 > FLAC.cpp:(.text+0x58): undefined reference to `FLAC__stream_decoder_seek_absolute'
 > /home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libaudiofile.a(FLAC.o): In function `FLACEncoder::sync2()':
 > FLAC.cpp:(.text+0x88): undefined reference to `FLAC__stream_encoder_finish'
 > /home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libaudiofile.a(FLAC.o): In function `FLACDecoder::~FLACDecoder()':
 > FLAC.cpp:(.text+0xc4): undefined reference to `FLAC__stream_decoder_delete'
 > /home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libaudiofile.a(FLAC.o): In function `FLACEncoder::~FLACEncoder()':
 > FLAC.cpp:(.text+0x164): undefined reference to `FLAC__stream_encoder_delete'
 > /home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libaudiofile.a(FLAC.o): In function `FLACDecoder::runPull()':
 > [..]

 > The Libs.private field is specifically designed for such usage:

 > From pkg-config documentation:

 >   Libs.private:

 >     This line should list any private libraries in use.  Private
 >     libraries are libraries which are not exposed through your
 >     library, but are needed in the case of static linking.

 > Therefore, this patch adds a reference to FLAC as well as to lcov in the
 > Libs.private field of the pkg-config file.

 > Patch status: Pending
 > https://github.com/mpruett/audiofile/pull/26

 > Fixes:
 > http://autobuild.buildroot.net/results/e95/e959e703a8db81032da27bece295c121e53d830d/
 > http://autobuild.buildroot.net/results/10b/10bd00209f098e8782016355cb2f46d1d3e7d3a3/
 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
