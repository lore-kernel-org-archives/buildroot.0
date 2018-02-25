From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 25 Feb 2018 21:50:34 +0100
Subject: [Buildroot] [PATCH 2/3] package/strace: add missing libunwind
 optional dependency
In-Reply-To: <CAAXf6LXnevwOqgTb7yV5AraDkHsauEfhJNoQr8rNgWFLQKp15Q@mail.gmail.com>
References: <20180225183415.8362-1-romain.naour@gmail.com>
 <20180225183415.8362-2-romain.naour@gmail.com>
 <CAAXf6LXnevwOqgTb7yV5AraDkHsauEfhJNoQr8rNgWFLQKp15Q@mail.gmail.com>
Message-ID: <d5803d2e-773e-10ce-71b0-e5ca69671cf8@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 25/02/2018 ? 21:28, Thomas De Schampheleire a ?crit?:
> Hi,
> 
> 2018-02-25 19:34 GMT+01:00 Romain Naour <romain.naour@gmail.com>:
>> This improve the reproducible build.
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>>  package/strace/strace.mk | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/package/strace/strace.mk b/package/strace/strace.mk
>> index e292c60f2a..9c1fab3871 100644
>> --- a/package/strace/strace.mk
>> +++ b/package/strace/strace.mk
>> @@ -10,6 +10,13 @@ STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSI
>>  STRACE_LICENSE = BSD-3-Clause
>>  STRACE_LICENSE_FILES = COPYING
>>
>> +ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
>> +STRACE_DEPENDENCIES += libunwind
>> +STRACE_CONF_OPTS += --with-libunwind
>> +else
>> +STRACE_CONF_OPTS += --without-libunwind
>> +endif
>> +
> 
> As far as I know, the main (only?) reason for a libunwind dependency
> is to support 'strace -k' to get callstack info. Perhaps it would be
> useful to update the Config.in file to hint about this, i.e. that
> users should enable libunwind manually if they want 'strace -k'
> support.

Ok, why not.

> 
> In our local tree, I had added a config option to strace for that, but
> perhaps that is overkill?

Most packages optional dependencies are handled like this, otherwise we have to
maintain one config option for each optional dependencies.

Best regards,
Romain

> 
> /Thomas
> 
