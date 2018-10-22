From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Oct 2018 07:33:41 +0000
Subject: [Buildroot] [Bug 11416] check-uniq-files staging issue
In-Reply-To: <bug-11416-163@https.bugs.busybox.net/>
References: <bug-11416-163@https.bugs.busybox.net/>
Message-ID: <bug-11416-163-vYSBbaxHKg@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11416

--- Comment #1 from Jean-pierre Cartal <jpcartal@free.fr> ---
The following patch avoids the false positive warnings regarding .la files: 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a689dde4d2..110f8ee4a5 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -276,7 +276,8 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
                                $(addprefix
$(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ;\
        fi
        @$(call MESSAGE,"Fixing libtool files")
-       $(Q)find $(STAGING_DIR)/usr/lib* -name "*.la" | xargs --no-run-if-empty
\
+       $(Q)for lafile in $$(find $(@D) -name *.la -exec basename {} \; | sort
-u); do \
+               ls $(STAGING_DIR)/usr/lib*/$${lafile}; done | xargs
--no-run-if-empty \
                $(SED) "s:$(BASE_DIR):@BASE_DIR@:g" \
                        -e "s:$(STAGING_DIR):@STAGING_DIR@:g" \
                        $(if $(TOOLCHAIN_EXTERNAL_INSTALL_DIR),\

-- 
You are receiving this mail because:
You are on the CC list for the bug.
