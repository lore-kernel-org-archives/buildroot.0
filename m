From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Jul 2015 01:22:59 +0200
Subject: [Buildroot] [PATCH 7/7] qpid-proton: new package
In-Reply-To: <1436624110-20428-7-git-send-email-luca@lucaceresoli.net>
References: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
 <1436624110-20428-7-git-send-email-luca@lucaceresoli.net>
Message-ID: <55A1A553.7030500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/11/15 16:15, Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

 What's the upstream status of the patch?

 One more comment below:

[snip]
> diff --git a/package/qpid-proton/qpid-proton.hash b/package/qpid-proton/qpid-proton.hash
> new file mode 100644
> index 000000000000..8c2cc4f3503d
> --- /dev/null
> +++ b/package/qpid-proton/qpid-proton.hash
> @@ -0,0 +1,2 @@
> +# Hash from: http://www.apache.org/dist/qpid/proton/0.9.1/qpid-proton-0.9.1.tar.gz.sha
> +sha1  98008d90acd0d47cbd7ac1572a2bb50b452338ed  qpid-proton-0.9.1.tar.gz
> diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
> new file mode 100644
> index 000000000000..8ff05a94f3d1
> --- /dev/null
> +++ b/package/qpid-proton/qpid-proton.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# qpid-proton
> +#
> +################################################################################
> +
> +QPID_PROTON_VERSION_MAJOR = 0.9
> +QPID_PROTON_VERSION = $(QPID_PROTON_VERSION_MAJOR).1
> +QPID_PROTON_SITE = http://apache.panu.it/qpid/proton/0.9.1

 Use _VERSION here.

> +QPID_PROTON_STRIP_COMPONENTS = 2
> +QPID_PROTON_LICENSE = Apache-2.0
> +QPID_PROTON_LICENSE_FILES = LICENSE
> +QPID_PROTON_INSTALL_STAGING = YES
> +QPID_PROTON_DEPENDENCIES = \
> +	util-linux \
> +	$(if $(BR2_PACKAGE_OPENSSL),openssl,)

 The final , is not needed.

> +QPID_PROTON_CONF_OPTS = \
> +	-DBUILD_JAVA=OFF \
> +	-DENABLE_VALGRIND=OFF \
> +	-DENABLE_WARNING_ERROR=OFF
> +
> +define QPID_PROTON_REMOVE_EXAMPLES
> +	rm -fr $(TARGET_DIR)/usr/share/proton-$(QPID_PROTON_VERSION_MAJOR)/examples

 To avoid the need for defining _MAJOR (which is a pain IMHO), you could just do
proton-*/examples.

 Regards,
 Arnout

> +endef
> +
> +QPID_PROTON_POST_INSTALL_TARGET_HOOKS += QPID_PROTON_REMOVE_EXAMPLES
> +
> +$(eval $(cmake-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
