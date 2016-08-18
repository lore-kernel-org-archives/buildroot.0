From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 00:02:27 +0200
Subject: [Buildroot] [git commit] package/elfutils: set program-prefix to
	default ("eu-")
Message-ID: <20160902142936.ABA83822FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2970711de7516b171b9c214be388bad49177b842
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Elfutils program names collide with binutils' binaries. By default
applications provided by elfutils are prefixed with "eu-", but in
Buildroot that setting is overridden by pkg-autotools.
The option in pkg-autotools rules was added to avoid including a target
triple in some packages as a prefix, so restore elfutils default
behaviour by adding a "eu-" program-prefix.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: add comment in the .mk file explaining why we have a custom
program prefix, as suggested by Arnout.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elfutils/elfutils.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index b999d0f..6af1223 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -14,7 +14,12 @@ ELFUTILS_DEPENDENCIES = zlib
 
 # We patch configure.ac
 ELFUTILS_AUTORECONF = YES
-ELFUTILS_CONF_OPTS += --disable-werror
+
+# Pass a custom program prefix to avoid a naming conflict between
+# elfutils binaries and binutils binaries.
+ELFUTILS_CONF_OPTS += \
+	--disable-werror \
+	--program-prefix="eu-"
 
 # elfutils gets confused when lfs mode is forced, so don't
 ELFUTILS_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
