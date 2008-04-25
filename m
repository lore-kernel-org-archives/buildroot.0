From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 25 Apr 2008 10:31:48 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <1209108213.2859.9.camel@localhost>
References: <20080424184430.B4D613C849@busybox.net>
	<1209108213.2859.9.camel@localhost>
Message-ID: <d6cda7730804250631nf9ea783y8fb70640c7bfba98@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  >  QTOPIA4_SOURCE:=qt-embedded-linux-commercial-src-$(QTOPIA4_VERSION).tar.gz
>  >  QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-commercial-src-$(QTOPIA4_VERSION)
>  > -QTOPIA4_NO_SQL_OCI:=-no-sql-oci
>  > -QTOPIA4_NO_SQL_TDS:=-no-sql-tds
>  > -QTOPIA4_NO_SQL_DB2:=-no-sql-db2
>  > +QTOPIA4_CONFIGURE+= -no-sql-oci -no-sql-tds -no-sql-db2
>
>  The SQL selection stuff should be kept.

Actually, according to configure --help, all sql drivers are disabled
by default, so this is not needed.

>
>  >
>  > -QTOPIA4_DEBUG:=$(strip $(subst ",, $(QTOPIA4_DEBUG)))
>  > +QTOPIA4_CONFIGURE:=$(strip $(subst ",, $(QTOPIA4_CONFIGURE)))
>  >  #"))
>  >  BR2_PACKAGE_QTOPIA4_EMB_PLATFORM:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)))
>  >  #"))
>  >
>  >
>  >  # Variable for other Qt applications to use
>  > -QTOPIA4_QMAKE:=$(STAGING_DIR)/usr/bin/qmake
>  > +QTOPIA4_QMAKE:=$(TARGET_CONFIGURE_OPTS) $(STAGING_DIR)/usr/bin/qmake -spec qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++
>  >
>
>  Is this really needed? qmake works fine for me by just specifying the
>  Buildroot PATH to STAGING_DIR/bin.

Actually that's what you suggested, that prepend calling qmake with
$(TARGET_CONFIGURE_OPTS) , but that makes no difference, so this one
isn't.

>
>  >  $(DL_DIR)/$(QTOPIA4_SOURCE):
>  >       $(WGET) -P $(DL_DIR) $(QTOPIA4_SITE)/$(QTOPIA4_SOURCE)
>  > @@ -198,7 +198,16 @@
>  >       $(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QTOPIA4_TARGET_DIR)/configure
>  >  endif
>  >       $(SED) 's/^CFG_XINERAMA=auto/CFG_XINERAMA=no/' $(QTOPIA4_TARGET_DIR)/configure
>  > -     $(SED) 's,-O2,$(TARGET_CFLAGS),' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
>  > +     #$(SED) 's,-O2,$(TARGET_CFLAGS),' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
>  > +        # Fix compiler path
>  > +     $(SED) '\,QMAKE_CC, c\QMAKE_CC = $(TARGET_CC)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
>  > +     $(SED) '\,QMAKE_CXX, c\QMAKE_CXX = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
>  > +     $(SED) '\,QMAKE_LINK, c\QMAKE_LINK = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
>  > +     $(SED) '\,QMAKE_LINK_SHLIB, c\QMAKE_LINK_SHLIB = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
>  > +     $(SED) '\,QMAKE_AR, c\QMAKE_AR = $(TARGET_CROSS)ar cqs' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
>  > +     $(SED) '\,QMAKE_RANLIB, c\QMAKE_RANLIB = $(TARGET_RANLIB)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
>  > +     $(SED) '\,QMAKE_STRIP, c\QMAKE_STRIP = $(TARGET_CROSS)strip' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
>  > +
>
>  Again, if people use the BUildroot environment, this is not needed.
>

Again, it simply doesn't work.
The issue is not qmake, but the generated makefile. This is the only
way I found it to work.


>  > -     -$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libQt*.so.*
>  > +     -$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libQt*.so.*

$(STRIP) doesn't exist, and now that the patch was reverted, it
doesn't work, as opposed to working. So, it seams fixing whitespace
damage is more important than producing a working binary.

>  >       # Install image plugins if they are built
>  >       if [ -d $(STAGING_DIR)/usr/plugins/imageformats ]; then \
>  >               mkdir -p $(TARGET_DIR)/usr/plugins; \
>  >               cp -dpfr $(STAGING_DIR)/usr/plugins/imageformats $(TARGET_DIR)/usr/plugins/; \
>  > -             $(STRIP) --strip-unneeded $(TARGET_DIR)/usr/plugins/imageformats/*; \
>  > +             $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/plugins/imageformats/*; \

Same here.

>  >
>  > +qtopia4-status:
>  > +     @echo "QTOPIA4_QMAKE:               " $(QTOPIA4_QMAKE)
>  > +     @echo "QTOPIA4_DEP_LIBS:            " $(QTOPIA4_DEP_LIBS)
>  > +
>
>  Do we really need this?
>

We have one to debug linux kernel makefile, and other packages as
well, so why not? Does it really bother people?

Kind Regards,
    Thiago A. Correa
