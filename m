From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 18:28:46 +0200
Subject: [Buildroot] [git commit] getent: new package
Message-ID: <20141012163257.7E825B2960@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db4919bcac12ff9d2383dd6c69e3042e0658247a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ecryptfs-utils scripts require the 'getent' program to be
installed to find the home directory of users. However, Buildroot
currently never installs this program, and therefore bug #7142 was
reported, explaining that ecryptfs-utils is not working properly.

In normal Linux systems, the getent program is provided by glibc, and
allows to query not only /etc/passwd, but also other NSS databases
such as LDAP and others.

In the context of Buildroot, this gives us several cases:

 1/ Internal toolchain

    a/ glibc/eglibc. In this case, the getent program is already built
       and installed by Buildroot in the staging directory, so the
       only thing missing is installing it in the target directory.

    b/ uclibc. uClibc provides a simple shell script that emulates the
       behavior of getent. It is located in extra/scripts/getent in
       the uClibc sources, but is currently never installed.

    c/ musl. There seems to be no getent implementation, and musl does
       not support NSS.

 2/ External toolchain

    a/ glibc/eglibc. In several external toolchains that we tested,
       there is a pre-built getent binary available in the sysroot,
       but Buildroot is not installing it to the target.

    b/ uclibc. The getent wrapper script is typically not part of any
       external uClibc toolchain.

    c/ musl. There is no getent implementation.

This patch proposes to solve this problem by introducing a getent
package, which has the following behavior:

 - When the toolchain is glibc based (either internal or external), it
   installs the getent program that was built and installed in the
   staging directory. This covers cases 1/ a/ and 2/ a/ above.

 - When the toolchain is uclibc or musl based, it installs a version
   of uclibc's getent wrapper script that is built into the getent
   package. This script is unlikely to change over time, so having it
   directly built into the package should not cause much issues moving
   forward. This covers all other cases above.

This solution allows to install a NSS-capable getent when glibc/eglibc
is used, and otherwise to rely on uClibc's wrapper script.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in        |    1 +
 package/getent/Config.in |   10 ++++++++++
 package/getent/getent    |   45 +++++++++++++++++++++++++++++++++++++++++++++
 package/getent/getent.mk |   26 ++++++++++++++++++++++++++
 4 files changed, 82 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 94e5f90..ef84916 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1181,6 +1181,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 endif
 	source "package/dsp-tools/Config.in"
 	source "package/ftop/Config.in"
+	source "package/getent/Config.in"
 	source "package/htop/Config.in"
 	source "package/iprutils/Config.in"
 	source "package/keyutils/Config.in"
diff --git a/package/getent/Config.in b/package/getent/Config.in
new file mode 100644
index 0000000..a7303cb
--- /dev/null
+++ b/package/getent/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_GETENT
+	bool "getent"
+	help
+	  This package installs the 'getent' utility, which allows to
+	  get entries from Name Service Switch libraries. For glibc
+	  toolchains, it's the real getent program from the C library
+	  that gets installed, which is NSS-capable. For uclibc and
+	  musl toolchains, it's a simple wrapper script that emulates
+	  getent's behavior, since there is no NSS support in uclibc
+	  and musl.
diff --git a/package/getent/getent b/package/getent/getent
new file mode 100644
index 0000000..fdda793
--- /dev/null
+++ b/package/getent/getent
@@ -0,0 +1,45 @@
+#!/bin/sh
+# $Header: /var/cvs/uClibc/extra/scripts/getent,v 1.2 2005/02/02 14:18:01 solar Exp $
+#
+# Closely (not perfectly) emulate the behavior of glibc's getent utility
+#
+#passwd|shadow|group|aliases|hosts|networks|ethers|netgroup|protocols|services|rpc
+# only returns the first match (by design)
+# dns based search is not supported (hosts,networks)
+# case-insensitive matches not supported (ethers; others?)
+# may return false-positives (hosts,protocols,rpc,services,ethers)
+#
+# Taken from uClibc 0.9.33.
+
+export PATH="${PATH}:/bin:/usr/bin"
+
+file="/etc/$1"
+case $1 in
+	passwd|group)
+		match="^$2:\|^[^:]*:[^:]*:$2:" ;;
+	shadow)
+		match="^$2:" ;;
+	networks|netgroup)
+		match="^[[:space:]]*$2\>" ;;
+	hosts|protocols|rpc|services|ethers)
+		match="\<$2\>" ;;
+	aliases)
+		match="^[[:space:]]*$2[[:space:]]*:" ;;
+	""|-h|--help)
+		echo "USAGE: $0 database [key]"
+		exit 0 ;;
+	*)
+		echo "$0: Unknown database: $1" 1>&2
+		exit 1 ;;
+esac
+
+if [ ! -f "$file" ] ; then
+	echo "$0: Could not find database file for $1" 1>&2
+	exit 1
+fi
+
+if [ $# -eq 1 ] ; then
+	exec cat "$file"
+else
+	sed "s/#.*//; /$match/q; d" "$file" | grep . || exit 2
+fi
diff --git a/package/getent/getent.mk b/package/getent/getent.mk
new file mode 100644
index 0000000..dd08478
--- /dev/null
+++ b/package/getent/getent.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# getent
+#
+################################################################################
+
+# source included in Buildroot
+GETENT_SOURCE =
+
+GETENT_VERSION = buildroot-$(BR2_VERSION)
+GETENT_LICENSE = LGPLv2.1+
+
+# For glibc toolchains, we use the getent program built/installed by
+# the C library. For other toolchains, we use the wrapper script
+# included in this package.
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
+GETENT_LOCATION = $(STAGING_DIR)/usr/bin/getent
+else
+GETENT_LOCATION = package/getent/getent
+endif
+
+define GETENT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(GETENT_LOCATION) $(TARGET_DIR)/usr/bin/getent
+endef
+
+$(eval $(generic-package))
