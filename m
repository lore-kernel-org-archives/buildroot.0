From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Feb 2017 23:48:13 +0100
Subject: [Buildroot] [PATCH v3 2/5] package: add generic support for lz
 archives
In-Reply-To: <20170215221520.41e4c66e@free-electrons.com>
References: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
 <1e78e6f82883e4ba95766459a39cbd2d49934152.1486930542.git.baruch@tkos.co.il>
 <20170215221520.41e4c66e@free-electrons.com>
Message-ID: <83572997-616f-8bec-fadb-0a59bbf847ed@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-02-17 22:15, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 12 Feb 2017 22:15:39 +0200, Baruch Siach wrote:
> 
>> diff --git a/Makefile b/Makefile
>> index df3b64eb03ec..b4550e098958 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -431,6 +431,7 @@ KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
>>  ZCAT := $(call qstrip,$(BR2_ZCAT))
>>  BZCAT := $(call qstrip,$(BR2_BZCAT))
>>  XZCAT := $(call qstrip,$(BR2_XZCAT))
>> +LZCAT := $(call qstrip,$(BR2_LZCAT))
> 
> So here, we use the value of the config option BR2_LZCAT.
> 
>> diff --git a/support/dependencies/check-host-lzip.mk b/support/dependencies/check-host-lzip.mk
>> new file mode 100644
>> index 000000000000..708105acd892
>> --- /dev/null
>> +++ b/support/dependencies/check-host-lzip.mk
>> @@ -0,0 +1,5 @@
>> +ifeq (,$(call suitable-host-package,lzip,$(LZCAT)))
>> +DEPENDENCIES_HOST_PREREQ += host-lzip
>> ++EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .lz
>> +LZCAT = $(HOST_DIR)/usr/bin/lzip -d -c
> 
> But here in the case where we are building our own host-lzip, we
> completely ignore BR2_LZCAT, and use a hardcoded
> $(HOST_DIR)/usr/bin/lzip -d -c.

 Er, yes of course: if BR2_LZCAT doesn't work, then we use the Buildroot
internal lzcat. What else did you expect?


> Since there is already the exact same pattern for XZCAT, I decided to
> apply your patch anyway. I also don't really understand the use case
> for all those BR2_ZCAT, BR2_BZCAT, BR2_XZCAT, etc. config options.
> Peter, maybe you can shed some light on why we have these?

 As I understand it, these options are provided in case you have an old build
host and have locally installed these tools in e.g. your homedir. However, I
wouldn't mind getting rid of these options completely, and instead require that
they are in PATH.

 True, they could also be used to pass alternative options to the extractors,
but I don't see much point of that. Or they could be used to call it in an
alternative form, e.g. "zcat" instead of "gzip -d -c", or "busybox gzip -d -c".
But I also don't see much point of that.

 While we're on the subject, I don't see much point of BR2_TAR_OPTIONS either.


 But of course, it's not as if keeping these things is such a burden. So I at
least won't spend time in removing them.


 Regards,
 Arnout


> 
> Also Baruch: there was one too many "+" at the beginning of:
> 
>> ++EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .lz
> 
> so I've fixed that before applying.
> 
> Thanks,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
