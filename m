From: Alexander Khryukin <alexander@mezon.ru>
Date: Tue, 30 Oct 2012 14:34:03 +0300
Subject: [Buildroot] Problem building curlftpfs within buildroot
In-Reply-To: <CABtOAfxR4LQnWRRfr7_MrjA=+pw7hH-L8U2M0vweivkkw19_zQ@mail.gmail.com>
References: <508FB158.1090205@mail.ru>
 <CABtOAfxR4LQnWRRfr7_MrjA=+pw7hH-L8U2M0vweivkkw19_zQ@mail.gmail.com>
Message-ID: <CABtOAfxXQb3k2+1M+oZpBf++jLZUE82LJ+pDrzF5V-Sf_PGvCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/10/30 Alexander Khryukin <alexander@mezon.ru>

>
>
> 2012/10/30 Alexander Varnin <fenixk19@mail.ru>
>
>> Hello. I'm trying to build self-made package curlftpfs within buildroot.
>> It is simple autotools based package. Build fails with pthread error:
>>
>> /home/varnin/buildroot/output/**host/usr/lib/gcc/arm-unknown-**
>> linux-uclibcgnueabi/4.5.4/../.**./../../arm-unknown-linux-**uclibcgnueabi/bin/ld:
>> note: 'pthread_create' is defined in DSO /home/varnin/buildroot/output/**
>> host/usr/arm-unknown-linux-**uclibcgnueabi/sysroot/lib/**libpthread.so.0
>> so try adding it to the linker command line
>> /home/varnin/buildroot/output/**host/usr/arm-unknown-linux-**
>> uclibcgnueabi/sysroot/lib/**libpthread.so.0: could not read symbols:
>> Invalid operation
>> collect2: ld returned 1 exit status
>>
>> I'm using buildroot toolchain to build my application that uses threads,
>> and it compiles and works normally. What could be the problem?
>> I'm attaching build log.
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
>
>
> You forgot add -lpthread to linker flags.
>



Your problem here :

/bin/bash ./libtool --tag=CC --mode=link
/home/varnin/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
 -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Wall -W -Wno-sign-compare -D_REENTRANT
-I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0
-I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include
  -D_FILE_OFFSET_BITS=64
-I/home/varnin/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/fuse
   -liconv  -o curlftpfs  ftpfs.o libcurlftpfs.a -lglib-2.0 -lintl
-lfuse   -lcurl


For example it's mine link string

/bin/sh ./libtool --tag=CC   --mode=link gcc  -O2
-Wa,--compress-debug-sections -gdwarf-4 -fvar-tracking-assignments
-frecord-gcc-switches -Wstrict-aliasing=2 -pipe -Wformat
-Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fstack-protector
--param=ssp-buffer-size=4 -fPIC -Wall -W -Wno-sign-compare -D_REENTRANT
-I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include
-D_FILE_OFFSET_BITS=64 -I/usr/include/fuse     -Wl,--as-needed
-Wl,--no-undefined -Wl,-z,relro -Wl,-O1 -Wl,--build-id
-Wl,--enable-new-dtags -Wl,--hash-style=gnu -o curlftpfs ftpfs.o
libcurlftpfs.a -lglib-2.0   -pthread -L/lib64 -lfuse   -lcurl
libtool: link: gcc -O2 -Wa,--compress-debug-sections -gdwarf-4
-fvar-tracking-assignments -frecord-gcc-switches -Wstrict-aliasing=2 -pipe
-Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fstack-protector
--param=ssp-buffer-size=4 -fPIC -Wall -W -Wno-sign-compare -D_REENTRANT
-I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include
-D_FILE_OFFSET_BITS=64 -I/usr/include/fuse -Wl,--as-needed
-Wl,--no-undefined -Wl,-z -Wl,relro -Wl,-O1 -Wl,--build-id
-Wl,--enable-new-dtags -Wl,--hash-style=gnu -o curlftpfs ftpfs.o -pthread
libcurlftpfs.a -lglib-2.0 -L/lib64 -lfuse -lcurl -pthread


if you discard all unnecessary you get "--as-needed" linker option

in sum you can add --as-needed to linker or -lpthread
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121030/288b121a/attachment.html>
