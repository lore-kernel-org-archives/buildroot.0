From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon,  4 Feb 2019 19:05:46 +0100
Subject: [Buildroot] [PATCHv2 1/8] support/download/scp: fix download with
 scheme prefix 'scp://'
In-Reply-To: <20190204180553.18394-1-patrickdepinguin@gmail.com>
References: <20190204180553.18394-1-patrickdepinguin@gmail.com>
Message-ID: <20190204180553.18394-2-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The scp download helper is broken when the server URL starts with 'scp://'.
Such prefix is used in two situations:
1. to let FOO_SITE point to an scp location without explicitly having to set
   'FOO_SITE_METHOD = scp'

2. when BR2_PRIMARY_SITE or BR2_BACKUP_SITE points to an scp location. In
   this case, there is no equivalent of 'SITE_METHOD'.

Strip out the scheme prefix, similarly to how the 'file' download helper
does it. That helper has the same cases as above.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
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
-- 
2.19.2
