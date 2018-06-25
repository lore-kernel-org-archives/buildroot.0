From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 25 Jun 2018 14:13:24 -0700
Subject: [Buildroot] [PATCH] gcc: fix uclibc build with gcc-8 for xtensa
In-Reply-To: <eaba9b03-f0b0-b972-68ff-034a78d9048a@gmail.com>
References: <20180619202706.17347-1-jcmvbkbc@gmail.com>
 <eaba9b03-f0b0-b972-68ff-034a78d9048a@gmail.com>
Message-ID: <CAMo8Bf+xjVGfX2+9R0KK3Fr7P471e_-+e25Xk_8snZuTqtiUkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Mon, Jun 25, 2018 at 1:50 PM, Romain Naour <romain.naour@gmail.com> wrote:
> Do you know what changed in gcc 8.0 that trigger this issue ?

No. My guess is that it's something innocent that tweaks instruction stream
in some of the optimization passes.

> I tried to use git bisect to find the culprit commit, the last working gcc
> commit is 5266910fed23d6d7f101a878dd8a28d178697ec5 (2017-06-28) and this "first"
> broken commit is 7051d2393d15d0d1b848768a6f2767c75aa4b5cd (2017-07-06) but I
> gave up due to lack of time...

I used the following check to drive creduce to minimize the testcase,
I guess it may be reused for gcc bisection:

--->8---
grep -B 10 movsp < ldso.s > tmp
sed -ne '/add.*, sp,/,/movsp/p' < tmp > tmp1
while : ; do
        read cmd reg1 reg2
        SR=$reg1
        while read cmd reg1 reg2 reg3 ; do
                if [ "$cmd" = "movsp" ] ; then break ; fi
                if [ "$cmd" = "s32i" -o "$cmd" = "s32i.n" ] && [ $SR =
$reg2 ] ; then exit 0 ; fi
        done
done < tmp1
exit 1
---8<---

I didn't do it because it was easier to just debug the libc startup.

-- 
Thanks.
-- Max
