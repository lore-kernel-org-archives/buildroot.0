From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Sun, 28 Aug 2016 16:10:46 +0200
Subject: [Buildroot] [PATCH] openal: Explicitly enable/disable NEON
 support to avoid trouble with precompiled toolchains
In-Reply-To: <20160828155006.0abb2572@free-electrons.com>
References: <1472387820-6783-1-git-send-email-nerv@dawncrow.de>
 <20160828155006.0abb2572@free-electrons.com>
Message-ID: <ed871b54-3861-1b9e-e557-eb46e0887acc@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 28.08.2016 um 15:50 schrieb Thomas Petazzoni:
> Hello,
> 
> Why do you think the problem is with "precompiled" toolchains only?

Because the bug is about mismatch between target settings made in the buildroot config and the toolchain default target settings.

> 
> On Sun, 28 Aug 2016 14:37:00 +0200, Andr? Hentschel wrote:
>> Fixes:
>> http://autobuild.buildroot.net/results/d7ccef77a355ccc23f26d012e8441af931469ae4
>> http://autobuild.buildroot.net/results/b5777a0ed33f6bb7a5fc0486ea21ecef58615dac
>> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
>> ---
>>  package/openal/openal.mk | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/package/openal/openal.mk b/package/openal/openal.mk
>> index 2916aa6..8205f9e 100644
>> --- a/package/openal/openal.mk
>> +++ b/package/openal/openal.mk
>> @@ -50,4 +50,11 @@ ifeq ($(BR2_STATIC_LIBS),y)
>>  OPENAL_CONF_OPTS += -DLIBTYPE=STATIC
>>  endif
>>  
>> +# Explicitly enable/disable NEON support to avoid trouble with precompiled toolchains
>> +ifeq ($(BR2_ARM_FPU_NEON)$(BR2_ARM_FPU_NEON_VFPV4),y)
> 
> I believe you should use BR2_ARM_CPU_HAS_NEON instead.

Thought so too, looked into it, failed. It really depends on the FPU setting.
I know there's no other package doing this kind of check...
Other options are to always disable neon or to extend the checking in openal cmake script with a patch.
(I won't be able to patch it as my cmake skills are very low)
