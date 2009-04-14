From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Apr 2009 09:09:07 +0200
Subject: [Buildroot] buildroot openssl compile error
In-Reply-To: <49E3FEAF.7040705@comcast.net>
References: <49E16433.9010707@comcast.net> <87fxgcbfcp.fsf@macbook.be.48ers.dk>
	<20090413220823.210225fe@surf> <49E3FEAF.7040705@comcast.net>
Message-ID: <20090414090907.2c297e77@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Brad,

Le Mon, 13 Apr 2009 22:10:39 -0500,
Brad Johnson <bradjohn263@comcast.net> a ?crit :

> /opt/arm-linux/usr/bin/arm-linux-gcc -I.. -I../.. -I../../include
> -fPIC -DOPENSS
> L_PIC -DZLIB_SHARED -DZLIB -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN 
> -DHAVE_DLF
> CN_H -DTERMIO -O3 -fomit-frame-pointer -Wall   -c -o c_zlib.o c_zlib.c
> c_zlib.c:25:18: error: zlib.h: No such file or directory
> 
> I do not see a --sysroot gcc argument. There is a 
> build_arm/staging_dir/usr/include/zlib.h.
> Please advise me as to how I can build openssl within buildroot using
> an external toolchain.

Thanks for the report. I've just run the compilation of openssl to
reproduce the issue. I strongly suspect that the following part of
openssl.mk is the culprit :

$(OPENSSL_TARGET_BUILD):
        $(MAKE1) CC=$(TARGET_CC) -C $(OPENSSL_DIR) all build-shared
        $(MAKE1) CC=$(TARGET_CC) -C $(OPENSSL_DIR) do_linux-shared
        touch $@

Because by passing CC=$(TARGET_CC) it overrides the value of CC passed
in $(TARGET_CONFIGURE_ARGS), which is CC="$(TARGET_CC)
$(TARGET_CFLAGS)".

I'm looking into this.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
