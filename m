From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Sun, 13 Apr 2014 10:19:08 -0300
Subject: [Buildroot] [PATCH v2] toolchain-external: Introduce kernel
 headers sanitization
In-Reply-To: <20140413100512.540e6923@skate>
References: <1397338462-22573-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20140413100512.540e6923@skate>
Message-ID: <CAAEAJfCWcTpOEvpkTdz1hcv3B93Z9XxuiCr354=NpVwJdc4aCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13 April 2014 05:05, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Ezequiel Garcia,
>
> On Sat, 12 Apr 2014 18:34:22 -0300, Ezequiel Garcia wrote:
>> The Nios-II Sourcery external toolchain (the only Nios-II we currently
>> support) exports broken kernel headers. In particular, these kernels should
>> be exported using the "headers_install" rule which applies a set of fixes
>> on the kernel headers so they are suitable for userspace usage.
>>
>> In order to fix this, let's introduce a compile-time hidden option, to be
>> selected by such broken toolchains, and perform the header fixes ourselves.
>> The result is equivalent to apply the "headers_install" rule.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/c32/c32ad4bac5f651502e551f7733f702afaa0e742a/
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> ---
>> v1 -> v2: Yann asked to replace ${STAGING_DIR} with $(STAGING_DIR)
>>
>>  toolchain/toolchain-external/Config.in             |  7 +++++++
>>  toolchain/toolchain-external/toolchain-external.mk | 15 +++++++++++++++
>>  2 files changed, 22 insertions(+)
>>
>> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
>> index 3990336..9a3ab6f 100644
>> --- a/toolchain/toolchain-external/Config.in
>> +++ b/toolchain/toolchain-external/Config.in
>> @@ -434,6 +434,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
>>       select BR2_INSTALL_LIBSTDCPP
>>       select BR2_HOSTARCH_NEEDS_IA32_LIBS
>>       select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
>> +     select BR2_TOOLCHAIN_HEADERS_SANITIZE_NEEDED
>>       help
>>         Sourcery CodeBench toolchain for the Nios-II architecture,
>>         from Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52,
>> @@ -1206,4 +1207,10 @@ config BR2_BFIN_INSTALL_FLAT_SHARED
>>         into a buildroot rootfs image built with binary format that is not
>>         shared FLAT.
>>
>> +# Some toolchains have their headers broken and need to be sanitized.
>> +# Currently, this is only needed on Nios-II external Sourcery toolchain,
>> +# to fix the Linux headers.
>> +config BR2_TOOLCHAIN_HEADERS_SANITIZE_NEEDED
>> +     bool
>
> I am wondering whether this really warrants an additional hidden
> Kconfig option, since the matter is purely "internal" to the external
> toolchain backend. See my proposal below.
>

Proposal looks good, thanks!
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
