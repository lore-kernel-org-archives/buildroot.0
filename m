From: =?UTF-8?B?SsO2cmcgS3JhdXNl?= <jkrause@posteo.de>
Date: Fri, 11 Jul 2014 15:23:19 +0200
Subject: [Buildroot] PACKAGE_USERS does not work
In-Reply-To: <CAJtjsKbLN1-yEkBq=cCsoaOx_n+LUYof1P51T3wzOupaxR75JQ@mail.gmail.com>
References: <i5np0ra770dn4ujwdmsweh48.1405067942517@email.android.com>
 <CAJtjsKbLN1-yEkBq=cCsoaOx_n+LUYof1P51T3wzOupaxR75JQ@mail.gmail.com>
Message-ID: <53BFE547.70600@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Johan,

unfortunatly there is no error message. As I mentioned, I can build 
upmpdcli with success. Here is the contents of my 
package/upmpdcli/upmpdcli.mk:

    ################################################################################
    #
    # upmpdcli
    #
    ################################################################################

    UPMPDCLI_VERSION = 0.7.1
    UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
    UPMPDCLI_LICENSE = GPLv2
    UPMPDCLI_LICENSE_FILES = LICENSE
    UPMPDCLI_INSTALL_STAGING = YES
    UPMPDCLI_INSTALL_TARGET = YES
    UPMPDCLI_AUTORECONF = YES
    UPMPDCLI_CONF_OPT = --prefix=/usr
    UPMPDCLI_DEPENDENCIES = host-pkgconf
    UPMPDCLI_DEPENDENCIES += libupnp
    UPMPDCLI_DEPENDENCIES += libmpdclient

    define UPMPDCLI_USERS
         upmpdcli -1 upmpdcli -1 * - - -
    endef

    define UPMPDCLI_INSTALL_INIT_SYSV
         $(INSTALL) -m 0755 package/upmpdcli/S99upmpdcli
    $(TARGET_DIR)/etc/init.d/
    endef

    $(eval $(autotools-package))

I would expect that upmpdcli will be added to shadow, passwd, and group 
in output/target/etc, but it isn't. I think it has something to do with 
PACKAGES_USERS in package/pkg-generic.mk. If i rebuild avahi, I can see 
that make adds the entry of AVAHI_USERS to PACKAGES_USERS, but for my 
build of upmpdcli it doesn't. I also tried another custom package.

Best regards
J?rg Krause


On 07/11/2014 01:41 PM, Johan Oudinet wrote:
> Hi J?rg,
>
> On Fri, Jul 11, 2014 at 10:57 AM, J?rg Krause <jkrause@posteo.de> wrote:
>> I added a custom package (upmpdcli) to buildroot which I can cleanly build,
>> except of adding a user with UPMPDCLI_USERS.
>>
>> I am using the same syntax as the package avahi for the definition,  where
>> the user avahi is in fact added to the users table.
>>
>> define UPMPDCLI_USERS
>> upmdpcli -1 upmpdcli -1 * - - -
>> endef
> Your definition of a new user looks correct to me. Could you share the
> error message?
>
> Best,

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140711/828e515e/attachment.html>
