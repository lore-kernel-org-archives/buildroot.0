From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Nov 2010 16:06:30 +0000 (UTC)
Subject: [Buildroot] [Bug 2767] Build for lsof broken in buildroot-2010.08
In-Reply-To: <bug-2767-163@https.bugs.busybox.net/>
References: <bug-2767-163@https.bugs.busybox.net/>
Message-ID: <20101104160630.2A9CE8DAFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2767

--- Comment #3 from Andy Gibbs <andyg1001@hotmail.co.uk>  ---
Thomas,

I do get it downloading, but it I believe it picks it up from the
sources.buildroot.org mirror instead of the ftp site, so maybe best to change
to the debian distribution site.

Regarding the use of CFLAGS, inside the Makefile is defined:

CFLAGS= ${CDEFS} ${INCL} ${DEP} ${DEBUG}

which expands to

CFLAGS= ${CDEF} ${CFGF} ${DINC} ${CFGD} ${CFGDN} ${DEBUG}

Now when make is invoked, buildroot's CFLAGS are passed via DEBUG:

$(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" -C
$(LSOF_DIR)/lsof_$(LSOF_VERSION)_src

However, if TARGET_CONFIGURE_OPTS also holds CFLAGS, then the CFLAGS declared
inside the Makefile is overridden and all the additional flags that are
required (e.g. from CFGF) are lost.

This is why I have patched it to put the "override" keyword ahead of the
Makefile's CFLAGS declaration.  Buildroot's CFLAGS are still sent forward, via
DEBUG, so that's not a problem.

Does this explain the situation better?

Cheers
Andy

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
