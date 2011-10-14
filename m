From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Oct 2011 09:50:02 +0200
Subject: [Buildroot] [PATCH 1/1] dependencies: additional check for
	PERL_MM_OPT
In-Reply-To: <cover.1318578597.git.thomas.petazzoni@free-electrons.com>
References: <cover.1318578597.git.thomas.petazzoni@free-electrons.com>
Message-ID: <099241d4a1d158c57663ffbeb12c34aa1ad2f58a.1318578597.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the user has Perl local::lib installed, its environment contains
a PERL_MM_OPT variables which defines
INSTALL_BASE="/some/location". Unfortunately, having this makes the
build of libxml-parser-perl (and probably other Perl related packages)
fail, because it complains that both PREFIX (passed in our .mk file)
and INSTALL_BASE (passed from the PERL_MM_OPT environment variable)
are defined. Since in Buildroot we want our PREFIX to be considered,
we error out when the user has PERL_MM_OPT defined.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/dependencies/dependencies.sh |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index 410f663..2b9c0b3 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -40,6 +40,14 @@ if test -n "$PATH" ; then
 	fi
 fi;
 
+if test -n "$PERL_MM_OPT" ; then
+    /bin/echo -e "\nYou have PERL_MM_OPT defined because Perl local::lib"
+    /bin/echo -e "is installed on your system. Please unset this variable"
+    /bin/echo -e "before starting Buildroot, otherwise the compilation of"
+    /bin/echo -e "Perl related packages will fail"
+    exit 1
+fi
+
 # Verify that which is installed
 if ! which which > /dev/null ; then
 	/bin/echo -e "\nYou must install 'which' on your build machine\n";
-- 
1.7.4.1
