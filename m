From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Sun, 10 Nov 2013 18:32:52 +0100
Subject: [Buildroot] [PATCH 1/1] Generation of locales: made call to tr more
	robust and added LOWERCASE macro
Message-ID: <1384104772-30097-1-git-send-email-thierry.bultel@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When calling 'tr' without quoting braces, bash can make really weird things
if there are existing 'single-letter-named' directories
eg:
thierry at thierry-desktop:~$ echo AAA | tr [A-Z] [a-z] 
aaa
thierry at thierry-desktop:~$ mkdir m
thierry at thierry-desktop:~$ echo AAA | tr [A-Z] [a-z] 
AAA


The (quick) analysis is that the callee (tr) argvs then
contain 'm' thus the translation does not work

Using quotes works around it:
thierry at thierry-desktop:~$ echo AAA | tr '[A-Z]' '[a-z]' 
aaa


Changes v1->v2
  - Added the LOWERCASE macro, following Thomas De Schampheleire's advice


Signed-off-by: Thierry Bultel <thierry.bultel@wanadoo.fr>
---
 Makefile             |    2 +-
 package/pkg-utils.mk |    8 ++++++++
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 1496bd7..a006615 100644
--- a/Makefile
+++ b/Makefile
@@ -548,7 +548,7 @@ target-generatelocales: host-localedef
 		I18NPATH=$(STAGING_DIR)/usr/share/i18n:/usr/share/i18n \
 		$(HOST_DIR)/usr/bin/localedef \
 			--prefix=$(TARGET_DIR) \
-			--`echo $(BR2_ENDIAN) | tr [A-Z] [a-z]`-endian \
+			--$(call LOWERCASE,$(BR2_ENDIAN))-endian \
 			-i $${inputfile} -f $${charmap} \
 			$${locale} ; \
 	done
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 5930f2c..0ef433d 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -23,6 +23,14 @@ UPPERCASE = $(strip $(eval __tmp := $1) \
 	$(__tmp)))) \
 	$(__tmp))
 
+# LOWERCASE macro -- transforms its arguments to lowercase
+# The above non-tr implementation is not needed, because LOWERCASE is not
+# called very often
+
+define LOWERCASE
+$(shell echo $1 | tr '[:upper:]' '[:lower:]')
+endef
+
 #
 # Manipulation of .config files based on the Kconfig
 # infrastructure. Used by the Busybox package, the Linux kernel
-- 
1.7.1
