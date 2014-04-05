From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 5 Apr 2014 19:49:32 +0200
Subject: [Buildroot] [PATCH] libuci: Lua binding needs mmu and version
	5.1
In-Reply-To: <20140405190836.7bcda5b5@skate>
References: <1396708617-7364-1-git-send-email-yegorslists@googlemail.com>
 <20140405190836.7bcda5b5@skate>
Message-ID: <CAGm1_ksn1CKicBtvrkUte9nuL3_=KjotkBm6-heHTEo6essC-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 5, 2014 at 7:08 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Yegor Yefremov,
>
> On Sat,  5 Apr 2014 16:36:57 +0200, Yegor Yefremov wrote:
>> The Lua binding option of libuci uses fork() so it needs the MMU.
>>
>> Finally, libuci fails to build with Lua 5.2 because it uses functions
>> removed from this version. Fix it by activating the option only with
>> Lua 5.1.
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>>  package/libuci/libuci.mk | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> I've applied your patch... but I'm not really happy because you clearly
> tested the patch insufficiently:
>
>> diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
>> index 736b946..42e61ee 100644
>> --- a/package/libuci/libuci.mk
>> +++ b/package/libuci/libuci.mk
>> @@ -10,10 +10,14 @@ LIBUCI_LICENSE = LGPLv2.1
>>  LIBUCI_INSTALL_STAGING = YES
>>  LIBUCI_DEPENDENCIES = libubox
>>
>> -ifeq ($(BR2_PACKAGE_LUA),y)
>> -     LIBUCI_DEPENDENCIES += lua
>> +ifeq ($(BR2_USE_MMU),y) # fork()
>> +ifeq ($(BR2_PACKAGE_LUA_5_1),y)
>> +LIBUBOX_DEPENDENCIES += lua
>> +LIBUBOX_CONF_OPT += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
>> +     -DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
>>  else
>> -     LIBUCI_CONF_OPT += -DBUILD_LUA:BOOL=OFF
>> +LIBUBOX_CONF_OPT += -DBUILD_LUA:BOOL=OFF
>
> LIBUBOX_* variables in libuci.mk ? Surely this cannot work.
>
> I've fixed that and applied, but it'd be nice if patches were minimally
> tested before being submitted :-)

OMG! My bad! I know now, why I send patches from work and not from home :-)

I even made a test, but it was a test with Lua enabled, so it didn't
produce any error  :-(

Yegor
