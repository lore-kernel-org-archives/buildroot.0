From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 28 May 2019 00:17:21 +0200
Subject: [Buildroot] [PATCH v2 1/4] package/brotli: work aroung gcc bug
 68485
In-Reply-To: <55b75809-666e-299a-50b2-2916651f65cc@mind.be>
References: <2e2b06bc-ee6a-7d38-5c14-a79dd51685dd@micronovasrl.com>
 <20190527213826.114001-1-giulio.benetti@micronovasrl.com>
 <20190527213826.114001-2-giulio.benetti@micronovasrl.com>
 <55b75809-666e-299a-50b2-2916651f65cc@mind.be>
Message-ID: <55387552-88a0-ffab-ca89-f93cf3694dd5@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 28/05/2019 00:11, Arnout Vandecappelle ha scritto:
> 
> 
> On 27/05/2019 23:38, Giulio Benetti wrote:
>> With Microblaze Gcc version <= 9.x the build fails due to gcc bug 68485:
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
> 
>   Applied to master, thanks.
> 
>   The rest of the series should go to next, actually. In fact, I should also have
> applied flare-engine to next :-(

Sure, no problem, I have lot of other Microblaze patches.
Tomorrow I will give priority to bug fix patches and only after to 
"clean-up" patches.

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
>> +BROTLI_CONF_OPTS += -DCMAKE_C_FLAGS="-O0"
>> +endif
>> +
>>   $(eval $(cmake-package))
>>
