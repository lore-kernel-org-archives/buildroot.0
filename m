From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 29 Nov 2015 21:55:55 +0100
Subject: [Buildroot] [PATCH 2/3] Config.in: add symbols for
 BR2_HOST_GCC_AT_LEAST_X_Y
In-Reply-To: <20151129174805.GC3630@free.fr>
References: <1448147919-5463-1-git-send-email-arnout@mind.be>
 <1448147919-5463-2-git-send-email-arnout@mind.be>
 <20151129174805.GC3630@free.fr>
Message-ID: <565B665B.9050304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29-11-15 18:48, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-11-22 00:18 +0100, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> Some host packages need a recent gcc version. Add symbols to Config.in
>> to specify the HOSTCC version. The values are passed through the
>> environment, and this environment is generated in a new support script.
> 
> I really don't like this...

 I originally had it as a make fragment :-P

> 
> Maybe it is a good candidate for a generated kconfig snippet, instead of
> this generated-environment oddity?

 I never thought of that, it would be a possibility. If I would have time :-)
I'd have a go at it.

> 
> Anyway, see below, you could generate only one environment variable,
> instead of all of them...
> 
>> Also update the documentation to mention the new symbols.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>>  Config.in                                 | 17 ++++++++++
>>  Makefile                                  |  1 +
>>  docs/manual/adding-packages-directory.txt |  7 ++++
>>  support/scripts/gcc-version-variables     | 56 +++++++++++++++++++++++++++++++
>>  4 files changed, 81 insertions(+)
>>  create mode 100755 support/scripts/gcc-version-variables
>>
>> diff --git a/Config.in b/Config.in
>> index d795361..7bec90c 100644
>> --- a/Config.in
>> +++ b/Config.in
>> @@ -18,6 +18,23 @@ config BR2_EXTERNAL
>>  	string
>>  	option env="BR2_EXTERNAL"
>>  
>> +# Hidden config symbols for packages to check system gcc version
>> +config BR2_HOST_GCC_AT_LEAST_4_7
>> +	bool
>> +	option env="HOST_GCC_AT_LEAST_4_7"
>> +
>> +config BR2_HOST_GCC_AT_LEAST_4_8
>> +	bool
>> +	option env="HOST_GCC_AT_LEAST_4_8"
>> +
>> +config BR2_HOST_GCC_AT_LEAST_4_9
>> +	bool
>> +	option env="HOST_GCC_AT_LEAST_4_9"
>> +
>> +config BR2_HOST_GCC_AT_LEAST_5
>> +	bool
>> +	option env="HOST_GCC_AT_LEAST_5"
> 
> If you make each of those options actually select the N-1 option, then
> all you need if to set one environment variable.

 Alas, that is not possible with the env option. You'd need two symbols, one for
getting it from the environment and a real one that can be selected.

> 
> [--SNIP--]
>> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
>> index 139123e..c2d9f75 100644
>> --- a/docs/manual/adding-packages-directory.txt
>> +++ b/docs/manual/adding-packages-directory.txt
>> @@ -283,6 +283,13 @@ use in the comment.
>>  ** Comment string: +gcc >= X.Y+ and/or `gcc <= X.Y` (replace
>>     +X.Y+ with the proper version)
>>  
>> +* Host GCC version
>> +** Dependency symbol: +BR2_HOST_GCC_AT_LEAST_X_Y+, (replace
>> +   +X_Y+ with the proper version, see +Config.in+)
>> +** Comment string: no comment to be added
>> +** Note that it is usually not the package itself that has a minimum
>> +   host GCC version, but rather a host-package on which it depends.
> 
> Well, in case the package builds an internal host tool, and properly
> separates BUILD_CC from CC, then the restriction does apply to the
> package itself and not a host-package.

 Yeah I know, however it's complicated to explain that well in the manual, and I
don't believe it will ever happen in practice. Things built with BUILD_CC are
usually pretty simple tools.


 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
