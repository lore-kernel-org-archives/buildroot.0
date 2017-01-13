From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 13 Jan 2017 01:53:34 -0200 (BRST)
Subject: [Buildroot] [autobuild.buildroot.net] Your build results
	for	2017-01-11
In-Reply-To: <1397774101.6731830.1484224257049.JavaMail.zimbra@datacom.ind.br>
References: <20170112072936.BAC98207D1@mail.free-electrons.com>
 <1397774101.6731830.1484224257049.JavaMail.zimbra@datacom.ind.br>
Message-ID: <1936743309.6879632.1484279614405.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Carlos Santos" <casantos@datacom.ind.br>
--8<---
>>     powerpc |                util-linux-2.29 |
>>     http://autobuild.buildroot.net/results/3a2f228e0fa7b5cc28a13d49f48f1a6aef8d9d7a
>>     powerpc |                util-linux-2.29 |
>>     http://autobuild.buildroot.net/results/99e96069f652d511c6212a5bb6be29e68fb1747c
>> microblazeel |                util-linux-2.29 |
>> http://autobuild.buildroot.net/results/2dc5721aef93b7b410153bafad78248fac3db941
> 
> Looks like the recent attempts to fix the util-linux + ncurses + wchar problem
> were not successful. I will take a look at this tonight.

The problem is caused by the replacement of "wchar_t" by "char" in widechar.h
conflicting with the definition of wchar_t contained in stddef.h, which is
included by c.h. It can be reproduced attempting to compile the following code
snippet:

$ cat test.c

#include <ctype.h>
#define wchar_t char
#include <stddef.h>

int main()
{
	return 0;
}

$ powerpc-linux-cc -Wall -Werror -o test test.c
test.c:2:17: error: two or more data types in declaration specifiers
 #define wchar_t char

The problem can be circumvented by reordering the #includes in
text-utils/{colcrt.c,colrm.c,column.c}, moving widechar.h below c.h.

I will submit a patch soon.

Carlos Santos (Casantos) - DATACOM, P&D
?Something must be done. This is something. Therefore we must do it.?
(from the BBC series ?Yes, Prime Minister?, ?Power to the people?)
