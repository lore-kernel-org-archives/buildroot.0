From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 30 Oct 2017 17:35:39 -0700
Subject: [Buildroot] [PATCH] package/collectd: Specify correct FP layout for
	PowerPC
Message-ID: <20171031003539.919-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PowerPC stores floating point as big endian, so, in order for
'network' plugin to work correctly (and potentially any user of
htond() in collectd's codebase), --with-fp-layout=endianflip as
opposed to --with-fp-layout=nothing needs to be specified during
configuration phase.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/collectd/collectd.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 626fba81bf..80791b618d 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -24,9 +24,15 @@ COLLECTD_PLUGINS_DISABLE = \
 
 COLLECTD_CONF_ENV += LIBS="-lm"
 
+ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
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
