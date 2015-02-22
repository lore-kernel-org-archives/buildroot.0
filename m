From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 22 Feb 2015 16:14:57 +0000
Subject: [Buildroot] [PATCH v2] evtest: disable documentation
Message-ID: <1424621697-22309-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

evtest uses asciidoc to generate documentation, but /usr/bin/asciidoc
will try to use buildroot's host-python which doesn't have the required
unicodedata. To avoid that, define ASCIIDOC as an empty string so the
Makefile can't find the executable and skips the documentation
generation.  This is the same solution used in the evemu package.
Otherwise it will fail with this message:

make[1]: Entering directory `/br/output/build/evtest-1.32'
/usr/bin/make  all-am
make[2]: Entering directory `/br/output/build/evtest-1.32'
  File "/usr/bin/asciidoc", line 95
    except KeyError, k: return None

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2: amend commit message

 package/evtest/evtest.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/evtest/evtest.mk b/package/evtest/evtest.mk
index 42a7999..1573f52 100644
--- a/package/evtest/evtest.mk
+++ b/package/evtest/evtest.mk
@@ -13,4 +13,9 @@ EVTEST_DEPENDENCIES = host-pkgconf
 # needed because source package contains no generated files
 EVTEST_AUTORECONF = YES
 
+# asciidoc used to generate manpages, which we don't need, and if it's
+# present on the build host, it ends getting called with our host-python
+# which doesn't have all the needed modules enabled, breaking the build
+EVTEST_CONF_ENV = ac_cv_path_ASCIIDOC=""
+
 $(eval $(autotools-package))
-- 
1.7.1
