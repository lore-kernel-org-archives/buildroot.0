From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Nov 2010 10:33:47 +0100
Subject: [Buildroot] [git commit master 1/1] tcpdump: punt duplicate
	versioned binary
Message-ID: <20101129093435.4C8E48C6FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3783d4a30140ae68e016677c125405cf77142e38
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tcpdump package likes to install two binaries into /usr/sbin --
one named "tcpdump" and one named "tcpdump.<ver>".  But it does this
by installing the file twice rather than using links.  Since the alt
name is useless to us, just punt it.

[Peter: Rework to use POST_INSTALL_TARGET_HOOKS instead]
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    2 +-
 package/tcpdump/tcpdump.mk |    7 +++++++
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 87056ed..f696164 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: qt, xserver-xorg
+	Updated/fixed packages: qt, tcpdump, xserver-xorg
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index e295e69..8122816 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -14,4 +14,11 @@ TCPDUMP_CONF_OPT:=--without-crypto \
 		$(if $(BR2_PACKAGE_TCPDUMP_SMB),--enable-smb,--disable-smb)
 TCPDUMP_DEPENDENCIES:=zlib libpcap
 
+# make install installs an unneeded extra copy of the tcpdump binary
+define TCPDUMP_REMOVE_DUPLICATED_BINARY
+	rm -f $(TARGET_DIR)/usr/sbin/tcpdump.$(TCPDUMP_VERSION)
+endef
+
+TCPDUMP_POST_INSTALL_TARGET_HOOKS += TCPDUMP_REMOVE_DUPLICATED_BINARY
+
 $(eval $(call AUTOTARGETS,package,tcpdump))
-- 
1.7.2.2
