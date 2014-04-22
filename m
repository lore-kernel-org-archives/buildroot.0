From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Apr 2014 22:25:54 +0200
Subject: [Buildroot] php / snmp / iconv problem
In-Reply-To: <535556F6.3050807@lucaceresoli.net>
References: <20140420063009.8B76B100DB9@stock.ovh.net>
 <20140420104812.5bc926a9@skate> <535556F6.3050807@lucaceresoli.net>
Message-ID: <20140422222554.2d601379@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Mon, 21 Apr 2014 19:35:50 +0200, Luca Ceresoli wrote:

> My bad, it built perfectly here! Tried uninstalling net-snmp from my
> host, as well as installing it with -dev packages. It always built fine.
> 
> FWIW, my build machine is a 64-bit Ubuntu 13.10.
> 
> Can you share the output/build/php-5.5.11/config.log file from your
> build server please?

Sure. So, as expected, the error is:

===============================================
checking OpenSSL dir for SNMP... no
checking for init_snmp in -lnetsnmp... no
configure: error: SNMP sanity check failed. Please check config.log for more information.
make: *** [/home/test/outputs/5a7fd0de2747e876a182117d7f7d8f16b20cadea/output/build/php-5.5.11/.stamp_configured] Error 1
===============================================

In config.log, we see that:

===============================================
configure:83770: checking for init_snmp in -lnetsnmp
configure:83795: /home/test/outputs/5a7fd0de2747e876a182117d7f7d8f16b20cadea/output/host/usr/bin/arm-none-linux-gnueabi-gcc -o conftest -I/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -fvisibility=hidden -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -L/lib  -L/home/test/outputs/5a7fd0de2747e876a182117d7f7d8f16b20cadea/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib conftest.c -lnetsnmp  -lgmp -lz -lpcre -lcrypto -lssl -lcrypto -lm  -lxml2 -lz -lm -ldl -
lxml2 -lz -lm -ldl -lnetsnmp -lcrypto -lm >&5
/home/test/outputs/5a7fd0de2747e876a182117d7f7d8f16b20cadea/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.7.3/../../../../arm-none-linux-gnueabi/bin/ld: warning: library search path "/lib" is unsafe for cross-compilation
/lib/libgcc_s.so.1: file not recognized: File format not recognized
collect2: error: ld returned 1 exit status
===============================================

So the problem is due to /lib being present in the -L flags. This is
most likely due to:

ifeq ($(BR2_PACKAGE_PHP_EXT_ICONV),y)
ifeq ($(BR2_PACKAGE_LIBICONV),y)
        PHP_CONF_OPT += --with-iconv=$(STAGING_DIR)/usr
        PHP_DEPENDENCIES += libiconv
else
        PHP_CONF_OPT += --with-iconv
endif
endif

We are in a case where BR2_PACKAGE_PHP_EXT_ICONV=y but
BR2_PACKAGE_LIBICONV is not enabled (glibc toolchain). So the iconv
test of PHP starts looking in /lib for iconv. I think we already
discussed this problem with Gustavo. See "[PATCH] php: fix wrong -L and
-I paths added by iconv tests" in the mailing list archive.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
