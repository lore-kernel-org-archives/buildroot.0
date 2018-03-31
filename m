From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Mar 2018 15:17:29 +0200
Subject: [Buildroot] [PATCH] netcat: add forced dependence on BusyBox
In-Reply-To: <804dc052-7333-f82d-0650-abbfc67580f9@mind.be>
References: <20171012151418.3523-1-casantos@datacom.ind.br>
 <20171012151418.3523-2-casantos@datacom.ind.br>
 <00cfde34-7006-40de-ecb5-307418aa97b8@smile.fr>
 <804dc052-7333-f82d-0650-abbfc67580f9@mind.be>
Message-ID: <20180331131729.GD25161@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-03-31 15:03 +0200, Arnout Vandecappelle spake thusly:
> On 31-03-18 12:34, Romain Naour wrote:
> > Hi Carlos,
> > 
> > Le 12/10/2017 ? 17:14, Carlos Santos a ?crit?:
> >> It may be necessary if packages become built in parallel, leading to a
> >> race condition on the creation of the "nc" link. Moreover, netcat is as
> >> shy as BusyBox and would not override an existing file/link, so we must
> >> remove $(TARGET_DIR)/usr/bin/nc in advance.
> >>
> >> Of course this still leaves a race conditon if other netcat competitors
> >> but we must assume thet the user is a grown-up person who knows what is
> >> doing.
> > 
> > It seems you are using a custom busybox config file because the netcat applet is
> > disabled by default.
> > 
> > I'm agree, the dependency on busybox is missing but the TARGET_HOOKS doesn't
> > seems necessary. I removed it and netcat package is able to override the busybox
> > symlink.
> > 
> >  /usr/bin/install -c netcat output/target/usr/bin/netcat
> 
>  And anyway, in the context of PPS we will eventually have to reverse the
> busybox dependencies, i.e. busybox will depend on netcat.

Actually, we can do that even before PPS...

Regards,
Yann E. MORIN.

> > Maybe we should check if other packages depending on
> > BR2_PACKAGE_BUSYBOX_SHOW_OTHERS have a dependency on busybox.
> 
>  check-uniq-files should cover this.
> 
>  Regards,
>  Arnout
> 
> > 
> > Best regards,
> > Romain
> > 
> >>
> >> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> >> ---
> >>  package/netcat/netcat.mk | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
> >> index eb7ddcac27..c032eea56d 100644
> >> --- a/package/netcat/netcat.mk
> >> +++ b/package/netcat/netcat.mk
> >> @@ -9,4 +9,15 @@ NETCAT_SITE = http://downloads.sourceforge.net/project/netcat/netcat/$(NETCAT_VE
> >>  NETCAT_LICENSE = GPL-2.0+
> >>  NETCAT_LICENSE_FILES = COPYING
> >>  
> >> +# Ensure Busybox gets built/installed before, so that this package
> >> +# overrides Busybox nc. We must remove an existing file/link because
> >> +# netcat is as shy as Busybox and would not override existing files.
> >> +ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> >> +NETCAT_DEPENDENCIES += busybox
> >> +define NETCAT_RMOVE_NC_LINK
> >> +	rm -f $(TARGET_DIR)/usr/bin/nc
> >> +endef
> >> +NETCAT_PRE_INSTALL_TARGET_HOOKS += NETCAT_RMOVE_NC_LINK
> >> +endif
> >> +
> >>  $(eval $(autotools-package))
> >>
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
