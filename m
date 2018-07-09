From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Jul 2018 00:00:25 +0200
Subject: [Buildroot] [PATCH 5/8] sysklogd: update S01logging
In-Reply-To: <20180709033134.22175-6-casantos@datacom.com.br>
References: <20180709033134.22175-1-casantos@datacom.com.br>
 <20180709033134.22175-6-casantos@datacom.com.br>
Message-ID: <63d82074-c817-927b-995f-c7837b2209ed@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-07-18 05:31, Carlos Santos wrote:
> +		start-stop-daemon -b -S -q -p /var/run/syslogd.pid -x /sbin/syslogd -- -n $SYSLOGD_ARGS && \
> +		start-stop-daemon -b -S -q -p /var/run/klogd.pid -x /sbin/klogd -- -n $KLOGD_ARGS && \

 Just like rsyslogd, I believe syslogd and klogd can background and create a PID
file themselves. In that case, it's better not to use start-stop-daemon's -b option.

 Note that this is different for systemd units, because systemd does actual
monitoring of the processes it starts; it can only do that if the process
doesn't background itself. In sysvinit, however, there is no monitoring so it's
better if daemons daemonize themselves.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
