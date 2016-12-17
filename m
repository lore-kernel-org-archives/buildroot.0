From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Dec 2016 08:56:46 +0100
Subject: [Buildroot] [PATCH 2/2] package/aespipe: fix host compile
In-Reply-To: <20161217071659.3975-2-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 17 Dec 2016 08:16:59 +0100")
References: <20161217071659.3975-1-bernd.kuhls@t-online.de>
 <20161217071659.3975-2-bernd.kuhls@t-online.de>
Message-ID: <87r3579ef5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Building host-aespipe fails on
 > $ cat /etc/debian_version
 > stretch/sid

 > at linking stage:

 > /usr/bin/gcc -L/home/buildroot/br6/output/host/lib
 > -L/home/buildroot/br6/output/host/usr/lib
 > -Wl,-rpath,/home/buildroot/br6/output/host/usr/lib -o aespipe
 > aespipe.o aes-amd64.o md5-amd64.o md5-2x-amd64.o aes-intel64.o
 > sha512.o rmd160.o
 > /usr/bin/ld: aes-amd64.o: relocation R_X86_64_32S against `.rodata'
 > can not be used when making a shared object; recompile with -fPIC

 > Fix is also used in Debian:
 > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=837393

Ahh, so we will start to see various fallout of them enabling -fPIE by
default?

If it happends to a lot of packages, then I think we should do it
globally in HOST_CFLAGS / HOST_LDFLAGS, but I have committed this for
now after adding a comment explaining why, thanks.


 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/aespipe/aespipe.mk | 4 ++++
 >  1 file changed, 4 insertions(+)

 > diff --git a/package/aespipe/aespipe.mk b/package/aespipe/aespipe.mk
 > index 6a38556..3a95469 100644
 > --- a/package/aespipe/aespipe.mk
 > +++ b/package/aespipe/aespipe.mk
 > @@ -9,5 +9,9 @@ AESPIPE_SOURCE = aespipe-v$(AESPIPE_VERSION).tar.bz2
 >  AESPIPE_SITE = http://loop-aes.sourceforge.net/aespipe
 >  AESPIPE_LICENSE = GPL
 
 > +HOST_AESPIPE_CONF_ENV = \
 > +	CFLAGS="$(HOST_CFLAGS) -no-pie" \
 > +	LDFLAGS="$(HOST_LDFLAGS) -no-pie"
 > +
 >  $(eval $(autotools-package))
 >  $(eval $(host-autotools-package))
 > -- 
 > 2.10.2

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
