From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Nov 2014 12:55:04 +0000 (UTC)
Subject: [Buildroot] [Bug 7646] New: strftime on datetime not works on
	python3.
Message-ID: <bug-7646-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7646

           Summary: strftime on datetime not works on python3.
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: beyonlo at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I set python3 to compile in buildroot and the strftime not works:


# uname -a
Linux buildroot 3.13.5 #1 Wed Nov 12 09:42:52 BRST 2014 armv5tejl GNU/Linux
# python3
Python 3.4.1 (default, Nov 12 2014, 09:22:50) 
[GCC 4.4.5] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> from datetime import datetime
>>> datetime.now().strftime("%Y-%m-%d %H:%M:%S")
''
>>> 

As I know, strftime use locale. So I change toolchain to:
"[*] Toolchain has locale support?"

And compile buildroot again. But still not works. The same problem.

However, I tried to do a simple test in C using locale. The strftime works fine
in C.

# uname -a
Linux buildroot 3.13.5 #1 Wed Nov 12 09:42:52 BRST 2014 armv5tejl GNU/Linux
# file test2
test2: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), dynamically
linked (uses shared libs), not stripped
# ./test2 
Locale is: (null)
Locale is: (null)
Date is: Fri Sep 12 16:34:33 2014
# 

This is the c example compiled (using arm cross compile) in the host and put in
the embedded buildroot:
$ cat test2.c 
#include <locale.h>
#include <stdio.h>
#include <time.h>

int main ()
{
   time_t currtime;
   struct tm *timer;
   char buffer[80];

   time( &currtime );
   timer = localtime( &currtime );

   printf("Locale is: %s\n", setlocale(LC_ALL, "en_US"));
   printf("Locale is: %s\n", setlocale(LC_CTYPE, "en_US.UTF-8"));
   strftime(buffer,80,"%c", timer );
   printf("Date is: %s\n", buffer);

   return(0);
}

Thank you.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
