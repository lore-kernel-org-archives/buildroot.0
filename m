From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 23 Mar 2017 00:46:57 +0100
Subject: [Buildroot] [PATCHv3] package: add qt5virtualkeyboard
In-Reply-To: <20170322211621.5u6tlemnihszb53s@gportay>
References: <20170322205412.24993-1-gael.portay@savoirfairelinux.com>
 <20170322220723.1a673199@gmx.net>
 <20170322211621.5u6tlemnihszb53s@gportay>
Message-ID: <20170323004657.30266283@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ga?l,

On Wed, 22 Mar 2017 17:16:21 -0400, Ga?l PORTAY <gael.portay@savoirfairelinux.com> wrote:

[...]
> > > +
> > > +define QT5VIRTUALKEYBOARD_INSTALL_TARGET_CMDS
> > > +	mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
> > > +	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/platforminputcontexts/libqtvirtualkeyboardplugin.so $(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
> > > +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick
> > > +	cp -dpfr $(STAGING_DIR)/usr/qtvirtualkeyboard $(TARGET_DIR)/usr
> > 
> > 
> > Still no $(STAGING_DIR)/usr/qtvirtualkeyboard file to copy:
> > 
> > cp: cannot stat ?.../host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/qtvirtualkeyboard?: No such file or directory
> 
> Okay, it is certainly because you did not configure it for Japanese/Chinese
> layouts; and I did not clean properly the target directory when I tested it.
> 

Yes, enabling this adds some content to  $(STAGING_DIR)/usr/qtvirtualkeyboard:

	$ find staging/usr/qtvirtualkeyboard/
  staging/usr/qtvirtualkeyboard/
  staging/usr/qtvirtualkeyboard/pinyin
  staging/usr/qtvirtualkeyboard/pinyin/dict_pinyin.dat


And adds additional compile/object files to:

  - qt5virtualkeyboard-5.8.0/src/virtualkeyboard/3rdparty/pinyin
  - qt5virtualkeyboard-5.8.0/src/virtualkeyboard/3rdparty/openwnn

Both with own license files:

  - qt5virtualkeyboard-5.8.0/src/virtualkeyboard/3rdparty/pinyin/NOTICE (Apache License v2.0)
  - qt5virtualkeyboard-5.8.0/src/virtualkeyboard/3rdparty/openwnn/NOTICE (Apache License v2.0)

> Will you agree for this if statement?
> 
> 	if [ -d "$(STAGING_DIR)/usr/qtvirtualkeyboard" ]; then \
> 		cp -dpfr $(STAGING_DIR)/usr/qtvirtualkeyboard $(TARGET_DIR)/usr; \
> 	fi

Possible (working) solution, but a more deterministic way would be good, see
additional/optional license problem above (and more 3rdparty modules: hunspell,
lipi-toolkit, t9write, tcime)...

Regards,
Peter

> 
> > 
> > Regards,
> > Peter
> > 
> > 
> > > +	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_EXAMPLES)
> > > +endef
> > > +
> > > +$(eval $(generic-package))
> > 
> 
> Regards,
> Gael
