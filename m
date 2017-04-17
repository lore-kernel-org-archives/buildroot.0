From: =?UTF-8?B?U2VtZW4gS29sZ2Fub3Y=?= <semenak94@mail.ru>
Date: Mon, 17 Apr 2017 17:20:40 +0300
Subject: [Buildroot] =?utf-8?q?=5BPATCH=5D_mpir=3A_fix_build_failure?=
In-Reply-To: <20170417140823.GB3441@scaer>
References: <1492437588-19728-1-git-send-email-semenak94@mail.ru>
 <20170417140823.GB3441@scaer>
Message-ID: <1492438840.57438440@f210.i.mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Well, good idea, I'll check it. Thanks for revision!

>???????????, 17 ?????? 2017, 17:08 +03:00 ?? "Yann E. MORIN" <yann.morin.1998@free.fr>:
>
>Semyon, All,
>
>On 2017-04-17 16:59 +0300, Semyon Kolganov spake thusly:
>> Signed-off-by: Semyon Kolganov < semenak94@mail.ru >
>> ---
>>  package/mpir/Config.in | 5 +++++
>>  package/mpir/mpir.mk   | 8 ++++++++
>>  2 files changed, 13 insertions(+)
>> 
>> diff --git a/package/mpir/Config.in b/package/mpir/Config.in
>> index da4cc9f..4f7fa65 100644
>> --- a/package/mpir/Config.in
>> +++ b/package/mpir/Config.in
>> @@ -1,8 +1,13 @@
>>  config BR2_PACKAGE_MPIR
>>  	bool "mpir"
>> +	# asm files in mpn/powerpc64/mode64/* are Abi version 1.
>> +	depends on !BR2_powerpc64le
>
>Is it otherwise possible to disable use of the asm code and use some
>generic one (if any) ?
>
>>  	select BR2_PACKAGE_GMP
>>  	help
>>  	  MPIR is a highly optimised library for bignum arithmetic
>>  	  forked from the GMP bignum library.
>> 
>>  	  http://www.mpir.org/
>> +
>> +comment "mpir conflicts with powerpc64le"
>> +	depends on BR2_powerpc64le
>
>We do not usually add a comment for architecture dependencies.
>
>Regards,
>Yann E. MORIN.
>
>> diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
>> index 430d587..b835ca4 100644
>> --- a/package/mpir/mpir.mk
>> +++ b/package/mpir/mpir.mk
>> @@ -12,4 +12,12 @@ MPIR_LICENSE_FILES = COPYING.LIB
>>  MPIR_INSTALL_STAGING = YES
>>  MPIR_DEPENDENCIES = gmp host-yasm
>> 
>> +ifeq ($(BR2_MIPS_NABI32),y)
>> +MPIR_CONF_OPTS += ABI=n32
>> +endif
>> +
>> +ifeq ($(BR2_MIPS_NABI64),y)
>> +MPIR_CONF_OPTS += ABI=n64
>> +endif
>> +
>>  $(eval $(autotools-package))
>> -- 
>> 2.7.4
>> 
>> _______________________________________________
>> buildroot mailing list
>>  buildroot at busybox.net
>>  http://lists.busybox.net/mailman/listinfo/buildroot
>
>-- 
>.-----------------.--------------------.------------------.--------------------.
>|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>|  +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>|  +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>|  http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
>'------------------------------^-------^------------------^--------------------'


Semyon
---------------
Semyon Kolganov
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170417/44b6d28b/attachment.html>
