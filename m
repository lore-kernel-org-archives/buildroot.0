From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Aug 2017 19:06:20 +0000
Subject: [Buildroot] [Bug 10276] BR2_PACKAGE_LINUX_TOOLS_GPIO fails for MIPS
 with "gpio-hammer.o: ABI is incompatible with that of the selected
 emulation"
In-Reply-To: <bug-10276-163@https.bugs.busybox.net/>
References: <bug-10276-163@https.bugs.busybox.net/>
Message-ID: <bug-10276-163-jjhIzHDO6J@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10276

--- Comment #4 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Thomas, I can very easily reproduce the truncated file issue, and it
indeed always happen with parallel builds, but not always.

And I can even reproduce it in a native build, on Linus' linux master:

$ make -j1000
mkdir -p include/linux 2>&1 || true
ln -sf /home/ymorin/dev/linux/linux/tools/gpio/../../include/uapi/linux/gpio.h
include/linux/gpio.h
make -f /home/ymorin/dev/linux/linux/tools/build/Makefile.build dir=.
obj=lsgpio
make -f /home/ymorin/dev/linux/linux/tools/build/Makefile.build dir=.
obj=gpio-hammer
make -f /home/ymorin/dev/linux/linux/tools/build/Makefile.build dir=.
obj=gpio-event-mon
make[1]: Entering directory '/home/ymorin/dev/linux/linux/tools/gpio'
make[1]: Entering directory '/home/ymorin/dev/linux/linux/tools/gpio'
make[1]: Entering directory '/home/ymorin/dev/linux/linux/tools/gpio'
  CC       gpio-event-mon.o
  CC       lsgpio.o
  CC       gpio-hammer.o
  CC       gpio-utils.o
  CC       gpio-utils.o
  CC       gpio-utils.o
gpio-event-mon.c: In function ?monitor_device?:
gpio-event-mon.c:100:19: warning: format ?%lu? expects argument of type ?long
unsigned int?, but argument 3 has type ?__u64 {aka long long unsigned int}?
[-Wformat=]
   fprintf(stdout, "GPIO EVENT %" PRIu64 ": ", event.timestamp);
                   ^~~~~~~~~~~~~~
  LD       gpio-event-mon-in.o
gpio-utils.o: file not recognized: File truncated
/home/ymorin/dev/linux/linux/tools/build/Makefile.build:143: recipe for target
'gpio-event-mon-in.o' failed
make[1]: *** [gpio-event-mon-in.o] Error 1
make[1]: Leaving directory '/home/ymorin/dev/linux/linux/tools/gpio'
Makefile:58: recipe for target 'gpio-event-mon-in.o' failed
make: *** [gpio-event-mon-in.o] Error 2
make: *** Waiting for unfinished jobs....
  LD       lsgpio-in.o
make[1]: Leaving directory '/home/ymorin/dev/linux/linux/tools/gpio'
  LD       gpio-hammer-in.o
make[1]: Leaving directory '/home/ymorin/dev/linux/linux/tools/gpio'


Yet, you are right that there is also (and more importantly) a
problem with using ld instead of gcc.

So, there are two issues in one. ;-)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
