From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 30 Apr 2018 22:21:35 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-04-28
In-Reply-To: <20180429060019.11112209D4@mail.bootlin.com>
References: <20180429060019.11112209D4@mail.bootlin.com>
Message-ID: <20180430222135.7aee3a71@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Apr 2018 08:00:19 +0200 (CEST), Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Results for branch 'master'
> ===========================
[...]   
>          arm |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/a58007263355e2734a8074d52b1b26b88973c39e |     
>         m68k |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/7d6fd0872efd23c7de552ab637956902b43c3f58 |     


A problem with the log4cplus configure time detection of clock_nanosleep() and later compile
failure with the used toolchain br-arm-cortex-m4-full-2018.02-891-g046c5e2.tar.bz2:

  sleep.cxx: In function 'int log4cplus::helpers::unix_nanosleep(const timespec*, timespec*)':
  sleep.cxx:55:56: error: 'clock_nanosleep' was not declared in this scope
       return clock_nanosleep (CLOCK_REALTIME, 0, req, rem);


The clock_nanosleep() configure detections uses the following:

	$ cat test_clock_nanosleep_002.cxx

  extern "C" char clock_nanosleep ();

  int main(int argc, char* argv[]) {
  	return clock_nanosleep();
  }


	$ ./host/usr/bin/arm-linux-g++ test_clock_nanosleep_002.cxx

...and compiles without errors, because libc.a defines clock_nanosleep:

	$ nm -A staging/usr/lib/*.a | grep clock_nano
  staging/usr/lib/libc.a:clock_nanosleep.o:00000000 T clock_nanosleep


But the definition in the staging/usr/include/time.h header file is disabled:

  334 #  if defined __USE_XOPEN2K && defined __UCLIBC_HAS_ADVANCED_REALTIME__
  335 #   ifdef __UCLIBC_HAS_THREADS_NATIVE__
  336 /* High-resolution sleep with the specified clock.
  337 
  338    This function is a cancellation point and therefore not marked with
  339    __THROW.  */
  340 extern int clock_nanosleep (clockid_t __clock_id, int __flags,
  341                             const struct timespec *__req,
  342                             struct timespec *__rem);
  343 


I think because __UCLIBC_HAS_THREADS_NATIVE__ is not defined...

Maybe it is possible to overwrite the check via ac_cv_search_clock_nanosleep, but not sure
which are the right conditions for this...

Regards,
Peter
