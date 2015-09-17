From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Thu, 17 Sep 2015 15:19:12 +0100
Subject: [Buildroot] [PATCH] sysvinit: build fixed for arm64
	architectures
In-Reply-To: <20150917135624.GQ11632@tarshish>
References: <2cd1307d42dd411b54c212cc53439d1ead0af01c.1442497341.git.jpinto@synopsys.com>
 <20150917135624.GQ11632@tarshish>
Message-ID: <55FACBE0.1040100@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On 9/17/2015 2:56 PM, Baruch Siach wrote:
> Hi Joao,
> 
> On Thu, Sep 17, 2015 at 02:46:02PM +0100, jpinto wrote:
>> sysvinit was not able to be built for arm64 architectures. This patch was made 
>> to fix the problem.
>>
>> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
>> ---
>>  package/sysvinit/0001-fix-libcrypt-test.patch | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/sysvinit/0001-fix-libcrypt-test.patch b/package/sysvinit/0001-fix-libcrypt-test.patch
>> index 207270d..7233d38 100644
>> --- a/package/sysvinit/0001-fix-libcrypt-test.patch
>> +++ b/package/sysvinit/0001-fix-libcrypt-test.patch
>> @@ -1,17 +1,25 @@
>>  Make the libcrypt test somewhat cross-compilation compliant
>>  
>>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> +Signed-off-by: Joao Pinto <jpinto@synopsys.com>
>>  
>>  Index: b/src/Makefile
>>  ===================================================================
>>  --- a/src/Makefile
>>  +++ b/src/Makefile
>> -@@ -78,7 +78,7 @@
>> +@@ -78,7 +78,14 @@
>>   endif
>>   
>>   # Additional libs for GNU libc.
>>  -ifneq ($(wildcard /usr/lib*/libcrypt.a),)
>> ++inc_additional_lib =
>>  +ifneq ($(wildcard $(SYSROOT)/usr/lib*/libcrypt.a),)
>> ++  inc_additional_lib = yes
>> ++else ifneq ($(wildcard $(SYSROOT)/usr/lib*/aarch64*/libcrypt.a),)
> 
> This looks to specific to that toolchain. Why not generalize
> 
>  else ifneq ($(wildcard $(SYSROOT)/usr/lib*/*/libcrypt.a),)
> 
> ?

Sounds like a good idea. Gonna send v2 patch in a sec.

> 
> baruch
> 
>> ++  inc_additional_lib = yes
>> ++endif
>> ++
>> ++ifdef inc_additional_lib
>>     SULOGINLIBS	+= -lcrypt
>>   endif
> 

Joao
