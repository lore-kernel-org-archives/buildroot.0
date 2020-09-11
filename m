From: Michael Nosthoff <buildroot@heine.tech>
Date: Fri, 11 Sep 2020 23:12:33 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-09-10
In-Reply-To: <20200911142131.GA10548@scaer>
References: <20200911070826.658B8868D9@whitealder.osuosl.org>
 <38c1b78d-82f6-2d50-a60f-eb6a161d22f8@heine.tech>
 <20200911101547.77832bc9@windsurf.hq.k.grp> <20200911122734.GY14354@scaer>
 <1f704b79-d506-698e-38c3-8d4ee1146802@heine.tech>
 <20200911142131.GA10548@scaer>
Message-ID: <5136b645-f8c9-36f5-5dbc-eeba060cba30@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 11.09.20 16:21, Yann E. MORIN wrote:
> Michael, All,
>
> On 2020-09-11 15:18 +0200, Michael Nosthoff spake thusly:
>> On 11.09.2020 14:27, Yann E. MORIN wrote:
>>> Michael, All,
>>>
>>> On 2020-09-11 10:15 +0200, Thomas Petazzoni spake thusly:
>>>> On Fri, 11 Sep 2020 09:29:20 +0200
>>>> Michael Nosthoff <buildroot@heine.tech> wrote:
>>>>> On 11.09.2020 09:08, Thomas Petazzoni wrote:
>>>>>>    mips64el   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/b554f6f2fb66892273f7520ad6e36923557b229e |
>>> Thanks for looking into this. Here's a simple way to reproduce:
>>>      $ curl https://pastebin.com/raw/JMe512Pt >foo/Dockerfile
>> Thanks for the Dockerfile.
>> Wouldn't it make sense to include the used Dockerfile with the autobuild
>> results?
> Because the autobuilders do not (all) run in docker.
>
> For example, my autobuilder (on which the host-grpc build issue happens)
> is not running in docker, so there is no Dockerfile that created it. It
> was manually created in November 2015 with debbootstrap.
>
> The Dockerfile I provided was made after the fact, a few months ago,
> last May.
Ah okay, I though this was all run in a docker container. I saw there is 
a patch to dump os-release, that's a start.
>
>> Concerning the host-grpc issue:
>>
>> With the Dockerfile I was able to reproduce the issue.
>> In comparison on a debian jessie with gcc 4.8.5 this problem does not occur.
>>
>>  From what I found on the protobuf issue tracker this seems to be an
>> issue which hits people pretty randomly even with newer (mostly clang)
>> compilers:
>>
>> https://github.com/protocolbuffers/protobuf/issues/6074
> Yeah, I had already found those issues bacj when I was investigating:
>
>      https://github.com/protocolbuffers/protobuf/issues/5353
>      https://github.com/protocolbuffers/protobuf/issues/5923
>
> And also:
>
>      https://github.com/grpc/grpc/issues/22781

Thanks for the links!

>
>> So currently I have no real idea how to fix this...
> I also already spent quite some time investigating this issue, and I
> have no clue...
I did some further testing using a fresh docker container `ubuntu:trusty`.
I derived a simple test which mirrors the failing code in [1].
If you compile this code using `g++ --std=c++11 main.cpp -lpthread -o 
thread_test`


```
#include <thread>
#include <cassert>

main() {
 ? ??? std::thread::id runner;
 ??? auto me = std::this_thread::get_id();

 ??? assert(runner != me);
}
```

running the resulting program will throw the assert. Doing the identical 
thing in a `debian:jessie` container with g++-4.8 will finish successfully.

What's happening in this code? When pthreads is not linked glibc's 
implementation of std::thread::id is used.
But this has a bug that it can't differentiate between a default 
initialized id and the result of the get_id() call when you have no 
threading.
This is addressed in [0] which lead to a fix in gcc-6.

But we are linking with -lpthread. So this bug should not affect us. So 
when I try to actually create a thread like

```
std::thread worker([](){});
```

I get a crash when running the program. Which proves that pthread is not 
actually linkend. Doing the same on debian yields a working program.
Even when I compile the program on debian and copy it to ubuntu the 
program runs successfully. So it is not a runtime thing.

When I change the compiler flag to -pthread I suddenly get a working 
program on ubuntu.

This brings me to two possible solutions:

- find out why in ubuntu:trusty -lpthread is not working
- ensure that protobuf uses -pthread instead of -lpthread (i have to 
check what is cmake decides to use on other compilers).

I'll check this next week.

Regards,
Michael

[0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57060
[1] 
https://github.com/protocolbuffers/protobuf/blob/master/src/google/protobuf/generated_message_util.cc#L796
