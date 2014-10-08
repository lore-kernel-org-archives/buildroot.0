From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 08 Oct 2014 16:16:51 -0300
Subject: [Buildroot] [PATCH 1/5] dash: bump to version 0.5.8-1
In-Reply-To: <87y4sqbds4.fsf@dell.be.48ers.dk>
References: <1412774389-11297-1-git-send-email-gustavo@zacarias.com.ar>	<87eguieaky.fsf@dell.be.48ers.dk>
 <5435748A.3090106@zacarias.com.ar>	<87k34acu9a.fsf@dell.be.48ers.dk>
 <543580C6.1090600@zacarias.com.ar> <87y4sqbds4.fsf@dell.be.48ers.dk>
Message-ID: <54358DA3.1030103@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/08/2014 03:46 PM, Peter Korsgaard wrote:

> But a buildroot config without busybox is quite unlikely.

Well that's what i'm testing here and other than the other patches
that's the only big broken thing that i've found.
For a basic boot the required packages are:

coreutils -> cat, echo, and a ton of other tiny utils
net-tools -> hostname, ifconfig and such
util-linux (agetty, fsck, kill, login utils, mount/umount)
some shell (bash, dash, zsh)

Optional but nice:

sysklogd -> a logger, not strictly necessary but convenient.
procps-ng -> ps utils.
and many others for the usual complete shell experience.

Not covered yet:

ifdown/ifup - we can package it.
start-stop-daemon - we can probably get away without it by tweaking
initscripts.

The problem is that we allow busybox to be turned off for
systemv/systemd so we've gotta cover those use cases.

>  > It's possible, probably best in System Configuration an option that
>  > selects the appropiate package.
>  > I wouldn't pull in busybox though, only make the option available if
>  > BR2_PACKAGE_BUSYBOX.
>  > And make the symlink in target-finalize to avoid touching the packages
>  > much (actually making them simpler).
> 
> Yes, we can do something like that if there's interest / need. I
> personally don't care enough about it do it myself, but I do want
> reproducible builds.
> 
> A real config with multiple (non busybox) shells is imho quite unlikely
> though.

I'll give it a shot, it shouldn't be hard.
Yes it would be odd for multiple non-busybox shells to exist, that was
my reasoning that any full shell would step on /bin/sh, see? ;)

> Sure it is arbitrary, but that's what we have today and I haven't heard
> anybody complaining.

Well, we can evolve it a bit, once the selection option is done it will
be quite easy to add new shell options which, contrary to adding a ton
of ifeqs, is nicer.
It might be interesting in the long run since we'll have to deal with
/etc/shells (not quite the same but still in the same area) for
non-busybox scenarios.

Regards.
