From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 25 Mar 2019 20:22:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/keepalived: add optional
 nftables dependency
In-Reply-To: <20190325185421.6141a000@windsurf>
References: <20190324120016.28701-1-fontaine.fabrice@gmail.com>
 <87h8bsmq9q.fsf@tarshish> <20190325185421.6141a000@windsurf>
Message-ID: <20190325182227.dr6qkvvh4dq3gb55@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Mar 25, 2019 at 06:54:21PM +0100, Thomas Petazzoni wrote:
> On Sun, 24 Mar 2019 14:05:21 +0200
> Baruch Siach <baruch@tkos.co.il> wrote:
> 
> > > +ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES),y)
> > > +KEEPALIVED_DEPENDENCIES += iptables
> > > +KEEPALIVED_CONF_OPTS += --enable-nftables  
> > 
> > What do you need that for? Please explain in the commit log and in an
> > inline comment.
> 
> I'm not sure what needs to be further explained. The fact that nftables
> can be provided either by the iptables package or by the nftables
> package ? Baruch, could you clarify what additional explanations you
> are looking for ?

I had the impression that BR2_PACKAGE_IPTABLES_NFTABLES itself depends on 
BR2_PACKAGE_NFTABLES to provide nftables support. I see now that this is not 
the case. Still, the fact that --enable-nftables enables support for both 
packages looks strange. So I think that a comment that says something like 
"iptables and nftables both provide compatible API" would be nice.

BTW, what happens when both BR2_PACKAGE_NFTABLES and 
BR2_PACKAGE_IPTABLES_NFTABLES are enabled? Do both coexist? If they do, I see 
no way for keepalived to know which library to link against. iptables will 
always build before keepalived because it optionally depends on 
BR2_PACKAGE_IPTABLES anyway. But nftables might not build before keepalived in 
that case.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
