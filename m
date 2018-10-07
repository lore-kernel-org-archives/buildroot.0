From: Carlos Santos <casantos@datacom.com.br>
Date: Sun,  7 Oct 2018 08:45:57 -0300
Subject: [Buildroot] [PATCH v3 0/8] init scripts: rewrite S01logging
Message-ID: <20181007114605.18153-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Continuing our effort to improve daemon startup scripts, this series
focuses on S01logging, which starts the logging daemon. Common features
are:

- Indent with tabs, not spaces.
- Implement start, stop, restart and reload as functions.
- Use start-stop-daemon.
- Correctly detect and report start/stop/restart/reload errors.
- Support a configuration file at /etc/default (example files for each
  package are provided in individual patches).
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

* "stopped" is an intermediary state that transitions to STARTED after
  one second.

Attempts to do invalid transitions (e.g. start from STARTED state) will
fail. That's why we don't pass -o (--oknodo) to start-stop-daemon. This
changes the script behavior, in some cases, while in other cases just
reports errors that were ignored previously.

The "restart" transition is implemented as "stop, sleep 1, start", so
restarting from STOPPED state is possible, although an error message is
shown because "stop" fails.

The "reload" transition semantics is "reload the configuration and keep
running", when possible, otherwise it is the same as "restart" (in this
series, only syslog-ng supports a true "reload" operation).

The scripts and configuration files checked with shellcheck v0.5.0:

  $ shellcheck -s sh package/*/{S01logging,etc.default.logging}

Carlos Santos (8):
  busybox: update S01logging
  busybox: add logging configuration file
  rsyslog: update S01logging
  rsyslog: add logging configuration file
  sysklogd: update S01logging
  sysklogd: add logging configuration file
  syslog-ng: update S01logging
  syslog-ng: add logging configuration file

 package/busybox/S01logging            | 82 +++++++++++++++---------
 package/busybox/busybox.mk            |  2 +
 package/busybox/etc.default.logging   | 17 +++++
 package/rsyslog/S01logging            | 68 +++++++++++++-------
 package/rsyslog/etc.default.logging   | 24 +++++++
 package/rsyslog/rsyslog.mk            |  2 +
 package/sysklogd/S01logging           | 90 +++++++++++++++++++++------
 package/sysklogd/etc.default.logging  | 33 ++++++++++
 package/sysklogd/sysklogd.mk          |  2 +
 package/syslog-ng/S01logging          | 73 +++++++++++++++-------
 package/syslog-ng/etc.default.logging | 21 +++++++
 package/syslog-ng/syslog-ng.mk        |  2 +
 12 files changed, 323 insertions(+), 93 deletions(-)
 create mode 100644 package/busybox/etc.default.logging
 create mode 100644 package/rsyslog/etc.default.logging
 create mode 100644 package/sysklogd/etc.default.logging
 create mode 100644 package/syslog-ng/etc.default.logging

-- 
2.17.1
