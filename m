From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 1 Feb 2016 19:17:26 +0100
Subject: [Buildroot] crontab: can't change directory to
 '/var/spool/cron/crontabs': No such file or directory
In-Reply-To: <87twlxmkfn.fsf@dell.be.48ers.dk>
References: <1454000577.4304.27.camel@synopsys.com>
 <87twlxmkfn.fsf@dell.be.48ers.dk>
Message-ID: <56AFA136.8030707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28-01-16 23:02, Peter Korsgaard wrote:
>>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:
> 
>  > Hello,
>  > Just noticed this:
>  ------------------> 8-------------------
>  > # crontab -e
>  > crontab: can't change directory to '/var/spool/cron/crontabs': No such file or directory
>  ------------------> 8-------------------
> 
>  > Obvious solution is:
>  ------------------> 8-------------------
>  > # mkdir -p /var/spool/cron/crontabs
>  ------------------> 8-------------------
> 
>  > But the question is if we want that to be done automatically and if
>  > we do want how (read "where") to do it properly?
> 
> Yes, the problem is also how should this work together with a readonly
> rootfs? Our default skeleton has /var/spool as a symlink to /tmp/, so we
> cannot add /var/spool/cron/crontabs at build time (unless we change the
> skeleton).

 I think it's a mistake that we have /var/spool as a symlink to /tmp. /var/spool
shouldn't contain any files directly. So instead, I think any package that needs
a /var/spool directory should create it either as a directory or as a symlink.
In the particular case of crontab, that should probably be a directory, not a
symlink, since it doesn't make much sense to have crontab files non-persistent.

 In fact, dcron does create $(TARGET_DIR)/var/spool/cron/crontabs - which is
silly of course since it will just create a directory in /tmp and the tmpfs will
be mounted over it.

 Of course, changing this may break other packages, probably at runtime only.
The following packages are currently referring to /var/spool from buildroot, but
there are probably a few others (including busybox) that refer to it from their
own Makefiles:
at boa busybox dcron dcron exim leafnode2 mutt smstools3


 Regards,
 Arnout

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
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
