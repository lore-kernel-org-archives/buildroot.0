From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Oct 2014 17:39:37 +0200
Subject: [Buildroot] [git commit] package/erlang: build host-erlang with
	support for openssl
Message-ID: <20141006153947.A083EB0BE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58381b3eca628776bdd02abfc5566c3ae0232839
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Erlang uses openssl for all things crypto.

Since there are host Erlang tools that use crypto (such as rebar), we
need to build host-erlang with support for crypto, and thus it shall
depends on openssl.

Suggested-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang/erlang.mk |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 986b6c9..e6899de 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -8,7 +8,6 @@ ERLANG_VERSION = 17.3
 ERLANG_SITE = http://www.erlang.org/download
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
 ERLANG_DEPENDENCIES = host-erlang
-HOST_ERLANG_DEPENDENCIES =
 
 ERLANG_LICENSE = EPL
 ERLANG_LICENSE_FILES = EPLICENCE
@@ -22,7 +21,11 @@ ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
 ERLANG_CONF_ENV += erl_xcomp_sysroot=$(STAGING_DIR)
 
 ERLANG_CONF_OPTS = --without-javac
-HOST_ERLANG_CONF_OPTS = --without-javac
+
+# erlang uses openssl for all things crypto. Since the host tools (such as
+# rebar) uses crypto, we need to build host-erlang with support for openssl.
+HOST_ERLANG_DEPENDENCIES = host-openssl
+HOST_ERLANG_CONF_OPTS = --without-javac --with-ssl=$(HOST_DIR)/usr
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 ERLANG_CONF_OPTS += --with-termcap
