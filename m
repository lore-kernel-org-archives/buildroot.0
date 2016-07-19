From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 19 Jul 2016 08:30:22 -0500
Subject: [Buildroot] [PATCH] mtd: Add option to install mtd integrity
	test
In-Reply-To: <20160717164835.GO3614@free.fr>
References: <1468530227-28124-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20160717164835.GO3614@free.fr>
Message-ID: <CANQCQpZAxdD6meHqGEn3V2VsjNDwZqo0o1xRJ314NSLauS2D2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sun, Jul 17, 2016 at 11:48 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Matt, All,
>
> On 2016-07-14 16:03 -0500, Matt Weber spake thusly:
>> From: ynadupur <yugendra.sai.babu.nadupuru@rockwellcollins.com>
>>
>> Description:
>>       The mtd tests have proven very useful in testing both flash stability
>>       and JFFS2 changes. Adding an option to install the integrity test.
>
> This is causing build failures with the musl C library, because it does
> not provide stdio_lim.h:
>
>     http://autobuild.buildroot.org/results/252/2526598f561dc66ae02c53ec82f6a2a1395cdaf6/build-end.log
>
> Instead, those defines are directly available in stdio.h for musl.
>
> Care to have a look, please?

Sure, Sai is taking a look and he might jump on IRC to get some
guidance for how to make it compatible across libs.

>
> Regards,
> Yann E. MORIN.
>
>> Signed-off-by:[YUGENDRA SAI BABU NADUPURU]<yugendra.sai.babu.nadupuru@rockwellcollins.com>
>> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>> ---
>>  package/mtd/Config.in |  3 +++
>>  package/mtd/mtd.mk    | 12 ++++++++++++
>>  2 files changed, 15 insertions(+)
>>
>> diff --git a/package/mtd/Config.in b/package/mtd/Config.in
>> index 6e4346f..780ba94 100644
>> --- a/package/mtd/Config.in
>> +++ b/package/mtd/Config.in
>> @@ -159,4 +159,7 @@ config BR2_PACKAGE_MTD_UBIBLOCK
>>       bool "ubiblock"
>>       default y
>>
>> +config BR2_PACKAGE_MTD_TESTS
>> +     bool "mtd tests"
>> +
>>  endif
>> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
>> index bf90212..a4aabd7 100644
>> --- a/package/mtd/mtd.mk
>> +++ b/package/mtd/mtd.mk
>> @@ -97,6 +97,18 @@ MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIBLOCK)        += ubiblock
>>  MTD_TARGETS_y += $(addprefix ubi-utils/,$(MTD_TARGETS_UBI_y))
>>  MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSUBIFS) += mkfs.ubifs/mkfs.ubifs
>>
>> +ifeq ($(BR2_PACKAGE_MTD_TESTS),y)
>> +define MTD_TESTS_BUILD_CMDS
>> +     $(TARGET_CONFIGURE_OPTS) $(MAKE1) CROSS=$(TARGET_CROSS) \
>> +             BUILDDIR=$(@D) $(MTD_MAKE_OPTS) -C $(@D)/tests/fs-tests all
>> +endef
>> +MTD_POST_BUILD_HOOKS += MTD_TESTS_BUILD_CMDS
>> +define MTD_TESTS_TARGET_INSTALL_CMDS
>> +     $(INSTALL) -D -m 755 $(@D)/tests/fs-tests/integrity/integck $(TARGET_DIR)/usr/sbin/integck
>> +endef
>> +MTD_POST_INSTALL_TARGET_HOOKS += MTD_TESTS_TARGET_INSTALL_CMDS
>> +endif
>> +
>>  define MTD_BUILD_CMDS
>>       $(TARGET_CONFIGURE_OPTS) $(MAKE1) CROSS=$(TARGET_CROSS) \
>>               BUILDDIR=$(@D) $(MTD_MAKE_OPTS) -C $(@D) \
>> --
>> 1.9.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
