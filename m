From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Oct 2014 16:44:22 -0300
Subject: [Buildroot] [PATCH 1/2] system/skeleton: make nsswitch install
 conditional
In-Reply-To: <CAGduivwEezhtmw0OfpqELQs2k3sGF_StUdC7hyqAWuKXj6u1yA@mail.gmail.com>
References: <1413808086-12177-1-git-send-email-gustavo@zacarias.com.ar>
 <20141020150209.5f8b45a5@free-electrons.com>
 <54450BF5.4000202@zacarias.com.ar>
 <20141020152759.4f438890@free-electrons.com>
 <54450F51.5050801@zacarias.com.ar>
 <20141020153719.034df3be@free-electrons.com>
 <54451174.5060309@zacarias.com.ar>
 <20141020155447.21c7c7ff@free-electrons.com>
 <5445185C.6020604@zacarias.com.ar>
 <20141020162811.4c3e2ce5@free-electrons.com>
 <CAGduivwEezhtmw0OfpqELQs2k3sGF_StUdC7hyqAWuKXj6u1yA@mail.gmail.com>
Message-ID: <54480916.6070704@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/22/2014 11:10 AM, Maxime Hadjinlian wrote:

> I would like to have a much better control over what's installed from
> the initscripts (or other) package. I don't have, yet, a clear idea of
> what I'd like but Gustavo, if you started working on this, maybe I
> could help ?

I have nothing big done (at least upstreamable, i've got custom scripts
done for my projects but they're not pretty).
A big wishlist would be:

1) Making /etc/inittab as minimal as possible:

-----
# Startup
::sysinit:/etc/init.d/rcS

# Put a getty on the serial port
#ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL

# Shutdown
::ctrlaltdel:/etc/init.d/rcK
null::shutdown:/etc/init.d/rcK
-----

Move all the "Startup the system" actions into /etc/init.d/S00sysinit
Move all the shutdown actions into /etc/init.d/K99shutdown

2) Move all of the non-init specific skeleton files into a package
(basefiles, sysfiles, some other pretty name).

3) Make SysV-initscripts more friendly, configurable (basic options,
startup or not).
Ship a default behaviour in /etc/default/$name or some other directory
and make it overridable via a counterpart in /etc/config/$name (or some
other naming convention).
In easily parseable variables, with some common settings, like:
STARTUP=YES
and such.

4) Make /run a separate tmpfs filesystem instead of -> /tmp, it really
looks ugly to find pidfiles in there and might be racy.

5) Make sysvinit without busybox work really well: this needs the
addition of a couple of packages (ifupdown if we plan on doing that for
interfaces for SysV-style), and start-stop-daemon (i don't recall OTOH
which debian package ships it but it's available).
And document what's required - i don't think it's work to select heaven
& hell automatically since it's pretty subjective.

6) For systemd networking take a look at netctl
(https://wiki.archlinux.org/index.php/netctl) which works for
simple/modest setups with simple configuration files.

I don't recall more right now :)
Regards.
