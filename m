From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 12 Mar 2019 07:22:09 +0100
Subject: [Buildroot] [PATCH 4/4] toolchain: allow PIC/PIE without RELRO
In-Reply-To: <3c26a901-4f69-163b-266a-5627f818b75c@mind.be>
References: <cover.1552286891.git.yann.morin@orange.com>
 <11977_1552286921_5C8604BE_11977_87_1_9c1d9253-d6be-4870-a4dd-b45f5c87742f@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
 <3c26a901-4f69-163b-266a-5627f818b75c@mind.be>
Message-ID: <32338_1552371732_5C875014_32338_448_1_20190312062209.GC4924@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-03-12 01:36 +0100, Arnout Vandecappelle spake thusly:
> On 11/03/2019 07:48, yann.morin at orange.com wrote:
> > From: "Yann E. MORIN" <yann.morin@orange.com>
> > 
> > Note: it is unknown if RELRO_FULL really needs PIC/PIE or not, so we
> > keep the current situation, where RELRO-FULL forces PIC/PIE compilation.
> 
>  I just checked on my host, and a simple test program compiled with -no-pie
> -Wl,-z,relro -Wl,-z,now does work, so indeed the two seem to be independent.

Still, I'd prefer tokeep the select to keep the current behaviour. We
can drop it later on if someone has a need for it.

>  I guess it's historical accident that the global full relro and PIE are
> typically introduced together. From what I understand, they are pretty much
> independent.

I talked with Matt on IRC about this the other day, and his reasoning
for doing so as it is was to mimick the way done on distros (Debian,
FC?), so it is not a complete accident either. ;-)

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
> > Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> > ---
> >  Config.in                      | 8 ++++++++
> >  toolchain/toolchain-wrapper.c  | 2 +-
> >  toolchain/toolchain-wrapper.mk | 4 ++++
> >  3 files changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Config.in b/Config.in
> > index d5a0460f98..31fea3ab34 100644
> > --- a/Config.in
> > +++ b/Config.in
> > @@ -712,6 +712,13 @@ endmenu
> >  
> >  comment "Security Hardening Options"
> >  
> > +config BR2_PIC_PIE
> > +	bool "Build code with PIC/PIE"
> > +	depends on BR2_SHARED_LIBS
> > +	help
> > +	  Generate Position-Independent Code (PIC) and link
> > +	  Position-Independent Executables (PIE).
> > +
> >  choice
> >  	bool "Stack Smashing Protection"
> >  	default BR2_SSP_ALL if BR2_ENABLE_SSP # legacy
> > @@ -794,6 +801,7 @@ config BR2_RELRO_PARTIAL
> >  
> >  config BR2_RELRO_FULL
> >  	bool "Full"
> > +	select BR2_PIC_PIE
> >  	help
> >  	  This option includes the partial configuration, but also marks
> >  	  the GOT as read-only at the cost of initialization time during
> > diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> > index d605a7d648..a38f827786 100644
> > --- a/toolchain/toolchain-wrapper.c
> > +++ b/toolchain/toolchain-wrapper.c
> > @@ -370,7 +370,7 @@ int main(int argc, char **argv)
> >  		*cur++ = "-Wno-builtin-macro-redefined";
> >  	}
> >  
> > -#ifdef BR2_RELRO_FULL
> > +#ifdef BR2_PIC_PIE
> >  	/* Patterned after Fedora/Gentoo hardening approaches.
> >  	 * https://fedoraproject.org/wiki/Changes/Harden_All_Packages
> >  	 * https://wiki.gentoo.org/wiki/Hardened/Toolchain#Position_Independent_Executables_.28PIEs.29
> > diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
> > index e48e765a8e..67cec5c1cf 100644
> > --- a/toolchain/toolchain-wrapper.mk
> > +++ b/toolchain/toolchain-wrapper.mk
> > @@ -45,6 +45,10 @@ ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
> >  TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
> >  endif
> >  
> > +ifeq ($(BR2_PIC_PIE),y)
> > +TOOLCHAIN_WRAPPER_ARGS += -DBR2_PIC_PIE
> > +endif
> > +
> >  ifeq ($(BR2_RELRO_PARTIAL),y)
> >  TOOLCHAIN_WRAPPER_ARGS += -DBR2_RELRO_PARTIAL
> >  else ifeq ($(BR2_RELRO_FULL),y)
> > 

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
