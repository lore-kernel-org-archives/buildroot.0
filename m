From: Rahul Jain <rahul.jain@imgtec.com>
Date: Tue, 18 Oct 2016 13:11:24 +0530
Subject: [Buildroot] [PATCH v4 1/3] ustream-ssl: new package
In-Reply-To: <CAHXCMMK6hSim5VSKp8kZR__0=Orw+4a=0xoC7wiy9ygSXmcZHA@mail.gmail.com>
References: <1476702145-25280-1-git-send-email-Rahul.Jain@imgtec.com>
 <CAHXCMMK6hSim5VSKp8kZR__0=Orw+4a=0xoC7wiy9ygSXmcZHA@mail.gmail.com>
Message-ID: <5805D224.7010008@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

Please find my comment inline.

On Tuesday 18 October 2016 01:33 AM, Samuel Martin wrote:
> Hi,
>
> On Mon, Oct 17, 2016 at 1:02 PM, Rahul Jain <Rahul.Jain@imgtec.com> wrote:
>> ustream-ssl has support for polarssl and cyassl
>> but since polarssl is made obsolete by mbedtls and cyassl
>> is not present in buildroot, we have not added support for it.
>>
>> Signed-off-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
>> Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>
>> ---
>>   Changes v3 -> v4:
>>     - add USTREAM_SSL_LICENSE_FILES variable
>>   Changes v2 -> v3:
>>     - Remove entry from DEVELOPERS file
>>   Changes v1 -> v2:
>>     - No changes
>>
>>   package/Config.in                  |  1 +
>>   package/ustream-ssl/Config.in      | 12 ++++++++++++
>>   package/ustream-ssl/ustream-ssl.mk | 21 +++++++++++++++++++++
>>   3 files changed, 34 insertions(+)
>>   create mode 100644 package/ustream-ssl/Config.in
>>   create mode 100644 package/ustream-ssl/ustream-ssl.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 9399f63..89de7af 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -911,6 +911,7 @@ menu "Crypto"
>>          source "package/polarssl/Config.in"
>>          source "package/tinydtls/Config.in"
>>          source "package/trousers/Config.in"
>> +       source "package/ustream-ssl/Config.in"
>>   endmenu
>>
>>   menu "Database"
>> diff --git a/package/ustream-ssl/Config.in b/package/ustream-ssl/Config.in
>> new file mode 100644
>> index 0000000..540e436
>> --- /dev/null
>> +++ b/package/ustream-ssl/Config.in
>> @@ -0,0 +1,12 @@
>> +config BR2_PACKAGE_USTREAM_SSL
>> +       bool "ustream-ssl"
>> +       depends on !BR2_STATIC_LIBS #libubox
>> +       select BR2_PACKAGE_LIBUBOX
>> +       select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
>> +       help
>> +         ustream SSL wrapper
>> +
>> +         https://git.openwrt.org/?p=project/ustream-ssl.git;a=summary
>> +
>> +comment "ustream-ssl needs a toolchain w/ dynamic library"
>> +       depends on BR2_STATIC_LIBS
>> diff --git a/package/ustream-ssl/ustream-ssl.mk b/package/ustream-ssl/ustream-ssl.mk
>> new file mode 100644
>> index 0000000..b83d129
>> --- /dev/null
>> +++ b/package/ustream-ssl/ustream-ssl.mk
>> @@ -0,0 +1,21 @@
>> +################################################################################
>> +#
>> +# ustream-ssl
>> +#
>> +################################################################################
>> +
>> +USTREAM_SSL_VERSION = ec80adaa1b47f28d426fa19c692011ce60b992d6
>> +USTREAM_SSL_SITE = git://git.openwrt.org/project/ustream-ssl.git
>> +USTREAM_SSL_LICENSE = ISC
>> +USTREAM_SSL_LICENSE_FILES = ustream-ssl.h
>> +USTREAM_SSL_INSTALL_STAGING = YES
>> +USTREAM_SSL_DEPENDENCIES = libubox
>> +
>> +ifeq ($(BR2_PACKAGE_MBEDTLS),y)
>> +USTREAM_SSL_DEPENDENCIES += mbedtls
>> +USTREAM_SSL_CONF_OPTS += -DMBEDTLS=ON
>> +else
>
> We usually prefer having the disable option sets here as well, i.e.:
> ifeq (...)
> USTREAM_SSL_CONF_OPTS += -DMBEDTLS=ON
> ...
> else
> USTREAM_SSL_CONF_OPTS += -DMBEDTLS=ON
> ...
> endif
>
It is about choice of cryptographic library and not adding optional 
support for it. I have referred  libcurl.mk, which do not seem to be 
doing what you suggested.

>> +USTREAM_SSL_DEPENDENCIES += openssl
>> +endif
>> +
>> +$(eval $(cmake-package))
>> --
>> 2.6.2
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> Regards,
>
