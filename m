From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Oct 2017 14:37:22 +0200
Subject: [Buildroot] [git commit] package/bridge-utils: fix headers path
Message-ID: <20171003123216.1851681047@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2a06accade570a3b1ad3be7e714e6bb60addb77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, bridge-utils wants to grap the headers from the linux-headers
package, so we point it directly there, as has been the case since we
first added bridge-utils in 2003 (c8eea31d3f), and then further refined
in 2005 (178a317d26) which is the first moment we pointed to the linux-
headers directory.

However, ther are two things wrong with that.

First, the headers are not directly in $(LINUX_HEADERS_DIR). Instead,
they are in a sub-directory thereof. So, we could not have found them
the way we are doing now.

Second, this definitely does not work when using an external toolchain,
because there is not linux-headers package enabled then.

Yet, against all odds, bridge-utils has valiantly deflected all rocks
thrown its way, day-in day-out building without any issue in every
autobuilders it's been confronted with. Good boy, good boy. :-)

And indeed, it turns out that the required headers are easily found from
within the sysroot of the toolchain. Wonders! :-)

But there's still a gotcha: the default search path is still a hard
coded path pointing to the installed kernel source tree on the host.

So, we still have to pass this option, but we can simply point to the
sysroot.

[Peter: point to sysroot instead of non-existing directory]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bridge-utils/bridge-utils.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/bridge-utils/bridge-utils.mk b/package/bridge-utils/bridge-utils.mk
index 7982025..2519227 100644
--- a/package/bridge-utils/bridge-utils.mk
+++ b/package/bridge-utils/bridge-utils.mk
@@ -8,8 +8,11 @@ BRIDGE_UTILS_VERSION = 1.6
 BRIDGE_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/bridge-utils
 BRIDGE_UTILS_SOURCE = bridge-utils-1.6.tar.xz
 BRIDGE_UTILS_AUTORECONF = YES
-BRIDGE_UTILS_CONF_OPTS = --with-linux-headers=$(LINUX_HEADERS_DIR)
 BRIDGE_UTILS_LICENSE = GPL-2.0+
 BRIDGE_UTILS_LICENSE_FILES = COPYING
 
+# Avoid using the host's headers. Location is not important as
+# required headers will anyway be found from within the sysroot.
+BRIDGE_UTILS_CONF_OPTS = --with-linux-headers=$(STAGING_DIR)/usr/include
+
 $(eval $(autotools-package))
