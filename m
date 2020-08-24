From: Marie Maurer <marie.maurer@pixida.de>
Date: Mon, 24 Aug 2020 16:21:30 +0000
Subject: [Buildroot] Problem adding a new package tpm2-tss-engine
In-Reply-To: <20200824160337.GB2246@scaer>
References: <VI1PR03MB45286A4A50F37EBB0DC2E56298560@VI1PR03MB4528.eurprd03.prod.outlook.com>
 <20200824160337.GB2246@scaer>
Message-ID: <VI1PR03MB4528F54C1492D171A1B7B37B98560@VI1PR03MB4528.eurprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

thanks for your answer!

Unfortunately no change, same error. I have already seen/found the type after I sent the email.
Thanks for the make check-package (it needs "python", I need to add a link to python3 to get it working).
It found 2 things, which I fixed, but still same error.

It outputs:

marie at 2020L009:~/buildroot-2020.08-rc1/buildroot-2020.08-rc1$ make check-package
find /home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1 -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' \) \
        -exec ./utils/check-package {} +
43352 lines processed
0 warnings generated
35180 lines processed
0 warnings generated
34083 lines processed
0 warnings generated
20158 lines processed
0 warnings generated
package/tpm2-tss-engine/tpm2-tss-engine.mk:11: line contains trailing whitespace
package/tpm2-tss-engine/tpm2-tss-engine.mk:21: expected indent with tabs
29560 lines processed
2 warnings generated
22558 lines processed
0 warnings generated
make: *** [Makefile:1212: check-package] Error 1
marie at 2020L009:~/buildroot-2020.08-rc1/buildroot-2020.08-rc1$ vi package/tpm2-tss-engine/tpm2-tss-engine.mk
marie at 2020L009:~/buildroot-2020.08-rc1/buildroot-2020.08-rc1$ make check-package
find /home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1 -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' \) \
        -exec ./utils/check-package {} +
43352 lines processed
0 warnings generated
35180 lines processed
0 warnings generated
34083 lines processed
0 warnings generated
20158 lines processed
0 warnings generated
29560 lines processed
0 warnings generated
22558 lines processed
0 warnings generated
marie at 2020L009:~/buildroot-2020.08-rc1/buildroot-2020.08-rc1$ cat package/tpm2-tss-engine/tpm2-tss-engine.mk
################################################################################
#
# tpm2-tss-engine
#
################################################################################

TPM2_TSS_ENGINE_VERSION = 1.1.0-rc1
TPM2_TSS_ENGINE_SITE = $(call github,tpm2-software,tpm2-tss-engine,v$(TPM2_TSS_ENGINE_VERSION))
TPM2_TSS_ENGINE_LICENSE = BSD-3-Clause
TPM2_TSS_ENGINE_LICENSE_FILES = LICENSE
TPM2_TSS_ENGINE_DEPENDENCIES = libqrencode tpm2-tss host-pkgconf
TPM2_TSS_ENGINE_AUTORECONF = YES
TPM2_TSS_ENGINE_CONF_OPTS = \
        --disable-defaultflags \
        --disable-doxygen-doc \
        --disable-plymouth \
        --without-initramfstoolsdir \
        --without-mkinitcpiodir

define TPM2_TSS_ENGINE_PRE_CONFIGURE_BOOTSTRAP
        cd $(@D)/ && ./bootstrap

endef

TPM2_TSS_ENGINE_PRE_CONFIGURE_HOOKS += TPM2_TSS_ENGINE_PRE_CONFIGURE_BOOTSTRAP

# uses C99 code but forgets to pass -std=c99 when --disable-defaultflags is used
TPM2_TSS_ENGINE_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"

# do not build man pages
TPM2_TSS_ENGINE_CONF_ENV += ac_cv_path_PANDOC=''

$(eval $(autotools-package))
marie at 2020L009:~/buildroot-2020.08-rc1/buildroot-2020.08-rc1$ make
>>> tpm2-tss-engine 1.1.0-rc1 Configuring
cd /home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/tpm2-tss-engine-1.1.0-rc1/ && ./bootstrap
./bootstrap: line 5: autoreconf: command not found
make: *** [package/pkg-generic.mk:239: /home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/tpm2-tss-engine-1.1.0-rc1/.stamp_configured] Error 127
marie at 2020L009:~/buildroot-2020.08-rc1/buildroot-2020.08-rc1$

Best regards,

Marie

-----Urspr?ngliche Nachricht-----
Von: Yann E. MORIN <yann.morin.1998@free.fr>
Gesendet: Montag, 24. August 2020 18:04
An: Marie Maurer <marie.maurer@pixida.de>
Cc: buildroot at busybox.net
Betreff: Re: [Buildroot] Problem adding a new package tpm2-tss-engine

Marie, All,

On 2020-08-24 14:06 +0000, Marie Maurer spake thusly:
> Hello,
[--SNIP--]
> TPM2_TSS_AUTORECONF = YES

Typo in the name of that variable; it should be TPM2_TSS_ENGINE_AUTORECONF.

Run 'make check-package' which should hint at such typoes.

> define TPM2_TSS_ENGINE_PRE_CONFIGURE_BOOTSTRAP
>     cd $(@D)/ && ./bootstrap
> endef
> TPM2_TSS_ENGINE_PRE_CONFIGURE_HOOKS +=
> TPM2_TSS_ENGINE_PRE_CONFIGURE_BOOTSTRAP

No need for this hook, since you have _AUTORECONF, above.

Also, such hooks are usually bad, because such bootstrap scripts usually do not have the proper variables and options that are needed to properly autoreconf in the Buildroot context.

So I guess your issue stems from the typo in the _AUTORECONF variable.

Regards,
Yann E. MORIN.

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
| conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'


Pixida GmbH
Ungererstr. 129
80805 M?nchen

Amtsgericht M?nchen - HRB 173520
Gesch?ftsf?hrer Johann Neubauer, Panagiota Dimou



www.pixida.de<http://www.pixida.de/>

[PIXIDA]



Unsere Datenschutzgrunds?tze<http://www.pixida.com/grundsaetze.html>
