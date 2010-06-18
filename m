From: Karl Krach <mailinglists@blueSpirit.la>
Date: Fri, 18 Jun 2010 09:57:17 +0200
Subject: [Buildroot] undefined reference to `qBadAlloc()'
Message-ID: <l47a3h.k9uzd@webmail.variomedia.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have a solved problem and report this, just for documentation. I found this
bug, because I have to evaluate the impact of exceptions on the qt performance
(we made bad experience with ARM some time ago).

If you compile qt WITHOUT exceptions (e.g. because you ve not enabled the
xml-pattern module) and don't remove your whole output/ directory, you will
get on a future compilation WITH exception strange linker errors.

Reason: Qt is linking against the installed libQtCore.so (which has no
exceptions) first, and only afterwards against your fresh compiled
libQtCore.so.


I would add a

	touch $@
+	rm -rf $(STAGING_DIR)/usr/lib/libQt*

$(QT_TARGET_DIR)/.compiled: $(QT_TARGET_DIR)/.configured

to packages/qt/qt.mk to solve this problem. Calling "make uninstall" would
solve this problem too.

Thx,

Charly
