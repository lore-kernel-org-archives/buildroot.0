From: Carlos Santos <casantos@datacom.com.br>
Date: Sat,  3 Nov 2018 13:42:40 -0300
Subject: [Buildroot] [PATCH 0/4] audit: fix broken startup and make some
 improvements
Message-ID: <20181103164244.10607-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I stomped on these problems while working on the logging init scripts,
so let's fix them right now, since this does not depend on other
changes.

Patch 1: Fixes broken auditd package. audispd is installed at /usr/sbin
but the configuration file pointed to /sbin, causing auditd to fail on
startup. Add a patch fixing auditd.conf.

Patch 2: Rename S01auditd to S02auditd to ensure that auditd is starded
after the syslog daemon, otherwise the initial log messages will be sent
to the console (and probably lost, since almost nobody watches the
system console on embedded systems).

Patch 3: Enable AUDIT in the kernel if the audit package is selected,
since auditd is useless and fails to load otherwise.

Patch 4: Since we are here, bump audit to version 2.8.4.

Carlos Santos (4):
  audit: fix audispd path in auditd.conf
  audit: ensure that it starts after the logging daemon
  linux: enble AUDIT if the audit package is selected
  audit: bump to version 2.8.4

 linux/linux.mk                                |  3 ++
 ...0001-Fix-audispd-path-in-auditd.conf.patch | 32 +++++++++++++++++++
 package/audit/{S01auditd => S02auditd}        |  0
 package/audit/audit.hash                      |  2 +-
 package/audit/audit.mk                        |  4 +--
 5 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 package/audit/0001-Fix-audispd-path-in-auditd.conf.patch
 rename package/audit/{S01auditd => S02auditd} (100%)

-- 
2.17.1
