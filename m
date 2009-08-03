From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  3 Aug 2009 19:21:33 +0000 (UTC)
Subject: [Buildroot] [Bug 527] misc fixes for dnsmasq package
In-Reply-To: <bug-527-163@https.bugs.busybox.net/>
References: <bug-527-163@https.bugs.busybox.net/>
Message-ID: <20090803192133.D211377812@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=527





--- Comment #9 from Gustavo Zacarias <gustavo@zacarias.com.ar>  2009-08-03 19:21:33 UTC ---
There's one broken bit:
The old package set the different DNSMASQ_COPTS according to IPV6, LARGEFILE
and TFTP settings and then passed a make COPTS="$(DNSMASQ_COPTS)" parameter
when building.
You are setting DNSMASQ_MAKE_OPT which doesn't fill up those values into the
COPTS parameter for make. So if one of them is true then make gets passed
-DWHATEVER which makes it fail.

Then there's the redundant bits:
DNSMASQ_AUTORECONF = NO -> it's default no, so no need to say that again
DNSMASQ_INSTALL_TARGET = YES -> again, it's default
DNSMASQ_INSTALL_TARGET_OPT .. -> you're using the same
DNSMASQ_DEPENDENCIES = uclibc -> default too

And the "why" thing:
DNSMASQ_INSTALL_STAGING = YES -> why?
As far as i know dnsmasq doesn't provide any library so it doesn't get linked
to.
It doesn't install any header required by some other package either.

Detail:
It's up to version 2.49, you could bump to the new one while doing this.

Improvements:
dnsmasq doesn't have a proper uninstall, you could write one that does this
into dnsmasq.mk
dnsmasq-2.49 introduced an option to disable the dhcp server thus a new option
if you want to do something more.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
