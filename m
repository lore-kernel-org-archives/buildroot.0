From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 8 Feb 2018 01:29:46 +0100
Subject: [Buildroot] [PATCH] ltp-testsuite: add numactl as optional
 dependency
In-Reply-To: <20180207194907.GA1349@x230>
References: <cd25369f9e0588a17965bbabcf6214c110f86ef4.1518030288.git.baruch@tkos.co.il>
 <20180207194907.GA1349@x230>
Message-ID: <7416baae-37f5-ad95-ce69-8b5ef882f48b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-02-18 20:49, Petr Vorel wrote:
> Hi Baruch,
>> Make the detection of libnuma in the configure script consistent when
>> the numactl package is enabled.
> 
>> ltp-testsuite does not currently take explicit enable/disable for
>> libnuma, so none are used. The next ltp-testsuite version will add these
>> options.
> 
>> Cc: Petr Vorel <petr.vorel@gmail.com>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>>  package/ltp-testsuite/ltp-testsuite.mk | 7 +++++++
>>  1 file changed, 7 insertions(+)
> 
>> diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
>> index 5e0b35d12a22..c47f587836b3 100644
>> --- a/package/ltp-testsuite/ltp-testsuite.mk
>> +++ b/package/ltp-testsuite/ltp-testsuite.mk
>> @@ -40,6 +40,13 @@ else
>>  LTP_TESTSUITE_CONF_ENV += ac_cv_lib_cap_cap_compare=no
>>  endif
> 
>> +# No explicit enable/disable options
>> +ifeq ($(BR2_PACKAGE_NUMACTL),y)
>> +LTP_TESTSUITE_DEPENDENCIES += numactl
>> +else
>> +LTP_TESTSUITE_CONF_ENV += have_numa_headers=no
>> +endif
>> +
>>  # ltp-testsuite uses <fts.h>, which isn't compatible with largefile
>>  # support.
>>  LTP_TESTSUITE_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
> Thanks for implementing it, LGTM.
> I just think whether it wouldn't be better to create config option
> BR2_PACKAGE_LTP_TESTSUITE_LIBNUMA which would select numactl (this would also inform user
> about this dependency).

 We generally don't do that unless there is a very good reason, to avoid
proliferation of Config.in options. In this case, I don't see a very good reason.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
