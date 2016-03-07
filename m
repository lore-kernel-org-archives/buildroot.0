From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Mar 2016 23:09:17 +0100
Subject: [Buildroot] node.js ENOTFOUND error when using uclibc
In-Reply-To: <CAFGQKxcn_nCR+jGABopOAHMt0-rhAF=g3ZvaxtFaE-CzAQo1Gw@mail.gmail.com>
 (Martin Bark's message of "Mon, 7 Mar 2016 13:02:48 +0000")
References: <trinity-42794f72-6f90-430b-8cdf-048645cbdab2-1457338189594@3capp-gmx-bs39>
 <CAFGQKxcn_nCR+jGABopOAHMt0-rhAF=g3ZvaxtFaE-CzAQo1Gw@mail.gmail.com>
Message-ID: <87d1r654aa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:

 > Michael,
 > I can reproduce your issue using the qemu_x86_64_defconfig.  As you
 > say this looks like a bug in uclibc or a difference between uclibc and
 > glibc.

 > Can you please raise this in bugzilla
 > (https://bugs.buildroot.org/buglist.cgi?product=buildroot) and add as
 > much detail as you can.  If possible can you try to narrow down the
 > issue, perhaps by testing getaddrinfo with hints.ai_flags sets to
 > AI_V4MAPPED for uclibc and glibc.

I had a look, and to me it seems like a glibc-ism in node.js.

according to getaddrinfo(3), glibc interpretes a NULL hints as passing a
hints structure with:

ai_family = AF_UNSPEC and ai_hints = AI_V4MAPPED | AI_ADDRCONFIG

This combination is quite odd, as posix specifies that AI_V4MAPPED only
does something if ai_family is set to AF_INET6 OR if AI_ALL is passed.

http://pubs.opengroup.org/onlinepubs/9699919799/functions/freeaddrinfo.html

uClibc(-ng) instead follows posix and sets ai_family to AF_UNSPEC and
ai_hints = 0.

And node.js seems to have copied glibc and passes AF_UNSPEC /
AI_V4MAPPED | AI_ADDRCONFIG by default.

The real problem is that glibc and uclibc{-ng} handles these flags
differently. From the looks of it, glibc ignores AI_V4MAPPED unless
ai_family is explictly set to AF_INET6, whereas uClibc{-ng} looks at the
*RESULT* ai_family when interpreting AI_V4MAPPED, causing it to return
no AF_INET results when AI_V4MAPPED is passed unless AI_ALL is also
passed (which causes it to convert the AF_INET result to AF_INET6).

Waldemar, while the application shouldn't be passing AF_UNSPEC +
AI_V4MAPPED it would be good if uClibc-ng could be changed to behave
more similar to glibc for compatibility reasons.

-- 
Bye, Peter Korsgaard
