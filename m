From: =?UTF-8?B?SsO2cmcgS3JhdXNl?= <jkrause@posteo.de>
Date: Mon, 14 Jul 2014 12:09:35 +0200
Subject: [Buildroot] PACKAGE_USERS does not work
In-Reply-To: <20140711203733.GE3739@free.fr>
References: <i5np0ra770dn4ujwdmsweh48.1405067942517@email.android.com>
 <CAJtjsKbLN1-yEkBq=cCsoaOx_n+LUYof1P51T3wzOupaxR75JQ@mail.gmail.com>
 <53BFE547.70600@posteo.de> <20140711203733.GE3739@free.fr>
Message-ID: <53C3AC5F.9090404@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

many thanks for your review! Any advice is very welcome!

On 07/11/2014 10:37 PM, Yann E. MORIN wrote:
> J?rg, All,
>
> You said in another mail that you'd be sending a patch to add this
> package. Thanks!
>
> So, here is my preliminary review of the .mk file:
>
> On 2014-07-11 15:23 +0200, J?rg Krause spake thusly:
>>    ################################################################################
>>    #
>>    # upmpdcli
>>    #
>>    ################################################################################
>>
>>    UPMPDCLI_VERSION = 0.7.1
>>    UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
>>    UPMPDCLI_LICENSE = GPLv2
>>    UPMPDCLI_LICENSE_FILES = LICENSE
>>    UPMPDCLI_INSTALL_STAGING = YES
> Wh yinstall in staging? As far as I can see, this installs a program,
> not a library, right? We install in staging only when the package
> installs one (or more) libraries.
>

Removed.

>>    UPMPDCLI_INSTALL_TARGET = YES
> Not needed, that's the default.


Removed.

>>    UPMPDCLI_AUTORECONF = YES
> Why do you autoreconf? It is not normally needed. If it is needed, add a
> comment stating why. See the existing packages for hints. ;-)

Removed, too. Source is not taken from the git repo.

>
>>    UPMPDCLI_CONF_OPT = --prefix=/usr
> Nope, that's already taken care of by the autotools-package
> infrastructure.

Removed.

>>    UPMPDCLI_DEPENDENCIES = host-pkgconf
>>    UPMPDCLI_DEPENDENCIES += libupnp
>>    UPMPDCLI_DEPENDENCIES += libmpdclient
> Please, put the dependencies on a single. If it does not fit in 80-char,
> then use continuation lines, like:
>
>      UPMPDCLI_DEPENDENCIES = host-pkgconf libupnp libmpdclient tooloong \
>          more-depndencies on-this-line

Done.

>
> BTW, it also depends on expat.

I am unsure of the necessary dependencies. The author of the package 
stated that it only depends on libupnp and libmpdclient.

I added host-pkgconf because I saw it on other package makefiles. Do I 
need it here?

Why do you suggest expat?

>>    define UPMPDCLI_USERS
>>        upmpdcli -1 upmpdcli -1 * - - -
>>    endef
> Do you really need a specific user for running upmpdcli?
>
> Also, would it need to belong to the audio group (as an additional
> group)? (even though it does not directly render audio)
>
>>    define UPMPDCLI_INSTALL_INIT_SYSV
>>        $(INSTALL) -m 0755 package/upmpdcli/S99upmpdcli $(TARGET_DIR)/etc/init.d/
>>    endef
> Regards,
> Yann E. MORIN.
>

Best regards
J?rg Krause
