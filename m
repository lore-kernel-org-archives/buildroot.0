From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Jul 2014 22:37:33 +0200
Subject: [Buildroot] PACKAGE_USERS does not work
In-Reply-To: <53BFE547.70600@posteo.de>
References: <i5np0ra770dn4ujwdmsweh48.1405067942517@email.android.com>
 <CAJtjsKbLN1-yEkBq=cCsoaOx_n+LUYof1P51T3wzOupaxR75JQ@mail.gmail.com>
 <53BFE547.70600@posteo.de>
Message-ID: <20140711203733.GE3739@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

You said in another mail that you'd be sending a patch to add this
package. Thanks!

So, here is my preliminary review of the .mk file:

On 2014-07-11 15:23 +0200, J?rg Krause spake thusly:
>   ################################################################################
>   #
>   # upmpdcli
>   #
>   ################################################################################
> 
>   UPMPDCLI_VERSION = 0.7.1
>   UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
>   UPMPDCLI_LICENSE = GPLv2
>   UPMPDCLI_LICENSE_FILES = LICENSE
>   UPMPDCLI_INSTALL_STAGING = YES

Wh yinstall in staging? As far as I can see, this installs a program,
not a library, right? We install in staging only when the package
installs one (or more) libraries.

>   UPMPDCLI_INSTALL_TARGET = YES

Not needed, that's the default.

>   UPMPDCLI_AUTORECONF = YES

Why do you autoreconf? It is not normally needed. If it is needed, add a
comment stating why. See the existing packages for hints. ;-)

>   UPMPDCLI_CONF_OPT = --prefix=/usr

Nope, that's already taken care of by the autotools-package
infrastructure.

>   UPMPDCLI_DEPENDENCIES = host-pkgconf
>   UPMPDCLI_DEPENDENCIES += libupnp
>   UPMPDCLI_DEPENDENCIES += libmpdclient

Please, put the dependencies on a single. If it does not fit in 80-char,
then use continuation lines, like:

    UPMPDCLI_DEPENDENCIES = host-pkgconf libupnp libmpdclient tooloong \
        more-depndencies on-this-line

BTW, it also depends on expat.

>   define UPMPDCLI_USERS
>       upmpdcli -1 upmpdcli -1 * - - -
>   endef

Do you really need a specific user for running upmpdcli?

Also, would it need to belong to the audio group (as an additional
group)? (even though it does not directly render audio)

>   define UPMPDCLI_INSTALL_INIT_SYSV
>       $(INSTALL) -m 0755 package/upmpdcli/S99upmpdcli $(TARGET_DIR)/etc/init.d/
>   endef

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
