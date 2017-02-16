From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Feb 2017 09:25:55 +0100
Subject: [Buildroot] [PATCH v3 2/5] package: add generic support for lz
 archives
In-Reply-To: <20170216083206.2064b783@free-electrons.com>
References: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
 <1e78e6f82883e4ba95766459a39cbd2d49934152.1486930542.git.baruch@tkos.co.il>
 <20170215221520.41e4c66e@free-electrons.com>
 <83572997-616f-8bec-fadb-0a59bbf847ed@mind.be>
 <20170216083206.2064b783@free-electrons.com>
Message-ID: <19a785a4-beaf-92dd-c53b-6e81dde24c7d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-02-17 08:32, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 15 Feb 2017 23:48:13 +0100, Arnout Vandecappelle wrote:
> 
>>>> +DEPENDENCIES_HOST_PREREQ += host-lzip
>>>> ++EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .lz
>>>> +LZCAT = $(HOST_DIR)/usr/bin/lzip -d -c  
>>>
>>> But here in the case where we are building our own host-lzip, we
>>> completely ignore BR2_LZCAT, and use a hardcoded
>>> $(HOST_DIR)/usr/bin/lzip -d -c.  
>>
>>  Er, yes of course: if BR2_LZCAT doesn't work, then we use the Buildroot
>> internal lzcat. What else did you expect?
> 
> BR2_LZCAT does not specify only the path to the lzcat program, but also
> its options. And we completely ignore those custom options if the
> lzcat built by Buildroot is used.

 It is possible to provide extra options, but these are completely useless.
Well, actually, lzcat is the first one with an option that could be useful:
--threads, to decompress over several cores. Except that --threads isn't
implemented yet for decompression. So, although it is possible to add extra
options in BR2_LZCAT, it just makes no sense.

 Regards,
 Arnout

> 
>>  As I understand it, these options are provided in case you have an old build
>> host and have locally installed these tools in e.g. your homedir. However, I
>> wouldn't mind getting rid of these options completely, and instead require that
>> they are in PATH.
>>
>>  True, they could also be used to pass alternative options to the extractors,
>> but I don't see much point of that. Or they could be used to call it in an
>> alternative form, e.g. "zcat" instead of "gzip -d -c", or "busybox gzip -d -c".
>> But I also don't see much point of that.
>>
>>  While we're on the subject, I don't see much point of BR2_TAR_OPTIONS either.
>>
>>  But of course, it's not as if keeping these things is such a burden. So I at
>> least won't spend time in removing them.
> 
> See above why it doesn't make sense to me: BR2_LZCAT allows to specify
> not only the path/name of the lzip program, but also its options. And
> they get completely ignored when host-lzip is built by Buildroot.
> 
> Which means one person doing the build on a machine with lzip installed
> locally will have BR2_LZCAT taken into account, and another person
> doing the same build on a different machine that does not have lzip
> installed will not have BR2_LZCAT taken into account.
> 
> This is definitely not very consistent IMO.
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
