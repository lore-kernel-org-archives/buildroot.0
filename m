From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 28 Nov 2016 13:03:24 +0000
Subject: [Buildroot] [Bug 9451] New: packatges/postgresql/postgresql.mk
 contains wrong POSTGRESQL_CONF_ENV
Message-ID: <bug-9451-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9451

            Bug ID: 9451
           Summary: packatges/postgresql/postgresql.mk contains wrong
                    POSTGRESQL_CONF_ENV
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: dde at innovaphone.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I'm building with the current build buildroot-2016.11-rc2.tar.gz and we
experience an issue while executing the resulting PostgreSQL binary pg_dump,
when we try to export a database which contains sequences:

ERROR LINE 1: ...nt_by, CASE WHEN increment_by > 0 AND max_value = %lldd
THEN...

Look at the %lldd inside the query, which is wrongly built within pg_dump.

After some research I found this piece of code inside the PostgreSQL sources
(https://github.com/postgres/postgres/blob/master/config/c-library.m4):

AC_DEFUN([PGAC_FUNC_SNPRINTF_LONG_LONG_INT_MODIFIER],
[AC_MSG_CHECKING([snprintf length modifier for long long int])
AC_CACHE_VAL(pgac_cv_snprintf_long_long_int_modifier,
[for pgac_modifier in 'll' 'q' 'I64'; do
AC_RUN_IFELSE([AC_LANG_SOURCE([[#include <stdio.h>
#include <string.h>
typedef long long int ac_int64;
#define INT64_FORMAT "%${pgac_modifier}d"

You see that the defined parameter pgac_cv_snprintf_long_long_int_modifier of
the postgresql.mk is used here inside "%${pgac_modifier}d" which then results
in:
%%lldd. After used with _snprintf, this results in %lldd, which is no valid
parameter for _snprintf.

If I define pgac_cv_snprintf_long_long_int_modifier="ll" instead and rebuild
the postgresql package, everything works fine!

Greetings,
Daniel

-- 
You are receiving this mail because:
You are on the CC list for the bug.
