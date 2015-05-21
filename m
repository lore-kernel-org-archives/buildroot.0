From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 22:04:38 +0200
Subject: [Buildroot] Issue with host-erlang-rebar causing timeouts
In-Reply-To: <20150521214726.19fc73fa@free-electrons.com>
References: <20150521212150.3f39f1c1@free-electrons.com>
 <20150521214726.19fc73fa@free-electrons.com>
Message-ID: <20150521220438.624c6697@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan,

On Thu, 21 May 2015 21:47:26 +0200, Thomas Petazzoni wrote:

> Maybe I should set up a cronjob that checks every minute if we are in
> this situation, and send me an e-mail, so that maybe I can catch the
> situation while it's happening, and see a bit more what's going on. I
> don't really have better ideas :/

Turns out that right after sending this e-mail, I checked, and one of
the build was stuck exactly in this situation. The process tree is like
this:

23332 pts/5    S+     0:01  |       \_ python ../buildroot-test/scripts/autobuild-run -c autobuild-run.conf
23969 pts/5    S      0:00  |       |   \_ timeout 28800 make O=/ssd1/thomas/autobuild/instance-2/output -C instance-2/buildroot BR2_DL_DIR=/ssd1/thomas/autobuild/instance-2/dl BR2_JLEVE
23970 pts/5    T      0:19  |       |       \_ make O=/ssd1/thomas/autobuild/instance-2/output -C instance-2/buildroot BR2_DL_DIR=/ssd1/thomas/autobuild/instance-2/dl BR2_JLEVEL=4
10928 pts/5    Z      0:00  |       |           \_ [bash] <defunct>

So basically, the Buildroot "make" invocation only has one child
process: a bash process that is defunct. This instance is really stuck
in the ./bootstrap call:

make[1]: Entering directory '/ssd1/thomas/autobuild/instance-2/output/build/host-erlang-rebar-2.5.1'
./bootstrap
[nothing else]

I tried running the exact make command that builds host-erlang-rebar in
a terminal, inside the build directory of this build, and it worked
perfectly fine. So even more puzzled.

I see however that 'bootstrap' tries to play with the hg and git VCS to
get a commit reference. Maybe this is failing for some reason?

Any other idea?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
