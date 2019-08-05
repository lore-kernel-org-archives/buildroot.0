From: yann.morin at orange.com <yann.morin@orange.com>
Date: Mon, 5 Aug 2019 08:03:26 +0200
Subject: [Buildroot] [PATCH 4/5 v2] toolchain: -fstack-protector-strong
 can be back-ported
In-Reply-To: <f999b059-b1e5-ef8b-412c-79782db7870d@mind.be>
References: <cover.1552392456.git.yann.morin@orange.com>
 <17089_1552392582_5C87A186_17089_130_1_f6f2aff0-c673-4b8c-9779-7e671921c77f@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
 <f999b059-b1e5-ef8b-412c-79782db7870d@mind.be>
Message-ID: <19885_1564985013_5D47C6B5_19885_35_1_20190805060326.GA2435@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-08-03 23:16 +0200, Arnout Vandecappelle spake thusly:
> On 12/03/2019 13:09, yann.morin at orange.com wrote:
> > From: "Yann E. MORIN" <yann.morin@orange.com>
> > 
> > Currently, use of -fstack-protector-strong is only available for gcc
> > starting with 4.9, on the assumption that it appeared with that version.
> > 
> > Although this is true, it happens that quite a few vendors will have
> > back-ported -fstack-protector-strong to older gcc versions (at least 4.8
> > seen in the wild).
> > 
> > Remove the guard against gcc>=4.9, and expand the help text.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
> > Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> > 
> > ---
> > Notes:
> > 
> > We could have changed the guard to something like:
> >     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || BR2_TOOLCHAIN_EXTERNAL
> > 
> > However, the latest gcc we support in the internal toolchain *is*
> > gcc-4.9, so the condition would have always been true. Hence, we just
> > drop the condition.
> 
>  This note is in fact interesting, so I've added it to the commit message.
> However, it would have been more appropriate (if we would have had the
> condition) to make it
> 
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || BR2_TOOLCHAIN_EXTERNAL_CUSTOM

Actually, this would no longer be true, since we recently merged support
for preconfigured toolchains from br2-external trees, and such toolchain
may well be a gcc-4.8 or earlier with back-ported SSP strong.

Regards,
Yann E. MORIN.

> (because we know our predefined external toolchains <4.9 *don't* suport this
> option). In fact, we only have one 4.8 predefined external toolchain: Sourcery
> ARM. So for that one toolchain, it's not worth adding that condition. The
> problem will anyway be caught by the check you just added, because it's also
> executed for predefined external toolchains.
> 
>  Regards,
>  Arnout
> 
> > ---
> >  Config.in | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Config.in b/Config.in
> > index 757ad1ca40..d5a0460f98 100644
> > --- a/Config.in
> > +++ b/Config.in
> > @@ -746,14 +746,14 @@ config BR2_SSP_REGULAR
> >  
> >  config BR2_SSP_STRONG
> >  	bool "-fstack-protector-strong"
> > -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> >  	help
> >  	  Like -fstack-protector but includes additional functions to be
> >  	  protected - those that have local array definitions, or have
> >  	  references to local frame addresses.
> >  
> > -comment "Stack Smashing Protection strong needs a toolchain w/ gcc >= 4.9"
> > -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> > +	  -fstack-protector-strong officially appeared in gcc 4.9, but
> > +	  some vendors have backported -fstack-protector-strong to older
> > +	  versions of gcc.
> >  
> >  config BR2_SSP_ALL
> >  	bool "-fstack-protector-all"
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
