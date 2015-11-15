From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Sun, 15 Nov 2015 18:36:38 +0100
Subject: [Buildroot] [PATCH v3 13/13] package/dhcp: systemd: add
	dhcrelay service file
In-Reply-To: <563A09A7.10002@wsystem.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <1445734779-7212-13-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <CAGduivzruYhUvjMdxw12EB+FaemiJX3p=zsfUra-Ma4dbkEC8g@mail.gmail.com>
 <563A09A7.10002@wsystem.com>
Message-ID: <CA+sos792u5kM98=OK7UeSmRSp5Hu1Yxhc-FgQ2u3unzKO8cp3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime, all,

On Wed, Nov 4, 2015 at 2:35 PM, Beno?t Th?baudeau <benoit@wsystem.com> wrote:
> On 04/11/2015 12:24, Maxime Hadjinlian wrote:
>> On Sun, Oct 25, 2015 at 2:59 AM, Beno?t Th?baudeau <benoit.thebaudeau.dev at gmail.com <mailto:benoit.thebaudeau.dev@gmail.com>> wrote:
[...]
>>     diff --git a/package/dhcp/dhcrelay.service b/package/dhcp/dhcrelay.service
>>     new file mode 100644
>>     index 0000000..5a1410e
>>     --- /dev/null
>>     +++ b/package/dhcp/dhcrelay.service
>>     @@ -0,0 +1,13 @@
>>     +[Unit]
>>     +Description=DHCP relay
>>     +After=network.target
>>     +
>>     +[Service]
>>     +Type=forking
>>     +PIDFile=/run/dhcrelay.pid
>>     +ExecStart=/usr/sbin/dhcrelay -q -pf /run/dhcrelay.pid $OPTIONS $IFCMD $SERVERS
[...]
>>     +KillSignal=SIGINT
>>
>> I did not try to run it, but it doesn't react to SIGTERM ? I did not see anything in the code to prevent it but I only looked at it pretty quickly.
>
> It's also from dhcpd.service. I've searched around and I've not found a good
> reason for it, but there must be one. I'll try and dig more.

There is a reference to it in this very old thread:
http://www.gossamer-threads.com/lists/gentoo/dev/31150

Here too:
https://kb.isc.org/article/AA-01043/0/Recommendations-for-restarting-a-DHCP-failover-pair.html
But this has been implemented in 4.2.0 according to:
https://kb.isc.org/article/AA-01297
But includes/site.h advises against using this feature.

This SIGINT seems to have been copied from Arch Linux for
dhcpd.service. This originates from the following commit, which wants
to make a difference between reload and stop, but without giving any
reason:
https://projects.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/dhcp&id=f60fc1997126ce5f104335d8f09a317300ce8323

Then this commit removed the reload thing:
https://projects.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/dhcp&id=4d45b1bb254995199386eb2c1c8ab703c738d9d6

Looking at the sources, neither 4.1-ESV-R12 nor 4.3.3 seem to make any
difference between SIGTERM and SIGINT. Also, contrary to Arch Linux,
Ubuntu does not use SIGINT at all for dhcpd or dhcrelay, and it's not
because of something in its patches. So I would be in favor of not
using SIGINT in Buildroot too.

>>     +EnvironmentFile=/etc/default/dhcrelay
[...]
>>     +
>>     +[Install]
>>     +WantedBy=multi-user.target
[...]

Best regards,
Beno?t
