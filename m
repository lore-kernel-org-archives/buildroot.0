From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 20 Nov 2018 08:32:17 +0100
Subject: [Buildroot] [PATCH v3 3/3] make: configure host-make with host-
 prefix
In-Reply-To: <20181119162515.20360-3-peter@korsgaard.com>
References: <20181119162515.20360-1-peter@korsgaard.com>
 <20181119162515.20360-3-peter@korsgaard.com>
Message-ID: <2665_1542699148_5BF3B88C_2665_329_1_20181120073217.GD25610@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-11-19 17:25 +0100, Peter Korsgaard spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/e29/e293aadc692d2ed337881ef2172ddf66a60bc05c/
> 
> And many more.
> 
> Install as 'host-make' rather than just 'make', as that otherwise confuses a
> number of packages when they invoke recursive / sub-make.  The internal job
> control logic of GNU make is version dependant, so mixing versions may lead
> to issues like:
> 
> make[1]: Entering directory `/home/peko/autobuild/instance-0/output/build/boa-0.94.14rc21'
> (cd src && make -w --jobserver-fds=5,6 -j)
> make: unrecognized option '--jobserver-fds=5,6'
> 
> With this rename, only packages explicitly opting in for our host-make
> (using the BR2_MAKE / BR2_MAKE_HOST_DEPENDENCY logic) will use it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Acked-by: "Yann E. MORIN" <yann.morin@orange.com>

A comment below, probably interesting for Thomas...

> ---
> v3: use --program-prefix instead of renaming post-install as suggested by Yann.
> v2: No changes
> 
>  package/make/make.mk                    | 4 ++++
>  support/dependencies/check-host-make.mk | 4 ++--
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/make/make.mk b/package/make/make.mk
> index 1471576850..10082353a2 100644
> --- a/package/make/make.mk
> +++ b/package/make/make.mk
> @@ -23,5 +23,9 @@ endif
>  HOST_MAKE_DEPENDENCIES = host-pkgconf
>  HOST_MAKE_CONF_OPTS = --without-guile
>  
> +# Configure host-make binary to be 'host-make' to ensure it isn't
> +# accidently used by packages when they invoke recursive / sub-make.
> +HOST_MAKE_CONF_OPTS += --program-prefix=host-
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> diff --git a/support/dependencies/check-host-make.mk b/support/dependencies/check-host-make.mk
> index 4235a393fd..66560ee85c 100644
> --- a/support/dependencies/check-host-make.mk
> +++ b/support/dependencies/check-host-make.mk
> @@ -12,8 +12,8 @@ BR2_MAKE ?= $(call suitable-host-package,make,\
>  	$(BR2_MAKE_VERSION_MIN) $(MAKE))
>  
>  ifeq ($(BR2_MAKE),)
> -BR2_MAKE = $(HOST_DIR)/bin/make -j$(PARALLEL_JOBS)
> -BR2_MAKE1 = $(HOST_DIR)/bin/make -j1
> +BR2_MAKE = $(HOST_DIR)/bin/host-make -j$(PARALLEL_JOBS)
> +BR2_MAKE1 = $(HOST_DIR)/bin/host-make -j1

Here, for top-level parallel build, we might have to propagate the
--jobserver-fds, by setting it from $(MAKEFLAGS).

Regards,
Yann E. MORIN.

>  BR2_MAKE_HOST_DEPENDENCY = host-make
>  else
>  BR2_MAKE = $(MAKE)
> -- 
> 2.11.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

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
