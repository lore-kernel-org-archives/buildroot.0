From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat,  2 Jan 2016 21:22:54 +0100
Subject: [Buildroot] [PATCH] Add download helper for PyPi
Message-ID: <1451766174-7072-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PyPi has following URL structure:

https://pypi.python.org/packages/source/{first pkg name char}/{pkg name}

User only needs to pass package name to the helper. The helper itself
extracts the first package name character and inserts it into download URL
together with package name.

Usage example:

PYTHON_SIX_SITE = $(call pypi,six)

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/pkg-download.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 1332e66..caaeba5 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -55,6 +55,9 @@ domainseparator = $(if $(1),$(1),/)
 # github(user,package,version): returns site of GitHub repository
 github = https://github.com/$(1)/$(2)/archive/$(3)
 
+# pypi(package): returns site of PyPi download location
+pypi = https://pypi.python.org/packages/source/$(shell echo $(1) | cut -c1)/$(1)
+
 # Expressly do not check hashes for those files
 # Exported variables default to immediately expanded in some versions of
 # make, but we need it to be recursively-epxanded, so explicitly assign it.
-- 
2.1.4
