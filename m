From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Aug 2015 17:52:43 +0200
Subject: [Buildroot] Issue with host-erlang-rebar causing timeouts
In-Reply-To: <20150820233144.73d974c9@free-electrons.com>
References: <20150521212150.3f39f1c1@free-electrons.com>
 <20150521214726.19fc73fa@free-electrons.com>
 <20150521220438.624c6697@free-electrons.com> <55663493.1040500@mind.be>
 <20150819230251.6aaa54e2@free-electrons.com>
 <20150820233144.73d974c9@free-electrons.com>
Message-ID: <55D7494B.4040404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/20/15 23:31, Thomas Petazzoni wrote:
> Arnout, Johan,
> 
> On Wed, 19 Aug 2015 23:02:51 +0200, Thomas Petazzoni wrote:
> 
>>>  Have you tried running it within the timeout? Maybe that one is doing SIGSTOP
>>> or ptrace() for some reason...
>>
>> I haven't tried running without the timeout, but I've tried to do a
>> manual build of host-relang-rebar *under* timeout, and it worked just
>> fine.
> 
> FWIW, the "timeout" seems to no longer be able to detect/interrupt the
> host-erlang-rebar build. The four autobuild jobs on gcc75 are stuck
> since several weeks on gcc75, blocking any other build. Here is the
> current process tree (look at the date of the processes) :
> 
> thomas    1474  0.0  0.0  56780  4056 pts/7    S+   Jul09   0:00  |   \_ python ../buildroot-test/scripts/autobuild-run -c autobuild-run.conf
> thomas    1478  0.0  0.0  58680  7044 pts/7    S+   Jul09   0:51  |       \_ python ../buildroot-test/scripts/autobuild-run -c autobuild-run.conf
> thomas    1755  0.0  0.0   8496   804 pts/7    S    Aug06   0:00  |       |   \_ timeout 28800 make O=/ssd1/thomas/autobuild/instance-0/output -C instance-0/buildroot BR2_DL_
> thomas    1756  0.0  0.4  85192 78400 pts/7    T    Aug06   0:14  |       |       \_ make O=/ssd1/thomas/autobuild/instance-0/output -C instance-0/buildroot BR2_DL_DIR=/ssd1/

 timeout isn't called with the -k option, so it'll just send SIGTERM and then
try to reap its child. Since the child never exits because it is STOPped,
timeout itself waits indefinitely. Does the make process exit if you send it a
SIGKILL? (I think there's a difference between how STOPped and ptrace'd process
behave in that respect.)


> thomas   11478  0.0  0.0      0     0 pts/7    Z    Aug06   0:00  |       |           \_ [bash] <defunct>

[snip]

> The log files of the four instances indicate they are blocked
> running ./bootstrap as part of host-erlang-rebar build process.

 Or whatever bootstrap is running without generating output...

> 
> Also, I have no idea if it's related, but in a different part of the
> process tree, I have:
> 
[snip]
> thomas   11479  0.0  0.0   6640  1836 pts/7    T    Aug06   0:00 /usr/bin/make -j4
> thomas   11480  0.0  0.0      0     0 pts/7    Z    Aug06   0:00  \_ [beam.smp] <defunct>

 It can't be a coincidence that PID 11479 is exactly one higher than bash 11478,
so I guess the bash is the shell from HOST_ERLANG_REBAR_BUILD_CMDS and the make
is the corresponding $(HOST_MAKE_ENV) $(MAKE). But bash itself has already
exited. Probably it did get killed by timeout, but its child make didn't so that
one got desinherited.

 And then the make does just one thing: it calls bootstrap, which also has
exited already. The beam.smp process is indeed the erlang runtime of the
bootstrap script (I checked with an actual host-erlang-rebar build). I have no
idea why bootstrap has exited before actually building. Its output should also
keep coming out even if the parent make gets STOPped.

 The other weird thing is that _both_ make processes that were active at the
time get STOPped. It looks as if this bootstrap script is doing a STOP on all
its parent processes called 'make' before starting the actual compilation...
Which seems highly unlikely and an strace on the thing also doesn't show that...


 I still suspect that there must be some weird interaction with timeout. Perhaps
you can just disable the timeout on that build server and see if it still happens?


 Regards,
 Arnout


> thomas    3943  0.0  0.0   6640  1868 pts/7    T    Aug07   0:00 /usr/bin/make -j4
> thomas    3944  0.0  0.0      0     0 pts/7    Z    Aug07   0:00  \_ [beam.smp] <defunct>
> 
> The date of these processes are the same as the blocked sub-processes
> of the autobuilder script.
> https://www.reddit.com/r/Ubuntu/comments/caae8/what_the_hell_is_beamsmb/
> says: "It's the Erlang runtime, which is running couchdb under the
> guise of desktopcouch. CouchDB is a schemaless database system, which
> typically runs globally and has no authentication. Ubuntu adds a layer
> of authentication and runs it on an arbitrary port.".
> 
> Thomas
> 

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
