From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 27 Aug 2013 00:59:40 +0000 (UTC)
Subject: [Buildroot] [Bug 6470] New: If the build directory is a child of
 /usr, the build can fail
Message-ID: <bug-6470-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6470

           Summary: If the build directory is a child of /usr, the build
                    can fail
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: benstoltz at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Create a build directory somewhere under /usr and enable the util-linux
package.
If the directory is /usr/local/home/me/buildroot, then you will find invalid
settings from the following command:

find /usr/local/home/me/buildroot/output -name libblkid.la\* -exec grep
dependency_libs '{}' ';'

One can just build from a different directory or "sudo mount -o bind
/usr/local/home/me/buildroot /buildroot" to workaround this situation if it is
not possible to move the files. However, in some environments, users may not
have those options available.

I was tempted to try to fix the various sed commands like so:

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index b0eddde..486d66f 100644
--- a/package/pkg-autotools.mk 
+++ b/package/pkg-autotools.mk 
@@ -246,7 +246,7 @@ define $(2)_INSTALL_STAGING_CMDS 
        $$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE)
$$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
        for i in $$$$(find $(STAGING_DIR)/usr/lib* -name "*.la"); do \
                cp -f $$$$i $$$$i~; \
-               $$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \ 
+               $$(SED) "\|$(STAGING_DIR)/usr|!s:\(['=
]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \ 
        done
 endef
 endif


---

Similar changes to sed commands needed in:
package/apr/apr.mk
package/pkg-autotools.mk
package/python/python.mk
package/python3/python3.mk
package/qt5/qt5.mk
package/qwt/qwt.mk


However, that fix is not sufficiently tested yet and there may be pathological
path choices that would defeat it. Since the .la files are sourced as shell
scripts, one should be able to use shell variable expansion to reliably
generate the correct path, even when these sed scripts are run multiple times.

I've made a quick try editing in foo=sysroot_path and then dependency_libs="
${sysroot_path}/usr". But quoting hell and time are making me leave this
problem for another day.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
