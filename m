From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 3 Oct 2018 23:03:15 +0200
Subject: [Buildroot] Plug/unplug ethernet connector does not detected on
 Raspberry PI3 B+
In-Reply-To: <CALtfCQbvKXAHjw60eazZ1LzRpuUQH5EuPaDypuUCd3sO=zoYaw@mail.gmail.com>
References: <CALtfCQbvKXAHjw60eazZ1LzRpuUQH5EuPaDypuUCd3sO=zoYaw@mail.gmail.com>
Message-ID: <fae7198d-e632-b1eb-c4d4-d38a15220618@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/10/2018 08:02, Oscar Gomez Fuente wrote:
> Hi everyone,
> 
> I'm using the HW: Raspberry Pi 3B+ and buildroot-2018.02.5 (with
> LINUX_KERNEL_CUSTOM_REPO_VERSION="865ddc1393f558198e7e7ce70928ff2e49c4f7f6") and
> I have the following problem.
> 
> I've started the system with the ethernet unplugged. After the system has
> initiated completely, I log in using the uart console, and I plug the ethernet
> cable, but I'm not able to up eth0 without executing ifup eth0 command.

 You probably want ifplugd.

 Regards,
 Arnout

> 
> This is my /etc/network/interface:
> 
> auto lo
> iface lo inet loopback
> 
> auto eth0
> iface eth0 inet manual
> ? ? ? ? pre-up /etc/network/wait_iface $IFACE 20
> ? ? ? ? pre-up /sbin/ip link set $IFACE up
> ? ? ? ? pre-up /etc/network/nfs_check
> ? ? ? ? pre-up /sbin/udhcpc -R -b -p /var/run/udhcpc.${IFACE}.pid -i $IFACE
> ? ? ? ? post-down /bin/kill -9 $(cat /var/run/udhcpc.${IFACE}.pid)
> ? ? ? ? post-down /sbin/ip link set $IFACE down
> 
> I would like that the ifup eth0 was executed automatically when the plug
> ethernet cable is detected, but it seems to be when I plug/unplug the ethernet
> cable the kernel isn't detect it.
> 
> I've check the same buildroot-2018.02.5 version in the Raspberry pi 3B (instead
> of 3B+) and it works fine, so I think it's something related with the driver
> associated to the phy LAN7515
> The raspberry pi has the LAN9514.
> 
> Does anyone know if there is a problem with the driver associated with the
> LAN9515 (Raspberry Pi 3B+)?
> 
> Best regards.
> 
> Oscar Gomez Fuente
> TST Sistemas
> www.tst-sistemas.es <http://www.tst-sistemas.es>
> ? ?
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
