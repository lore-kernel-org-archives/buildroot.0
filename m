From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Sep 2020 23:23:22 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-09-10
In-Reply-To: <5136b645-f8c9-36f5-5dbc-eeba060cba30@heine.tech>
References: <20200911070826.658B8868D9@whitealder.osuosl.org>
 <38c1b78d-82f6-2d50-a60f-eb6a161d22f8@heine.tech>
 <20200911101547.77832bc9@windsurf.hq.k.grp>
 <20200911122734.GY14354@scaer>
 <1f704b79-d506-698e-38c3-8d4ee1146802@heine.tech>
 <20200911142131.GA10548@scaer>
 <5136b645-f8c9-36f5-5dbc-eeba060cba30@heine.tech>
Message-ID: <20200911212322.GC10548@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Micheal, All,

On 2020-09-11 23:12 +0200, Michael Nosthoff spake thusly:
> >>>>>On 11.09.2020 09:08, Thomas Petazzoni wrote:
> >>>>>>   mips64el   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/b554f6f2fb66892273f7520ad6e36923557b229e |
[--SNIP--]
> I did some further testing using a fresh docker container `ubuntu:trusty`.
> I derived a simple test which mirrors the failing code in [1].
> If you compile this code using `g++ --std=c++11 main.cpp -lpthread -o
> thread_test`
> 
> ```
> #include <thread>
> #include <cassert>
> 
> main() {
> ? ??? std::thread::id runner;
> ??? auto me = std::this_thread::get_id();
> 
> ??? assert(runner != me);
> }
> ```
> 
> running the resulting program will throw the assert. Doing the identical
> thing in a `debian:jessie` container with g++-4.8 will finish successfully.
> 
> What's happening in this code? When pthreads is not linked glibc's
> implementation of std::thread::id is used.
> But this has a bug that it can't differentiate between a default initialized
> id and the result of the get_id() call when you have no threading.
> This is addressed in [0] which lead to a fix in gcc-6.
> 
> But we are linking with -lpthread. So this bug should not affect us. So when
> I try to actually create a thread like
> 
> ```
> std::thread worker([](){});
> ```
> 
> I get a crash when running the program. Which proves that pthread is not
> actually linkend. Doing the same on debian yields a working program.
> Even when I compile the program on debian and copy it to ubuntu the program
> runs successfully. So it is not a runtime thing.
> 
> When I change the compiler flag to -pthread I suddenly get a working program
> on ubuntu.

Whoa! Great investigation! ?

> This brings me to two possible solutions:
> 
> - find out why in ubuntu:trusty -lpthread is not working

Is it a bug in gcc-4.8 that is not fixed in Ubuntu but is in Debian? Or
is it a patch that Ubuntu applies that Debian does not?

> - ensure that protobuf uses -pthread instead of -lpthread (i have to check
> what is cmake decides to use on other compilers).
> 
> I'll check this next week.

Thanks! This is really very much appreciated! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
