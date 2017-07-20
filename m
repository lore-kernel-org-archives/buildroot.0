From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 20 Jul 2017 16:35:12 +0200
Subject: [Buildroot] [PATCH v8 01/10] support/scripts: relocate-sdk.sh now
	uses a normal pipe to find strings
In-Reply-To: <1500561321-6623-1-git-send-email-wg@grandegger.com>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
Message-ID: <1500561321-6623-2-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The normal shell does not support the bashism "< <(...)". Therefore
we use a normal pipe to find files containing a specific string.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
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
-- 
2.7.4
