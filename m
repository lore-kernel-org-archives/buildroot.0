From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 29 Oct 2014 08:59:02 +0100
Subject: [Buildroot] [PATCH] Makefile: improve detection of make "-s"
	flag
In-Reply-To: <5450056D.4010601@mind.be>
References: <1414422891-7269-1-git-send-email-fabio.porcedda@gmail.com>
 <5450056D.4010601@mind.be>
Message-ID: <CAHkwnC9rq6_TppDSftb2Eiz_20gPCdONE+9mzxo17m4RjPxf6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
thanks for reviewing it.

On Tue, Oct 28, 2014 at 10:06 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 27/10/14 16:14, Fabio Porcedda wrote:
>> Because it's just checked the presence of the "s" character even a
>>   make --warn-undefined-variables
>> is detected as a silent build so fix this by filtering out long options.
>> ---
>>  Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 907a0fc..4fd6b64 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -303,7 +303,7 @@ GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
>>  TARGETS :=
>>
>>  # silent mode requested?
>> -QUIET := $(if $(findstring s,$(MAKEFLAGS)),-q)
>> +QUIET := $(if $(findstring s, $(filter-out --%, $(MAKEFLAGS))), -q)
>
>  This add a spurious space to the QUIET variable. Not really important, but we
> normally avoid that.
Ok, I will fix it.

>  Also, maybe an easier solution is:
>
> # Search for s only in the short options
> QUIET := $(if $(findstring s,$(firstword $(MAKEFLAGS))),-q)

I tried it but it does not work because with "make
--warn-undefined-variables" the MAKEFLAGS variable contains just the
single word "--warn-undefined-variables" so it triggers a false
positive.

> (Note that GNU make converts something like --silent into an s in MAKEFLAGS, and
> that all the short options are collected to the beginning of MAKEFLAGS.)

Thanks & BR
-- 
Fabio Porcedda
