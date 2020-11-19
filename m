From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 22:58:20 +0100
Subject: [Buildroot] [git commit branch/next] package/radvd: fix build
 without stack-protector
Message-ID: <20201119214406.B43A986484@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ff1a64497a55ce25b7577844b85fba6aa4dcc32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 6e85ab44493624748398ffb2c6bf4bda409f2de7 forgot to manage the new
--{with,without}-stack-protector option which has been added with
https://github.com/reubenhwk/radvd/commit/f2cb35449f35b5815f3804161c968fde5ef2982b
and is enabled by default

Fixes:
 - http://autobuild.buildroot.org/results/e778df96f0a382a5b119724ee69f956ad455c452

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/radvd/radvd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 7a650dc3c5..bed6367841 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -15,6 +15,12 @@ RADVD_CONF_ENV = \
 RADVD_LICENSE = BSD-4-Clause-like
 RADVD_LICENSE_FILES = COPYRIGHT
 
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
+RADVD_CONF_OPTS += --with-stack-protector
+else
+RADVD_CONF_OPTS += --without-stack-protector
+endif
+
 # We don't provide /etc/radvd.conf, so disable the service by default.
 define RADVD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/radvd/50-radvd.preset \
