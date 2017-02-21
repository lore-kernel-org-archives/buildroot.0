From: ren_guo <ren_guo@c-sky.com>
Date: Tue, 21 Feb 2017 17:16:17 +0800
Subject: [Buildroot] [PATCH 1/1] toolchain/helpers.mk: fixup gcc version
 check
In-Reply-To: <9503bd30-974c-f3a5-3ad6-d71e21bcefcf@mind.be>
References: <1487578468-8080-1-git-send-email-ren_guo@c-sky.com>
 <9503bd30-974c-f3a5-3ad6-d71e21bcefcf@mind.be>
Message-ID: <bdb4bd29-0b3e-5726-33ef-bb70b0eefe41@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thx Arnout,

I've done a new patch mail, please have a check.

Best Regards

guoren


On 2017?02?21? 07:11, Arnout Vandecappelle wrote:
>   Hi Ren,
>
> On 20-02-17 09:14, ren_guo wrote:
>> some gcc --version ouput like this:
>>
>> $ csky-linux-gcc --version
>> csky-linux-gcc (C-SKY Tools V2.8.08(Beta1)(Glibc,Linux 4.8.4), ABIV1,
>> B20161118) 4.5.1
>>
>> current script just find first ')', but we need find last ')' to get
>> correct version number.
>>
>> Signed-off-by: ren_guo <ren_guo@c-sky.com>
>   Please use a normally formatted name, i.e. (I assume) Ren Guo. And use it as
> the author line as well.
>
>> ---
>>   toolchain/helpers.mk | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
>> index 72e7292..60347ea 100644
>> --- a/toolchain/helpers.mk
>> +++ b/toolchain/helpers.mk
>   You also need to update the comment above to reflect what you change below.
>
>   It would also help to make the example a bit more concrete, e.g.
>
> # The GCC version string is built up as follows:
> # GCC (PKGVERSION) BASEVER DATESTAMP DEVPHASE REVISION
> # PKGVERSION can be anything, it's a string provided at configure time.
> # BASEVER is what we need.
> # DATESTAMP is YYYYMMDD or empty
> # DEVPHASE is experimental, pre-release or empty
> # REVISION is [svn revision info] or empty
> # Therefore, we need the first non-space sequence after the last ')' character
>
>
>   Regards,
>   Arnout
>
>> @@ -147,7 +147,7 @@ check_gcc_version = \
>>   	if [ -z "$${expected_version}" ]; then \
>>   		exit 0 ; \
>>   	fi; \
>> -	real_version=`$(1) --version | sed -r -e '1!d; s/^[^)]+\) ([^[:space:]]+).*/\1/;'` ; \
>> +	real_version=`$(1) --version | sed -r -e '1!d; s/^.+\) ([^[:space:]]+).*/\1/;'` ; \
>>   	if [[ ! "$${real_version}" =~ ^$${expected_version}\. ]] ; then \
>>   		printf "Incorrect selection of gcc version: expected %s.x, got %s\n" \
>>   			"$${expected_version}" "$${real_version}" ; \
>>
