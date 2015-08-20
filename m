From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Aug 2015 23:31:44 +0200
Subject: [Buildroot] Issue with host-erlang-rebar causing timeouts
In-Reply-To: <20150819230251.6aaa54e2@free-electrons.com>
References: <20150521212150.3f39f1c1@free-electrons.com>
 <20150521214726.19fc73fa@free-electrons.com>
 <20150521220438.624c6697@free-electrons.com>
 <55663493.1040500@mind.be>
 <20150819230251.6aaa54e2@free-electrons.com>
Message-ID: <20150820233144.73d974c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Johan,

On Wed, 19 Aug 2015 23:02:51 +0200, Thomas Petazzoni wrote:

> >  Have you tried running it within the timeout? Maybe that one is doing SIGSTOP
> > or ptrace() for some reason...
> 
> I haven't tried running without the timeout, but I've tried to do a
> manual build of host-relang-rebar *under* timeout, and it worked just
> fine.

FWIW, the "timeout" seems to no longer be able to detect/interrupt the
host-erlang-rebar build. The four autobuild jobs on gcc75 are stuck
since several weeks on gcc75, blocking any other build. Here is the
current process tree (look at the date of the processes) :

thomas    1474  0.0  0.0  56780  4056 pts/7    S+   Jul09   0:00  |   \_ python ../buildroot-test/scripts/autobuild-run -c autobuild-run.conf
thomas    1478  0.0  0.0  58680  7044 pts/7    S+   Jul09   0:51  |       \_ python ../buildroot-test/scripts/autobuild-run -c autobuild-run.conf
thomas    1755  0.0  0.0   8496   804 pts/7    S    Aug06   0:00  |       |   \_ timeout 28800 make O=/ssd1/thomas/autobuild/instance-0/output -C instance-0/buildroot BR2_DL_
thomas    1756  0.0  0.4  85192 78400 pts/7    T    Aug06   0:14  |       |       \_ make O=/ssd1/thomas/autobuild/instance-0/output -C instance-0/buildroot BR2_DL_DIR=/ssd1/
thomas   11478  0.0  0.0      0     0 pts/7    Z    Aug06   0:00  |       |           \_ [bash] <defunct>
thomas    1479  0.0  0.0  58680  7548 pts/7    S+   Jul09   0:46  |       \_ python ../buildroot-test/scripts/autobuild-run -c autobuild-run.conf
thomas    3490  0.0  0.0   8496   816 pts/7    S    Aug07   0:00  |       |   \_ timeout 28800 make O=/ssd1/thomas/autobuild/instance-1/output -C instance-1/buildroot BR2_DL_
thomas    3491  0.0  0.4  84964 80376 pts/7    T    Aug07   0:14  |       |       \_ make O=/ssd1/thomas/autobuild/instance-1/output -C instance-1/buildroot BR2_DL_DIR=/ssd1/
thomas    3942  0.0  0.0      0     0 pts/7    Z    Aug07   0:00  |       |           \_ [bash] <defunct>
thomas    1480  0.0  0.0  58792  3556 pts/7    S+   Jul09   0:22  |       \_ python ../buildroot-test/scripts/autobuild-run -c autobuild-run.conf
thomas   30856  0.0  0.0   8496   696 pts/7    S    Jul21   0:00  |       |   \_ timeout 28800 make O=/ssd1/thomas/autobuild/instance-2/output -C instance-2/buildroot BR2_DL_
thomas   30857  0.0  0.0  83800  1680 pts/7    T    Jul21   0:19  |       |       \_ make O=/ssd1/thomas/autobuild/instance-2/output -C instance-2/buildroot BR2_DL_DIR=/ssd1/
thomas   29670  0.0  0.0      0     0 pts/7    Z    Jul21   0:00  |       |           \_ [bash] <defunct>
thomas    1481  0.0  0.0  58680  2612 pts/7    S+   Jul09   0:13  |       \_ python ../buildroot-test/scripts/autobuild-run -c autobuild-run.conf
thomas   30548  0.0  0.0   8496   668 pts/7    S    Jul17   0:00  |           \_ timeout 28800 make O=/ssd1/thomas/autobuild/instance-3/output -C instance-3/buildroot BR2_DL_
thomas   30552  0.0  0.0  82736  1656 pts/7    T    Jul17   0:09  |               \_ make O=/ssd1/thomas/autobuild/instance-3/output -C instance-3/buildroot BR2_DL_DIR=/ssd1/
thomas   23005  0.0  0.0      0     0 pts/7    Z    Jul17   0:00  |                   \_ [bash] <defunct>

The log files of the four instances indicate they are blocked
running ./bootstrap as part of host-erlang-rebar build process.

Also, I have no idea if it's related, but in a different part of the
process tree, I have:

thomas   23006  0.0  0.0   6640  1508 pts/7    T    Jul17   0:00 /usr/bin/make -j4
thomas   23007  0.0  0.0      0     0 pts/7    Z    Jul17   0:00  \_ [beam.smp] <defunct>
thomas   29673  0.0  0.0   6640  1524 pts/7    T    Jul21   0:00 /usr/bin/make -j4
thomas   29674  0.0  0.0      0     0 pts/7    Z    Jul21   0:00  \_ [beam.smp] <defunct>
thomas   11479  0.0  0.0   6640  1836 pts/7    T    Aug06   0:00 /usr/bin/make -j4
thomas   11480  0.0  0.0      0     0 pts/7    Z    Aug06   0:00  \_ [beam.smp] <defunct>
thomas    3943  0.0  0.0   6640  1868 pts/7    T    Aug07   0:00 /usr/bin/make -j4
thomas    3944  0.0  0.0      0     0 pts/7    Z    Aug07   0:00  \_ [beam.smp] <defunct>

The date of these processes are the same as the blocked sub-processes
of the autobuilder script.
https://www.reddit.com/r/Ubuntu/comments/caae8/what_the_hell_is_beamsmb/
says: "It's the Erlang runtime, which is running couchdb under the
guise of desktopcouch. CouchDB is a schemaless database system, which
typically runs globally and has no authentication. Ubuntu adds a layer
of authentication and runs it on an arbitrary port.".

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
