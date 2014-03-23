From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Mar 2014 18:43:01 +0100
Subject: [Buildroot] [RFC 2/3] Makefile: include only the package .mk files
	that are needed
In-Reply-To: <1395596582-7062-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1395596582-7062-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1395596582-7062-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of including all the package .mk files, that take a long time
to parse, this commit changes the Makefile logic to only include the
package .mk files for the selected packages. To do so, it looks at all
the BR2_PACKAGE_ variables, convert their name into a package file
name, and includes this file. This way, if BR2_PACKAGE_FOO=y or
BR2_PACKAGE_HOST_FOO=y are set, the package/foo/foo.mk is included.

The main purpose of this change is to significantly speed up the
execution of make when there is actually nothing or little to do: an
empty Buildroot invocation currently takes 12 seconds on a relatively
fast SSD equipped laptop, and this is only going to grow up with the
number of packages added in Buildroot.

This change of course has a number of consequences:

 * We must define blind BR2_PACKAGE_HOST_<foo> options for *all* host
   packages, and ensure they are selected as needed at the Config.in
   level. Therefore for host packages, describing the dependency in
   the .mk file would no longer be useful.

 * The name of a package option must exactly match the location of the
   package, which also means we can no longer have sub-directories for
   packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 2b13917..7441882 100644
--- a/Makefile
+++ b/Makefile
@@ -386,7 +386,12 @@ ifneq ($(PACKAGE_OVERRIDE_FILE),)
 -include $(PACKAGE_OVERRIDE_FILE)
 endif
 
-include $(sort $(wildcard package/*/*.mk))
+define pkgopt
+$(call LOWERCASE,$(patsubst BR2_PACKAGE_%,%,$(patsubst BR2_PACKAGE_HOST_%,%,$(1))))
+endef
+
+-include $(sort $(foreach V,$(filter BR2_PACKAGE_%,$(.VARIABLES)),\
+	$(wildcard $(TOPDIR)/package/$(call pkgopt,$V)/$(call pkgopt,$V).mk)))
 
 include boot/common.mk
 include linux/linux.mk
-- 
1.8.3.2
