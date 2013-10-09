From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Wed,  9 Oct 2013 10:18:19 -0700
Subject: [Buildroot] [PATCH v3] ccache: expose control interface via 'make
	ccache-options'
In-Reply-To: <5253AA39.1090908@mind.be>
References: <5253AA39.1090908@mind.be>
Message-ID: <1381339099-3666-1-git-send-email-tjlee@ambarella.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

usage:
	# set cache limit size
	make CCACHE_OPTIONS="--max-size=5G" ccache-options

	# zero statistics counters
	make CCACHE_OPTIONS="--zero-stats" ccache-options

Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
---
Fix a typo of manual in v2

 docs/manual/ccache-support.txt | 11 +++++++++++
 package/ccache/ccache.mk       |  5 +++++
 2 files changed, 16 insertions(+)

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
index c5e9385..663a959 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -45,3 +45,8 @@ ifeq ($(BR2_CCACHE),y)
 ccache-stats: host-ccache
 	$(Q)$(CCACHE) -s
 endif
+
+ifeq ($(BR2_CCACHE),y)
+ccache-options: host-ccache
+	$(Q)$(CCACHE) $(CCACHE_OPTIONS)
+endif
-- 
1.8.3.2
