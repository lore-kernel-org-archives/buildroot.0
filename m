From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 Jan 2017 23:37:45 +0100
Subject: [Buildroot] [git commit] riemann-c-client: fix build on bfin
Message-ID: <20170131225116.9021280DB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0b8e1835bee9ee2bc5b3ab8c1052c83c907bf19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/8de/8de7e533fed3c48fdbe164bc9286148e63494c8f/build-end.log
http://autobuild.buildroot.net/results/828/828a4e09cb14c33b021bd347394104ff8b6dba78/build-end.log
http://autobuild.buildroot.net/results/fc8/fc80326880fb19cd6fbd6c0073916373a52ef873/build-end.log

LD symbol versioning is not working on blackfin even though ld accepts the
--version-script argument, causing link errors, so disable it.

Notice: These autobuilder issues happened with an external fdpic toolchain,
but the issue also occurs with internal toolchain / binutils 2.27 and
fdpic/flat.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/riemann-c-client/riemann-c-client.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/riemann-c-client/riemann-c-client.mk b/package/riemann-c-client/riemann-c-client.mk
index 027898b..5593519 100644
--- a/package/riemann-c-client/riemann-c-client.mk
+++ b/package/riemann-c-client/riemann-c-client.mk
@@ -15,4 +15,9 @@ RIEMANN_C_CLIENT_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_GNUTLS),gnutls) \
 	$(if $(BR2_PACKAGE_JSON_C),json-c)
 
+ifeq ($(BR2_bfin),y)
+# ld symbol versioning not working on bfin
+RIEMANN_C_CLIENT_CONF_ENV += ac_cv_prog_ld_version_script=no
+endif
+
 $(eval $(autotools-package))
