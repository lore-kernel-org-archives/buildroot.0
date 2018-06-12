From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 12 Jun 2018 14:53:47 +0000
Subject: [Buildroot] [Bug 11096] New: Upgrade from glibc 2.26 to 2.27 broke
 some locales (ru_RU in particular)
Message-ID: <bug-11096-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11096

            Bug ID: 11096
           Summary: Upgrade from glibc 2.26 to 2.27 broke some locales
                    (ru_RU in particular)
           Product: buildroot
           Version: 2018.05
          Hardware: All
                OS: All
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: psycho_dk at mail.ru
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7646
  --> https://bugs.busybox.net/attachment.cgi?id=7646&action=edit
glibc downgrade patch

glibc 2.27 updated some locale definitions (added alt_mon, ab_lat_mon
descriptions). See release notes:
https://sourceware.org/ml/libc-announce/2018/msg00000.html.

Buildroot uses host's localedef for locale compilation. It's foreign utility
for glibc (from eglibc) and it doesn't support new descriptions. It cause error
in the final stage:

> for locale in ru_RU.UTF-8 ; do inputfile=`echo ${locale} | cut -f1 -d'.'` ; charmap=`echo ${locale} | cut -f2 -d'.' -s` ; if test -z "${charmap}" ; then charmap="UTF-8" ; fi ; echo "Generating locale ${inputfile}.${charmap}" ; I18NPATH=/home/hoxnox/devel/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/share/i18n:/usr/share/i18n /home/hoxnox/devel/buildroot/output/host/bin/localedef --prefix=/home/hoxnox/devel/buildroot/output/target --"little"-endian -i ${inputfile} -f ${charmap} ${locale} ; done
> Generating locale ru_RU.UTF-8
> /home/hoxnox/devel/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/share/i18n/locales/ru_RU:125: LC_TIME: syntax error
> /home/hoxnox/devel/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/share/i18n/locales/ru_RU:149: LC_TIME: syntax error


It's also the cause of no locale support by libc in the target system.

Downgrading to glibc-2.26 solves the problem (see attachment), but is not the
solution.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
