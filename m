From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 9 Jul 2018 23:09:16 +0200
Subject: [Buildroot] [PATCH 0/8] init scripts: rewrite S01logging
In-Reply-To: <20180709033134.22175-1-casantos@datacom.com.br>
References: <20180709033134.22175-1-casantos@datacom.com.br>
Message-ID: <7f94a5b7-7a5c-36a3-5e42-e0af8e7e0d7b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Carlos,

 Thanks for doing this!

 I'm going to give feedback more on the principles than on the detailed
implementation. Most of this feedback is my personal opinion, so wait for input
from some other people before reworking it. If/when you repost, it would be a
good idea to summarize the feedback (including who said what, especially when
there are differences of opinion) in either the cover letter or below the --- line.

On 09-07-18 05:31, Carlos Santos wrote:
> Continuing our effort to improve daemon startup scripts. This series
> focuses on S01logging, which starts the logging daemon. Common features

 Good choice of something to focus on!

> are:
> 
> - Indent with tabs, not spaces.

 +1.

> - Implement start, stop, restart and reload as functions.

 +1.

> - Use start-stop-daemon.

 +1.

 I think these three are entirely uncontroversial, so if you'd make a separate
patch with just these three, it could already be applied.

> - Use logic operators && and || to detect/handle errors, which provides
>   better readability than nested if/then/else blocks.

 Not sure if I'd want to make a general rule out of that.

> - Use brackets for blocking, also improving readability.

 ... Proving my point: with if, you get blocking automatically.

> - Correctly Detect and report start/stop/restart/reload errors.

 +1. But that's closely related with the conditional structure so not worth
making a separate patch of it.

> - Use separate functions for restart and reload; report the result of
>   the whole operations instead of invoking stop, start and report OK
>   twice.

 Actually, I like to have the separate stop and start output.

 Remember that the restart and reload calls are only used for explicit calls,
not automatically by init. So a little extra verbosity here doesn't hurt at all IMO.

> - Support a configuration file at /etc/default (example files for each
>   package will be added in separate patches).

 I'm not convinced that example files are enough of an added value. If we always
use the same pattern in the init scripts, and we put default assignments of
these variables at the beginning of the init script, we can just explain in the
documentation that the variables that can be used in /etc/default/foo are
explained at the beginning of /etc/init.d/S??foo.

> - Support a configuration variable that completely disables the service
>   and issues a warning message on any invocation.

 Why would we want that? If you really want to disable it entirely, then just
remove the init script in a post-build script. Or make it non-executable if you
want to temporarily disable.


> The configuration files are provided mostly as examples for init script
> authors but they also contain information about options that cannot be
> used when running in background.

 That can be done at the beginning of the init script as well.


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

 I don't know if the 1s sleep makes sense in general. Although, indeed,
otherwise we'd have to check if the process is really dead before restarting.


> Attempts to do invalid transitions (e.g. start from STARTED state) will
> fail. That's why we don't pass -o (--oknodo) to start-stop-daemon. This
> changes the script behavior, in some cases, while in other cases just
> reports errors that were ignored previously.

 NACK that. You want to be able to do /etc/init.d/S??foo restart even if foo is
not actually running. So for start we indeed want to terminate, but for stop we
want to continue (and report failure).

> We could interpret "start from STARTED" as "do nothing, ok" to match
> systemctl (systemd). Leave such change for later, however, since the
> current behavior matches most existing scripts.

 +1


 Regards,
 Arnout

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

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
