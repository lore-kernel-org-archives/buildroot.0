From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 24 Mar 2012 09:47:18 +0000 (UTC)
Subject: [Buildroot] [Bug 4922] Please consider introducing host-make for
 building software packages within the buildroot
In-Reply-To: <bug-4922-163@https.bugs.busybox.net/>
References: <bug-4922-163@https.bugs.busybox.net/>
Message-ID: <20120324094718.C340C96956@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4922

--- Comment #6 from Christoph Schulz <develop@kristov.de> 2012-03-24 09:47:18 UTC ---
Hello!

(In reply to comment #5)
> The choice between building our own or using whatever is present on the host
> depends on several factors. Among those are:
> 
> - How common is the package? How likely is the user to already have it
> present?
> - Do we have strict version requirements?

I think so:

# Check for minimal make version (note: this check will break at make 10.x)
MIN_MAKE_VERSION=3.81
ifneq ($(firstword $(sort $(MAKE_VERSION)
$(MIN_MAKE_VERSION))),$(MIN_MAKE_VERSION))
$(error You have make '$(MAKE_VERSION)' installed. GNU make >=
$(MIN_MAKE_VERSION) is required)
endif

So at least make 3.81 is required. Remember that, although e.g. make 3.80 has
been released 2002, it took years for the various Linux distributions to pick
it up (e.g. Gentoo put it into the stable tree in 2005).

> - How many dependencies does it have? How long does it take to build (and how
> much space does it need)?

It does not have any dependencies (with the exception of autotools). It does
not take much time to build. It does not need much space (the archive is
smaller as that of e.g. autoconf-2.65).

>  [...]
> > By the way, autoconf e.g. does get patched in the buildroot.
> 
> For bugfixes, yes - Not for features.

Fair enough. But in my eyes, not being able to build reproducable binaries _is_
a bug. Otherwise I would not have started the whole discussion ;-) I don't
think you will be able to stick to make 3.81 forever...

Please consider my last argument: According to
support/dependencies/dependencies.sh, GNU make is apparently the _only_ package
needed for building for which there exist strict version requirements (the
other one is gcc >= 2.95, but gcc 2.95 has been released in 1999, much earlier
than make 3.81). So why not build a host-make which definitely meets our
requirements?


Regards,

Christoph Schulz

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
