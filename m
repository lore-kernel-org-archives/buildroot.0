From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 21:47:26 +0200
Subject: [Buildroot] Issue with host-erlang-rebar causing timeouts
In-Reply-To: <20150521212150.3f39f1c1@free-electrons.com>
References: <20150521212150.3f39f1c1@free-electrons.com>
Message-ID: <20150521214726.19fc73fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Johan,

On Thu, 21 May 2015 21:21:50 +0200, Thomas Petazzoni wrote:

> Do you have any idea of what could cause this problem? Is this to only
> happen on certain build machines (so maybe the version of some host
> tools is playing a role), but also not always.

I've done a bit more "data mining" on this issue. I looked at *all* the
build results of gcc75 since I restarted it on May 4th, and looked at
the one that built host-erlang-rebar.

Up to May 19th, every time host-erlang-rebar was built, there was no
problem. Not a single failure. The last successful build that built
host-erlang-rebar was:

  http://autobuild.buildroot.org/results/083/08369dd2c7147d620b50ed799c74acea38bf1457/

This build was done on May 19th at 8h26.

Then later on that day, at 21h26, the first timeout occurred on
host-erlang-rebar, with this build result:

  http://autobuild.buildroot.org/results/3f9/3f9381a410e8411c390ccf5632a06c66b1c93524/

After that one, *all* builds that needed to build host-erlang-rebar
timed out.

Looking at the Buildroot Git commit being tested by both of those
builds, they are exactly the same:

  db989f89c9fb1ebc3997d8a3c517948392611d77

So it really smells like a change in the machine configuration. The
last working build of host-erlang-rebar took place at:

1432011188:start:build               : host-erlang-rebar

that is Tue May 19 06:53:08 CEST 2015.

The first non-working build of host-erlang-rebar too place at:

$ LANG=C date -d @1432038506
Tue May 19 14:28:26 CEST 2015

So just a few hours later.

According to the apt and dpkg logs on this machine, no package updates
have been made since May 4th.

The weird thing is that the problem happens in *all* builds of
host-erlang-rebar, but I'm not able to reproduce on the same machine,
outside of the autobuild infrastructure.

I'm puzzled.

Maybe I should set up a cronjob that checks every minute if we are in
this situation, and send me an e-mail, so that maybe I can catch the
situation while it's happening, and see a bit more what's going on. I
don't really have better ideas :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
