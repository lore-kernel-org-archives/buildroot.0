From: Spielmann Werner <Werner.Spielmann@SWAROVSKI.COM>
Date: Thu, 14 Mar 2013 15:53:20 +0100
Subject: [Buildroot] Problem with buildroot-2013.02 - ncurses
In-Reply-To: <51418446.5060808@mind.be>
References: <84EA0F7435E5F64C9B660453645DB90497AD4DEF0D@DSW350.wattens.swarovski.com>
 <20130307093024.30cb7d23@skate>
 <84EA0F7435E5F64C9B660453645DB90497AD52A6B0@DSW350.wattens.swarovski.com>
 <20130307140818.0d48c197@skate>
 <84EA0F7435E5F64C9B660453645DB90497AD52AA50@DSW350.wattens.swarovski.com>
 <513FB6CF.1070301@mind.be>
 <84EA0F7435E5F64C9B660453645DB90497AE6FBC34@DSW350.wattens.swarovski.com>
 <5140D5B4.3060903@mind.be>
 <84EA0F7435E5F64C9B660453645DB90497AE6FC15F@DSW350.wattens.swarovski.com>
 <51418446.5060808@mind.be>
Message-ID: <84EA0F7435E5F64C9B660453645DB90497AE6FC4DD@DSW350.wattens.swarovski.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

You are a piece of gold!

You are right:
  [...] $ which gcc
  /usr/bin/gcc               # OK 
  [...] $ which g++
  /usr/bin/g++               # OK
  [...] $ which cpp
  /usr/site/bin/cpp          # <- !!!!!!!!!!!!!!

This cpp is an (old) cross compiler for Motorola 68k, but it shouldn't be (with this name) at this place. I think this was an "accident" at the time when the compiler was built. I normally do not use cpp so I haven't noticed this "hiding". 

Now I have removed this wrong program, so the "normal" cpp works:
  [...] $ which cpp
  /usr/bin/cpp                # gcc version 4.4.3 (Ubuntu 4.4.3-4ubuntu5.1)

After this I started a "make clean all" of build root. Now the build has been completed!

Thank you very much for your help!


Best regards

Werner



-----Original Message-----
From: Arnout Vandecappelle [mailto:arnout at mind.be] 
Sent: Thursday, March 14, 2013 9:03 AM
To: Spielmann Werner
Cc: buildroot@busybox.net
Subject: Re: [Buildroot] Problem with buildroot-2013.02 - ncurses

On 03/14/13 08:15, Spielmann Werner wrote:
> Good morning Arnout,
> 
> Thanks again for your answer!
> 
> Both the /usr/include/termios.h and /usr/include/termio.h files exist (and are also readable):
> 
> $ ll /usr/include/termios.h
> -rw-r--r-- 1 root root 3611 2012-11-15 23:20 /usr/include/termios.h
> 
> $ ll  /usr/include/termio.h
> -rw-r--r-- 1 root root 214 2012-11-15 23:20 /usr/include/termio.h
> 
> I made an md5sum cross check with another installation. It gave the identical results on both PCs.
> 
>> Can you pastebin the config.log file?
> 
> I think you mean the "host-ncurses-5.9/config.log"?
> Here you can find buildroot-2013.02/output/build/host-ncurses-5.9/config.log:
> http://pastebin.com/nuZby0hi

 Probably unrelated, but I noticed this:

configure:14244: checking if external errno exists
configure:14266: /usr/bin/gcc -o conftest -O2 -I/home/spiewe/svnws/buildroot-2013.02/output/host/usr/include  --param max-inline-insns-single=1200 -I/home/spiewe/svnws/buildroot-2013.02/output/host/usr/include -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64  -DNDEBUG -L/home/spiewe/svnws/buildroot-2013.02/output/host/lib -L/home/spiewe/svnws/buildroot-2013.02/output/host/usr/lib -Wl,-rpath,/home/spiewe/svnws/buildroot-2013.02/output/host/usr/lib conftest.c  >&5
collect2: ld terminated with signal 11 [Segmentation fault]
/usr/bin/ld: configure:14269: $? = 1
configure: failed program was:
#line 14251 "configure"
#include "confdefs.h"

#undef errno
extern int errno;

int
main ()
{
errno = 2
  ;
  return 0;
}
configure:14286: result: no


 ld shouldn't segfault on something like that...



 But where it really goes wrong is here:

configure:14734: checking for termio.h
configure:14744: /usr/site/bin/cpp -I/home/spiewe/svnws/buildroot-2013.02/output/host/usr/include -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64  -DNDEBUG conftest.c
configure:14741: termio.h: No such file or directory
configure:14750: $? = 1
configure: failed program was:
#line 14740 "configure"
#include "confdefs.h"
#include <termio.h>
configure:14769: result: no

 It looks like /usr/site/bin/cpp doesn't look in /usr/include. 
Why do you have a non-standard cpp anyway?


 Regards,
 Arnout


> 
> As far as I can see there is in line 1139 an "#ifdef HAVE_TERMIOS_H" and in line 1143 an "#ifdef HAVE_TERMIO_H" construct but there are no equivalent defines.
> 
> What does this mean?
>   
> Best regards
> 
> Werner
> 
> 
> -----Original Message-----
> From: Arnout Vandecappelle [mailto:arnout at mind.be]
> Sent: Wednesday, March 13, 2013 8:38 PM
> To: Spielmann Werner
> Cc: Thomas Petazzoni; buildroot at busybox.net
> Subject: Re: [Buildroot] Problem with buildroot-2013.02 - ncurses
> 
> On 03/13/13 09:47, Spielmann Werner wrote:
>> I'm using Ubuntu 10.04 LTS Server.
>>
>> You can find the output of the preprocessed code 
>> here:http://pastebin.com/XnT1wzLK
> 
>    OK, so neither HAVE_TERMIOS_H nor HAVE_TERMIO_H is defined by configure, while both should exist on an Ubuntu system with libc6-dev (and I think you need libc6-dev to build kconfig, so you must have it).
> 
>    Can you do a sanity check that /usr/include/termios.h exists? If it doesn't, your Ubuntu installation is broken. If it does, then something is going wrong in the configure script. Can you pastebin the config.log file?
> 
>    Regards,
>    Arnout
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
