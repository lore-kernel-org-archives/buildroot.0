From: ren_guo <ren_guo@c-sky.com>
Date: Tue, 21 Feb 2017 22:19:29 +0800
Subject: [Buildroot] [PATCH 1/1] toolchain/helpers.mk: fixup
	check_gcc_version.
In-Reply-To: <f18e301f-6a8a-9ce4-6047-7b35e61fdcdf@mind.be>
References: <1487667876-27245-1-git-send-email-ren_guo@c-sky.com>
 <f18e301f-6a8a-9ce4-6047-7b35e61fdcdf@mind.be>
Message-ID: <abfd0c94-5545-b802-7906-b2755f453f37@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Another path is done, pls have a check.

my patch v2 is ok?

Best Regards

guoren

On 2017?02?21? 18:05, Arnout Vandecappelle wrote:
>   Hi guoren,
>
>   We like to have a version log in the patch. Under the Signed-off-by, add a line
> with --- and then a log of what changed compared to your first submission. Also
> put "[PATCH v2]" in the Subject (which you can do with
> "git format-patch -v2").
>
> On 21-02-17 10:04, Guo Ren wrote:
>> some gcc --version ouput like this:
>> $ csky-linux-gcc --version
>> csky-linux-gcc (C-SKY Tools V2.8.08(Beta1)(Glibc,Linux 4.8.4), ABIV1,
>> B20161118) 4.5.1
>>
>> current script just find first ')', but we need find last ')' to get
>> correct version number.
>>
>> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
>   I've tested this on about 300 gcc binaries I have available, and it gives the
> same results as before on all of them (I don't have anything like the C-SKY
> version string). However, not exactly the same, see below.
>
>   However, this made me realize that there is still a potential issue, see below.
>
>> ---
>>   toolchain/helpers.mk | 18 +++++++++++++-----
>>   1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
>> index 72e7292..2d695ed 100644
>> --- a/toolchain/helpers.mk
>> +++ b/toolchain/helpers.mk
>> @@ -136,18 +136,26 @@ check_kernel_headers_version = \
>>   # - 1!d
>>   #   - delete if not line 1
>>   #
>> -# - s/^[^)]+\) ([^[:space:]]+).*/\1/
>> -#   - eat all until the first ')' character followed by a space
>> -#   - match as many non-space chars as possible
>> -#   - eat all the remaining chars on the line
>   Why did you remove this part of the regex? I think the regex should be:
>
>> +# - s/^.+\)[[:space:]]*([^[:space:]]+)/\1/
>         s/^.+\)[[:space:]]*([^[:space:]]+).*/\1/
>
> so keep on eating the part that comes after BASEVER.
>
>> +#   - eat all until the last ')' character
>> +#   - match the first non-space sequence
>   You removed the "eat spaces" part. So:
>
> #   - eat all until the last ')' character
> #   - eat any following spaces
> #   - match the following non-space sequence
> #   - replace by the matched expression
>
>>   #   - replace by the matched expression
>>   #
>> +# The GCC version string is built up as follows:
>> +# GCC (PKGVERSION) BASEVER DATESTAMP DEVPHASE REVISION
>> +# PKGVERSION can be anything, it's a string provided at configure time.
>> +# BASEVER is what we need.
>> +# DATESTAMP is YYYYMMDD or empty
>> +# DEVPHASE is experimental, pre-release or empty
>   Turns out that this is wrong. It should be:
>
> # DEVPHASE is (experimental), (prerelease) or empty
>
> Which brings us to the first potential problem that I found in these 300
> toolchains: your new pattern will extract the wrong version when DEVPHASE is
> non-empty and REVISION is also non-empty. It worked for the toolchains I have,
> because they had an empty REVISION and the regex requires a non-space character
> after the last ). But it may not always work.
>
>   So this patch fixes one practical case and breaks another theoretical case -
> still a net improvement I'd say, so I'm OK with leaving it as is.
>
>   To improve this, we could probably require the match part to start with a
> digit. However, I don't have any toolchain with non-empty REVISION so I'm not
> sure if that one doesn't start with a digit either. From the code, it *looks*
> like the REVISION part always starts with [ but I can't be 100% sure.
>
>
>> +# REVISION is [svn revision info] or empty
>> +# Therefore, we need the first non-space sequence after the last ')' character
>> +#
>>   check_gcc_version = \
>>   	expected_version="$(strip $2)" ; \
>>   	if [ -z "$${expected_version}" ]; then \
>>   		exit 0 ; \
>>   	fi; \
>> -	real_version=`$(1) --version | sed -r -e '1!d; s/^[^)]+\) ([^[:space:]]+).*/\1/;'` ; \
>> +	real_version=`$(1) --version | sed -r -e '1!d; s/^.+\)[[:space:]]*([^[:space:]]+)/\1/;'` ; \
>>   	if [[ ! "$${real_version}" =~ ^$${expected_version}\. ]] ; then \
>   By not eating the DATESTAMP DEVPHASE REVISION part, nothing really changes
> because it will still match this pattern. Still, it's cleaner to have the actual
> BASEVER in real_version and not the entire version string.
>
>   Here is the second problem I found while going through all my toolchains: I
> have some toolchains that report BASEVER as 4.8 instead of 4.8.x. This will NOT
> match the expected_version because of the missing . after it. Not sure how to
> fix that, and if we really need to fix it - it was an Android toolchain :-)
>
>   But anyway, that would be for a separate patch.
>
>   Regards,
>   Arnout
>
>>   		printf "Incorrect selection of gcc version: expected %s.x, got %s\n" \
>>   			"$${expected_version}" "$${real_version}" ; \
>>
