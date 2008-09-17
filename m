From: Nick Peirson <nick@netcentral.co.uk>
Date: Wed, 17 Sep 2008 10:28:51 +0100
Subject: [Buildroot] Lighttpd and PCRE
Message-ID: <48D0CDD3.4070604@netcentral.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm fairly new to buildroot and cross compiling in general and I've 
encountered some problems getting PCRE support enabled in lighttpd.

Initially PCRE was failing to compile complaining of an unknown option 
-N, which I tracked down to the the line in the PCRE Makefile:

STRIP = true -Not_stripping

Commenting this out allow PCRE to compile, however lighttpd failed to 
compile with an error regarding libc.so.6 conflicting with with 
libc.so.0. A quick find through my buildroot environment showed no 
instances of libc.so.6, however it was present on my host system. In an 
attempt to fix it I changed the line:

PCRE_LIB = -L/usr/lib -lpcre

to

PCRE_LIB = -lpcre

The compilation now proceeded without errors, however I'm still 
receiving an error from lighttpd that it's not been compiled with PCRE 
support.

As I understand it, the sysroot argument, which is present and correct, 
should make that -L/usr/lib entry relative to the value provided by 
sysroot, however it still seemed to be finding libc.so.6 from the host 
system. Am I misunderstanding the sysroot argument or is somethign elses 
going on? Also, I thought that removing -L/usr/lib and leaving in -lpcre 
would still link it against PCRE, however, when running it, it's still 
claiming there's no PCRE support. Should I be loking for a problem in 
lighttpd, where the compilation error occured, or has the problem 
already been introduced during the compilation of PCRE?

Due to my lack of experience with buildroot, I'm not sure if this is 
something I've done wrong or if it's a bug with buildroot/lighttpd/pcre, 
but any help either way would be greatly appreciated.

Thanks
Nick
