From: =?UTF-8?Q?Beno=c3=aet_Th=c3=a9baudeau?= <benoit@wsystem.com>
Date: Mon, 9 Nov 2015 11:49:20 +0100
Subject: [Buildroot] [PATCH v3 11/13] package/dhcp: systemd: support
	IPv6 lease file
In-Reply-To: <CAGduivz2ChrAgNgxM-a33JN_Eh7aFsfSKpq_vT0hRd7sNTt_zw@mail.gmail.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <1445734779-7212-11-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <CAGduivxGsOm8DRoBsqDAMHx3dkC381C5TvXq_peYiKd1yizyvg@mail.gmail.com>
 <5639DF94.4000505@wsystem.com>
 <CAGduivyAygSdLT1pmrOCD7mHO8xC2UvHOP2rAk2MnChhPMHmiw@mail.gmail.com>
 <5639E8D9.7060109@wsystem.com>
 <CAGduivz2ChrAgNgxM-a33JN_Eh7aFsfSKpq_vT0hRd7sNTt_zw@mail.gmail.com>
Message-ID: <56407A30.1050404@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime, all,

On 04/11/2015 12:31, Maxime Hadjinlian wrote:
>>>     > A question though, from the manual page of dhcpd, by default it starts as an IPv6 server should we have, two services one with '-4' and one with '-6' ? And it's left to the user to specify it in the "$OPTIONS" ? Maybe this should be mentioned somewhere ?
>>>
>>>     '-4' is the default, not '-6'. 
>>>
>>> If I look at ./server/dhcpd.8 in the sources of dhcp-4.1-ESVR12, it clearly states:
>>>
>>> -6 Run as a DHCPv6 server. This is the default and cannot be combined with -4. 
>> 
>> My bad: I had looked at the man page of another version.

Actually, this dhcpd.8 is wrong. Looking at common/discover.c:
    int local_family = AF_INET;

So IPv4 really is the default, and this is confirmed by the behavior.

This documentation issue is fixed in 4.3.3. A version bump would be great, all
the more the EoL date of 4.1-ESV-R12 is Dec. 2015. I'll see if I can quickly add
that to my series.

>     >     A single instance of dhcpd cannot be run with
>     >     both '-4' and '-6'. I don't know if it's possible (or desirable) to safely run
>     >     simultaneously two instances of dhcpd, one with '-4' and the other one with
>     >     '-6'.
>     >
>     > Well it could be useful if you are trying to build a network appliance and you want to support both stack. So you would want to start two processes with different options. Maybe that's something that should be left to the users to figure out.
> 
>     Yes, but should everything be duplicated in Buildroot just for this purpose? For
>     SysV, it's easy not to duplicate things, but how would you do that with systemd?
>     How do distributions handle this?
> 
> I only looked at Arch Linux, they duplicate the service file. It's also possible to use the template mechanisms in systemd, to have something like dhcpd at .service and when you enable it, you create a symlink called dhcpd at 4.service, and the '4' is passed as argument to the template and you can use it however you want it to.

Ubuntu duplicates the service files too. And all the service files come from the
same package.

How do we want to handle that in Buildroot?
1/ Always start IPv4 and IPv6 instances like Ubuntu does. This is wasting
   resources if one of them is actually unused.
2/ Add a Kconfig choice - common to all the selected DHCP daemons - between
   "only IPv4", "only IPv6", and "IPv4 + IPv6".
3/ Use /etc/default/dhcpd and the like. We could detect the presence of
   /etc/default/dhcpd vs. /etc/default/dhcpd6, or of some variables in them, or
   of /etc/dhcp/dhcpd.conf vs. /etc/dhcp/dhcpd6.conf. Something like that seems
   to be easier to use, but less obvious for users unless well documented.

Best regards,
Beno?t
