From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue,  7 Nov 2017 12:04:42 -0800
Subject: [Buildroot] [PATCH v2] package/collectd: Specify FP layout based on
 endianness
Message-ID: <20171107200442.23067-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Big-endian CPUs store floating point as big endian (at lest majority
of them do), so, in order for 'network' plugin to work correctly (and
potentially any user of htond() in collectd's codebase),
--with-fp-layout=endianflip as opposed to --with-fp-layout=nothing
needs to be specified during configuration phase.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

Changes in [v2]:

 - Patch converted to use target's endianness as opposed to CPU
   architecture
 
 - Added a notes about the discussion around "intswap"

[v2] http://lists.busybox.net/pipermail/buildroot/2017-October/205773.html

 package/collectd/collectd.mk | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 626fba81bf..6c987b2e36 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -24,9 +24,23 @@ COLLECTD_PLUGINS_DISABLE = \
 
 COLLECTD_CONF_ENV += LIBS="-lm"
 
+#
+# NOTE: There's also a third availible setting "intswap", which might
+# be needed on some old ARM hardware (see [2]), but is not being
+# accounted for as per discussion [1]
+#
+# [1] http://lists.busybox.net/pipermail/buildroot/2017-November/206100.html
+# [2] http://lists.busybox.net/pipermail/buildroot/2017-November/206251.html
+#
+ifeq ($(BR2_ENDIAN),"BIG")
+COLLECTD_FP_LAYOUT=endianflip
+else
+COLLECTD_FP_LAYOUT=nothing
+endif
+
 COLLECTD_CONF_OPTS += \
 	--with-nan-emulation \
-	--with-fp-layout=nothing \
+	--with-fp-layout=$(COLLECTD_FP_LAYOUT) \
 	--with-perl-bindings=no \
 	$(foreach p, $(COLLECTD_PLUGINS_DISABLE), --disable-$(p)) \
 	$(if $(BR2_PACKAGE_COLLECTD_AGGREGATION),--enable-aggregation,--disable-aggregation) \
-- 
2.13.6
