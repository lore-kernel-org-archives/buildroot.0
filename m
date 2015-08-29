From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2015 12:05:18 +0200
Subject: [Buildroot] [RFC PATCH v2] pkg-generic: detect incorrectly used
	package
In-Reply-To: <1440783754-32663-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 28 Aug 2015 19:42:34 +0200")
References: <1440783754-32663-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k2sev28x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > In Buildroot, the selection of a package from a Config.in level and
 > from a Makefile level are completely disconnected. This can lead to
 > issues where the build of a package is triggered at the Makefile level
 > due to the package being listed in another package <pkg>_DEPENDENCIES
 > variable, even if that package is not enabled in the configuration.

[snip]

> ---
 > Still sent as an RFC. Maybe we should make this optional, since it
 > prevents from doing "make <pkg>" when "<pkg>" is not selected in
 > menuconfig, which can be seen as annoying for power users. So maybe we
 > could enable this only in the autobuilders? But then newcomers writing
 > new packages would not notice their potential mistake.

Yes, that's indeed something I do very often. Alternatively we can
perhaps extend the logic to also check MAKECMDGOALS and only trigger for
empty / default builds.

 > index 6a7d97e..7db5ab8 100644
 > --- a/package/pkg-generic.mk
 > +++ b/package/pkg-generic.mk
 > @@ -143,6 +143,10 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
 
 >  # Configure
 >  $(BUILD_DIR)/%/.stamp_configured:
 > +	if test "$(TYPE)" = "target" -a -z "$($(KCONFIG_VAR))" ; then \
 > +		echo "ERROR: package $(PKG) is being built but is not enabled in the configuration." ; \
 > +		exit 1 ; \
 > +	fi

This should imho also use @.

It would be good if the error message would be more clear about what the
problem is and how to fix it. Something like:

A package must have added $(PKG) to its _DEPENDENCIES line but forgot to
add the corresponding select / depends on $(KCONFIG_VAR). Please review
your packages and try again.

-- 
Bye, Peter Korsgaard
