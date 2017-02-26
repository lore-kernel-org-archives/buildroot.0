From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Feb 2017 15:56:53 +0000
Subject: [Buildroot] [Bug 9596] KODI: --enable-lirc needs "HAVE_LIRC"
 compiler definition to use the lirc subsystem
In-Reply-To: <bug-9596-163@https.bugs.busybox.net/>
References: <bug-9596-163@https.bugs.busybox.net/>
Message-ID: <bug-9596-163-eZiHYFCP31@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9596

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Ok, so I had a closer look, and the configure.ac code is completely wrong:

AC_ARG_ENABLE([lirc],
  [AS_HELP_STRING([--disable-lirc],
  [disable lirc support (default is enabled)])],
  [AC_MSG_RESULT("Lirc disabled")],
  [AC_DEFINE([HAVE_LIRC], [1], ["Lirc enabled"])])

So what this does is:

 * If a --enable-lirc or --disable-lirc option is passed, prints "Lirc
disabled"

 * If none of --enable-lirc or --disable-lirc is passed, it defines HAVE_LIRC.

As you can see, this is completely bogus. It should instead be something like:

AC_ARG_ENABLE([lirc],
  [AS_HELP_STRING([--disable-lirc],
  [disable lirc support (default is enabled)])],
  [use_lirc=$enableval])

if "${use_lirc}" = "yes" ; then
  AC_DEFINE([HAVE_LIRC], [1], ["Lirc enabled"])]
fi

-- 
You are receiving this mail because:
You are on the CC list for the bug.
