From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 17 Jan 2017 08:50:56 -0200 (BRST)
Subject: [Buildroot] [PATCH v2] util-linux: fix ncurses/wchar handling
 (again)
In-Reply-To: <20170117164437.36272eed@free-electrons.com>
References: <1484281849-25875-1-git-send-email-casantos@datacom.ind.br>
 <1484301833-16403-1-git-send-email-casantos@datacom.ind.br>
 <20170117164437.36272eed@free-electrons.com>
Message-ID: <288708440.7314310.1484650256382.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org
> Sent: Tuesday, January 17, 2017 3:44:37 AM
> Subject: Re: [Buildroot] [PATCH v2] util-linux: fix ncurses/wchar handling (again)

> Hello,
> 
> On Fri, 13 Jan 2017 08:03:53 -0200, Carlos Santos wrote:
>> util-linux #defines "wchar_t" as "char" when configured without widechar
>> support. This conflicts with definition of wchar_t contained in stddef.h,
>> so the compilation fails with
>> 
>>     error: two or more data types in declaration specifiers
>>     #define
>>      wchar_t char
>> 
>> The error can be avoided by rearranging the inclusion order in some files
>> under the text-utils directory.
>> 
>> Fixes:
>> 
>>   http://autobuild.buildroot.net/results/3a2f228e0fa7b5cc28a13d49f48f1a6aef8d9d7a
>>   http://autobuild.buildroot.net/results/99e96069f652d511c6212a5bb6be29e68fb1747c
>>   http://autobuild.buildroot.net/results/2dc5721aef93b7b410153bafad78248fac3db941
>> 
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> 
> I tried to fix the same problem in commit
> 5a18eabdf08564688761a9b2f35892d69d8f9a18, but apparently failed at
> taking into account all the possible situations.
> 
> So if we are going to merge a different solution, I'd like to see an
> investigation of whether commit
> 5a18eabdf08564688761a9b2f35892d69d8f9a18 is still needed or not. If
> it's not, then it should be reverted as well.

Ok, I will take a look tonight.

> I must say I find the fix of playing with the ordering of includes to
> be somewhat hackish. Do we have a better solution? Is it really legal
> for util-linux to redefine wchar_t? Should it use a better autoconf
> check before doing this?
> 
> Thomas

I'd rather disable ncurses support at all instead of resorting to ugly
hacks. Looks like ncurses is important for other people, however, so I
attempted to preserve it.

As far as I understand the redefinition aims to compile util-linux for
systems whose C libraries do not support wide characters at all (and
therefore do not define wchar_t). Perhaps this was easy to do a long
time ago but now that C compilers provide wchar_t as a built-in type
it became complicated.

Carlos Santos (Casantos) - DATACOM, P&D
?Something must be done. This is something. Therefore we must do it.?
(from the BBC series ?Yes, Prime Minister?, ?Power to the people?)
