From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  4 Sep 2013 10:55:59 +0200
Subject: [Buildroot] [PATCH] kmod: specify a separate set of dependencies
	for host-kmod
In-Reply-To: <B02044171A0C408F90D8A034B3523859@JohanW7>
References: <B02044171A0C408F90D8A034B3523859@JohanW7>
Message-ID: <1378284959-546-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the introduction of the host variant of kmod, no
HOST_KMOD_DEPENDENCIES was added, so the package infrastructure
assumes that it should use KMOD_DEPENDENCIES for the host variant,
after prefixing all the dependencies with 'host-'.

However, this doesn't work for kmod, since 'busybox' might be part of
the dependencies to ensure kmod gets built after busybox and is
therefore able to override the kernel module tools installed by
Busybox.

Specifying an explicit HOST_KMOD_DEPENDENCIES fixes this problem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reported-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/kmod/kmod.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 9ac7731..169fca3 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -9,6 +9,7 @@ KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod/
 KMOD_INSTALL_STAGING = YES
 KMOD_DEPENDENCIES = host-pkgconf
+HOST_KMOD_DEPENDENCIES = host-pkgconf
 
 # Some patches are touching configure.ac
 KMOD_AUTORECONF = YES
-- 
1.8.1.2
