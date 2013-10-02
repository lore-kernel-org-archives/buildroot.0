From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Oct 2013 22:27:20 +0200
Subject: [Buildroot] location of libxml2 header files ?
In-Reply-To: <5B53459BF5874D2CB0A49D06A82B64DC@JohanW7> (Sagaert Johan's
 message of "Wed, 2 Oct 2013 18:06:31 +0200")
References: <5B53459BF5874D2CB0A49D06A82B64DC@JohanW7>
Message-ID: <87ob77pgev.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> I was wondering why the libxml2 header files are under  ...staging/usr/include/libxml2/libxml 
 Sagaert> instead of just   ...staging/usr/include/libxml/

Because that's where upstream (make install) puts it. If I look on
E.G. Debian, that's also where they put them:

dpkg -L libxml2-dev | grep '\.h' | head
/usr/include/libxml2/libxml/relaxng.h
/usr/include/libxml2/libxml/xmlautomata.h
/usr/include/libxml2/libxml/xmlIO.h
/usr/include/libxml2/libxml/parserInternals.h
/usr/include/libxml2/libxml/nanohttp.h
/usr/include/libxml2/libxml/c14n.h
/usr/include/libxml2/libxml/tree.h
/usr/include/libxml2/libxml/valid.h
/usr/include/libxml2/libxml/xmlmemory.h
/usr/include/libxml2/libxml/xmlsave.h

 Sagaert> I have some problems in an autotools project where the
 Sagaert> compiler can't locate the libxml header files.

autotools normally should use pkg-config to get the proper
compiler/linker flags:

./output/hosr/usr/bin/pkg-config --cflags libxml-2.0
-I/home/peko/source/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/libxml2


 Sagaert> (My eclipse project was building fine, but the conversion to an autotools project gives me this problem.)
 Sagaert> Note that in my non-autotools eclipse project I had to add that libxml2 directory to the include list (-I)
 
 Sagaert> Coincedance or not, i found this in the gettext-tools/config.log:
 Sagaert> (this is the same error that I encounter in my autotools project.)
 
 Sagaert> snip from output/build/gettext-0.18.3.1/gettext-tools/config.log ...
 
 Sagaert> | # include <unistd.h>
 Sagaert> | #endif
 Sagaert> | 
 Sagaert> | #include <libcroco-0.6/libcroco/libcroco-config.h>
 Sagaert> configure:17429: result: no
 Sagaert> configure:17429: checking for libxml2/libxml/xmlexports.h
 Sagaert> configure:17429: /home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -c -D_LARGEFILE_SOURCE
 Sagaert> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -pipe -O2  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 Sagaert> conftest.c >&5
 Sagaert> conftest.c:81:39: fatal error: libxml2/libxml/xmlexports.h: No such file or directory

I have xmlexports.h here. Did you perhaps forget to add libxml2 to the
dependencies so it's built before this package?

-- 
Bye, Peter Korsgaard
