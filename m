From: Pedro Aguilar <paguilar@paguilar.org>
Date: Tue, 04 Nov 2014 01:14:24 +0100
Subject: [Buildroot] [PATCH v2 2/4] bdwgc: new package
In-Reply-To: <5457F2A4.4080708@mind.be>
References: <1414974851-4819-1-git-send-email-paguilar@paguilar.org>
 <1414974851-4819-3-git-send-email-paguilar@paguilar.org>
 <5457F2A4.4080708@mind.be>
Message-ID: <54581A60.8010207@paguilar.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 03/11/2014 22:24, Arnout Vandecappelle wrote:
> On 03/11/14 01:34, Pedro Aguilar wrote:
>> bdwgc is a garbage collector for C and C++. The Boehm-Demers-Weiser
>> conservative garbage collector can be used as a garbage collecting
>> replacement for C 'malloc' or C++ 'new'.
>>
>> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
>>
>> ---
>> Changes v1 -> v2
>> - Add external default dependency on libatomic_ops
>> - Fix several formatting issues
>> (All changes suggested by Yann Morin)
>>
>> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
>> ---
>>   package/Config.in       |  1 +
>>   package/bdwgc/Config.in | 11 +++++++++++
>>   package/bdwgc/bdwgc.mk  | 19 +++++++++++++++++++
>>   3 files changed, 31 insertions(+)
>>   create mode 100644 package/bdwgc/Config.in
>>   create mode 100644 package/bdwgc/bdwgc.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 3b3c372..bb158b4 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -942,6 +942,7 @@ endmenu
>>   menu "Miscellaneous"
>>   	source "package/aespipe/Config.in"
>>   	source "package/bc/Config.in"
>> +	source "package/bdwgc/Config.in"
>
>   This is a library, right? So doesn't it belong under Libraries/Other rather
> than here?

Right, I'll change it.

>>   	source "package/clamav/Config.in"
>>   	source "package/collectd/Config.in"
>>   	source "package/empty/Config.in"
>> diff --git a/package/bdwgc/Config.in b/package/bdwgc/Config.in
>> new file mode 100644
>> index 0000000..6f3878e
>> --- /dev/null
>> +++ b/package/bdwgc/Config.in
>> @@ -0,0 +1,11 @@
>> +config BR2_PACKAGE_BDWGC
>> +	bool "bdwgc"
>> +	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
>> +	select BR2_PACKAGE_LIBATOMIC_OPS
>> +	help
>> +	  The Boehm-Demers-Weiser conservative garbage collector can
>> +	  be used as a garbage collecting replacement for C 'malloc'
>> +	  or C++ 'new'.
>> +
>> +	  http://www.hboehm.info/gc/
>> +
>> diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
>> new file mode 100644
>> index 0000000..a687cc2
>> --- /dev/null
>> +++ b/package/bdwgc/bdwgc.mk
>> @@ -0,0 +1,19 @@
>> +################################################################################
>> +#
>> +# bdwgc
>> +#
>> +################################################################################
>> +
>> +BDWGC_VERSION = 7.2f
>> +BDWGC_SOURCE  = gc-$(BDWGC_VERSION).tar.gz
>> +BDWGC_SITE    = http://www.hboehm.info/gc/gc_source
>> +BDWGC_INSTALL_STAGING = YES
>> +BDWGC_LICENSE = bdwgc license
>> +BDWGC_LICENSE_FILES = README
>
>   Does the readme contain all the information of that license mess or are there
> additional files?

No, it's only this file.

>> +BDWGC_LIBTOOL_PATCH = NO
>
>   There should be a comment explaining why this is necessary.

I had a building issue. I'll comment it in the following patch set.

Thanks for the feedback.

-- 
Pedro Aguilar
http://paguilar.org
