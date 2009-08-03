From: bbj17 at gmx.de <bbj17@gmx.de>
Date: Mon, 03 Aug 2009 17:17:49 +0200
Subject: [Buildroot] float, va_arg, printf on x86_64
Message-ID: <20090803151749.224000@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I use buildroot-2009.08-rc1 and want to build a small system for a 64-Bit system.
I build my version with the following settings: 
Target architecture = x86_64
kernel type = advanced
kernel version = 2.6.30.2

The target image boots fine and everything is working, except the output of float values:

(printf - busyboy) => printf %f 7 => 0.000000
(printf - ash) => printf %f 7 => -2681561585988519419770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

(tcl format) => format %f 7 => 0.000000

Only perl-printf works right.
Can anyone explain this behaviour?

PS: same with buildroot-2009.05

c-code example:

#include <fcntl.h>
#include <stdio.h>
#include <termios.h>
#include <unistd.h>
#include <stdarg.h>


void my(int param1, ...) {
     double f;
     va_list argptr;

    va_start( argptr, param1 );
      f = va_arg( argptr, double );
      va_end( argptr );

      if (f==4.2) {
      printf("YES #2\n");
    }

    printf("my -> %.2f \n", f);

}

int main(int argc, char *argv[]) {

  float f3;
  f3 = 4.2f;

  printf("%d\n", (int)f3);
  if (f3==4.2f) {
        printf("YES %2.2f\n",f3);
  }

  my(3,f3);
  return 0;

}


correct output (opensuse 10.2):
./a.out
4
YES 4.20
my -> 4.20

incorrect output (BR-2009.08-rc1):
./testprintf
4
YES 0.00
my -> 0.00

If the target architecture is 32-Bit everything is OK!

Regards BC

-- 
GRATIS f?r alle GMX-Mitglieder: Die maxdome Movie-FLAT!
Jetzt freischalten unter http://portal.gmx.net/de/go/maxdome01
