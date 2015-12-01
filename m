From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  1 Dec 2015 23:19:07 +0100
Subject: [Buildroot] [PATCH 2/2 for 2015.11.x] package/gawk: do not use
	readeline ormpfr in host variant
In-Reply-To: <cover.1449008170.git.yann.morin.1998@free.fr>
References: <cover.1449008170.git.yann.morin.1998@free.fr>
Message-ID: <9cd7b6bdd9790d4105829b278c0e6acba9f103f3.1449008170.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gawk has an optional dependency on mpfr (and thus gmp) and readline,
and will probe for them. If they are present, they are used; if they
are missing, that's not an error. mpfr (and gmp) is used for "BIGNUM"
support on gawk; readline is used by the gawk debugger.

However, mpfr (bringing gmp) are also host-packages in Buildroot, but in
the standard build order (i.e. a plain 'make'), they are built after
gawk. Ditto readline (from ncurses).

If the user has the development files for gmp and mpfr, then gawk is
linked to them. Ditto readline.

Now, further on in the build, we build gmp and mpfr (for gcci or guile),
so we install them in the host dir. Ditto readline (for gdb, ncurses
itself and a few other packages...)

But because we forcibly set an RPATH tag on all our host binaries, our
host gawk will now dynamically link with our versions, when it was in
fact built against the host ones.

This did not seem to cause any harm dso far, but is far from ideal.

Since we do not really need BIGNUM or the debugger in our host gawk, we
just forcibly disable them and configure gawk without readline or mpfr
(there's no switch for gmp, but it;s not a direct dependency, it comes
just with mpfr).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Peter, that's also for the 2015.11.x maintenance branch.
---
 package/gawk/gawk.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 1820689..661ec1e 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -16,9 +16,11 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 GAWK_DEPENDENCIES += busybox
 endif
 
-# We don't have a host-busybox
+# We don't have a host-busybox, and we don't want to use mpfr
 HOST_GAWK_DEPENDENCIES =
 
+HOST_GAWK_CONF_OPTS = --without-readline --without-mpfr
+
 define GAWK_CREATE_SYMLINK
 	ln -sf /usr/bin/gawk $(TARGET_DIR)/usr/bin/awk
 endef
-- 
1.9.1
