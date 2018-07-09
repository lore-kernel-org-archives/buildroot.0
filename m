From: Carlos Santos <casantos@datacom.com.br>
Date: Mon,  9 Jul 2018 00:31:26 -0300
Subject: [Buildroot] [PATCH 0/8] init scripts: rewrite S01logging
Message-ID: <20180709033134.22175-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Continuing our effort to improve daemon startup scripts. This series
focuses on S01logging, which starts the logging daemon. Common features
are:

- Indent with tabs, not spaces.
- Implement start, stop, restart and reload as functions.
- Use start-stop-daemon.
- Use logic operators && and || to detect/handle errors, which provides
  better readability than nested if/then/else blocks.
- Use brackets for blocking, also improving readability.
- Correctly Detect and report start/stop/restart/reload errors.
- Use separate functions for restart and reload; report the result of
  the whole operations instead of invoking stop, start and report OK
  twice.
- Support a configuration file at /etc/default (example files for each
  package will be added in separate patches).
- Support a configuration variable that completely disables the service
  and issues a warning message on any invocation.

The configuration files are provided mostly as examples for init script
authors but they also contain information about options that cannot be
used when running in background. 

All files implement the following FSM:

                                                  +---------+
             +-------stop--------+   +----(1s)----| stopped |
             |                   |   |            |   (*)   |
             |                   |   |            +---------+
             v                   |   v                 ^
      +---------+             +---------+              |
      |         |             |         |----restart---+
      | STOPPED |----start--->| STARTED |
      |         |             |         |----reload----+
      +---------+             +---------+              |
                                     ^                 |
                                     |                 |
                                     +-----------------+

* "stopped" is an intermediary state that transitions automatically to
  STARTED after one second.

Attempts to do invalid transitions (e.g. start from STARTED state) will
fail. That's why we don't pass -o (--oknodo) to start-stop-daemon. This
changes the script behavior, in some cases, while in other cases just
reports errors that were ignored previously.

We could interpret "start from STARTED" as "do nothing, ok" to match
systemctl (systemd). Leave such change for later, however, since the
current behavior matches most existing scripts.

Carlos Santos (8):
  busybox: update S01logging
  busybox: add logging configuration file
  rsyslog: update S01logging
  rsyslog: add logging configuration file
  sysklogd: update S01logging
  sysklogd: add logging configuration file
  rsyslog: update S01logging
  syslog-ng: add logging configuration file

 package/busybox/S01logging            | 87 +++++++++++++++++--------
 package/busybox/busybox.mk            |  2 +
 package/busybox/etc.default.logging   | 13 ++++
 package/rsyslog/S01logging            | 74 ++++++++++++++-------
 package/rsyslog/etc.default.logging   | 14 ++++
 package/rsyslog/rsyslog.mk            |  2 +
 package/sysklogd/S01logging           | 93 +++++++++++++++++++++------
 package/sysklogd/etc.default.logging  | 25 +++++++
 package/sysklogd/sysklogd.mk          |  2 +
 package/syslog-ng/S01logging          | 83 +++++++++++++++++-------
 package/syslog-ng/etc.default.logging | 14 ++++
 package/syslog-ng/syslog-ng.mk        |  2 +
 12 files changed, 316 insertions(+), 95 deletions(-)
 create mode 100644 package/busybox/etc.default.logging
 create mode 100644 package/rsyslog/etc.default.logging
 create mode 100644 package/sysklogd/etc.default.logging
 create mode 100644 package/syslog-ng/etc.default.logging

-- 
2.17.1
