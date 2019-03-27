From: yann.morin at orange.com <yann.morin@orange.com>
Date: Wed, 27 Mar 2019 07:35:40 +0100
Subject: [Buildroot] [PATCH 3/5 v2] toolchain: check the SSP option is
 known
In-Reply-To: <20190326202628.02dfe936@windsurf>
References: <cover.1552392456.git.yann.morin@orange.com>
 <6137_1552392583_5C87A187_6137_470_1_3090e77d-fd75-49ec-8643-3a89ee5ea133@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
 <20190326202628.02dfe936@windsurf>
Message-ID: <16232_1553668542_5C9B19BE_16232_285_1_20190327063540.GA2571@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-03-26 20:26 +0100, Thomas Petazzoni spake thusly:
> On Tue, 12 Mar 2019 13:09:34 +0100
> <yann.morin@orange.com> wrote:
> 
> >  # $1: cross-gcc path
> > +# $2: gcc ssp option
> >  #
> >  check_toolchain_ssp = \
> >  	__CROSS_CC=$(strip $1) ; \
> > @@ -427,6 +428,13 @@ check_toolchain_ssp = \
> >  		echo "SSP support not available in this toolchain, please disable BR2_TOOLCHAIN_EXTERNAL_HAS_SSP" ; \
> >  		exit 1 ; \
> >  	fi ; \
> > +	__SSP_OPTION=$(2); \
> > +	if [ -n "$${__SSP_OPTION}" ] ; then \
> > +		if ! echo 'void main(){}' | $${__CROSS_CC} -Werror $${__SSP_OPTION} -x c - -o $(BUILD_DIR)/.br-toolchain-test.tmp >/dev/null 2>&1 ; then \
> > +			echo "SSP option $${__SSP_OPTION} not available in this toolchain, please select another SSP level" ; \
> > +			exit 1 ; \
> > +		fi; \
> > +	fi; \
> 
> Does it really make sense to check for both -fstack-protector (in the
> code that already exists) *and* BR2_SSP_OPTION ?
> 
> Wouldn't it make more sense to just check for BR2_SSP_OPTION ?

My reasoning behind this additional test, is that there are two things
we need to test:

  * does the toolchain have SSP support (or not) as claimed by the user?

  * does the toolchain actually support the SSP level requested by the
    user?

There are packages that, wrongly or rightfully so, are not concerned
with te SSP level, but just the fact that there is SSP or not.

So, I decided to keep the existing test, and expand it. It means that we
may indeed check for -fstack-protector twice.

Regards,
Yann E. MORIN.

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
