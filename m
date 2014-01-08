From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 8 Jan 2014 06:52:07 +0200
Subject: [Buildroot] [PATCH 1/1] ca-certificates: new package
In-Reply-To: <1389126590-25956-1-git-send-email-martin@barkynet.com>
References: <1389126590-25956-1-git-send-email-martin@barkynet.com>
Message-ID: <20140108045207.GD4659@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Martin,

Thanks for the patch. A few comments below.

On Tue, Jan 07, 2014 at 08:29:50PM +0000, Martin Bark wrote:
> CA certificates used for SSL based applications.  The package installs CA
> certificates to /usr/share/ca-certificates and creates symbolic links under
> /etc/ssl/certs.  For example, the existing libcurl package will use these
> certificates for https urls.  Based on the debian ca-certifcates package.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>

[...]

> +CA_CERTIFICATES_VERSION = 20130906
> +CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.gz
> +CA_CERTIFICATES_SITE = ftp://ftp.debian.org/debian/pool/main/c/ca-certificates

Please use $(BR2_DEBIAN_MIRROR). See package/at/at.mk, for example.

> +CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python
> +CA_CERTIFICATES_LICENSE = GPLv2+ MPLv2.0
> +CA_CERTIFICATES_LICENSE_FILES = debian/copyright

According to debian/copyright these licenses apply to the specific files 
listed there. You don't use any of these files as far as I can see.

> +define CA_CERTIFICATES_BUILD_CMDS
> +    PATH=$(HOST_PATH) $(MAKE) -C $(@D) all
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
> +
> +    #create symbolic links to the certificates by their hash values
> +    $(HOST_DIR)/usr/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
> +endef
> +
> +$(eval $(generic-package))
> -- 

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
