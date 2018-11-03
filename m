From: Carlos Santos <casantos@datacom.com.br>
Date: Sat,  3 Nov 2018 15:24:23 -0300
Subject: [Buildroot] [PATCH v4 0/4] init scripts: rewrite S01logging
Message-ID: <20181103182427.11738-1-casantos@datacom.com.br>
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
- Support a configuration file at /etc/default.
- Use one init script per daemom. Name the script accordding to the
  daemon it starts (e.g. S01syslogd, S02klogd).

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
series, sysklogd and syslog-ng support true "reload" operations).

The scripts were checked with shellcheck v0.5.0:

  $ shellcheck package/*/S0*log*

Carlos Santos (4):
  busybox: rewrite logging init script
  rsyslog: rewrite init script
  sysklogd: rewrite init script
  syslog-ng: rewrite init script

 package/busybox/S01logging     | 40 ---------------------
 package/busybox/S01syslogd     | 56 +++++++++++++++++++++++++++++
 package/busybox/S02klogd       | 56 +++++++++++++++++++++++++++++
 package/busybox/busybox.mk     | 19 +++++-----
 package/rsyslog/S01logging     | 36 -------------------
 package/rsyslog/S01rsyslogd    | 53 +++++++++++++++++++++++++++
 package/rsyslog/rsyslog.mk     |  4 +--
 package/sysklogd/S01logging    | 25 -------------
 package/sysklogd/S01syslogd    | 62 ++++++++++++++++++++++++++++++++
 package/sysklogd/S02klogd      | 65 ++++++++++++++++++++++++++++++++++
 package/sysklogd/sysklogd.mk   |  6 ++--
 package/syslog-ng/S01logging   | 38 --------------------
 package/syslog-ng/S01syslog-ng | 62 ++++++++++++++++++++++++++++++++
 package/syslog-ng/syslog-ng.mk |  4 +--
 14 files changed, 373 insertions(+), 153 deletions(-)
 delete mode 100644 package/busybox/S01logging
 create mode 100644 package/busybox/S01syslogd
 create mode 100644 package/busybox/S02klogd
 delete mode 100644 package/rsyslog/S01logging
 create mode 100644 package/rsyslog/S01rsyslogd
 delete mode 100644 package/sysklogd/S01logging
 create mode 100644 package/sysklogd/S01syslogd
 create mode 100644 package/sysklogd/S02klogd
 delete mode 100644 package/syslog-ng/S01logging
 create mode 100644 package/syslog-ng/S01syslog-ng

-- 
2.17.1
