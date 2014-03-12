From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Mar 2014 08:08:26 +0100
Subject: [Buildroot] [PATCH 1/1] Adding libstrophe
In-Reply-To: <1394557881-4770-1-git-send-email-lefinnois@lefinnois.net>
References: <1394557881-4770-1-git-send-email-lefinnois@lefinnois.net>
Message-ID: <532007EA.5070205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Denis,

 Thank you for your contribution! It looks good, but I have a few remarks
below. Could you fix them and resubmit?


On 03/11/14 18:11, Denis Bodor wrote:
> Signed-off-by: Denis Bodor <lefinnois@lefinnois.net>
> ---
>  package/libstrophe/Config.in                            | 11 +++++++++++
>  package/libstrophe/libstrophe-make-autoreconfable.patch |  9 +++++++++
>  package/libstrophe/libstrophe.mk                        | 14 ++++++++++++++

 You forgot to add it to package/Config.in so it won't appear in the menu.

>  3 files changed, 34 insertions(+)
>  create mode 100644 package/libstrophe/Config.in
>  create mode 100644 package/libstrophe/libstrophe-make-autoreconfable.patch
>  create mode 100644 package/libstrophe/libstrophe.mk
> 
> diff --git a/package/libstrophe/Config.in b/package/libstrophe/Config.in
> new file mode 100644
> index 0000000..ac02a66
> --- /dev/null
> +++ b/package/libstrophe/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_LIBSTROPHE
> +	bool "libstrophe"
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_EXPAT
> +	help
> +	  libstrophe is a lightweight XMPP client library written in C.
> +	  It has minimal dependencies and is configurable for various
> +	  environments. It runs well on both Linux, Unix, and Windows
> +	  based platforms.
> +
> +	  https://github.com/strophe/libstrophe
> diff --git a/package/libstrophe/libstrophe-make-autoreconfable.patch b/package/libstrophe/libstrophe-make-autoreconfable.patch
> new file mode 100644
> index 0000000..5caeaff
> --- /dev/null
> +++ b/package/libstrophe/libstrophe-make-autoreconfable.patch

 Patches should be numbered, e.g. libstrophe-01-make-autoreconfable.patch

 Also, the patch should have a small "commit log" with your signed-off-by.

> @@ -0,0 +1,9 @@
> +diff -ur libstrophe.orig/Makefile.am libstrophe/Makefile.am
> +--- libstrophe.orig/Makefile.am	2014-03-02 18:58:36.219753865 +0100
> ++++ libstrophe/Makefile.am	2014-03-02 18:58:02.739752477 +0100
> +@@ -1,4 +1,4 @@
> +-AUTOMAKE_OPTIONS = subdir-objects
> ++AUTOMAKE_OPTIONS = subdir-objects foreign
> + 
> + CFLAGS = -g -Wall
> + 
> diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
> new file mode 100644
> index 0000000..356d3d4
> --- /dev/null
> +++ b/package/libstrophe/libstrophe.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +# 
> +# libstrophe
> +#
> +################################################################################
> +
> +LIBSTROPHE_VERSION = d408eaf2bbfe5ff5c56eab01463c278f9891c08e
> +LIBSTROPHE_SITE = $(call github,strophe,libstrophe,$(LIBSTROPHE_VERSION))
> +LIBSTROPHE_INSTALL_STAGING = YES
> +LIBSTROPHE_INSTALL_TARGET = NO

 I guess that's because it only builds a static library? Can you add a
comment that says that?

> +LIBSTROPHE_DEPENDENCIES = expat openssl host-pkgconf
> +LIBSTROPHE_AUTORECONF = YES

 You're missing _LICENSE and _LICENSE_FILES.


 Regards,
 Arnout

> +
> +$(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
