From: bruce bushby <bruce.bushby@gmail.com>
Date: Tue, 15 Mar 2011 10:13:49 +0000
Subject: [Buildroot] Adding stunnel
Message-ID: <AANLkTiknO=A98cXWgg2DHa73uFbYwBtXmUF_7N8fbtx9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I noticed stunnel appears to have gained some new life and I wanted to test
it.....but I'm having some trouble configuring the package to locate the SSL
library.


This is my very basic stunnel.mk :
#############################################################
#
# stunnel
#
#############################################################

# TARGETS
STUNNEL_VERSION = 4.35
STUNNEL_SOURCE = stunnel-$(STUNNEL_VERSION).tar.gz
STUNNEL_SITE = ftp://ftp.nluug.nl/pub/networking/stunnel

STUNNEL_AUTORECONF = yes

STUNNEL_INSTALL_STAGING = YES
STUNNEL_INSTALL_TARGET = YES
STUNNEL_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
STUNNEL_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install

STUNNEL_DEPENDENCIES += openssl

STUNNEL_CONF_OPT = \
        --with-shared \
        --with-ssl=$(TARGET_DIR) \                    <---------------------
I think this is my problem...but not sure what "DIR" I should use?
        --with-libssl-prefix=$(STAGING_DIR)
<---------------------------------------

$(eval $(call AUTOTARGETS,package,stunnel))
$(eval $(call AUTOTARGETS,package,stunnel,host))




However, when I run "make stunnel" it complains:

checking for SSL directory... Not found

Couldn't find your SSL library installation dir
Use --with-ssl option to fix this problem





I have included openssl in my build and when I boot the resulting OS,
openssl is there and it works.

The stunnel "ssl configure check" is as follows:
".....if test -f "$1/include/openssl/ssl.h"
           then $as_echo "#define HAVE_OPENSSL 1" >>confdefs.h...."





And my build definitely has ssl:
./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libssl.so
./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libssl.so.1.0.0
./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/pkgconfig/libssl.pc
./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/pkgconfig/openssl.pc
./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libssl.a
./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/bin/openssl
./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/openssl
./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/openssl/ssl.h
./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/openssl/ssl2.h
./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/openssl/opensslv.h
./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/openssl/ssl23.h
./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/openssl/opensslconf.h
./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/openssl/kssl.h
./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/openssl/ssl3.h
./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/openssl/ossl_typ.h
./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/etc/ssl
./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/etc/ssl/openssl.cn



I'm guessing my stunnel configure is failing because I'm confused about
STAGING_DIR and TARGET_DIR

Have I missed another obvious? :)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110315/d5c9f6e3/attachment.html>
