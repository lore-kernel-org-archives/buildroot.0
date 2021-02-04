From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Feb 2021 17:26:42 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/linux-headers:
 with headers from kernel, also override srcdir
Message-ID: <20210204164022.7CC1A81592@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0157044f941caa393945409c96d3249dce1bbb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

When using the headers from the kernel to be built, with the kernel
set to a custom version, and overriding the kernel sources with
LINUX_OVERRIDE_SRCDIR, the linux-headers package is still trying to
download an archive, and fails to validate its hash.

What is going on under the hood is that, with _OVERRIDE_SRCDIR, the
_VERSION of a package is set to 'custom'. Furthermore, the variable
BR_NO_CHECK_HASH_FOR is recursively expanded, so its value is only
evaluated when it is needed.

For linux-headers, we inherit the values from the linux package, and
the LINUX_HEADERS_VERSION takes the value from the configuration.

Thus we end up with the following situation:

    LINUX_VERSION=custom
    LINUX_HEADERS_VERSION=5.10   # For example
    BR_NO_CHECK_HASH_FOR=... linux-custom.tar.gz ...

And thus the archive downloaded by linux-headers will not match any
exclusion, and since there will most probably not be a hash for it,
the download will fail, as was noticed and reported by Jarkko.

But in this case, what we really want is to really use the headers
from the kernel that we build, we do not even want to attempt a
download at all.

So, when using the headers from the kernel to be built, we also
propagate the LINUX_OVERRIDE_SRCDIR to linux-headers, so that we
also use the headers from the overridden sources.

Furthermore, in that configuration, we explicitly disallow
overriding the linux-headers specifically, as it does not make sense
(even though, if they were overridden to the same location, that'd
be OK, but to simplify the condition, we do not even check for that).

Reported-by: Jarkko Sakkinen <jjs@kapsi.fi>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b9e7adc152b5811b20724d8c05f0f2117254919c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/linux-headers.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 4c3cb716b3..2e30a8ff45 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -18,6 +18,10 @@ LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_HEADERS_CUSTOM_TARBALL_LOCATION = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 LINUX_HEADERS_REPO_URL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_HEADERS_CIP = $(BR2_LINUX_KERNEL_LATEST_CIP_VERSION)$(BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION)
+ifneq ($(LINUX_HEADERS_OVERRIDE_SRCDIR),)
+$(error LINUX_HEADERS_OVERRIDE_SRCDIR must not be set when BR2_KERNEL_HEADERS_AS_KERNEL=y)
+endif
+LINUX_HEADERS_OVERRIDE_SRCDIR = $(LINUX_OVERRIDE_SRCDIR)
 else # ! BR2_KERNEL_HEADERS_AS_KERNEL
 LINUX_HEADERS_CUSTOM_TARBALL = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_TARBALL))
 LINUX_HEADERS_CUSTOM_GIT = $(call qstrip,$(BR2_KERNEL_HEADERS_CUSTOM_GIT))
