From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Apr 2020 11:18:44 +0200
Subject: [Buildroot] date command
In-Reply-To: <2047d0f5.f3a.1710a050334.Coremail.mail_hysong@163.com> (shy's
 message of "Tue, 24 Mar 2020 08:50:32 +0800 (CST)")
References: <589197dd.b0b7.17107dc905e.Coremail.mail_hysong@163.com>
 <20200323180549.6ccd2738@gmx.net>
 <2047d0f5.f3a.1710a050334.Coremail.mail_hysong@163.com>
Message-ID: <87a73ub5zf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "shy" == shy  <mail_hysong@163.com> writes:

 > Hi all:
 > I test in buildroot and ubuntu, it all can't set time "1970-01-01 00:00:00", there is error message "date: can't set date: Invalid argument".
 > I don't know why and how to solve the problem. It's UTC time and no timezone.


 > 1. I use buildroot-2013.05, the busybox is in 1.21.1, the linux kernel is in version 4.4.39.


 > # date -s "1970-01-20 00:00:00"
 > Tue Jan 20 00:00:00 UTC 1970
 > # date -R
 > Tue, 20 Jan 1970 00:00:03 +0000
 > # date -s "1970-01-01 00:00:00"
 > date: can't set date: Invalid argument
 > Thu Jan  1 00:00:00 UTC 1970

 > 2. I test in ubuntu version 14.04.1.
 > shy at ubuntu:/etc$ sudo date -s "2020-03-01 00:00:00"
 > Sun Mar  1 00:00:00 UTC 2020
 > shy at ubuntu:/etc$ date -R
 > Sun, 01 Mar 2020 00:00:03 +0000

 > shy at ubuntu:/etc$ sudo date -s "1970-01-01 00:00:00"

 > date: cannot set date: Invalid argument

 > Thu Jan  1 00:00:00 UTC 1970

 > shy at ubuntu:/etc$ uname -a

 > Linux ubuntu 4.4.0-142-generic #168~14.04.1-Ubuntu SMP Sat Jan 19 11:26:28 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

This looks to be a kernel regression, presumably introduced by the year
2038 work.

Specifically, it seems to reject settimeofday with a tv_sec value less
than 1171500:

# strace -e settimeofday date -s '1970-01-14 13:24'
settimeofday({tv_sec=1171440, tv_usec=0}, NULL) = -1 EINVAL (Invalid argument)
date: can't set date: Invalid argument

# strace -e settimeofday date -s '1970-01-14 13:25'
settimeofday({tv_sec=1171500, tv_usec=0}, NULL) = 0
Wed Jan 14 13:25:00 UTC 1970

(here on 5.4.18).


On an ancient 2.6.37 kernel it does work:

strace -e settimeofday date -s '1970-01-14 13:24'
settimeofday({tv_sec=1171440, tv_usec=0}, NULL) = 0
Wed Jan 14 13:24:00 UTC 1970
+++ exited with 0 +++
uname -r
2.6.37.6

Arnd, any ideas?

-- 
Bye, Peter Korsgaard
