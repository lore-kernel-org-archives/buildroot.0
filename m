From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Mar 2018 17:18:18 +0100
Subject: [Buildroot] [git commit] support/dependencies/dependencies.sh:
 check for Python argparse module
Message-ID: <20180303162031.D699D815FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8cde7e6af9193545819c05369b87c8a61b2a61fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The script support/scripts/check-uniq-files uses the argparse Python
module. In most recent Python versions (starting with 2.7), the
argparse module is part of the standard library, and we already check
for the availability of Python in
support/dependencies/dependencies.sh.

However, when running on an ancient distribution with Python 2.6, the
argparse module is not part of the Python standard library, but
available as an external module. Without this module, the build fails,
because check-uniq-files, which is used in target-finalize, fails to
run.

To avoid this failure, this commit adds a check in
support/dependencies/dependencies.sh to verify that the argparse
module is available.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 17dbe08fa4..6698f21a7a 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -301,3 +301,8 @@ if [ -n "$missing_perl_modules" ] ; then
 	echo
 	exit 1
 fi
+
+if ! python -c "import argparse" > /dev/null 2>&1 ; then
+	echo "Your Python installation is not complete enough: argparse module is missing"
+	exit 1
+fi
