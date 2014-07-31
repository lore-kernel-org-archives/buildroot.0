From: prafullakota <prafulla.fin@gmail.com>
Date: Wed, 30 Jul 2014 23:30:55 -0700 (PDT)
Subject: [Buildroot] backtrace() not working on ARMv7a
Message-ID: <1406788255956-76350.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to generate a call stack trace using backtrace() API which is
part of libbacktrace. The idea is to catch a SIGSEGV signal and call
backtrace() to print all the address values and compare the obtained
addresses from objdump -D of executable. Following is the output seen on
ARMv7a platform with buildroot cross-toolchain (gcc- 4.8.2, binutis-2.18.1).

To compile the application:
${CROSS_COMPILE}gcc -o crash_test -O0 -funwind-tables -rdynamic crash_test.c

ARMv7a# ./crash_test
Trying to access NULL pointer!
SIGSEGV Handler!
Got Backtrace Size=2
0x00008724
0x000087c4
ARMv7a#

The above function call trace is only that of the signal hander
(print_back_trace, sigsegv_handler) and does not show the entire call stack
for the function where program crashed (print_back_trace, sigsegv_handler,
func2, main).

On x86 host same program shows a deeper function call trace right up to the
main function and even beyond:
x86-RHEL5-host$./crash_test
Trying to access NULL pointer!
SIGSEGV Handler!
Got Backtrace Size=7
0x00400939
0x004009ab
0x30930302f0
0x004009d3
0x00400a7b
0x309301d994
0x00400889
x86-RHEL5-host$

Can someone please comment on what is going wrong. Any special flags that
need to be used while compiling/linking the program.

For other issues like NULL pointer access or invalid memory access,
backtrace is working fine in glibc but not for below type of issues.

void func1() {
  int    val;
  char buf[256];
  val = 100;
  printf("\nTrying to construct invalid buffer!\n");
  snprintf(buf, sizeof (buf), "%s", val);
  printf("The content of buf: %s\n", buf);

}

For above issue uclibc forum has given fix in below link
http://lists.uclibc.org/pipermail/uclibc/2013-September/047932.html

Similar issue in uclibc was solved by creating a patch to uclibc files, can
some one let me know if there is any existing patch is available for glibc
similar to this?, if not can anyone help me in providing the similar patch
for glibc.

Please let me know if i can provide any info.

/Thanks
Prafulla

-------------code------------------------------
#include <termios.h>
#include <unistd.h>
#include <stdlib.h>
#include <pthread.h>
#include <signal.h>
#include <stdio.h>
#include <string.h>

void print_back_trace() {
  void *array[32];
  int index, size;

  size = backtrace (array, 32);
  printf("Got Backtrace Size=%d\n", size);
  for (index = 0; index < size; index++)
  {
    printf ("0x%08lx\n", (unsigned long) array[index]);
  }
}

static void sigsegv_handler (int sig, siginfo_t * info, void *v)
{
  printf("SIGSEGV Handler!\n");
  print_back_trace();
  exit (0);
}

void func2() {
   int val;
   unsigned int *ptr;
   ptr = 0;
   printf("Trying to access NULL pointer!\n");
   val = *ptr;
   printf ("Read 0x%x from %p\n", val, ptr);
}

void func1() {
  int    val;
  char buf[256];
  val = 100;
  printf("\nTrying to construct invalid buffer!\n");
  snprintf(buf, sizeof (buf), "%s", val);
  printf("The content of buf: %s\n", buf);

}

int main()
{
  struct sigaction sig_act;
  int    rc;

  sig_act.sa_sigaction = sigsegv_handler;
  rc = sigaction (SIGSEGV, &sig_act, 0);

  func1(); 
  return 0;
}




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/backtrace-not-working-on-ARMv7a-tp76350.html
Sent from the Buildroot (busybox) mailing list archive@Nabble.com.
