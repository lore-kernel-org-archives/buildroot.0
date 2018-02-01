From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 01 Feb 2018 10:44:10 +0000
Subject: [Buildroot] [Bug 10726] New: Current libglib2.mk creates broken
 libglib2 binary when using glibc 2.26
Message-ID: <bug-10726-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10726

            Bug ID: 10726
           Summary: Current libglib2.mk creates broken libglib2 binary
                    when using glibc 2.26
           Product: buildroot
           Version: 2017.11.2
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: porto.rio at gmx.net
                CC: buildroot at uclibc.org
  Target Milestone: ---

We recently ran into a weird problem where the udisks-daemon crashes at startup
when migrating from buildroot 2017.08 to 2017.11.

Debugging the issue yielded the following problem:
? udisks tries to call g_io_channel_new_file ("/proc/mdstat", "r", &error);
which fails because "/proc/mdstat" does not exists (see
build/libglib2-2.54.2/glib/giounix.c:527).
? libglib2 then tries to create an error string using g_strerror() (see
build/libglib2-2.54.2/glib/gstrfuncs.c)
? g_error() uses strerror_r() to acquire the error string but discards the
returned string (see build/libglib2-2.54.2/glib/gstrfuncs.c:1293).

BR 2017.11 uses libglib2-2.54.2 (BR 2017.08 used 2.52.2) which changed the
detection of the available variant of strerror_r() (returning the message vs.
filling a buffer) in the c-library (see
build/libglib2-2.54.2/glib/gstrfuncs.c).

Old check in libglib2-2.52.2,:
#  if defined(__GLIBC__) && !((_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >=
600) && ! _GNU_SOURCE)

New check in libglib2-2.54.2:
#  if defined(STRERROR_R_CHAR_P)

The 2.54.2 version relies on a configure-time check to determine if
strerror_r() returns the error message or fills the provided buffer with the
message.
STRERROR_R_CHAR_P needs to be defined for the current version of glibc (2.26)
but is set to undefined in the current makefile for libglib2 in Buildroot.
See buildroot-2017.11.2/package/libglib2/libglib2.mk. It contains
LIBGLIB2_CONF_ENV which sets "ac_cv_have_decl_strerror_r=yes
ac_cv_func_strerror_r_char_p=no".
If these two lines are removed the resulting libglib2 binary works again as the
configure script selects the right variant of strerror_r().

-- 
You are receiving this mail because:
You are on the CC list for the bug.
