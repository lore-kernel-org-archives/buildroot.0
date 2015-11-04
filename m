From: =?UTF-8?Q?Beno=c3=aet_Th=c3=a9baudeau?= <benoit@wsystem.com>
Date: Wed, 4 Nov 2015 12:15:37 +0100
Subject: [Buildroot] [PATCH v3 11/13] package/dhcp: systemd: support
	IPv6 lease file
In-Reply-To: <CAGduivyAygSdLT1pmrOCD7mHO8xC2UvHOP2rAk2MnChhPMHmiw@mail.gmail.com>
References: <1445734779-7212-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <1445734779-7212-11-git-send-email-benoit.thebaudeau.dev@gmail.com>
 <CAGduivxGsOm8DRoBsqDAMHx3dkC381C5TvXq_peYiKd1yizyvg@mail.gmail.com>
 <5639DF94.4000505@wsystem.com>
 <CAGduivyAygSdLT1pmrOCD7mHO8xC2UvHOP2rAk2MnChhPMHmiw@mail.gmail.com>
Message-ID: <5639E8D9.7060109@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/11/2015 11:53, Maxime Hadjinlian wrote:
> 
> 
> On Wed, Nov 4, 2015 at 11:36 AM, Beno?t Th?baudeau <benoit at wsystem.com <mailto:benoit@wsystem.com>> wrote:
> 
>     Maxime, all,
> 
>     On 04/11/2015 11:21, Maxime Hadjinlian wrote:
>     > Hi Benoit, all
>     >
>     > On Sun, Oct 25, 2015 at 2:59 AM, Beno?t Th?baudeau <benoit.thebaudeau.dev at gmail.com <mailto:benoit.thebaudeau.dev@gmail.com> <mailto:benoit.thebaudeau.dev at gmail.com <mailto:benoit.thebaudeau.dev@gmail.com>>> wrote:
>     >
>     >     The IPv6 lease file has a different name.
>     >
>     >     Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev at gmail.com <mailto:benoit.thebaudeau.dev@gmail.com> <mailto:benoit.thebaudeau.dev at gmail.com <mailto:benoit.thebaudeau.dev@gmail.com>>>
>     >
>     >     ---
>     >     Changes v2 -> v3: new patch.
>     >     ---
>     >      package/dhcp/dhcp.mk <http://dhcp.mk> <http://dhcp.mk> | 2 ++
>     >      1 file changed, 2 insertions(+)
>     >
>     >     diff --git a/package/dhcp/dhcp.mk <http://dhcp.mk> <http://dhcp.mk> b/package/dhcp/dhcp.mk <http://dhcp.mk> <http://dhcp.mk>
>     >     index c05e694..3aa1577 100644
>     >     --- a/package/dhcp/dhcp.mk <http://dhcp.mk> <http://dhcp.mk>
>     >     +++ b/package/dhcp/dhcp.mk <http://dhcp.mk> <http://dhcp.mk>
>     >     @@ -83,6 +83,8 @@ define DHCP_INSTALL_INIT_SYSTEMD
>     >                     $(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
>     >             echo "f /var/lib/dhcp/dhcpd.leases - - - - -" >> \
>     >                     $(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
>     >     +       echo "f /var/lib/dhcp/dhcpd6.leases - - - - -" >> \
>     >     +               $(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
>     >      endef
>     >      endif
>     >
>     > Reviewed-by: "Maxime Hadjinlian" <maxime.hadjinlian at gmail.com <mailto:maxime.hadjinlian@gmail.com> <mailto:maxime.hadjinlian at gmail.com <mailto:maxime.hadjinlian@gmail.com>>>
>     >
>     > A question though, from the manual page of dhcpd, by default it starts as an IPv6 server should we have, two services one with '-4' and one with '-6' ? And it's left to the user to specify it in the "$OPTIONS" ? Maybe this should be mentioned somewhere ?
> 
>     '-4' is the default, not '-6'. 
> 
> If I look at ./server/dhcpd.8 in the sources of dhcp-4.1-ESVR12, it clearly states:
> 
> -6 Run as a DHCPv6 server. This is the default and cannot be combined with -4. 

My bad: I had looked at the man page of another version.

>     A single instance of dhcpd cannot be run with
>     both '-4' and '-6'. I don't know if it's possible (or desirable) to safely run
>     simultaneously two instances of dhcpd, one with '-4' and the other one with
>     '-6'.
> 
> Well it could be useful if you are trying to build a network appliance and you want to support both stack. So you would want to start two processes with different options. Maybe that's something that should be left to the users to figure out.

Yes, but should everything be duplicated in Buildroot just for this purpose? For
SysV, it's easy not to duplicate things, but how would you do that with systemd?
How do distributions handle this?

>     "$OPTIONS" is designed exactly for such things. Users should read the man page
>     of dhcpd to know what may fit in there.
> 
> I understood what was "$OPTIONS" about, I just worry that it's a bit "hidden" for the users, but maybe they should know what they are doing. 

It's not possible to document everything, but there are comments about the
meaning of these variables in the SysV init scripts, so I can add such comments
to the .service files too.

Best regards,
Beno?t
