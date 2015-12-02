From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Dec 2015 23:42:02 +0100
Subject: [Buildroot] [git commit] package/gawk: do not use readeline ormpfr
	in host variant
Message-ID: <20151202225655.CA91A802C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc08a57305264d8dd0b6c54a4e35ecd3e151c22f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

This did not seem to cause any harm so far, but is far from ideal.

Since we do not really need BIGNUM or the debugger in our host gawk, we
just forcibly disable them and configure gawk without readline or mpfr
(there's no switch for gmp, but it's not a direct dependency, it comes
just with mpfr).

[Adjust comment as suggested by Thomas/Yann]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gawk/gawk.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 1820689..6702c48 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -16,9 +16,11 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 GAWK_DEPENDENCIES += busybox
 endif
 
-# We don't have a host-busybox
+# We don't have a host-busybox, and we don't want to use readline or mpfr
 HOST_GAWK_DEPENDENCIES =
 
+HOST_GAWK_CONF_OPTS = --without-readline --without-mpfr
+
 define GAWK_CREATE_SYMLINK
 	ln -sf /usr/bin/gawk $(TARGET_DIR)/usr/bin/awk
 endef
