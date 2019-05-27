From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 27 May 2019 23:22:28 +0200
Subject: [Buildroot] [PATCH 2/2] package/brotli: work aroung gcc bug
 68485
In-Reply-To: <b1f174a3-e61b-0127-5e25-9b90632cb852@mind.be>
References: <20190527210510.70987-1-giulio.benetti@micronovasrl.com>
 <20190527210510.70987-2-giulio.benetti@micronovasrl.com>
 <b1f174a3-e61b-0127-5e25-9b90632cb852@mind.be>
Message-ID: <2e2b06bc-ee6a-7d38-5c14-a79dd51685dd@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 27/05/2019 23:18, Arnout Vandecappelle ha scritto:
> 
> 
> On 27/05/2019 23:05, Giulio Benetti wrote:
>> With Microblaze Gcc version <= 9.x the build hangs due to gcc bug 68485:
>                                                 ^^^^^
>   fails, not hangs

Oops. Right.

>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. The bug show up when
>> building brotli with optimization but not when building with -O0. To
>> work aroung this, if BR2_TOOLCHAIN_HAS_GCC_BUG_68458=y, we force using
>> -O0.
>>
>> Fixes:
>>
>>    http://autobuild.buildroot.net/results/d86/d86251974a0a348a64d9a1d1fd7d02dd4aff0792/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>>   package/brotli/brotli.mk | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
>> index 2c1ad48753..248bfb9daf 100644
>> --- a/package/brotli/brotli.mk
>> +++ b/package/brotli/brotli.mk
>> @@ -14,4 +14,8 @@ BROTLI_CONF_OPTS = \
>>   	-DBROTLI_DISABLE_TESTS=ON \
>>   	-DBROTLI_BUNDLED_MODE=OFF
>>   
>> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
> 
>   Could you also update package/gpsd/gpsd.mk in the same way? It's the package
> which triggered the original bug report, and it still disables it for microblaze
> entirely.
> 

Sure, it was already ready to tell the truth, but I have too many 
patches in WIP.
There are also, flann and libspatialindex.
I'm going to send all together then.

Thank you

Kind regards
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

> 
>> +BROTLI_CONF_OPTS += -DCMAKE_C_FLAGS="-O0"
>> +endif
>> +
>>   $(eval $(cmake-package))
>>
