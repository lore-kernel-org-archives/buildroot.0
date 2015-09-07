From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Sep 2015 16:40:30 +0200
Subject: [Buildroot] [PATCH] check: new package
In-Reply-To: <1441633062-8282-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1441633062-8282-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <55EDA1DE.4020904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07-09-15 15:37, gustavo.zacarias at free-electrons.com wrote:
[snip]
> diff --git a/package/check/check.hash b/package/check/check.hash
> new file mode 100644
> index 0000000..0c3a924
> --- /dev/null
> +++ b/package/check/check.hash
> @@ -0,0 +1,3 @@
> +# From http://sourceforge.net/projects/check/files/check/0.10.0/
> +md5	53c5e5c77d090e103a17f3ed7fd7d8b8	check-0.10.0.tar.gz
> +sha1	35d3a53446aea7b21a770faedb358d0fc7cba76d	check-0.10.0.tar.gz

 Don't we usually add a locally calculated sha256 if only sha1 is available
upstream? (Honest question, I don't remember.)

> diff --git a/package/check/check.mk b/package/check/check.mk
> new file mode 100644
> index 0000000..9b88321
> --- /dev/null
> +++ b/package/check/check.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# check
> +#
> +################################################################################
> +
> +CHECK_VERSION = 0.10.0
> +CHECK_SITE = http://downloads.sourceforge.net/project/check/check/$(CHECK_VERSION)
> +CHECK_INSTALL_STAGING = YES
> +CHECK_DEPENDENCIES = host-pkgconf
> +CHECK_LICENSE = LGPLv2.1+
> +CHECK_LICENSE_FILES = COPYING.LESSER
> +
> +# Having checkmk in the target makes no sense
> +define CHECK_REMOVE_CHECKMK
> +	rm -f $(TARGET_DIR)/usr/bin/checkmk
> +endef
> +CHECK_POST_INSTALL_TARGET_HOOKS += CHECK_REMOVE_CHECKMK
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))

 Why do we need a host package?

 Regards,
 Arnout

> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
