From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 12:22:35 +0200
Subject: [Buildroot] [RFC PATCH v2] pkg-generic: detect incorrectly used
	package
In-Reply-To: <87k2sev28x.fsf@dell.be.48ers.dk>
References: <1440783754-32663-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87k2sev28x.fsf@dell.be.48ers.dk>
Message-ID: <20150829122235.3b8210a5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sat, 29 Aug 2015 12:05:18 +0200, Peter Korsgaard wrote:

>  > Still sent as an RFC. Maybe we should make this optional, since it
>  > prevents from doing "make <pkg>" when "<pkg>" is not selected in
>  > menuconfig, which can be seen as annoying for power users. So maybe we
>  > could enable this only in the autobuilders? But then newcomers writing
>  > new packages would not notice their potential mistake.
> 
> Yes, that's indeed something I do very often. Alternatively we can
> perhaps extend the logic to also check MAKECMDGOALS and only trigger for
> empty / default builds.

That could be an option, indeed. Only enable this check if MAKECMDGOALS
is empty or "all" ?

>  > index 6a7d97e..7db5ab8 100644
>  > --- a/package/pkg-generic.mk
>  > +++ b/package/pkg-generic.mk
>  > @@ -143,6 +143,10 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
>  
>  >  # Configure
>  >  $(BUILD_DIR)/%/.stamp_configured:
>  > +	if test "$(TYPE)" = "target" -a -z "$($(KCONFIG_VAR))" ; then \
>  > +		echo "ERROR: package $(PKG) is being built but is not enabled in the configuration." ; \
>  > +		exit 1 ; \
>  > +	fi
> 
> This should imho also use @.

Aah, yes. I actually had a @ at some point during my development, until
the point where I had to debug this :)

> It would be good if the error message would be more clear about what the
> problem is and how to fix it. Something like:
> 
> A package must have added $(PKG) to its _DEPENDENCIES line but forgot to
> add the corresponding select / depends on $(KCONFIG_VAR). Please review
> your packages and try again.

Will fix.

Thanks for the suggestions!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
