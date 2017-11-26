From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:25:30 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] package/collectd: Specify
 FP layout based on endianness
Message-ID: <20171126213911.9D9C0802D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c81ad144bfa2c20415e1c41fbab63603b37a6e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Big-endian CPUs store floating point as big endian (at lest majority
of them do), so, in order for 'network' plugin to work correctly (and
potentially any user of htond() in collectd's codebase),
--with-fp-layout=endianflip as opposed to --with-fp-layout=nothing
needs to be specified during configuration phase.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit bdd8475b90fa46644149d34bf852b213ec60ce71)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/collectd.mk | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 38354ac..1b61b06 100644
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
