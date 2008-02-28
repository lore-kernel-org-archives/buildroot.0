From: Nicola Salvemini <nicolasalvemini@yahoo.it>
Date: Thu, 28 Feb 2008 16:28:13 +0000 (GMT)
Subject: [Buildroot] Problem with iperf
Message-ID: <413341.40400.qm@web23414.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes,
I tried to select option "Use software floating point by default" from buildroot configuration menu, but I have some compilation problems:

/home/user/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin/ld: ERROR: libgcc/./_udivsi3_s.o uses hardware FP, whereas ./libgcc_s.so.1.tmp uses software FP
/home/user/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin/ld: failed to merge target specific data of file libgcc/./_udivsi3_s.o
/home/user/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin/ld: ERROR: libgcc/./_divsi3_s.o uses hardware FP, whereas ./libgcc_s.so.1.tmp uses software FP
/home/user/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin/ld: failed to merge target specific data of file libgcc/./_divsi3_s.o

....

etcetera...

Best regards,
Nicola.


----- Messaggio originale -----
Da: Rex Ashbaugh <rexa@xeratech.com>
A: Nicola Salvemini <nicolasalvemini@yahoo.it>
Cc: buildroot at uclibc.org
Inviato: Gioved? 28 febbraio 2008, 16:33:19
Oggetto: Re: [Buildroot] Problem with iperf

Also, check how your cross compiler is configured for floating point handling..

http://www.arm.linux.org.uk/mailinglists/faq.php

3. I feel really confused about what's the difference with gcc

          soft-float support and the kernel NWFPE/FastFPE support?
          [31 January 2004 - np]
          Scenario 1 (hard-float): The compiler emits opcodes designed to
          be  used  with a hardware floating point coprocessor (FPU). The

          FPU  usually  has a set of extra registers for its use, and the
          compiler  may as well pass floating point argument to functions
          through  those registers. This is of course the best performing

          solution when a real hardware FPU is used.

          Scenario  2  (soft-float): the compiler converts floating point
          operations into function calls and a special library is used to
          provide  all  functions performing the required operations, all

          in software with no FPU instructions at all. There is obviously
          no  extra  floating  point  registers  available  in this case,
          therefore  all  FP  arguments  to  functions  have to be passed

          through  standard  registers or on the stack. This is of course
          the best performing solution when no hardware FPU is available,
          given  that  the  library  implementing  the  FP  operations is

          optimally coded.

          Now,  unfortunately, the default on ARM Linux has traditionally
          been set to have the compiler use hard-float, even if ARM Linux
          never  ran  on any ARM CPU with a real hardware FPU. The CPU is

          therefore  raising  the invalid instruction exception each time
          some  FPU  opcode  is  encountered.  Then the kernel traps that
          exception,  looks  at the given FPU instruction and emulates it

          in  software.  But here not only the kernel must perform the FP
          operation,  it  must  emulates  the whole hardware FPU as well.
          That's  what  NWFPE or FastFPE are doing. This is obviously the

          worst  performing  arrangement that can be due to the exception
          trap and emulation overhead

On 2/28/08, Nicola Salvemini <nicolasalvemini@yahoo.it> wrote:
Hi Rex,

Yes I tried with the previous version (2.0.1) of iperf, bat I had same results. 

I'm waiting for a replay from iperf maintainer.
Best regards,

Nicola.

----- Messaggio originale -----

Da: Rex Ashbaugh <rexa@xeratech.com>
A: Nicola Salvemini <nicolasalvemini@yahoo.it>

Cc: buildroot at uclibc.org
Inviato: Mercoled? 27 febbraio 2008, 16:52:03
Oggetto: Re: [Buildroot] Problem with iperf



NWFPE is the floating point emulator.


00000002 is a floating point divide-by-zero.

try another version of iperf maybe? 
report this problem to the iperf maintainer?
-Rex


On 2/27/08, Nicola Salvemini <nicolasalvemini@yahoo.it> wrote:

Hi all,
 
 I have a ARM arm926t (it's a little-endian) target platform and I use buildroot to cross-compile applications.
 I include iperf in the package selection for the target and the build phase go to the end without problems, but when I try to use iperf on the target, I take an exception:


 
 NWFPE: iperf[770] takes exception 00000002 at c00288f0 from 400f4580
 NWFPE: iperf[770] takes exception 00000002 at c00288f0 from 400f4580
 NWFPE: iperf[770] takes exception 00000002 at c00288f0 from 400f4580


 
 Could you please give me an idea to resolve the problem?
 Thanks in advance,
 

 Nicola.
 

 
 
 
      ___________________________________
 L'email della prossima generazione? Puoi averla con la nuova Yahoo! Mail: http://it.docs.yahoo.com/nowyoucan.html


 
 _______________________________________________
 buildroot mailing list
 buildroot at uclibc.org

 http://busybox.net/mailman/listinfo/buildroot

 












      L'email della prossima generazione? Puoi averla con la nuova Yahoo! Mail










      ___________________________________ 
L'email della prossima generazione? Puoi averla con la nuova Yahoo! Mail: http://it.docs.yahoo.com/nowyoucan.html
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080228/a786832e/attachment-0001.htm 
