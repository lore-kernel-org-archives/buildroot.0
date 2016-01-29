From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 29 Jan 2016 11:13:33 +0100
Subject: [Buildroot] crontab: can't change directory to
 '/var/spool/cron/crontabs': No such file or directory
In-Reply-To: <87twlxmkfn.fsf@dell.be.48ers.dk>
References: <1454000577.4304.27.camel@synopsys.com>
 <87twlxmkfn.fsf@dell.be.48ers.dk>
Message-ID: <56AB3B4D.1010004@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey, Peter,

Peter Korsgaard wrote:
>>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:
>
>   > Hello,
>   > Just noticed this:
>   ------------------> 8-------------------
>   > # crontab -e
>   > crontab: can't change directory to '/var/spool/cron/crontabs': No such file or directory
>   ------------------> 8-------------------
>
>   > Obvious solution is:
>   ------------------> 8-------------------
>   > # mkdir -p /var/spool/cron/crontabs
>   ------------------> 8-------------------
>
>   > But the question is if we want that to be done automatically and if
>   > we do want how (read "where") to do it properly?
>
> Yes, the problem is also how should this work together with a readonly
> rootfs? Our default skeleton has /var/spool as a symlink to /tmp/, so we
> cannot add /var/spool/cron/crontabs at build time (unless we change the
> skeleton).

Yeah, changing the skeleton looks like a clean solution at first, but
it would potentially break existing configurations using /var/spool
with a readonly rootfs, and quietly change the behaviour of those with
a rw rootfs... Not good.

Another option, specific for crond and crontab, would be to change
CONFIG_FEATURE_CROND_DIR in the Busybox config so it points to
non-volatile storage. A candidate might be /var/cron, but according to
hier(7):

  - /var/cron: Reserved for historical reasons.
  - /var/spool/cron: Spooled jobs for cron(8).

A variant on this might be:
  - store crontab files in /var/cron (or wherever in the rootfs)
  - add a boot script that creates a symlink
    /var/spool/cron -> /var/cron
  - _not_ change the Busybox config.

>
> What I have done in the past is simply to do it in an init script,
> E.G. something like:
>
>
> # /var/spool is link to /tmp => crontabs are not persistent over boot
> mkdir -p /var/spool/cron/crontabs
> cp /root/crontab /var/spool/cron/crontabs/root
> start-stop-daemon -S -q -p /var/run/crond.pid --exec /usr/sbin/crond -- -l 9
>
> But that isn't very generic.

And it does not save /var/spool/cron/crontabs/root to /root/crontab
after edits, which is the worst drawback IMHO.

This is a topic we may discuss during the Developer Days next week.

-- 
Luca
