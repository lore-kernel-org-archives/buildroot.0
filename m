From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Mar 2012 13:43:15 +0100
Subject: [Buildroot] [RFC v2 29/31] qt: define license choice
In-Reply-To: <1331153911-22277-30-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
 <1331153911-22277-30-git-send-email-luca@lucaceresoli.net>
Message-ID: <201203101343.15332.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 07 March 2012 21:58:29 Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  package/qt/Config.in |   15 +++++++++++++++
>  package/qt/qt.mk     |    9 +++++++++
>  2 files changed, 24 insertions(+), 0 deletions(-)
> 
> diff --git a/package/qt/Config.in b/package/qt/Config.in
> index 3a552d0..b430258 100644
> --- a/package/qt/Config.in
> +++ b/package/qt/Config.in
> @@ -55,6 +55,21 @@ config BR2_PACKAGE_QT_LICENSE_APPROVED
>  	  LGPL v2.1: http://doc.trolltech.com/4.5/lgpl.html
>  	  GPL  v3.0: http://doc.trolltech.com/4.5/gpl.html
>  
> +if BR2_PACKAGE_QT_LICENSE_APPROVED
> +
> +choice
> +	prompt "License"
> +
> +config BR2_PACKAGE_QT_LICENSE_LGPL
> +	bool "LGPL v2.1"
> +
> +config BR2_PACKAGE_QT_LICENSE_GPL
> +	bool "GPL v3.0"
> +
> +endchoice
> +
> +endif # BR2_PACKAGE_QT_LICENSE_APPROVED
> +
>  config BR2_PACKAGE_QT_CONFIG_FILE
>  	string "Config file"
>  	help
> diff --git a/package/qt/qt.mk b/package/qt/qt.mk
> index 776eb63..e8bc3a2 100644
> --- a/package/qt/qt.mk
> +++ b/package/qt/qt.mk
> @@ -20,6 +20,15 @@ QT_INSTALL_STAGING = YES
>  
>  ifeq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
>  QT_CONFIGURE_OPTS += -opensource -confirm-license
> +
> +ifeq ($(BR2_PACKAGE_QT_LICENSE_LGPL),y)
> +QT_LICENSE = LGPLv2.1
> +QT_LICENSE_FILES = LICENSE.LGPL
> +else ifeq ($(BR2_PACKAGE_QT_LICENSE_GPL),y)
> +QT_LICENSE = GPLv3
> +QT_LICENSE_FILES = LICENSE.GPL3
> +endif
> +

 I think this is way too much hassle for the buildroot maintainers.  
Instead, I'd just include both options in the legal info.  I.e.:

QT_LICENSE = LGPLv2.1 GPLv3
QT_LICENSE_FILES = LICENSE.LGPL LICENSE.GPL3

 It's up to the legal team to decide which license to use; the buildroot
user just wants to pass on the relevant information.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
