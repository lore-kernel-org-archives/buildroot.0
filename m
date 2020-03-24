From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 15:27:57 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fix flake8 E722
 warning
Message-ID: <20200324144153.4A6218805D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b5bc480a59a100e835b8d7739ce71c4f14d2dba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

flake8 complains with:

  support/scripts/pkg-stats:339:13: E722 do not use bare 'except'

Due to the construct:

  try:
     something
  except:
     print("some message")
     raise

Which is in fact OK because the exception is re-raised. This issue is
discussed at https://github.com/PyCQA/pycodestyle/issues/703, and the
general agreement is that these "bare except" are OK, and should be
ignored from flake8 using a noqa statement.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 4d8e932a9f..5adda6df08 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -336,7 +336,7 @@ class CVE:
             filename = CVE.download_nvd_year(nvd_dir, year)
             try:
                 content = ijson.items(gzip.GzipFile(filename), 'CVE_Items.item')
-            except:
+            except:  # noqa: E722
                 print("ERROR: cannot read %s. Please remove the file then rerun this script" % filename)
                 raise
             for cve in content:
