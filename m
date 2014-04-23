From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Apr 2014 22:17:49 -0300
Subject: [Buildroot] php / snmp / iconv problem
In-Reply-To: <20140422222554.2d601379@skate>
References: <20140420063009.8B76B100DB9@stock.ovh.net>	<20140420104812.5bc926a9@skate>	<535556F6.3050807@lucaceresoli.net>
 <20140422222554.2d601379@skate>
Message-ID: <535714BD.4020403@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/2014 05:25 PM, Thomas Petazzoni wrote:
> Sure. So, as expected, the error is:
> 
> ===============================================
> checking OpenSSL dir for SNMP... no
> checking for init_snmp in -lnetsnmp... no
> configure: error: SNMP sanity check failed. Please check config.log for more information.
> make: *** [/home/test/outputs/5a7fd0de2747e876a182117d7f7d8f16b20cadea/output/build/php-5.5.11/.stamp_configured] Error 1
> ===============================================
> 
> In config.log, we see that:
> 
> ===============================================
> configure:83770: checking for init_snmp in -lnetsnmp
> configure:83795: /home/test/outputs/5a7fd0de2747e876a182117d7f7d8f16b20cadea/output/host/usr/bin/arm-none-linux-gnueabi-gcc -o conftest -I/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -fvisibility=hidden -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -L/lib  -L/home/test/outputs/5a7fd0de2747e876a182117d7f7d8f16b20cadea/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib conftest.c -lnetsnmp  -lgmp -lz -lpcre -lcrypto -lssl -lcrypto -lm  -lxml2 -lz -lm -ldl -
> lxml2 -lz -lm -ldl -lnetsnmp -lcrypto -lm >&5
> /home/test/outputs/5a7fd0de2747e876a182117d7f7d8f16b20cadea/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.7.3/../../../../arm-none-linux-gnueabi/bin/ld: warning: library search path "/lib" is unsafe for cross-compilation
> /lib/libgcc_s.so.1: file not recognized: File format not recognized
> collect2: error: ld returned 1 exit status
> ===============================================
> 
> So the problem is due to /lib being present in the -L flags. This is
> most likely due to:
> 
> ifeq ($(BR2_PACKAGE_PHP_EXT_ICONV),y)
> ifeq ($(BR2_PACKAGE_LIBICONV),y)
>         PHP_CONF_OPT += --with-iconv=$(STAGING_DIR)/usr
>         PHP_DEPENDENCIES += libiconv
> else
>         PHP_CONF_OPT += --with-iconv
> endif
> endif
> 
> We are in a case where BR2_PACKAGE_PHP_EXT_ICONV=y but
> BR2_PACKAGE_LIBICONV is not enabled (glibc toolchain). So the iconv
> test of PHP starts looking in /lib for iconv. I think we already
> discussed this problem with Gustavo. See "[PATCH] php: fix wrong -L and
> -I paths added by iconv tests" in the mailing list archive.

Hi.
Ok, hopefully i've finally solved this php 'nuisance'.
Ugly patch sent in need of heavy testing, it should solve many (all?) of
the php autobuild failures related to iconv.
I really don't want to see this b****** again, fingers crossed, i'm not
a fan of modifying configure directly but there seem to be no other
choice at the moment.
Also php upstream should really take a hard look at hardcoding paths and
using test instead of AC_TRY_LINK to check for headers, that's very dirty.
Regards.
