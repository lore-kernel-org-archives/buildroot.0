From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Dec 2014 22:36:24 +0100
Subject: [Buildroot] [git commit] erlang: use libatomic_ops if available
Message-ID: <20141215215003.A758F80403@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a5b819c0f9f5ad0a77017d402410870183967e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Erlang can either provide its own atomic_ops implementation or use the
one in libatomic_ops. This patch ensures that it only uses the one from
libatomic_ops if it is available.

Fixes:

http://autobuild.buildroot.net/results/3eb/3ebfd36948d5a642cc83ce31ddf5902cb369bfbd/
http://autobuild.buildroot.net/results/04c/04cbf79ccf159e15f9ea3953b425faadafc8a1c0/
http://autobuild.buildroot.net/results/fc9/fc9904446553e67dd44954310fea26d751a0df5d/
http://autobuild.buildroot.net/results/501/501a12da25615071fb6197a898456cfe41a6451d/
http://autobuild.buildroot.net/results/34e/34e2fbb4d39737fd7defa5bd607726d52ef38568/
http://autobuild.buildroot.net/results/722/7220c3905ebe9e081f1e3b90641b0859d996c2ac/
http://autobuild.buildroot.net/results/ffd/ffdc531d8cf9adb43340d045aa88eb0b39fc9bb7/
http://autobuild.buildroot.net/results/b4f/b4f238bcb30b0191ce1a2be669fa792c8ccd3e69/

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/erlang/erlang.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 045c07f..dd15539 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -22,6 +22,11 @@ ERLANG_CONF_ENV += erl_xcomp_sysroot=$(STAGING_DIR)
 
 ERLANG_CONF_OPTS = --without-javac
 
+ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
+ERLANG_DEPENDENCIES = libatomic_ops
+ERLANG_CONF_OPTS += --with-libatomic_ops=$(STAGING_DIR)/usr
+endif
+
 # erlang uses openssl for all things crypto. Since the host tools (such as
 # rebar) uses crypto, we need to build host-erlang with support for openssl.
 HOST_ERLANG_DEPENDENCIES = host-openssl
