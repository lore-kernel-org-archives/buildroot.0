From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Jan 2016 08:26:57 -0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160122102957.10f29956@free-electrons.com>
References: <20160122073021.E35B6101A27@stock.ovh.net>
 <20160122102957.10f29956@free-electrons.com>
Message-ID: <56A21201.5000508@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/01/16 06:29, Thomas Petazzoni wrote:

>>        mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/62f386829193c747176ace05e4b26826fcabbf59/
>>      mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/a92fa5dc5d9d6742d61d4d293f7eac97c5355dfe/
>
> rbt.c:116:15: error: two or more data types in declaration specifiers
>    isc_uint32_t ptrsize;
>                 ^
> rbt.c:116:22: error: expected identifier or '(' before ';' token
>    isc_uint32_t ptrsize;
>
> Gustavo, can you have a look ? I think this error already popped up in the past, no?

Hi.
Finally nailed it down, it's uclibc's fault, basically it #defines 
ptrsize in bits/setjmp.h for mips.
Waldemar: you did that in 70a04a287a2875c82e6822c36e071afba5b63a62 
(uclibc), unfortunately it will be hard to get rid of, we'll have to 
live with this for some time.
I can patch bind to not use ptrsize (say, rename it to pointersize or 
something like that) and that fixes it, however it definitely won't be 
upstreamable (i don't even want to show my face to explain why it's 
necessary).
This could affect other programs in the future i believe.
Regards.
