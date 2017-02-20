From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Feb 2017 23:37:00 +0100
Subject: [Buildroot] [PATCH v1] qt5quickcontrols: fix LTS (5.6) qml file
	install
In-Reply-To: <20170220232328.65ea63b8@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 20 Feb 2017 23:23:28 +0100")
References: <20170220214105.8106-1-ps.report@gmx.net>
 <20170220232328.65ea63b8@free-electrons.com>
Message-ID: <87efyspjzn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon, 20 Feb 2017 22:41:05 +0100, Peter Seiderer wrote:

 >> +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 >> define QT5QUICKCONTROLS_INSTALL_TARGET_CMDS
 >> cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Controls $(TARGET_DIR)/usr/qml/QtQuick
 >> cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Dialogs $(TARGET_DIR)/usr/qml/QtQuick
 >> cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Extras $(TARGET_DIR)/usr/qml/QtQuick
 >> cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/PrivateWidgets $(TARGET_DIR)/usr/qml/QtQuick
 >> endef
 >> +else
 >> +define QT5QUICKCONTROLS_INSTALL_TARGET_CMDS
 >> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Controls $(TARGET_DIR)/usr/qml/QtQuick
 >> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Dialogs $(TARGET_DIR)/usr/qml/QtQuick
 >> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Extras $(TARGET_DIR)/usr/qml/QtQuick
 >> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Layouts $(TARGET_DIR)/usr/qml/QtQuick
 >> +endef
 >> +endif

 > Perhaps it's time to:

 > ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 > QT5QUICKCONTROLS_INSTALL_QML_DIRS = Controls Dialogs Extras PrivateWidgets
 > else
 > QT5QUICKCONTROLS_INSTALL_QML_DIRS = Controls Dialogs Extras Layouts
 > endif

 > define QT5QUICKCONTROLS_INSTALL_TARGET_CMDS
 > 	$(foreach d,$(QT5QUICKCONTROLS_INSTALL_QML_DIRS), \
 > 		cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/$(d) $(TARGET_DIR)/usr/qml/QtQuick
 > 	)
 > endef

Yeah, I also didn't really like the repeated lines - But this way is
atleast very minimal/safe.

Alternatively the loop could be extended to check if the directory
exists and otherwise skip it, then we wouldn't need the version check.

-- 
Bye, Peter Korsgaard
