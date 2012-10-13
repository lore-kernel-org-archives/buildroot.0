From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sat, 13 Oct 2012 16:25:46 +0300
Subject: [Buildroot] [PATCH] beecrypt: enable OpenMP if Buildroot GCC
 supports it
In-Reply-To: <50793478.1090305@mind.be>
References: <1350071690-11279-1-git-send-email-stefan.froberg@petroprogram.com>
 <50793478.1090305@mind.be>
Message-ID: <50796BDA.3040008@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

13.10.2012 12:29, Arnout Vandecappelle kirjoitti:
> On 12/10/12 21:54, Stefan Fr?berg wrote:
>>
>> Signed-off-by: Stefan Fr?berg<stefan.froberg@petroprogram.com>
>> ---
>>   package/beecrypt/beecrypt.mk |    6 ++++++
>>   1 files changed, 6 insertions(+), 0 deletions(-)
>>
>> diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
>> index d165aee..101d0df 100644
>> --- a/package/beecrypt/beecrypt.mk
>> +++ b/package/beecrypt/beecrypt.mk
>> @@ -18,6 +18,12 @@ BEECRYPT_CONF_OPT = \
>>           --without-java \
>>           --without-python
>>
>> +ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
>> +BEECRYPT_CONF_OPT += --enable-openmp
>> +else
>> +BEECRYPT_CONF_OPT += --disable-openmp
>> +endif
>> +
>
>  This doesn't solve the underlying issue that -lgomp isn't included.  In
> addition, it would only enable openmp for internal toolchains, while
> it may
> be present for ct-ng or external toolchains as well.  I think the
> automatic
> detection works well in this case.
>

Yeah, but how do you test the presence of OpenMP in case of external
toolchain ?
Checking if /usr/lib/libgomp.so.* are present ?
Parsing the output of external toolchain "gcc -v" ? (there is not even
configure switch for OpenMP in current gcc)

There are just too many variables and corner cases when it comes for
testing various features of buildroot external toolchains.

And the automatic detection didn't work for Alexander and he was even
using the internal toolchain
(if Im not wrong he uses ARM version of internal buildroot toolchain ?)


Best regards
Stefan
>  Regards,
>  Arnout
