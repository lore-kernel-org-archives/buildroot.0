From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Dec 2018 09:31:42 +0100
Subject: [Buildroot] [PATCH v2,
 2/2] lxc: fix build without stack protector
In-Reply-To: <20181204081511.3vxelx4rdxykqozt@sapphire.tkos.co.il>
References: <20181203223855.10152-1-fontaine.fabrice@gmail.com>
 <20181203223855.10152-2-fontaine.fabrice@gmail.com>
 <20181204055439.rhfgmyb6w7ijykx6@sapphire.tkos.co.il>
 <20181204091029.01a78c0e@windsurf>
 <20181204081511.3vxelx4rdxykqozt@sapphire.tkos.co.il>
Message-ID: <20181204093142.51b1f30d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 4 Dec 2018 10:15:11 +0200, Baruch Siach wrote:

> > The question is whether we want SSP support to be enabled as soon as
> > the toolchain *has* SSP support, or only when the user explicitly
> > request SSP support using BR2_SSP_{REGULAR,STRONG,ALL} ?
> > 
> > This is a real policy decision:
> > 
> >  - Do we let the packages default to what they think is good (of course
> >    as long as the toolchain provides what's needed) ?
> > 
> >  - Or do we enforce the system-level configuration options that
> >    Buildroot has ?  
> 
> I think we should let upstream packages decide when to enable SSP. This patch, 
> however, disables SSP unconditionally, AFAICS. I don't think we want to do 
> that. So I suggest to force SSP disable only when BR2_TOOLCHAIN_HAS_SSP is 
> disabled.

Well, Fabrice patch doesn't really disable SSP unconditionally: it
tells the package to never enable SSP on its own.

However, if one of the global BR2_SSP_{REGULAR,STRONG,ALL} options are
enabled, the compiler wrapper will properly build everything with SSP
support, including lxc. So basically, Fabrice's patch is a correct
implementation for the option (2) I described above.

I don't (yet?) have a strong opinion on which of the two options we
want to chose, but Fabrice's solution does implement one of them
correctly :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
