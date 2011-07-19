From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jul 2011 07:05:26 +0200
Subject: [Buildroot] [PATCH 1/2] Allow rebuilding of generic targets.
In-Reply-To: <1310980553-20754-2-git-send-email-quotientvremainder@gmail.com>
References: <1310980553-20754-1-git-send-email-quotientvremainder@gmail.com>
 <1310980553-20754-2-git-send-email-quotientvremainder@gmail.com>
Message-ID: <20110719070526.44b8f083@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 18 Jul 2011 10:15:52 +0100,
Quotient Remainder <quotientvremainder@gmail.com> a ?crit :

> Individual packages using the GENTARGETS and AUTOTARGETS infrastructure
> can now be rebuilt by issuing "make ${pkg}-rebuild".
> Changes can be made in output/build/${pkg}/* and make ${pkg}-rebuild will
> run the normal build command for that directory again.
> 
> Signed-off-by: Quotient Remainder <quotientvremainder@gmail.com>

I also have a patch (below) that implements a similar feature
(<pkg>-rebuild and <pkg>-reconfigure), but it also does the "make"
again automatically as well to regenerate the root filesystem. The
implementation is a bit different, as it doesn't use a new fake stamp
file, but simply uses phony targets.

commit 6242b6c713a435c1afa4fb04655024539d0d6106
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Wed May 18 23:23:44 2011 +0200

    package: add <pkg>-rebuild and <pkg>-reconfigure
    
    We are often asked "how can I restart the build of a package ?" or
    "how can I restart the build of package from the configure part
    ?". Obviously, tweaking with stamp files is possible, but not very
    user friendly.
    
    Therefore this patch adds two new per-package targets: <pkg>-rebuild
    and <pkg>-reconfigure. They will remove the right stamp files and
    restart the complete build process (by using the 'all' target, so that
    not only the package is reconfigured, recompiled and reinstalled, but
    the root filesystem images are also regenerated).
    
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 1cfffab..b876d9d 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -504,6 +504,19 @@ $(1)-clean:		$(1)-uninstall \
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
+$(1)-clean-for-rebuild:
+			rm -f $$($(2)_TARGET_BUILD)
+			rm -f $$($(2)_TARGET_INSTALL_STAGING)
+			rm -f $$($(2)_TARGET_INSTALL_TARGET)
+			rm -f $$($(2)_TARGET_INSTALL_HOST)
+
+$(1)-rebuild:		$(1)-clean-for-rebuild all
+
+$(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
+			rm -f $$($(2)_TARGET_CONFIGURE)
+
+$(1)-reconfigure:	$(1)-clean-for-reconfigure all
+
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
 $$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
