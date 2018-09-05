From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Wed, 5 Sep 2018 09:24:21 +0200
Subject: [Buildroot] Problmes with eth0 on Raspberry Pi 3B+
In-Reply-To: <87musxarof.fsf@dell.be.48ers.dk>
References: <CALtfCQYbuFj8HMLNpk4t=M4FeZF4_=wXjNw7YcQPcN=iGYsR7Q@mail.gmail.com>
 <1560ed39-cf1b-046e-9855-c35dde778374@green-communications.fr>
 <87musxarof.fsf@dell.be.48ers.dk>
Message-ID: <6928306d-157a-5bf3-9232-0af952b40cdb@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/09/2018 23:17, Peter Korsgaard wrote:
>>>>>> "Nicolas" == Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr> writes:
> 
>  > On 9/4/18 12:58 PM, Oscar Gomez Fuente wrote:
>  >> auto eth0
>  >> iface eth0 inet manual
>  >> wait-delay 10
>  >> pre-up ifconfig eth0 up
>  >> pre-up /sbin/udhcpc -R -b -p /var/run/udhcpc.eth0.pid -i eth0
>  >> pre-up /etc/network/nfs_check
>  >> post-down kill -9 $(cat /var/run/udhcpc.eth0.pid)
>  >> post-down ifconfig eth0 down
> 
>  > pre-up will run before the wait_iface hook.  For things that are actually
>  > configuring the interface, you should use up.
>  > (and ifconfig is a bid deprecated these days)

(s/bid/bit/, sorry for the typo)

> 
> Correct. In addition to that, what is the reason why you manually run
> udhcpc instead of just using 'iface eth0 inet dhcp'?

This probably have to do with the fact that the udhcpc options that are used
with method=dhcp are only configurable through a non-obvious way which is the
busybox Kconfig option CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS.

Or it could be the real ifupdown which does not really allow the user to
configure the udhcpc parameters easily. Or the desire to be compatible with both.
