From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 10 Jul 2018 23:04:05 +0200
Subject: [Buildroot] [PATCH 0/8] init scripts: rewrite S01logging
In-Reply-To: <20180709033134.22175-1-casantos@datacom.com.br>
References: <20180709033134.22175-1-casantos@datacom.com.br>
Message-ID: <20180710210405.GA2555@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2018-07-09 00:31 -0300, Carlos Santos spake thusly:
> Continuing our effort to improve daemon startup scripts. This series
> focuses on S01logging, which starts the logging daemon.

Nice to see someone tackling the issue! :-)

I don't have much more to say than what Arnout and Nicolas already said,
i.e.:

  - use if-then-else blocks rather than the {}||{} construct;

  - allow restarting a stopped process;

  - restart and reload can be different: restart is stop-n-start, while
    reload should just instruct the daemon to reload its configuration.
    IFF the dameon does not handle reload, then reload should behave
    the same as restart;

  - starting an already started daemon is a noop, but is not an error;

  - don't try to protexct against stupidity in configuration files:
    users are expected to know what they will set in there. If they
    don't, they'll learn;

> Common features
> are:
> 
> - Indent with tabs, not spaces.
> - Implement start, stop, restart and reload as functions.
> - Use start-stop-daemon.
> - Use logic operators && and || to detect/handle errors, which provides
>   better readability than nested if/then/else blocks.
> - Use brackets for blocking, also improving readability.

Sorry, not that last two. if-then-else are very readable, and they are
very well knwon; while the {} || {} && {} constrcut is a bit convoluted
(that comment coming from the guy who's known for writing a *lot* of
big and complex shell scripts).

> - Correctly Detect and report start/stop/restart/reload errors.
> - Use separate functions for restart and reload; report the result of
>   the whole operations instead of invoking stop, start and report OK
>   twice.

I prefer that restart is an actual stop followed by an actual start. For
reload, it should, when supoprted by the daemon, ask it to just reload
its configuration' otherwise, reload is a restart.

Regards,
Yann E. MORIN.

> - Support a configuration file at /etc/default (example files for each
>   package will be added in separate patches).
> - Support a configuration variable that completely disables the service
>   and issues a warning message on any invocation.
> 
> The configuration files are provided mostly as examples for init script
> authors but they also contain information about options that cannot be
> used when running in background. 
> 
> All files implement the following FSM:
> 
>                                                   +---------+
>              +-------stop--------+   +----(1s)----| stopped |
>              |                   |   |            |   (*)   |
>              |                   |   |            +---------+
>              v                   |   v                 ^
>       +---------+             +---------+              |
>       |         |             |         |----restart---+
>       | STOPPED |----start--->| STARTED |
>       |         |             |         |----reload----+
>       +---------+             +---------+              |
>                                      ^                 |
>                                      |                 |
>                                      +-----------------+
> 
> * "stopped" is an intermediary state that transitions automatically to
>   STARTED after one second.
> 
> Attempts to do invalid transitions (e.g. start from STARTED state) will
> fail. That's why we don't pass -o (--oknodo) to start-stop-daemon. This
> changes the script behavior, in some cases, while in other cases just
> reports errors that were ignored previously.
> 
> We could interpret "start from STARTED" as "do nothing, ok" to match
> systemctl (systemd). Leave such change for later, however, since the
> current behavior matches most existing scripts.
> 
> Carlos Santos (8):
>   busybox: update S01logging
>   busybox: add logging configuration file
>   rsyslog: update S01logging
>   rsyslog: add logging configuration file
>   sysklogd: update S01logging
>   sysklogd: add logging configuration file
>   rsyslog: update S01logging
>   syslog-ng: add logging configuration file
> 
>  package/busybox/S01logging            | 87 +++++++++++++++++--------
>  package/busybox/busybox.mk            |  2 +
>  package/busybox/etc.default.logging   | 13 ++++
>  package/rsyslog/S01logging            | 74 ++++++++++++++-------
>  package/rsyslog/etc.default.logging   | 14 ++++
>  package/rsyslog/rsyslog.mk            |  2 +
>  package/sysklogd/S01logging           | 93 +++++++++++++++++++++------
>  package/sysklogd/etc.default.logging  | 25 +++++++
>  package/sysklogd/sysklogd.mk          |  2 +
>  package/syslog-ng/S01logging          | 83 +++++++++++++++++-------
>  package/syslog-ng/etc.default.logging | 14 ++++
>  package/syslog-ng/syslog-ng.mk        |  2 +
>  12 files changed, 316 insertions(+), 95 deletions(-)
>  create mode 100644 package/busybox/etc.default.logging
>  create mode 100644 package/rsyslog/etc.default.logging
>  create mode 100644 package/sysklogd/etc.default.logging
>  create mode 100644 package/syslog-ng/etc.default.logging
> 
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
