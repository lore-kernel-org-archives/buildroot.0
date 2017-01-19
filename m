From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 19 Jan 2017 17:28:50 -0200 (BRST)
Subject: [Buildroot] [PATCH v2] util-linux: fix ncurses/wchar handling
 (again)
In-Reply-To: <cc558229-46cf-ebf9-7df1-280cf8c7e18e@cartelsol.com>
References: <1484281849-25875-1-git-send-email-casantos@datacom.ind.br>
 <1484301833-16403-1-git-send-email-casantos@datacom.ind.br>
 <20170117164437.36272eed@free-electrons.com>
 <cc558229-46cf-ebf9-7df1-280cf8c7e18e@cartelsol.com>
Message-ID: <52160250.7827358.1484854130829.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Marcus Hoffmann" <m.hoffmann@cartelsol.com>
> To: buildroot at busybox.net
> Sent: Tuesday, January 17, 2017 11:57:12 AM
> Subject: Re: [Buildroot] [PATCH v2] util-linux: fix ncurses/wchar handling (again)

> On 17.01.2017 06:44, Thomas Petazzoni wrote:
>> Hello,
>> 
>> On Fri, 13 Jan 2017 08:03:53 -0200, Carlos Santos wrote:
>>> util-linux #defines "wchar_t" as "char" when configured without widechar
>>> support. This conflicts with definition of wchar_t contained in stddef.h,
>>> so the compilation fails with
>>>
>>>     error: two or more data types in declaration specifiers
>>>     #define
>>>      wchar_t char
>>>
>>> The error can be avoided by rearranging the inclusion order in some files
>>> under the text-utils directory.
>>>
>>> Fixes:
>>>
>>>   http://autobuild.buildroot.net/results/3a2f228e0fa7b5cc28a13d49f48f1a6aef8d9d7a
>>>   http://autobuild.buildroot.net/results/99e96069f652d511c6212a5bb6be29e68fb1747c
>>>   http://autobuild.buildroot.net/results/2dc5721aef93b7b410153bafad78248fac3db941
>>>
>>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
>> 
>> I tried to fix the same problem in commit
>> 5a18eabdf08564688761a9b2f35892d69d8f9a18, but apparently failed at
>> taking into account all the possible situations.
>> 
>> So if we are going to merge a different solution, I'd like to see an
>> investigation of whether commit
>> 5a18eabdf08564688761a9b2f35892d69d8f9a18 is still needed or not. If
>> it's not, then it should be reverted as well.

It can be reverted. I just confirmed that my patch covers both the
musl and uClibc cases.

>> I must say I find the fix of playing with the ordering of includes to
>> be somewhat hackish. Do we have a better solution? Is it really legal
>> for util-linux to redefine wchar_t? Should it use a better autoconf
>> check before doing this?
> 
> Maybe we should ask the util-linux list? There's often an active
> discussion, on what is the correct way to handle such things.
> 
> Marcus

I just sent a patch to the util-linux list.

Carlos Santos (Casantos) - DATACOM, P&D
?Something must be done. This is something. Therefore we must do it.?
(from the BBC series ?Yes, Prime Minister?, ?Power to the people?)
