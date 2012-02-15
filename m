From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 15 Feb 2012 09:10:10 +0100
Subject: [Buildroot] [PATCH 1 of 2 v3-resend] Makefile.package.in: add
 utility functions find*clauses and notfirstword
In-Reply-To: <201202111757.20786.arnout@mind.be>
References: <patchbomb.1328818168@beantl019720>
 <47a9c088ed0bfaeaaef3.1328818169@beantl019720>
 <201202111757.20786.arnout@mind.be>
Message-ID: <CAAXf6LWCS7+=9bTnikrkk8RZMvH=+iZGV5JZAYOAORpBMpnYhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sat, Feb 11, 2012 at 5:57 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Thursday 09 February 2012 21:09:29 Thomas De Schampheleire wrote:
>> +# Utility functions for 'find'
>> +# findfileclauses: creates "-name 'X' -o -name 'Y'"
>> +# [1:namelist]
>> +findfileclauses=-name '$(firstword $(1))' $(patsubst %,-o -name '%',$(call notfirstword,$(1)))
>> +# finddirclauses: creates "-path 'basedir/dirX' -o -path 'basedir/dirY'"
>> +# [1:basedir, 2:namelist]
>> +finddirclauses=-path '$(1)/$(firstword $(2))' $(patsubst %,-o -path '$(1)/%',$(call notfirstword,$(2)))
>> +
>> +# Miscellaneous utility functions
>> +notfirstword=$(wordlist 2,$(words $(1)),$(1))
>>
>
> ?You asked for inspiration on how to simplify this; here are two (untested) ideas:
>
> - a function 'join':
>
> # join,<joinstr>,<wordlist>: puts <joinstr> between the words of <wordlist>
> # e.g.: $(call join,+,a b c) -> a + b + c
> join = $(firstword $(2)) $(addprefix $(1) ,$(call notfirstword,$(2))
>
> findfileclauses = $(call join,-o,$(patsubst %,-name '%',$(1))
>
> - strip the first -o after joining:
> findfileclauses = $(call notfirstword,$(patsubst %, -o -name '%',$(1)))
> finddirclauses = $(call notfirstword,$(patsubst %, -o -path '$(1)/%',$(2)))

Thanks for these suggestions. I eventually used the second one.
I tried the first one, because the join function could have been
useful in other situations. However, there were two issues.
1. 'join' already is a make function (of course another name would suffice).
2. Because make uses whitespace to separate words, join cannot be used
here: the words are in fact groups of words: '-name X'. As a result,
'firstword $(2)' would be '-name' and 'notfirstword $(2)' would be
'X'. This conflicts with our purpose.

The second suggestion is also very nice and easily understandable, so
I took that as alternative.

Best regards,
Thomas
