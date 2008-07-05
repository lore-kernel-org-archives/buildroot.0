From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sun, 06 Jul 2008 01:20:56 +0200
Subject: [Buildroot] Makefile.autotools.in downloads new copy of tarball,
 everytime it is called
Message-ID: <487001D8.9030203@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

It does not seem to test if there is something in $(DL_DIR)
and downloads <package>.tar.bz2.<n>,
where n is an ever increasing number.

What does MAKELEVEL mean?
If this is 1, the download occurs, even if there is something,
but you do not replace "<package>.tar.bz2".
You get "<package>.tar.bz2.<n>"



How about this?

Index: Makefile.autotools.in
===================================================================
- --- Makefile.autotools.in	(revision 22653)
+++ Makefile.autotools.in	(arbetskopia)
@@ -132,7 +132,7 @@
 $(BUILD_DIR)/%/.stamp_downloaded:
 # support make source-check/external-deps
 ifeq ($(MAKELEVEL),1)
- -	$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
+	-$(Q)test -e $(DL_DIR)/$($(PKG)_SOURCE) || $(WGET) -P $(DL_DIR)
$($(PKG)_SITE)/$($(PKG)_SOURCE)
 	$(if $($(PKG)_PATCH),$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_PATCH))
 else
 	$(call MESSAGE,"Downloading")

BR
Ulf Samuelsson
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIcAHYAyRRH5cXxqwRAj0oAJ0WSHxplkiGovBOLUnZMR2RQ6Ia5ACfeNrB
CcY6cqQsOLsB1mrkeqJBRPE=
=5kYR
-----END PGP SIGNATURE-----
