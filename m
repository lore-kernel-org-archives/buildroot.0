From: yann.morin at orange.com <yann.morin@orange.com>
Date: Wed, 13 Mar 2019 08:27:07 +0100
Subject: [Buildroot] [PATCH 3/5 v2] toolchain: check the SSP option is
 known
In-Reply-To: <7ac2b57b-4f33-b661-e80f-6d4d30ebe469@mind.be>
References: <cover.1552392456.git.yann.morin@orange.com>
 <6137_1552392583_5C87A187_6137_470_1_3090e77d-fd75-49ec-8643-3a89ee5ea133@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
 <7ac2b57b-4f33-b661-e80f-6d4d30ebe469@mind.be>
Message-ID: <9577_1552462030_5C88B0CE_9577_184_5_20190313072707.GA3315@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-03-13 00:25 +0100, Arnout Vandecappelle spake thusly:
> On 12/03/2019 13:09, yann.morin at orange.com wrote:
> > From: "Yann E. MORIN" <yann.morin@orange.com>
[--SNIP--]
> > Note that the SSP option is either totaly empty, or an already-quoted
> > string, so we can safely and easily assign it to a shell variable to
> > test and use it.

Please note this paragraph above, and...

[--SNIP--]
> > @@ -427,6 +428,13 @@ check_toolchain_ssp = \
> >  		echo "SSP support not available in this toolchain, please disable BR2_TOOLCHAIN_EXTERNAL_HAS_SSP" ; \
> >  		exit 1 ; \
> >  	fi ; \
> > +	__SSP_OPTION=$(2); \
> 
>  Is there any reason to pass this as an argument rather than using
> $(BR2_SSP_OPTION) directly?

... correlate it with your question here.

There are two cases:

  - no SSP      BR2_SSP_OPTION is not defined, so it is not even the
                empty quoted string ""

  - some SSP    BR2_SSP_OPTION is a non-empty quoted string.

So...

> > +	if [ -n "$${__SSP_OPTION}" ] ; then \

... this test would have to use the qstrip-then-quote-anyway dance.

And finally, I tried to mimick the existing code, which lead to the
current patch: pass the option as a parameter to the macro, and use an
intermediate shell variable.

Regards,
Yann E. MORIN.

> > +		if ! echo 'void main(){}' | $${__CROSS_CC} -Werror $${__SSP_OPTION} -x c - -o $(BUILD_DIR)/.br-toolchain-test.tmp >/dev/null 2>&1 ; then \
> > +			echo "SSP option $${__SSP_OPTION} not available in this toolchain, please select another SSP level" ; \
> > +			exit 1 ; \
> > +		fi; \
> > +	fi; \
> >  	rm -f $(BUILD_DIR)/.br-toolchain-test.tmp*
> >  
> >  #
> > diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> > index db3570d96f..00cbd7b17a 100644
> > --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> > +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> > @@ -549,7 +549,7 @@ define $(2)_CONFIGURE_CMDS
> >  	else \
> >  		$$(call check_glibc,$$$${SYSROOT_DIR}) ; \
> >  	fi
> > -	$$(Q)$$(call check_toolchain_ssp,$$(TOOLCHAIN_EXTERNAL_CC))
> > +	$$(Q)$$(call check_toolchain_ssp,$$(TOOLCHAIN_EXTERNAL_CC),$(BR2_SSP_OPTION))
> >  endef
> >  
> >  $(2)_TOOLCHAIN_WRAPPER_ARGS += $$(TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS)
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
