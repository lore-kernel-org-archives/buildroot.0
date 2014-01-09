From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jan 2014 07:45:37 +0800
Subject: [Buildroot] [PATCH v2] ca-certificates: new package
In-Reply-To: <1389201330-2420-1-git-send-email-martin@barkynet.com>
References: <1389201330-2420-1-git-send-email-martin@barkynet.com>
Message-ID: <20140110074537.75d0a765@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Wed,  8 Jan 2014 17:15:30 +0000, Martin Bark wrote:

> +config BR2_PACKAGE_CA_CERTIFICATES
> +    bool "CA Certificates"
> +    help

Indentation should be one tab.

> +      This package includes PEM files of CA certificates to allow
> +      SSL-based applications to check for the authenticity of SSL
> +      connections.

And here one tab + two spaces.

> +
> +      It includes, among others, certificate authorities used by the
> +      Debian infrastructure and those shipped with Mozilla's browsers.

If possible, please add an upstream URL here.

> diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
> new file mode 100644
> index 0000000..6cf2e7a
> --- /dev/null
> +++ b/package/ca-certificates/ca-certificates.mk
> @@ -0,0 +1,39 @@
> +################################################################################
> +#
> +# ca-certificates
> +#
> +################################################################################
> +
> +CA_CERTIFICATES_VERSION = 20130906
> +CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.gz
> +CA_CERTIFICATES_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/c/ca-certificates

I think we should use snapshot.debian.net instead of BR2_DEBIAN_MIRROR.
Maybe we should even completely remove BR2_DEBIAN_MIRROR altogether.
The problem of using BR2_DEBIAN_MIRROR is that there is no guarantee
that the tarballs are going to stay at the same location, as Debian
evolves. While snapshot.debian.net guarantees this.

> +CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python
> +CA_CERTIFICATES_LICENSE = GPLv2+ (script), MPLv2.0 (data)
> +CA_CERTIFICATES_LICENSE_FILES = debian/copyright
> +
> +define CA_CERTIFICATES_BUILD_CMDS
> +    PATH=$(HOST_PATH) $(MAKE) -C $(@D) all

Instead of PATH=$(HOST_PATH), I'd prefer to see:

	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all

Also, the indentation of the command should be one tab.

> +endef
> +
> +define CA_CERTIFICATES_INSTALL_TARGET_CMDS
> +    $(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/ca-certificates
> +    $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/ssl/certs
> +    $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
> +    rm -f $(TARGET_DIR)/usr/sbin/update-ca-certificates
> +
> +    #remove any existing certificates under /etc/ssl/certs
> +    rm -f  $(TARGET_DIR)/etc/ssl/certs/*
> +
> +    #generate symlinks to certificates under /etc/ssl/certs
> +    ( \
> +      cd $(TARGET_DIR) ;\
> +      for i in `find usr/share/ca-certificates -name "*.crt"` ; do \
> +            ln -sf ../../../$$i etc/ssl/certs/`basename $${i%.crt}.pem` ;\
> +      done ;\
> +    )

This is not very pretty, but I don't really have a better suggestion,
unfortunately.

> +
> +    #create symbolic links to the certificates by their hash values
> +    $(HOST_DIR)/usr/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
> +endef
> +
> +$(eval $(generic-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
