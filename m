From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Feb 2019 20:32:53 +0100
Subject: [Buildroot] [git commit] support/download/scp: fix download with
 scheme prefix 'scp://'
Message-ID: <20190205193816.679F783BE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa62b36456d143e4d2b7f1acd9a61d6bad52d3e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The scp download helper is broken when the server URL starts with 'scp://'.
Such prefix is used in two situations:
1. to let FOO_SITE point to an scp location without explicitly having to set
   'FOO_SITE_METHOD = scp'

2. when BR2_PRIMARY_SITE or BR2_BACKUP_SITE points to an scp location. In
   this case, there is no equivalent of 'SITE_METHOD'.

Strip out the scheme prefix, similarly to how the 'file' download helper
does it. That helper has the same cases as above.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/scp | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/download/scp b/support/download/scp
index 49cfff2b9f..80cf495c4e 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -34,4 +34,7 @@ _scp() {
     eval ${SCP} "${@}"
 }
 
+# Remove any scheme prefix
+uri="${uri##scp://}"
+
 _scp ${verbose} "${@}" "'${uri}/${filename}'" "'${output}'"
