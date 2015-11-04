From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 Nov 2015 22:26:43 +0100
Subject: [Buildroot] [PATCH v3 13/13] package/dhcp: systemd: add
 dhcrelay service file
In-Reply-To: <563A09A7.10002@wsystem.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <1445734779-7212-13-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <CAGduivzruYhUvjMdxw12EB+FaemiJX3p=zsfUra-Ma4dbkEC8g@mail.gmail.com>
 <563A09A7.10002@wsystem.com>
Message-ID: <563A7813.9080605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04-11-15 14:35, Beno?t Th?baudeau wrote:
> Hi Maxime, all,
> 
> On 04/11/2015 12:24, Maxime Hadjinlian wrote:
>> On Sun, Oct 25, 2015 at 2:59 AM, Beno?t Th?baudeau <benoit.thebaudeau.dev at gmail.com <mailto:benoit.thebaudeau.dev@gmail.com>> wrote:
[snip]
>>     +ExecStart=/usr/sbin/dhcrelay -q -pf /run/dhcrelay.pid $OPTIONS $IFCMD $SERVERS
>>
>> Why don't we want /var/run/dhcrelay.pid which is the default ? 
> 
> I did that to be consistent with what had been done for dhcpd.service.
> 
> /run is the new norm, but Buildroot configures the dhcp package to use /var/run
> as the default, and the SysV init scripts stick to that.
> 
> I don't know Buildroot's rules about that if any. Maybe dhcp.mk should just be
> updated to use /run. Thomas?

 Since /var/run is currently a symlink to /run, it would be good to update
dhcp.mk as you propose. Or perhaps even remove those configures since I think
they're the default anyway.


 Regards,
 Arnout

> 
>>     +KillSignal=SIGINT
>>
>> I did not try to run it, but it doesn't react to SIGTERM ? I did not see anything in the code to prevent it but I only looked at it pretty quickly.
> 
> It's also from dhcpd.service. I've searched around and I've not found a good
> reason for it, but there must be one. I'll try and dig more.
> 
>>     +EnvironmentFile=/etc/default/dhcrelay
>>
>> Should be 'EnvironmentFile=-/etc/default/dhcrelay'
> 
> This is on purpose. This file is required because IFCMD and SERVERS are required
> too.
> 
>>     +
>>     +[Install]
>>     +WantedBy=multi-user.target
>>     --
>>     2.1.4
> 
> Best regards,
> Beno?t
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
