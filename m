From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Fri,  8 Nov 2013 17:25:16 +0100
Subject: [Buildroot] [PATCH 1/1] Generation of locales: made call to tr more
	robust
Message-ID: <1383927916-27001-1-git-send-email-thierry.bultel@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: tbultel <tbultel@basystemes.fr>

When calling 'tr' without quoting braces, bash can make really weird things
if there are existing 'single-letter-named' directories
eg:
tbultel at laois:~/test$ echo AAA | tr [A-Z] [a-z]
aaa
tbultel at laois:~/test$ echo AAA | tr [A-Z] [a-z]
AAA

The (quick) analysis is that the callee (tr) argvs then
contain 'm' thus the translation does not work

Using quotes works around it
tbultel at laois:~/test$ echo AAA | tr '[A-Z]' '[a-z]'
aaa


Signed-off-by: tbultel <tbultel@basystemes.fr>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 1496bd7..7f835c0 100644
--- a/Makefile
+++ b/Makefile
@@ -548,7 +548,7 @@ target-generatelocales: host-localedef
 		I18NPATH=$(STAGING_DIR)/usr/share/i18n:/usr/share/i18n \
 		$(HOST_DIR)/usr/bin/localedef \
 			--prefix=$(TARGET_DIR) \
-			--`echo $(BR2_ENDIAN) | tr [A-Z] [a-z]`-endian \
+			--`echo $(BR2_ENDIAN) | tr '[A-Z]' '[a-z]'`-endian \
 			-i $${inputfile} -f $${charmap} \
 			$${locale} ; \
 	done
-- 
1.7.0.4
