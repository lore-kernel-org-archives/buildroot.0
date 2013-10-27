From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2013 10:30:10 +0100
Subject: [Buildroot] [git commit] ccache: expose control interface via 'make
	ccache-options'
Message-ID: <20131027094052.541849BBED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1bca7c49c5f80673a2ff88bdad798812b09e9f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

usage:
	# set cache limit size
	make CCACHE_OPTIONS="--max-size=5G" ccache-options

	# zero statistics counters
	make CCACHE_OPTIONS="--zero-stats" ccache-options

[Peter: drop the redundant ifeq]
Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/ccache-support.txt |   11 +++++++++++
 package/ccache/ccache.mk       |    9 +++++++++
 2 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/docs/manual/ccache-support.txt b/docs/manual/ccache-support.txt
index 4969180..fe06a01 100644
--- a/docs/manual/ccache-support.txt
+++ b/docs/manual/ccache-support.txt
@@ -23,3 +23,14 @@ remove this directory.
 
 You can get statistics on the cache (its size, number of hits,
 misses, etc.) by running +make ccache-stats+.
+
+The make target +ccache-options+ and the +CCACHE_OPTIONS+ variable
+provide more generic access to the ccache. For example
+
+-----------------
+# set cache limit size
+make CCACHE_OPTIONS="--max-size=5G" ccache-options
+
+# zero statistics counters
+make CCACHE_OPTIONS="--zero-stats" ccache-options
+-----------------
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index c5e9385..82a53f3 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -44,4 +44,13 @@ $(eval $(host-autotools-package))
 ifeq ($(BR2_CCACHE),y)
 ccache-stats: host-ccache
 	$(Q)$(CCACHE) -s
+
+ccache-options: host-ccache
+ifeq ($(CCACHE_OPTIONS),)
+	$(Q)echo "Usage: make ccache-options CCACHE_OPTIONS=\"opts\""
+	$(Q)echo "where 'opts' corresponds to one or more valid ccache options" \
+	"(see ccache help text below)"
+	$(Q)echo
+endif
+	$(Q)$(CCACHE) $(CCACHE_OPTIONS)
 endif
