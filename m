From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Sun, 15 Nov 2015 18:55:32 +0100
Subject: [Buildroot] [PATCH v3 11/13] package/dhcp: systemd: support
	IPv6 lease file
In-Reply-To: <CAGduivw6uX9yEFiMA6XtNM3w8zPfEg96o+7ZS1ZcvfsJB0mcLQ@mail.gmail.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <1445734779-7212-11-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <CAGduivxGsOm8DRoBsqDAMHx3dkC381C5TvXq_peYiKd1yizyvg@mail.gmail.com>
 <5639DF94.4000505@wsystem.com>
 <CAGduivyAygSdLT1pmrOCD7mHO8xC2UvHOP2rAk2MnChhPMHmiw@mail.gmail.com>
 <5639E8D9.7060109@wsystem.com>
 <CAGduivz2ChrAgNgxM-a33JN_Eh7aFsfSKpq_vT0hRd7sNTt_zw@mail.gmail.com>
 <56407A30.1050404@wsystem.com>
 <CAGduivw6uX9yEFiMA6XtNM3w8zPfEg96o+7ZS1ZcvfsJB0mcLQ@mail.gmail.com>
Message-ID: <CA+sos79n2A+-eyLSgiMYsq8+7C9Ark7PVXKcL84bB=wn6vr5-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime, all,

On Thu, Nov 12, 2015 at 11:42 AM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> On Mon, Nov 9, 2015 at 11:49 AM, Beno?t Th?baudeau <benoit@wsystem.com>
> wrote:
>> On 04/11/2015 12:31, Maxime Hadjinlian wrote:
>> >     >     A single instance of dhcpd cannot be run with
>> >     >     both '-4' and '-6'. I don't know if it's possible (or
>> > desirable) to safely run
>> >     >     simultaneously two instances of dhcpd, one with '-4' and the
>> > other one with
>> >     >     '-6'.
>> >     >
>> >     > Well it could be useful if you are trying to build a network
>> > appliance and you want to support both stack. So you would want to start two
>> > processes with different options. Maybe that's something that should be left
>> > to the users to figure out.
>> >
>> >     Yes, but should everything be duplicated in Buildroot just for this
>> > purpose? For
>> >     SysV, it's easy not to duplicate things, but how would you do that
>> > with systemd?
>> >     How do distributions handle this?
>> >
>> > I only looked at Arch Linux, they duplicate the service file. It's also
>> > possible to use the template mechanisms in systemd, to have something like
>> > dhcpd at .service and when you enable it, you create a symlink called
>> > dhcpd at 4.service, and the '4' is passed as argument to the template and you
>> > can use it however you want it to.
>>
>> Ubuntu duplicates the service files too. And all the service files come
>> from the
>> same package.
>>
>> How do we want to handle that in Buildroot?
>> 1/ Always start IPv4 and IPv6 instances like Ubuntu does. This is wasting
>>    resources if one of them is actually unused.
>> 2/ Add a Kconfig choice - common to all the selected DHCP daemons -
>> between
>>    "only IPv4", "only IPv6", and "IPv4 + IPv6".
>> 3/ Use /etc/default/dhcpd and the like. We could detect the presence of
>>    /etc/default/dhcpd vs. /etc/default/dhcpd6, or of some variables in
>> them, or
>>    of /etc/dhcp/dhcpd.conf vs. /etc/dhcp/dhcpd6.conf. Something like that
>> seems
>>    to be easier to use, but less obvious for users unless well documented.
>>
> In my humble opinion, I would go for the Kconfig options as I find this
> easier for the end user and to maintain.

Actually, I've just noticed that, while it installs both IPv4 and IPv6
startup mechanisms, Ubuntu uses ConditionPathExists with
/etc/dhcp/dhcpd.conf and /etc/dhcp/dhcpd6.conf to skip the dhcpd
service if its required configuration file is not present, just like
what is currently done by Buildroot's S80dhcp-server. In Buildroot,
that would mean having to tweak the rootfs overlay and/or the
post-build script to choose what to run. This would have to be done
anyway with Kconfig options in order not to keep the default
dhcpd.conf, which is not very useful, so it may be more flexible not
to have Kconfig options. Thomas?
