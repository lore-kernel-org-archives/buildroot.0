From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Thu, 17 Sep 2015 14:23:31 +0200
Subject: [Buildroot] [PATCH v3 0/5] Buildroot printing with Cups
Message-ID: <1442492616-12626-1-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm resubbmitting this patch series.  It seems that the previous sub-
mission got lost due to a mail server or other issue.  The versions
has been updated to the latest available.  
CUPS 2.1.0 adds support for 3D printing. Lots of possibilities...

CUPS-filters provides backends, filters, and other software that was once 
part of the core CUPS distribution but is no longer maintained by Apple Inc.
From CUPS 1.6.0 forward, cups-filters is required for using printer drivers
with CUPS under linux.  It is maintained by the openprinting group of the
linux foundation.

Changes V1 -> V2
Modify Cups makefile to not use -fPIE and -pie when doing static builds.
(Vicente Olivert Riera)

Changes V2 -> V3 (Suggestions by Thomas Pettazoni)
Cups:
Modify Cups patches to show [PATCH] instead of [PATCH 1/2].
Add comment to cups genstrings patch to explain why it is being built.
Remove AVAHI configuration selection, enable/disable according to 
BR_PACKAGE_AVAHI
Add BR2_PACKAGE_CUPS_PDFTOPS to Config.in.legacy
Add locally calculated sh256 hash to cups.hash
Add zlib as cups dependency

HPLIP:
Remove +HPLIP_MAKE_OPTS += LDFLAGS+=-lpthread - Not necessary for succesful 
compilation

Cups-filters
Add dependencies depends on lines and comments for when the dependencies are
not available.
Remove AVAHI configuration selection, enable/disable according to 
BR_PACKAGE_AVAHI
Fix indentation in cups-filters.mk
Remove --disable-avahi and --without-png from default configuration.
Create a separate commit to enable xpdf-headers for poppler
Add selection of BR2_PACKAGE_CUPS_FILTERS_PDFTOPS to Config.in.legacy

Olivier Schonken (5):
  package/poppler: bump version to 0.35.0
  package/cups: Un-deprecate, and update CUPS to 2.1.0
  package/hplip: Un-deprecate and bump version to 3.15.7
  package/gutenprint: Un-deprecate and bump version to 5.2.10
  package/cups-filters: Add new package cups-filters 1.0.74

 package/Config.in                                  |  1 +
 package/cups-filters/Config.in                     | 47 ++++++++++++++++
 package/cups-filters/cups-filters.hash             |  2 +
 package/cups-filters/cups-filters.mk               | 65 ++++++++++++++++++++++
 ...01-Remove-building-html-from-man-makefile.patch | 27 +++++++++
 package/cups/0001-fix-static.patch                 | 28 ----------
 package/cups/0002-Do-not-use-genstrings.patch      | 27 +++++++++
 package/cups/0002-fix-stack-protector-check.patch  | 25 ---------
 package/cups/0003-mantohtml.patch                  | 11 ----
 package/cups/Config.in                             | 19 ++++---
 package/cups/cups.hash                             |  2 +
 package/cups/cups.mk                               | 44 +++++++++------
 package/gutenprint/Config.in                       |  1 -
 package/gutenprint/gutenprint.hash                 |  2 +-
 package/gutenprint/gutenprint.mk                   |  2 +-
 package/hplip/Config.in                            |  1 -
 package/hplip/hplip.hash                           |  2 +-
 package/hplip/hplip.mk                             |  4 +-
 ...invalid-shell-comparaison-in-libtiff-test.patch | 23 --------
 package/poppler/poppler.hash                       |  2 +-
 package/poppler/poppler.mk                         | 13 ++++-
 21 files changed, 227 insertions(+), 121 deletions(-)
 create mode 100644 package/cups-filters/Config.in
 create mode 100644 package/cups-filters/cups-filters.hash
 create mode 100644 package/cups-filters/cups-filters.mk
 create mode 100644 package/cups/0001-Remove-building-html-from-man-makefile.patch
 delete mode 100644 package/cups/0001-fix-static.patch
 create mode 100644 package/cups/0002-Do-not-use-genstrings.patch
 delete mode 100644 package/cups/0002-fix-stack-protector-check.patch
 delete mode 100644 package/cups/0003-mantohtml.patch
 create mode 100644 package/cups/cups.hash
 delete mode 100644 package/poppler/0001-Fix-invalid-shell-comparaison-in-libtiff-test.patch

-- 
1.9.1
