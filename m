From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Fri, 21 Jul 2017 11:51:46 -0400
Subject: [Buildroot] [PATCH v4 2/3] qt5webengine: new package
In-Reply-To: <f54d8e9c-aede-ebd1-32b0-a3129333293b@gmail.com>
References: <20170720010527.5359-1-gael.portay@savoirfairelinux.com>
 <20170720010527.5359-3-gael.portay@savoirfairelinux.com>
 <f54d8e9c-aede-ebd1-32b0-a3129333293b@gmail.com>
Message-ID: <20170721155145.zm2gauvqgoqvxsmy@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Zoltan,

On Fri, Jul 21, 2017 at 11:45:26AM +0200, Zoltan Gyarmati wrote:
> Dear Ga?l,
> (...)
>
> > diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
> > new file mode 100644
> > index 000000000..cad32cc54
> > --- /dev/null
> > +++ b/package/qt5/qt5webengine/qt5webengine.hash
> > @@ -0,0 +1,5 @@
> > +# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.2/submodules/qtwebengine-opensource-src-5.6.2.tar.xz.mirrorlist
> > +sha256 2f0a1648e1a8b22bad0134f2b37d69d185074393c398c1a3c6a83b910ff39740  qtwebengine-opensource-src-5.6.2.tar.xz
> > +
> > +# Hash from: http://download.qt.io/official_releases/qt/5.8/5.8.0/submodules/qtwebengine-opensource-src-5.8.0.tar.xz.mirrorlist
> > +sha256 223d22f1660811e60677afe0a85f2f385823e25157689561489700c5d1da79be  qtwebengine-opensource-src-5.8.0.tar.xz
> 
> No hash entry for qtwebengine-opensource-src-5.9.1.tar.xz

That is because you applied my patch after the bump to 5.9.1.

	854b93370 package/qt5: bump latest version to 5.9.1

I am working on bumping Qt WebEngine to 5.9.1; but I met the following error
when I build it for a rpi3.

It concerns the opus codec which is build by chromium through Qt WebEngine.

	In file included from ../../3rdparty/chromium/third_party/opus/src/silk/arm/NSQ_neon.c:31:0:
	/home/gportay/src/buildroot/output-rpi-5.9-7/host/lib/gcc/arm-buildroot-linux-gnueabihf/7.1.0/include/arm_neon.h:10369:1: error: inlining failed in call to always_inline ?vld1q_s32?: target specific option mismatch
	 vld1q_s32 (const int32_t * __a)
	 ^~~~~~~~~
	../../3rdparty/chromium/third_party/opus/src/silk/arm/NSQ_neon.c:40:15: note: called from here
	     int32x4_t coef0 = vld1q_s32(coef32);
		       ^~~~~
	../../3rdparty/chromium/third_party/opus/src/silk/arm/NSQ_neon.c: At top level:
	cc1: warning: unrecognized command line option ?-Wno-#pragma-messages?
	[11/12339] CC obj/third_party/ffmpeg/ffmpeg_internal/autorename_libavcodec_flacdec.o
	ninja: build stopped: subcommand failed.

Now, I am enabling the WEBENGINE_CONFIG+=use_system_ffmpeg by default; building
the buildroot copy of opus, and it seems to compile.

> 
> Zoltan Gyarmati
> https://zgyarmati.de
> 

Regards,
Ga?l
