From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Nov 2013 22:54:56 +0100
Subject: [Buildroot] [PATCH 1/1] omniorb: add COS Naming Service
In-Reply-To: <1384288305-4945-1-git-send-email-mlweber1@rockwellcollins.com>
References: <1384288305-4945-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <20131112225456.6012af43@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Tue, 12 Nov 2013 14:31:45 -0600, Matt Weber wrote:
> 
> Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
> ---
>  package/omniorb/Config.in  |    9 +++++++++
>  package/omniorb/omniorb.mk |    8 ++++++++
>  2 files changed, 17 insertions(+), 0 deletions(-)
> 
> diff --git a/package/omniorb/Config.in b/package/omniorb/Config.in
> index 6326688..22527fc 100644
> --- a/package/omniorb/Config.in
> +++ b/package/omniorb/Config.in
> @@ -10,5 +10,14 @@ config BR2_PACKAGE_OMNIORB
>  
>  	  http://omniorb.sourceforge.net/
>  
> +if BR2_PACKAGE_OMNIORB
> +
> +config BR2_PACKAGE_OMNIORB_WITH_SERVICES
> +        bool "COS Naming Service"
> +        default y
> +        help
> +          omniORB COS Naming Service

Use tab for indentation (and one tab + two spaces for the help text).

> +define OMNIORB_ENABLE_SERVICES
> +	$(SED) 's:SUBDIRS += lib:SUBDIRS += lib services:g' $(@D)/src/dir.mk
> +endef
> +
> +ifeq ($(BR2_PACKAGE_OMNIORB_WITH_SERVICES),y)
> +	OMNIORB_POST_CONFIGURE_HOOKS += OMNIORB_ENABLE_SERVICES
> +endif

This is kind of weird, because the "services" directory is built in
some condition:

ifndef EmbeddedSystem
SUBDIRS += appl services
endif

but you define EmbeddedSystem=1 in Buildroot:

echo "EmbeddedSystem=1" >> $(@D)/mk/beforeauto.mk

Is there a reason for defining EmbeddedSystem=1 ? The only difference
will be that it's going to build the stuff in src/appl/, but looking at
this directory, it doesn't seem like a huge amount of code compared to
the overall size of omniORB.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
