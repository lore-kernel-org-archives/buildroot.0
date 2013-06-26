From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Jun 2013 09:54:11 +0000 (UTC)
Subject: [Buildroot] [Bug 6344] Wrong handling of license text files with
 same name and different directory
In-Reply-To: <bug-6344-163@https.bugs.busybox.net/>
References: <bug-6344-163@https.bugs.busybox.net/>
Message-ID: <20130626095411.DE06D9B1B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6344

--- Comment #1 from Aleksandar <aleksandar.zivkovic@gmail.com> 2013-06-26 09:52:21 UTC ---
Quick/dirty solution that works for me: take all files stated in *.mk and merge
them in single file called license.txt

Index: pkg-utils.mk
===================================================================
--- pkg-utils.mk    (revision 12362)
+++ pkg-utils.mk    (revision 12874)
@@ -95,7 +95,7 @@
 define legal-warning-pkg-savednothing # pkg, {local|override}
     $(call legal-warning-pkg,$(1),sources and license files not saved ($(2)
packages not handled))
 endef
-legal-manifest=echo '"$(1)","$(2)","$(3)","$(4)","$(5)"'
>>$(LEGAL_MANIFEST_CSV)
+legal-manifest=echo '"$(1)","$(2)","$(3)","license.txt","$(5)"'
>>$(LEGAL_MANIFEST_CSV)
 define legal-license-header
     echo -e "$(LEGAL_INFO_SEPARATOR)\n\t$(1):" \
         "$(2)\n$(LEGAL_INFO_SEPARATOR)\n\n" >>$(LEGAL_LICENSES_TXT)
@@ -108,5 +108,6 @@
     cat $(3) >>$(LEGAL_LICENSES_TXT) && \
     echo >>$(LEGAL_LICENSES_TXT) && \
     mkdir -p $(LICENSE_FILES_DIR)/$(1)/ && \
-    cp $(3) $(LICENSE_FILES_DIR)/$(1)/
+    echo -e "$(LEGAL_INFO_SEPARATOR)\n$(2):" >>
$(LICENSE_FILES_DIR)/$(1)/license.txt && \
+    cat $(3) >> $(LICENSE_FILES_DIR)/$(1)/license.txt
 endef

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
