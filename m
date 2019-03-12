From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 12 Mar 2019 10:13:10 +0100
Subject: [Buildroot] [PATCH 2/4] toolchain: check the SSP option is known
In-Reply-To: <ac2d0cfd-efb7-7a6b-3e59-54502e8d40ea@mind.be>
References: <cover.1552286891.git.yann.morin@orange.com>
 <8928_1552286905_5C8604B9_8928_93_1_836f3203-3172-44de-a772-1825aafd915d@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
 <f8725159-1dae-da34-de01-dbf681de2169@mind.be>
 <19507_1552371492_5C874F24_19507_2_1_20190312061810.GB4924@r-lnx-nyma7486-2>
 <ac2d0cfd-efb7-7a6b-3e59-54502e8d40ea@mind.be>
Message-ID: <23669_1552381992_5C877828_23669_160_1_20190312091310.GF4924@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-03-12 09:53 +0100, Arnout Vandecappelle spake thusly:
> On 12/03/2019 07:18, yann.morin at orange.com wrote:
> > Arnout, All,
> > 
> > On 2019-03-12 01:25 +0100, Arnout Vandecappelle spake thusly:
> >> On 11/03/2019 07:48, yann.morin at orange.com wrote:
> >>> From: "Yann E. MORIN" <yann.morin@orange.com>
> >>> Extend the macro that currently checks for SSP in the toolchain, with
> >>> a new test that the actual SSP option is recognised and accepted.
> > [--SNIP--]
> >>  I notice that in vlc.mk, we have
> >>
> >> ax_cv_check_cflags___fstack_protector_strong=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
> > 
> > It should probably be changed to:   $(if $(BR2_SSP_STRONG),yes,no)
> > 
> > I'll check what vlc really wants it for (e.g. strong, all, regular?),
> > fix and send a patch.
> > 
> >> without an actual check that stack-protector=strong really is available... Maybe
> >> we need BR2_TOOLCHAIN_HAS_SSP_STRONG after all?
> > 
> > I really pondered doing it that way, but I decided against, because:
> > 
> >   - our internal toolchain infra only supports gcc >= 4.9, so it has SSP
> >     strong
> > 
> >   - of the external pre-built toolchains, only the codesourcery-arm one
> >     has a gcc-4.8 which lacks SSP strong (and I use that in the cover
> >     letter to explain how to test my changes), all the others have a
> >     gcc >= 4.9
> > 
> > So, we'd have to add this _HAS_SSP_STRONG for a single case.
> 
>  Hm, somehow I missed that in your commit message :-P

ACK, I'll add it to the commit message before submitting v2.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > 
> > Now, the vlc case, fixed as I suggest above, would be covered by this
> > configure-test.
> > 
> > Regards,
> > Yann E. MORIN.
> > 
> >>> Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
> >>> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> >>> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> >>> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >>> ---
> >>>  toolchain/helpers.mk                                   | 8 ++++++++
> >>>  toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
> >>>  2 files changed, 9 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> >>> index e5520c00c3..ba097e83cf 100644
> >>> --- a/toolchain/helpers.mk
> >>> +++ b/toolchain/helpers.mk
> >>> @@ -415,6 +415,7 @@ check_unusable_toolchain = \
> >>>  # Check if the toolchain has SSP (stack smashing protector) support
> >>>  #
> >>>  # $1: cross-gcc path
> >>> +# $2: gcc ssp option
> >>>  #
> >>>  check_toolchain_ssp = \
> >>>  	__CROSS_CC=$(strip $1) ; \
> >>> @@ -427,6 +428,13 @@ check_toolchain_ssp = \
> >>>  		echo "SSP support not available in this toolchain, please disable BR2_TOOLCHAIN_EXTERNAL_HAS_SSP" ; \
> >>>  		exit 1 ; \
> >>>  	fi ; \
> >>> +	__SSP_OPTION=$(2); \
> >>> +	if [ -n "$${__SSP_OPTION}" ] ; then \
> >>> +		if ! echo 'void main(){}' | $${__CROSS_CC} -Werror $${__SSP_OPTION} -x c - -o $(BUILD_DIR)/.br-toolchain-test.tmp >/dev/null 2>&1 ; then \
> >>> +			echo "SSP option $${__SSP_OPTION} not available in this toolchain, please select another SSP level" ; \
> >>> +			exit 1 ; \
> >>> +		fi; \
> >>> +	fi; \
> >>>  	rm -f $(BUILD_DIR)/.br-toolchain-test.tmp*
> >>>  
> >>>  #
> >>> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> >>> index db3570d96f..00cbd7b17a 100644
> >>> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> >>> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> >>> @@ -549,7 +549,7 @@ define $(2)_CONFIGURE_CMDS
> >>>  	else \
> >>>  		$$(call check_glibc,$$$${SYSROOT_DIR}) ; \
> >>>  	fi
> >>> -	$$(Q)$$(call check_toolchain_ssp,$$(TOOLCHAIN_EXTERNAL_CC))
> >>> +	$$(Q)$$(call check_toolchain_ssp,$$(TOOLCHAIN_EXTERNAL_CC),$(BR2_SSP_OPTION))
> >>>  endef
> >>>  
> >>>  $(2)_TOOLCHAIN_WRAPPER_ARGS += $$(TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS)
> >>>
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
