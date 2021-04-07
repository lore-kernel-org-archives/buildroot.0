From: Arthur Lambert <lambertarthur22@gmail.com>
Date: Wed, 7 Apr 2021 11:01:59 +0200
Subject: [Buildroot] issue with timer_create and openblas after update
 buildroot from 2019_02 to 2021_02
Message-ID: <CAGpqJgqZBG5qMZDaS59syis2y1rm53f1KMWYzJKiwepHcJbadA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to update buildroot from 2019_02 tag to 2021_02. After the
update I have
some issue with timer_create function  from uclibc . I get -1 return error
with  EAGAIN errno.
The error only occurred with SIGEV_THREAD type.

I was able to track the code responsible from the error without
understanding the reason

output/build/uclibc-1.0.37/libpthread/nptl/sysdeps/unix/sysv/linux/timer_create.c
line-150

>>     {
>>     /* Create the helper thread.  */
>>     pthread_once (&__helper_once, __start_helper_thread);
>>     if (__helper_tid == 0)
>> {
>>  /* No resources to start the helper thread.  */
>>  __set_errno (EAGAIN);
>>  return -1;
>> }

I am was also able to reproduce the issue with a minimalist piece of code.
The issue seems
to be related to openblas. I dont see the link between BLAS and
thread/timer issue ??

>> #include <stdlib.h>
>> #include <unistd.h>
>> #include <stdio.h>
>> #include <signal.h>
>> #include <time.h>
>>
>>
>> int main(void)
>> {
>>
>> struct sigevent alarm_sigevt;
>> timer_t alarm_timer;
>> int ret = 0;
>>
>> alarm_sigevt.sigev_notify = SIGEV_THREAD;
>> alarm_sigevt.sigev_notify_function = NULL;
>> alarm_sigevt.sigev_notify_attributes = NULL;
>> alarm_sigevt.sigev_value.sival_ptr =  NULL;
>> ret = timer_create(CLOCK_REALTIME, &alarm_sigevt, &alarm_timer);
>> printf ("ret : %d\n", ret);
>>
>> exit(EXIT_SUCCESS);
>> }

I compile the code like this :

/home/arthur/work/buildroot/atto_dreem3_dev/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
test_timer.c -o test_timer

I run the binary on my arm target :

# ./test_timer
ret : 0
#

Everything is working fine here.
I just add openblas library now :

/home/arthur/work/buildroot/atto_dreem3_dev/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
test_timer.c -o test_timer -lopenblas

I now run the new binary :

# ./test_timer
ret : -1

An issue with openblas which init too many timer ?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210407/9f6f31fe/attachment.html>
