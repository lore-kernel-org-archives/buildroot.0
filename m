From: Vincent Fazio <vfazio@xes-inc.com>
Date: Fri, 19 Feb 2021 15:21:54 -0600
Subject: [Buildroot] [PATCH] support/download/svn: fix date format for
 archive creation
Message-ID: <20210219212154.27107-1-vfazio@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previously we would use the date provided by:
`svn info --show-item last-changed-date ...`

The date returned from this command could include sub-second precision
which is not compatible with the PAX options we specify to GNU tar.

Now the returned date is massaged to drop the sub-seconds.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 support/download/svn | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/download/svn b/support/download/svn
index 839dccaf62..ea1032267f 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -52,6 +52,9 @@ _svn export ${verbose} "${@}" "'${uri}@${rev}'" "'${basename}'"
 # last line (svn outputs everything on stdout)
 date="$( _svn info --show-item last-changed-date "'${uri}@${rev}'" |tail -n 1 )"
 
+# Drop sub-second precision to play nice with GNU tar's valid_timespec check
+date="$( date -d "${date}" -uIseconds )"
+
 # Generate the archive.
 # We did a 'svn export' above, so it's not a working copy (there is no .svn
 # directory or file to ignore).
-- 
2.30.0
