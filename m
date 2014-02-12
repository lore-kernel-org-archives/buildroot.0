From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Feb 2014 08:10:23 +0100
Subject: [Buildroot] Build error from time to time
In-Reply-To: <AFACE42542AE499CA9403FAD6805F21A@JohanW7>
References: <AFACE42542AE499CA9403FAD6805F21A@JohanW7>
Message-ID: <52FB1E5F.1000305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/02/14 16:23, Sagaert Johan wrote:
>  
> Hi
> 
> Sometimes I get this error, if I then run make again after removing the nettle-2.7.1 build directory
> It rebuilds nettle and the build ends without errors.
> Could this be caused by the ccache ?
> 
> (I had run make clean before I started the new build.)
> 
> 
> ic -MT ecc-modq.o -MD -MP -MF ecc-modq.o.d -fpic -c ecc-modq.c \
> 	&& true
> /home/buildroot12git/output/host/usr/bin/ccache /home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -I.
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64  -pipe -Os  -Wno-pointer-sign -Wall -W   -Wmissing-prototypes -Wmissing-declarations -Wstrict-prototypes
> -Wpointer-arith -Wbad-function-cast -Wnested-externs -fpic -MT ecc-generic-redc.o -MD -MP -MF ecc-generic-redc.o.d -fpic -c
> ecc-generic-redc.c \
> 	&& true
> /usr/bin/make eccdata
> make[3]: Entering directory `/home/buildroot12git/output/build/nettle-2.7.1'
> Makefile:595: ecc-generic-modq.o.d: No such file or directory

 Took me a while to find it, but it looks like a parallel build issue in
nettle combined with ccache. In the configure step, all the *.d files are
created as empty files. These files are included unconditionally in the
Makefile, so you get an error if they don't exist. Unfortunately, ccache
does an unlink() just before creating the new file, so there is a tiny
window of time where the file doesn't exist. It looks like you have a
filesystem where this window is relatively large (NFS?), which is why you
see the problem and others don't.

 This is a tough nut to crack fundamentally.

* You could say that nettle's behaviour of including empty dependency
files is bad. To overcome that, a - can be added in front of the include.

* You can say the behaviour of ccache is bad. The unlink could be removed
there, except in the case of CCACHE_HARDLINK because it is not possible
to create a hardlink to an existing file.

 Any suggestions on how to proceed?

 Regards,
 Arnout

> /home/buildroot12git/output/host/usr/bin/ccache /home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -I.
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64  -pipe -Os  -Wno-pointer-sign -Wall -W   -Wmissing-prototypes -Wmissing-declarations -Wstrict-prototypes
> -Wpointer-arith -Wbad-function-cast -Wnested-externs -fpic -MT ecc-size.o -MD -MP -MF ecc-size.o.d -fpic -c ecc-size.c \
> 	&& true
> make[3]: *** No rule to make target `ecc-generic-modq.o.d'.  Stop.
> make[3]: Leaving directory `/home/buildroot12git/output/build/nettle-2.7.1'
> make[2]: *** [eccdata.stamp] Error 2
> make[2]: *** Waiting for unfinished jobs....
> make[2]: Leaving directory `/home/buildroot12git/output/build/nettle-2.7.1'
> make[1]: *** [all] Error 2
> make[1]: Leaving directory `/home/buildroot12git/output/build/nettle-2.7.1'
> make: *** [/home/buildroot12git/output/build/nettle-2.7.1/.stamp_built] Error 2
> 
> Regards 
> Sagaert Johan
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
