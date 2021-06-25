From: Herve Codina <herve.codina@bootlin.com>
Date: Fri, 25 Jun 2021 15:13:30 +0200
Subject: [Buildroot] [PATCH 00/15] Overwritten file detection and fixes,
 one more step to TLP build
In-Reply-To: <eb439d88-83c0-3ba6-5b1f-33fc011837c0@andin.de>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <eb439d88-83c0-3ba6-5b1f-33fc011837c0@andin.de>
Message-ID: <20210625151330.35f3adc8@fedora>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, 25 Jun 2021 11:08:43 +0200
Andreas Naumann <dev@andin.de> wrote:

> after a long time I have recently picked up playing with TLP build 
> again. As part of that I found a problem in qt5 where I sent a patch two 
> days ago "qt5: Fix sporadic build failure during top-level parallel 
> build" which is caused by manipulation of the hard-linked qt.conf in 
> HOST_DIR from different qt5 packages.
> 
> Now I see your promising set, but the matter is quite complex and so I 
> wonder if the "overwritten file detection" would a) uncover the qt.conf 
> problem and b)if your patch series somehow fixes it in a generic way?
> 
> 

I quickly looked at your patch and it looks like an overwrite issue.

Your patch:
---- 8< ----
 # compiled into the Qt library. We need it to make "qmake" relocatable and
 # tweak the per-package install pathes
 define QT5_INSTALL_QT_CONF
+	rm -f $(HOST_DIR)/bin/qt.conf
 	sed -e "s|@@HOST_DIR@@|$(HOST_DIR)|" -e "s|@@STAGING_DIR@@|$(STAGING_DIR)|" \
 		$(QT5BASE_PKGDIR)/qt.conf.in > $(HOST_DIR)/bin/qt.conf
 endef
---- 8< ----

This overwrite is done by sed whose output is redirected $(HOST_DIR)/bin/qt.conf

With TLP this overwite leads to package A seeing modification done by package B

Without your patch and with overwrite detection present in my series
the overwrite should be detected and the build stopped.

My series do not contains any fixes for this specific Qt5 overwrite.
This is a concrete example of what I said still missing ...

Your 'rm' breaks the hardlink and so the following sed does not perform
overwrite anymore.
That's the correct fix.

To go further with interactions with my current series still ongoing and not ready
to be merged, the entire macro (QT5_INSTALL_QT_CONF) should be moved to
<PKG>_PER_PACKAGE_TWEAK_HOOKS and QT5_QT_CONF_FIXUP is no more needed.

Herv?

-- 
Herv? Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
