From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 May 2020 23:00:06 +0200
Subject: [Buildroot] [Next] package/kmod: modinfo support of signature
 details
In-Reply-To: <20200515201923.GF12536@scaer>
References: <20200514182806.56592-1-matthew.weber@rockwellcollins.com>
 <20200515201923.GF12536@scaer>
Message-ID: <20200515210006.GG12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, All,

On 2020-05-15 22:19 +0200, Yann E. MORIN spake thusly:
> On 2020-05-14 13:28 -0500, Matt Weber spake thusly:
> > Add conditional support to allow the module tools to use openssl
> > on target to inspect the signature of signed modules. If openssl
> > is not enabled the modinfo will show a hash algo as unknown.
> > 
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> 
> Tested-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> You tagged it for next, but I think we can see that as a fix, as it
> at least ensures build order when enabled, and explicit disabling
> otherwise.

So I applied to master, thanks.

Regards,
Yann E. MORIN.

> Regards,
> Yann E. MORIN.
> 
> > ---
> > Prior to this patch the kmod series for compressed modules should
> > be applied. No functionality dependency, I just identified them as
> > patching conflicts.
> > 
> > http://patchwork.ozlabs.org/project/buildroot/list/?series=174301
> > ---
> >  package/kmod/kmod.mk | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
> > index 979c3e87e6..69615452cf 100644
> > --- a/package/kmod/kmod.mk
> > +++ b/package/kmod/kmod.mk
> > @@ -46,6 +46,13 @@ else
> >  KMOD_CONF_OPTS += --without-xz
> >  endif
> >  
> > +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> > +KMOD_DEPENDENCIES += openssl
> > +KMOD_CONF_OPTS += --with-openssl
> > +else
> > +KMOD_CONF_OPTS += --without-openssl
> > +endif
> > +
> >  ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
> >  KMOD_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
> >  KMOD_CONF_OPTS += --enable-python
> > -- 
> > 2.17.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
