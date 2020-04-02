From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Apr 2020 13:33:01 +0200
Subject: [Buildroot] date command
In-Reply-To: <CAK8P3a1KX2Ln5zw=q0-eYLFz1vYL-UGOAA0N=SUFB3jCV1uDVA@mail.gmail.com>
 (Arnd Bergmann's message of "Thu, 2 Apr 2020 11:55:37 +0200")
References: <589197dd.b0b7.17107dc905e.Coremail.mail_hysong@163.com>
 <20200323180549.6ccd2738@gmx.net>
 <2047d0f5.f3a.1710a050334.Coremail.mail_hysong@163.com>
 <87a73ub5zf.fsf@dell.be.48ers.dk>
 <CAK8P3a1KX2Ln5zw=q0-eYLFz1vYL-UGOAA0N=SUFB3jCV1uDVA@mail.gmail.com>
Message-ID: <87369mazrm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnd" == Arnd Bergmann <arnd@arndb.de> writes:

Hi,

 >> > Linux ubuntu 4.4.0-142-generic #168~14.04.1-Ubuntu SMP Sat Jan 19 11:26:28 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
 >> 
 >> This looks to be a kernel regression, presumably introduced by the year
 >> 2038 work.
 >> 
 >> Specifically, it seems to reject settimeofday with a tv_sec value less
 >> than 1171500:
 >> 
 >> # strace -e settimeofday date -s '1970-01-14 13:24'
 >> settimeofday({tv_sec=1171440, tv_usec=0}, NULL) = -1 EINVAL (Invalid argument)
 >> date: can't set date: Invalid argument
 >> 
 >> # strace -e settimeofday date -s '1970-01-14 13:25'
 >> settimeofday({tv_sec=1171500, tv_usec=0}, NULL) = 0
 >> Wed Jan 14 13:25:00 UTC 1970
 >> 
 >> (here on 5.4.18).

 > I think this is a result of commit e1d7ba873555 ("time: Always make sure
 > wall_to_monotonic isn't positive") that enforces CLOCK_REALTIME to return a
 > number greater than CLOCK_MONOTONIC, meaning you cannot set the current
 > time to anything less than the number of seconds since booting the system.
 > This has been the case since linux-4.3, and is unrelated to the y2038 work.

Ahh yes, thanks - And sorry for pointing fingers in the wrong
direction. I did see the check, but didn't connect the dots.

-- 
Bye, Peter Korsgaard
