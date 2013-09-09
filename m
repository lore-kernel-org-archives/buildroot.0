From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 9 Sep 2013 11:27:55 +0200
Subject: [Buildroot] [git commit] webkit: fix staging install
Message-ID: <20130909094042.75F379A1A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=33a9d34ff375ec0c0389c9af6bc499a8dd7ccbc9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Parallel 'make install' seems to deadlock here (make 3.81). Work around it
by disabling parallel make for the install step.

We only disable parallel make for the install step, as the build step works
with parallel make, and webkit is a huge package, so build time goes up
significantly with make -j1.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/webkit/webkit.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 99a90b9..eb1547b 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -15,6 +15,9 @@ WEBKIT_DEPENDENCIES = host-ruby host-flex host-bison host-gperf enchant harfbuzz
 WEBKIT_AUTORECONF = YES
 WEBKIT_AUTORECONF_OPT = -I $(@D)/Source/autotools
 
+# parallel make install deadlocks with make 3.81
+WEBKIT_INSTALL_STAGING_OPT = -j1 DESTDIR=$(STAGING_DIR) install
+
 # Does not build and it's disabled by default
 # in newer releases
 define DISABLE_INDEXED_DATABASE
