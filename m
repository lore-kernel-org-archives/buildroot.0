From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 20 Oct 2018 16:33:33 +0000
Subject: [Buildroot] [Bug 11411] check-uniq-files issue
In-Reply-To: <bug-11411-163@https.bugs.busybox.net/>
References: <bug-11411-163@https.bugs.busybox.net/>
Message-ID: <bug-11411-163-EHaCcty4Qa@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11411

--- Comment #2 from Jean-pierre Cartal <jpcartal@free.fr> ---
Here is the patch that I tested on my builds:

diff --git a/package/Makefile.in b/package/Makefile.in
index 58af2ef242..7d3d7c9028 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -216,7 +216,7 @@ TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
 ifeq ($(BR2_STRIP_strip),y)
 STRIP_STRIP_DEBUG := --strip-debug
 TARGET_STRIP = $(TARGET_CROSS)strip
-STRIPCMD = $(TARGET_CROSS)strip --remove-section=.comment
--remove-section=.note
+STRIPCMD = $(TARGET_CROSS)strip --remove-section=.comment
--remove-section=.note -p
 else
 TARGET_STRIP = /bin/true
 STRIPCMD = $(TARGET_STRIP)


BTW, there are also a lot of false positive in staging because of this command
:
$(Q)find $(STAGING_DIR)/usr/lib* -name "*.la" | xargs --no-run-if-empty \
                $(SED) "s:$(BASE_DIR):@BASE_DIR@:g" \
                        -e "s:$(STAGING_DIR):@STAGING_DIR@:g" \
                        $(if $(TOOLCHAIN_EXTERNAL_INSTALL_DIR),\
                                -e
"s:$(TOOLCHAIN_EXTERNAL_INSTALL_DIR):@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:g") \
                        -e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
                        $(if $(TOOLCHAIN_EXTERNAL_INSTALL_DIR),\
                                -e
"s:@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:$(TOOLCHAIN_EXTERNAL_INSTALL_DIR):g") \
                        -e "s:@STAGING_DIR@:$(STAGING_DIR):g" \
                        -e "s:@BASE_DIR@:$(BASE_DIR):g"

Do you think a patch using stat/touch to keep the original modification time of
impacted files be interesting ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
