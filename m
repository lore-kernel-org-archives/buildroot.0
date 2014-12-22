From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Dec 2014 15:00:54 +0100
Subject: [Buildroot] [git commit] package/erlang-rebar: new host package
Message-ID: <20141222141357.2599780432@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b9b4f46e0bcd009b46892d2d59ce0421608f9f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rebar is used to compile Erlang packages.

We need  host variant so as to be able to provide it to Erlang packages
that do not bundle their own version, or bundle a broken version.

Since this is a host-only package, used only internally, we do not
provide a Kconfig option for it. Packages that need it will depend on
it.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
[yann.morin.1998 at free.fr: extract host-rebar to its own patch]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-rebar/erlang-rebar.mk |   31 +++++++++++++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/erlang-rebar/erlang-rebar.mk b/package/erlang-rebar/erlang-rebar.mk
new file mode 100644
index 0000000..f29eb75
--- /dev/null
+++ b/package/erlang-rebar/erlang-rebar.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# erlang-rebar
+#
+################################################################################
+
+ERLANG_REBAR_VERSION = 2.5.1
+
+# Upstream publishes a release, but we can not use it as it is a release of
+# a generated rebar script, when we want the sources. So we have to use the
+# gihub helper in this case.
+ERLANG_REBAR_SITE = $(call github,rebar,rebar,$(ERLANG_REBAR_VERSION))
+
+# Although the file LICENSE state Apache-2.0, a lot (if not all) the files
+# in src/ bear the MIT licence.
+ERLANG_LICENSE = Apache-2.0, MIT
+ERLANG_LICENSE_FILES = LICENSE
+
+# We do not have a target variant, so just define the dependencies,
+# configure and build commands for the host variant.
+HOST_ERLANG_REBAR_DEPENDENCIES = host-erlang
+
+define HOST_ERLANG_REBAR_BUILD_CMDS
+	cd $(@D) && $(HOST_MAKE_ENV) $(MAKE)
+endef
+
+define HOST_ERLANG_REBAR_INSTALL_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/rebar $(HOST_DIR)/usr/bin/rebar
+endef
+
+$(eval $(host-generic-package))
