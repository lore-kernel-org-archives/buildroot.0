From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 5 May 2017 19:34:46 -0300 (BRT)
Subject: [Buildroot] [PATCH 1/3] core: allow check-host-cmake.sh to
 check several candidates
In-Reply-To: <20170505210703.GA3001@scaer>
References: <1494016231-50639-1-git-send-email-casantos@datacom.ind.br>
 <1494016231-50639-2-git-send-email-casantos@datacom.ind.br>
 <20170505210703.GA3001@scaer>
Message-ID: <829990645.21765498.1494023686203.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org
> Sent: Friday, May 5, 2017 6:07:03 PM
> Subject: Re: [Buildroot] [PATCH 1/3] core: allow check-host-cmake.sh to check several candidates
>> --- a/support/dependencies/check-host-cmake.sh
>> +++ b/support/dependencies/check-host-cmake.sh
>> @@ -1,39 +1,41 @@
>>  #!/bin/sh
>>  
>> -candidate="${1}"
>> -version_min="${2}"
>> +eval 'version_min="${'${#}'}"'
> 
> It took me a moment to understand what this was doing (and I am known
> for being a shell fanboy!).
> 
> Just revert the order options are passed: version first, then
> candidates. This will allow you to get rid of this weird construct.
> 
>    version_min="${1}"
>    shift # Keep only candidates

I did it that way because all invocations of the "suitable-host-package"
macro pass the candidate name as the first argument to the script but I
must admit that the script lost some readability. 

> 
> So that you can do...
> 
>>  major_min="${version_min%.*}"
>>  minor_min="${version_min#*.}"
> [--SNIP--]
>> +while [ $# -gt 1 ]; do
>> +    cmake=`which "${1}" 2>/dev/null`
> 
>    for cmake; do
>        cmake=`which "${cmake}" 2>/dev/null`
> 
>> +
>> +    if [ -x "${cmake}" ]; then
> 
> Please use an early cut:
> 
>        [ -x "${cmake}" ] || continue
> 
> which allows you to gain a indentation level below.

Ok.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
