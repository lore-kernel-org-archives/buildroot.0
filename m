From: Pascal Huerst <pascal.huerst@gmail.com>
Date: Wed, 30 Jul 2014 17:27:19 +0200
Subject: [Buildroot] [PATCH v8 0/1] google-breakpad: Integration into
	Makefile and Config.in
Message-ID: <1406734040-31558-1-git-send-email-pascal.huerst@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes v7 -> v8
	Removed use of eval in $(eval ls "${TARGET_DIR}/${@}"); do
	  as expected by Yann E. MORIN

Changes v6 -> v7
	Removed comments I forgot to remove in v6 in gen-symy.sh for:
	  ifeq ($(BR2_PACKAGE_GOOGLE_BREAKPAD),y)
	  as suggested by Yann E. MORIN
	Still using eval, however for:
	  for FILE in $(eval ls "${TARGET_DIR}/${@}"); do
	  could not make it work without eval

Changes v5 -> v6
	google-breakpad: new package has been accepted.
	Moved parts from makefile into google-breakpad.mk and defined 
	  the call to gen-symy.sh as a new variable in google-breakpas.mk.
	  This seems to be more compatible with fabios series, as
	  suggested by Arnout and Thomas.
	Changed integration in Config.in, by adding an enable google breakpad 
	  option which expands to a list to insert filenames as suggested by
	  Arnout and Thomas.
	Removed creation of tmp directory in gen-symy.sh as sugested
	  by Arnout, since this is not necessary.

Changes v4 -> v5 (All suggested by Yann E. MORIN)
	Fixed some typo
	Reorganized patch structure
	  which parts belong to 'new package' and which parts belong to
	  'intergration into Makefile and Config.in'
	Changed and Rewrote gen-symy.sh - script
	  Passing $(EXTRA_ENV)
	  Adapted a proposed solution from Yann E. MORIN, which
	  uses ls instead of find commands
	Made better descriptions for users in:
	  Config.in
	  package/google-breakpad/Config.in

Changes v3 -> v4
	Fixed minor issue in google-breakpad_gen-syms.sh
	  Had to remove -print from find command

Changes v2 -> v3 (All suggested by thomas.petazzoni at free-electrons.com)
        Removed dependency of BR2_ENABLE_DEBUG, but added comment,
          that this flag might have to be set in order to use breakpad
          properly.
        Removed "find -name ..." for libs and binaries by generic patterns,
          such as "*.so" and so forth. This will never work properly. Instead
          I added a list to insert libs and binaries, that will be symbol-
          dumped and prepared for breakpad (see Config.in patch v3 2/2)
        Changed storage path for dumps from: $(TARGET_DIR).. to
          $(STAGING_DIR)/usr/share/google-breakpad-symbols/
        Removed most logic from Makefile. Added script instead, which is
          called by Makefile
        Added dependency for compatible targets: ARM, i386, MIPS...
        Set fixed version for checkout (instead of head)
        Fixed typos, and some minor mistakes

Changes v1 -> v2 (All suggested by maxime.hadjinlian at gmail.com)
        Added dependency from BR2_ENABLE_DEBUG
        Removed symbolstore.py -> Its all done in Makefile now
        Removed new Target -> It in target-finalize before stripping now
        Added LICENSE and LICENSE_FILE to *.mk

Pascal Huerst (1):
  google-breakpad: Integration into Makefile and Config.in

 Config.in                                  | 28 ++++++++++++++++++++++++++++
 package/google-breakpad/gen-syms.sh        | 25 +++++++++++++++++++++++++
 package/google-breakpad/google-breakpad.mk |  8 ++++++++
 3 files changed, 61 insertions(+)
 create mode 100755 package/google-breakpad/gen-syms.sh

-- 
1.9.3
