From: Will Newton <will.newton@gmail.com>
Date: Mon, 24 Aug 2009 17:49:23 +0100
Subject: [Buildroot] pkg-config problems
Message-ID: <87a5b0800908240949i3b84ed83je359165a66dabd50@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I've come across a tricky issue with pkg-config and I was wondering if
anyone might have any ideas on the best way to sort it out.

cairo can be built for the target with or without png support. We also
build a version of cairo for the host, which is always built without
png support. If we enable png support for cairo (for the target) and
build a version of pango for the host, the pango build fails. The host
pango build failure is caused because the pango configure script
thinks it has a cairo with png support but when it tries to link
against the host cairo library there are no png related symbols.

The root cause of this is that the host pango is using host pkgconfig
to determine what libraries are available. The host pkgconfig is
configured like this however:

 $(STAMP_DIR)/host_pkgconfig_configured: $(STAMP_DIR)/host_pkgconfig_unpacked
        (cd $(PKG_CONFIG_HOST_DIR); rm -rf config.cache; \
                $(HOST_CONFIGURE_OPTS) \
                CFLAGS="$(HOST_CFLAGS)" \
                LDFLAGS="$(HOST_LDFLAGS)" \
                ./configure \
                --prefix="$(HOST_DIR)/usr" \
                --sysconfdir="$(HOST_DIR)/etc" \
                --with-pc-path="$(STAGING_DIR)/usr/lib/pkgconfig" \
# Note that STAGING_DIR is being used here!
                --disable-static \
        )
        touch $@

So the host pkgconfig will pick up any libraries we have installed in
staging dir, in this case it detects cairo png support that does not
exist. Does anyone have any ideas how we can work around this?

There doesn't seem to be any way to override the configure time
pkgconfig path at runtime. Perhaps we need a new type of host
pkgconfig that really is for host libraries?
