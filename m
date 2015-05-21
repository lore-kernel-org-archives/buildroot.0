From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 21:21:50 +0200
Subject: [Buildroot] Issue with host-erlang-rebar causing timeouts
Message-ID: <20150521212150.3f39f1c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Johan,

We have an issue with host-erlang-rebar: it causes some timeouts in our
builds. See
http://autobuild.buildroot.org/?reason=host-erlang-rebar-2.5.1.

The script that does the autobuilder builds kills the build if it lasts
for more than 8 hours. And in the last few days, all the timeouts we
have had were only caused by host-erlang-rebar.

If you look at the link above, things are fairly strange:

 * We had three of such timeouts back on March 16, all on the gcc10
   machine.

 * Since May 19th, we have the exact same timeouts, but this time only
   on gcc75.

All the timeouts take place at exactly the same point, during the
"build" step of host-erlang-rebar:

./bootstrap
package/pkg-generic.mk:156: recipe for target '/ssd1/thomas/autobuild/instance-2/output/build/host-erlang-rebar-2.5.1/.stamp_built' failed
make: *** [/ssd1/thomas/autobuild/instance-2/output/build/host-erlang-rebar-2.5.1/.stamp_built] Terminated
Makefile:7: recipe for target 'all' failed
make[1]: *** [all] Terminated

So it's the ./bootstrap program that either hangs forever, or does an
infinite loop.

Let's take a closer look at
http://autobuild.buildroot.org/results/73d/73d491670cb29ab68cb8552b4b9bd82d31571e62/.
From the logs of the autobuilder instance (only visible on gcc75), I
see:

[Wed, 20 May 2015 14:11:36] INFO: generate the configuration
[Wed, 20 May 2015 14:11:44] INFO: build started
[Wed, 20 May 2015 22:11:44] INFO: build timed out
Importing 73d491670cb29ab68cb8552b4b9bd82d31571e62 from /tmp/phpS9zcmM

So the build started at 14h11, and timed out at 22h11, so exactly 8
hours after the start of the build, which is expected.

Now, we can correlate this with the build-time.log information
available at
http://autobuild.buildroot.org/results/73d/73d491670cb29ab68cb8552b4b9bd82d31571e62//build-time.log,
which gives us the starting and ending time of each step of the build
process.

The first line is:

1432123908:start:extract             : toolchain-external

The Unix time stamp 1432123908 corresponds to:

thomas at skate:~$ LANG=C date -d @1432123908
Wed May 20 14:11:48 CEST 2015

So this is exactly matching the 14h11 start time for the build.

The last line of build-time.log is the starting time of
host-erlang-rebar build:

1432126776:start:build               : host-erlang-rebar

And this time stamp corresponds to:

$ LANG=C date -d @1432126776
Wed May 20 14:59:36 CEST 2015

So basically about 48 minutes after the start of the build process, we
started building host-erlang-rebar.

And then nothing happened for the next 7+ hours, until the build got
killed at 22h11.

I've used the br-reproduce-build script on gcc75 to attempt to
reproduce exactly this 73d491670cb29ab68cb8552b4b9bd82d31571e62 build,
but it didn't occur: the build succeeded completely without an error,
and without any hang. The ./bootstrap part went just fine:

./bootstrap
Recompile: src/rebar
Recompile: src/rebar_abnfc_compiler
Recompile: src/rebar_app_utils
[...]

Do you have any idea of what could cause this problem? Is this to only
happen on certain build machines (so maybe the version of some host
tools is playing a role), but also not always.

Do you have any idea?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
