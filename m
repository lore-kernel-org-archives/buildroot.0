From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 22:29:12 +0200
Subject: [Buildroot] [git commit] support/scripts: relocate-sdk.sh now uses
	a normal pipe to find strings
Message-ID: <20170720202609.6A21F802D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f45f0c2d40e3e750d66a9b791ed9e62ac4f69a8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The normal shell does not support the bashism "< <(...)". Therefore
we use a normal pipe to find files containing a specific string.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/misc/relocate-sdk.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/misc/relocate-sdk.sh b/support/misc/relocate-sdk.sh
index 729353a..caabeaa 100755
--- a/support/misc/relocate-sdk.sh
+++ b/support/misc/relocate-sdk.sh
@@ -35,12 +35,12 @@ echo "Relocating the buildroot SDK from ${OLDPATH} to ${NEWPATH} ..."
 # Make sure file uses the right language
 export LC_ALL=C
 # Replace the old path with the new one in all text files
-while read -r FILE ; do
+grep -lr "${OLDPATH}" . | while read -r FILE ; do
     if file -b --mime-type "${FILE}" | grep -q '^text/' && [ "${FILE}" != "${LOCFILE}" ]
     then
         sed -i "s|${OLDPATH}|${NEWPATH}|g" "${FILE}"
     fi
-done < <(grep -lr "${OLDPATH}" .)
+done
 
 # At the very end, we update the location file to not break the
 # SDK if this script gets interruted.
