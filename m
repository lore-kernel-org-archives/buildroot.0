From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Oct 2018 14:49:44 +0200
Subject: [Buildroot] [PATCH v1 2/3] qt5serialbus: fix 5.6.3 license file
 hashes
In-Reply-To: <20181003045224.wlrhhkgyv2tj3pqg@sapphire.tkos.co.il>
References: <20181002211637.2356-1-ps.report@gmx.net>
 <20181002211637.2356-2-ps.report@gmx.net>
 <20181003045224.wlrhhkgyv2tj3pqg@sapphire.tkos.co.il>
Message-ID: <20181003144944.2a26cf25@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 3 Oct 2018 07:52:24 +0300, Baruch Siach wrote:

> Shouldn't the tarball hash move also here? Having the 5.6.x tarball hash in 
> the default .hash file is confusing.

This doesn't work, because the download wrapper only uses the main hash
file:

define DOWNLOAD
        $(Q)mkdir -p $($(PKG)_DL_DIR)
        $(Q)$(EXTRA_ENV) $(FLOCK) $(DL_WRAPPER) \
                -c '$($(PKG)_DL_VERSION)' \
                -d '$($(PKG)_DL_DIR)' \
                -D '$(DL_DIR)' \
                -f '$(notdir $(1))' \
                -H '$(PKGDIR)/$($(PKG)_RAWNAME).hash' \
                -n '$($(PKG)_BASENAME_RAW)' \
                -N '$($(PKG)_RAWNAME)' \
                -o '$($(PKG)_DL_DIR)/$(notdir $(1))' \
                $(if $($(PKG)_GIT_SUBMODULES),-r) \
                $(DOWNLOAD_URIS) \
                $(QUIET) \
                -- \
                $($(PKG)_DL_OPTS)
endef

See the value passed to the -H option. It works for license files
because:

define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-fullpath, {HOST|TARGET}
	mkdir -p $(LICENSE_FILES_DIR_$(6))/$(2)/$(dir $(4)) && \
	{ \
		if [ -f $(3)/$($(PKG)_VERSION)/$(1).hash ]; then \
			support/download/check-hash $(3)/$($(PKG)_VERSION)/$(1).hash $(5) $(4); \
		else \
			support/download/check-hash $(3)/$(1).hash $(5) $(4); \
		fi; \
		case $${?} in (0|3) ;; (*) exit 1;; esac; \
	} && \
	cp $(5) $(LICENSE_FILES_DIR_$(6))/$(2)/$(4)
endef

I discussed this topic on the mailing list a few weeks ago with Yann.
See
http://lists.busybox.net/pipermail/buildroot/2018-September/229892.html
and
http://lists.busybox.net/pipermail/buildroot/2018-September/230404.html.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
