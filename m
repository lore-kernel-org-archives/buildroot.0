From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Mar 2012 09:06:18 +0200
Subject: [Buildroot] [PATCH 2/2] microperl: install host-microperl in
	$(HOST_DIR)/opt/perl
In-Reply-To: <cover.1332831974.git.thomas.petazzoni@free-electrons.com>
References: <cover.1332831974.git.thomas.petazzoni@free-electrons.com>
Message-ID: <cb1e211a5de6c88c39cd9890dbf823c0ff1766c3.1332831974.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit is a tentative at fixing some Perl-related build problems
we are having nowadays, due to the fact that microperl now depends on
host-microperl. Since the perl binary from host-microperl is installed
in $(HOST_DIR)/usr/bin, it gets picked up when we run host tools like
host-intltool, which were normally meant to be used against the
distribution-provided Perl.

This problem currently causes between a third to half of the failures
in our random build tests.

Another, cleaner, option would be to make host-intltool depend on
host-microperl, but this would require every user needing intltool to
build a host Perl interpreter, even if the real reason for build the
host Perl interpreter is only needed for those who want to build the
Perl interpreter for the target. This commit is really a test at
trying another solution than adding this dependency, to see whether it
turns out to be a reasonable trade-off or not. Later developments and
improvements in the Perl area may require to switch to a different
solution than the one implemented by this patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/microperl/microperl.mk |   18 ++++++++++++------
 1 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index 5bf4a2e..31b7a63 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -22,10 +22,16 @@ MICROPERL_MODS += constant.pm CGI CGI.pm Carp.pm Exporter.pm overload.pm \
 	vars.pm warnings.pm warnings/register.pm
 endif
 
-# Host microperl is actually full-blown perl
+# Host microperl is actually full-blown perl. Instead of installing it
+# with prefix=$(HOST_DIR)/usr, we install it with
+# prefix=$(HOST_DIR)/opt/perl so that this host-microperl is only used
+# for building the target microperl. If we install the host-microperl
+# in $(HOST_DIR)/usr, it gets picked up by all Perl-based utilities
+# (such as intltool) that Buildroot has installed, creating
+# incompatibilites with the Perl provided by the distribution.
 define HOST_MICROPERL_CONFIGURE_CMDS
 	cd $(@D) ; \
-	./Configure -Dcc="$(HOSTCC)" -Dprefix="$(HOST_DIR)/usr" \
+	./Configure -Dcc="$(HOSTCC)" -Dprefix="$(HOST_DIR)/opt/perl/" \
 		-Dloclibpth='/lib /lib64 /usr/lib /usr/lib64' -des
 endef
 
@@ -95,8 +101,8 @@ define MICROPERL_CONFIGURE_CMDS
 	cp -f $(@D)/uconfig.sh $(@D)/config.sh
 	echo "ccname='$(TARGET_CC)'" >>$(@D)/config.sh
 	echo "PERL_CONFIG_SH=true" >>$(@D)/config.sh
-	cd $(@D) ; $(HOST_DIR)/usr/bin/perl make_patchnum.pl ; \
-	$(HOST_DIR)/usr/bin/perl configpm
+	cd $(@D) ; $(HOST_DIR)/opt/perl/bin/perl make_patchnum.pl ; \
+	$(HOST_DIR)/opt/perl/bin/perl configpm
 endef
 
 define MICROPERL_BUILD_CMDS
@@ -111,9 +117,9 @@ endef
 # Just ignore make_ext.pl warning/errors
 define MICROPERL_BUILD_EXTENSIONS
 	for i in $(MICROPERL_MODS); do \
-	cd $(@D); ln -sf $(HOST_DIR)/usr/bin/perl miniperl; \
+	cd $(@D); ln -sf $(HOST_DIR)/opt/perl/bin/perl miniperl; \
 		PERL5LIB=$(TARGET_DIR)/$(MICROPERL_ARCH_DIR) \
-		$(HOST_DIR)/usr/bin/perl make_ext.pl MAKE="$(MAKE)" --nonxs \
+		$(HOST_DIR)/opt/perl/bin/perl make_ext.pl MAKE="$(MAKE)" --nonxs \
 		`echo $$i|sed -e 's/.pm//'`; \
 	done
 endef
-- 
1.7.4.1
