From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 27 May 2019 12:10:14 +0200
Subject: [Buildroot] [PATCH v2 4/7] package/libnss: re-enable package if
 BUG_85862 is present
In-Reply-To: <20190524231547.35975ecf@windsurf>
References: <10430096-81de-792a-8b49-c59ed5e9de2e@micronovasrl.com>
 <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
 <20190522135906.30796-5-giulio.benetti@micronovasrl.com>
 <20190524231547.35975ecf@windsurf>
Message-ID: <8952c4d4-67e8-a662-48b0-4fbe7e957006@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 24/05/2019 23:15, Thomas Petazzoni ha scritto:
> On Wed, 22 May 2019 15:59:03 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>>   # --gc-sections triggers binutils ld segfault
>>   # https://sourceware.org/bugzilla/show_bug.cgi?id=21180
>>   ifeq ($(BR2_microblaze),y)
>> @@ -33,7 +34,6 @@ LIBNSS_BUILD_VARS = \
>>   	MOZILLA_CLIENT=1 \
>>   	NSPR_INCLUDE_DIR=$(STAGING_DIR)/usr/include/nspr \
>>   	NSPR_LIB_DIR=$(STAGING_DIR)/usr/lib \
>> -	BUILD_OPT=1 \
> 
> In fact why are we building with BUILD_OPT=1 at all ? This adds some
> semi-random optimization flags decided by libnss. I guess we should not
> pass BUILD_OPT=1 at all, and simply pass CFLAGS=$(LIBNSS_CFLAGS), with
> LIBNSS_CFLAGS = $(TARGET_CFLAGS), with -O0 added to work around the
> Microblaze bug.
> 
> What do you think ?

I totally agree. I've taken a closer look to what I've done on this 
patch, LIBNSS_CFLAGS are not setup and CFLAGS=".." passed to $(MAKE1) 
are actually ignored by libnss. Need to find a way to pass our 
$(TARGET_CFLAGS).

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
