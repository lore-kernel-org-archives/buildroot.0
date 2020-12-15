From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 15 Dec 2020 16:00:23 -0000 (UTC)
Subject: [Buildroot] Slow SNMP daemon startup
References: <rram42$17q6$1@ciao.gmane.io>
Message-ID: <rramin$k2f$1@ciao.gmane.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-12-15, Grant Edwards <grant.b.edwards@gmail.com> wrote:
> After upgrading from an older version of net-snmp (5.7.3 -> 5.8) it
> now takes the snmp daemon anywhere from 5s to a minute to start up. It
> used to start with no noticeable delay.
>
> Has anybody else noticed this?
>
> Does anybody have any guesses on where to start looking for the problem?
>
> There's nothing in the syslog to indicate any problem:
>
>  # grep snmp /var/log/messages
>  Jan  1 00:00:08 (none) daemon.info snmpd[944]: Created directory: /var/lib/snmp
>  Jan  1 00:00:08 (none) daemon.info snmpd[944]: Created directory: /var/lib/snmp/cert_indexes
>  Dec 15 15:17:26 (none) daemon.info snmpd[944]: Created directory: /var/lib/snmp/mib_indexes
>  Dec 15 15:17:26 (none) daemon.info snmpd[946]: NET-SNMP version 5.8
>
> Though it looks like the ntp daemon has stepped the time while snmpd
> is starting up, so perhaps that's causing a problem...

That's not it. I disable ntp, and it got even worse (over two minutes):

   # grep snmp /var/log/messages
   Jan  1 00:00:08 (none) daemon.info snmpd[942]: Created directory: /var/lib/snmp
   Jan  1 00:00:08 (none) daemon.info snmpd[942]: Created directory: /var/lib/snmp/cert_indexes
   Jan  1 00:02:34 (none) daemon.info snmpd[942]: Created directory: /var/lib/snmp/mib_indexes
   Jan  1 00:02:34 (none) daemon.info snmpd[944]: NET-SNMP version 5.8

--
Grant
