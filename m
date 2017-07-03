From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Jul 2017 18:03:51 +0200
Subject: [Buildroot] [git commit] core/pkg-utils: check hashes of license
	files
Message-ID: <20170703161020.A23177FAF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=518b797b2b6627a5dfa178ca60e5420becf64e96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will help catch a change of license even if the filename does
not change.

For now, a missing hash for the license files is not a fatal error, to
let people catch up and add them. When we switch to make it mandatory,
we can simplify the code by just removing the case statement.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-utils.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index e9ac562..accf48c 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -85,5 +85,10 @@ endef
 
 define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-fullpath, {HOST|TARGET}
 	mkdir -p $(LICENSE_FILES_DIR_$(6))/$(2)/$(dir $(4)) && \
+	{ \
+		support/download/check-hash $(3)/$(1).hash $(5) $(4); \
+		ret=$${?}; \
+		case $${ret} in (0|3) ;; (*) exit 1;; esac; \
+	} && \
 	cp $(5) $(LICENSE_FILES_DIR_$(6))/$(2)/$(4)
 endef
