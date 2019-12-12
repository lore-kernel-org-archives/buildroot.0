From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Dec 2019 08:27:54 +0100
Subject: [Buildroot] [git commit] package/pkg-generic.mk,
 support/scripts/fix-rpath: fix per-package regexp
Message-ID: <20191212072102.7962C890D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97dee44a6c166980e992699969c4ba5d4860a378
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c4e6d5c8be6ada8e7c60950e3b499c55d48761cb ("core: implement
per-package SDK and target") had a mistake on the regexp that is used
to match $(PER_PACKAGE_DIR)/<something>/, and due to this, the regexp
was never matched.

The + sign in [^/]+ which was suggested by Yann E. Morin during the
review of the per-package patch series (instead of [^/]*) needs to be
escaped to be taken into account correctly. Without this, the regexp
doesn't match, and the replacement is not done, causing:

 (1) For the libtool fixup in pkg-generic.mk, the lack of replacement
     causes libtool .la files to not be tweaked as expected, which it
     turn causes build failures reported by the autobuilder.

 (2) For the fix-rpath, the RPATH of host binaries in the SDK were not
     correct.

Interestingly, we have the same regexp in
support/scripts/check-host-rpath, but here the + sign does not need to
be escaped.

Fixes:

  http://autobuild.buildroot.net/results/d4d996f3923699e266afd40cc7180de0f7257d99/ (libsvg-cairo)
  http://autobuild.buildroot.net/results/56330f86872f67a2ce328e09b4c7b12aa835a432/ (bind)
  http://autobuild.buildroot.net/results/9e0fc42d2c9f856b92954b08019b83ce668ef289/ (ibrcommon)
  and probably a number of other similar issues

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk    | 2 +-
 support/scripts/fix-rpath | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6d598cfd9d..3904a1c4db 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -145,7 +145,7 @@ endif
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 define fixup-libtool-files
 	$(Q)find $(2)/usr/lib* -name "*.la" | xargs --no-run-if-empty \
-		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]+/:$(PER_PACKAGE_DIR)/$(1)/:g"
+		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$(1)/:g"
 endef
 endif
 
diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
index 9fc9ef8514..3e67e770e5 100755
--- a/support/scripts/fix-rpath
+++ b/support/scripts/fix-rpath
@@ -141,7 +141,7 @@ main() {
         # the per-package host directory is not within ${rootdir}. So,
         # we rewrite all RPATHs pointing to per-package directories so
         # that they point to the global host directry.
-        changed_rpath=$(echo ${rpath} | sed "s@${PER_PACKAGE_DIR}/[^/]+/host@${HOST_DIR}@")
+        changed_rpath=$(echo ${rpath} | sed "s@${PER_PACKAGE_DIR}/[^/]\+/host@${HOST_DIR}@")
         if test "${rpath}" != "${changed_rpath}" ; then
             ${PATCHELF} --set-rpath ${changed_rpath} "${file}"
         fi
