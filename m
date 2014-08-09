From: Paul Cercueil <paul@crapouillou.net>
Date: Sat, 09 Aug 2014 15:45:07 +0200
Subject: [Buildroot] [PATCH 2/2] lightning: Added package
In-Reply-To: <20140806031244.GN2322@tarshish>
References: <1407279610-15589-1-git-send-email-paul@crapouillou.net>
 <1407279610-15589-2-git-send-email-paul@crapouillou.net>
 <20140806031244.GN2322@tarshish>
Message-ID: <53E625E3.7030707@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Le 06/08/2014 05:12, Baruch Siach a ?crit :
> Hi Paul,
>
> On Wed, Aug 06, 2014 at 01:00:10AM +0200, Paul Cercueil wrote:
>> GNU lightning is a library that generates assembly language code
>> at run-time.
>>
>> https://www.gnu.org/software/lightning/
>>
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> ---
>>   package/Config.in              |  1 +
>>   package/lightning/Config.in    |  8 ++++++++
>>   package/lightning/lightning.mk | 18 ++++++++++++++++++
>>   3 files changed, 27 insertions(+)
>>   create mode 100644 package/lightning/Config.in
>>   create mode 100644 package/lightning/lightning.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 1e4bc50..6ca10a8 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -864,6 +864,7 @@ menu "Other"
>>   	source "package/libunwind/Config.in"
>>   	source "package/liburcu/Config.in"
>>   	source "package/libuv/Config.in"
>> +	source "package/lightning/Config.in"
>>   	source "package/linux-pam/Config.in"
>>   	source "package/lttng-libust/Config.in"
>>   	source "package/mpc/Config.in"
>> diff --git a/package/lightning/Config.in b/package/lightning/Config.in
>> new file mode 100644
>> index 0000000..5a7152a
>> --- /dev/null
>> +++ b/package/lightning/Config.in
>> @@ -0,0 +1,8 @@
>> +config BR2_PACKAGE_LIGHTNING
>> +	bool "lightning"
>> +	depends on BR2_sparc || BR2_i386 || BR2_x86_64 || BR2_mips || BR2_mipsel || BR2_arm || BR2_powerpc
>> +	help
>> +	  GNU lightning is a library that generates
>> +	  assembly language code at run-time.
>> +
>> +	  https://www.gnu.org/software/lightning/
>> diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
>> new file mode 100644
>> index 0000000..ff3ea92
>> --- /dev/null
>> +++ b/package/lightning/lightning.mk
>> @@ -0,0 +1,18 @@
>> +################################################################################
>> +#
>> +# lightning
>> +#
>> +################################################################################
>> +
>> +LIGHTNING_VERSION = 2.0.4
>> +LIGHTNING_SITE = http://ftp.gnu.org/gnu/lightning/
>> +LIGHTNING_LICENSE = GPLv3
>> +LIGHTNING_LICENSE_FILES = COPYING
>> +LIGHTNING_INSTALL_STAGING = YES
>> +
>> +ifeq ($(BR2_PACKAGE_BINUTILS),y)
>> +LIGHTNING_DEPENDENCIES += binutils
>> +LIGHTNING_CONF_OPT += --enable-disassembler
>> +endif
>
> Have you tested external toolchains?
>
> baruch

No I did not, as I don't use one. Furthermore, I only tested the package 
on mipsel, the list of archs specified in this package is taken from 
lightning's web page and may be incorrect (hopefully not).

Regards,

Paul

>
>> +
>> +$(eval $(autotools-package))
>
