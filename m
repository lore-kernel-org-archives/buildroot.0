From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 22:17:11 +0200
Subject: [Buildroot] [git commit] package/freeswitch: enable optional modules
Message-ID: <20160417201716.519C481D60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffd066017ae4229793b2e903d2b5fe2652fa9fae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All these modules have no external dependencies.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freeswitch/freeswitch.mk | 80 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 73 insertions(+), 7 deletions(-)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index a184e60..7703763 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -37,13 +37,6 @@ FREESWITCH_DEPENDENCIES = \
 	util-linux \
 	zlib
 
-# freeswitch comes with pre-enabled modules, since we want to control
-# the modules ourselves reset the upstream configuration
-define FREESWITCH_RESET_MODULES
-	> $(@D)/modules.conf
-endef
-FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_RESET_MODULES
-
 # we neither need host-perl nor host-php
 FREESWITCH_CONF_ENV += \
 	ac_cv_prog_PERL=false \
@@ -94,4 +87,77 @@ else
 FREESWITCH_CONF_OPTS += --disable-zrtp
 endif
 
+# Enable optional modules
+FREESWITCH_ENABLED_MODULES += \
+	applications/mod_avmd \
+	applications/mod_blacklist \
+	applications/mod_callcenter \
+	applications/mod_commands \
+	applications/mod_conference \
+	applications/mod_curl \
+	applications/mod_db \
+	applications/mod_directory \
+	applications/mod_dptools \
+	applications/mod_easyroute \
+	applications/mod_esf \
+	applications/mod_esl \
+	applications/mod_expr \
+	applications/mod_fifo \
+	applications/mod_fsk \
+	applications/mod_hash \
+	applications/mod_httapi \
+	applications/mod_lcr \
+	applications/mod_sms \
+	applications/mod_snom \
+	applications/mod_spandsp \
+	applications/mod_spy \
+	applications/mod_valet_parking \
+	applications/mod_voicemail \
+	codecs/mod_g723_1 \
+	codecs/mod_g729 \
+	dialplans/mod_dialplan_asterisk \
+	dialplans/mod_dialplan_xml \
+	endpoints/mod_loopback \
+	endpoints/mod_rtc \
+	endpoints/mod_rtmp \
+	endpoints/mod_sofia \
+	endpoints/mod_verto \
+	event_handlers/mod_cdr_csv \
+	event_handlers/mod_cdr_sqlite \
+	event_handlers/mod_event_socket \
+	formats/mod_local_stream \
+	formats/mod_native_file \
+	formats/mod_tone_stream \
+	loggers/mod_console \
+	loggers/mod_logfile \
+	loggers/mod_syslog \
+	say/mod_say_de \
+	say/mod_say_en \
+	say/mod_say_es \
+	say/mod_say_es_ar \
+	say/mod_say_fa \
+	say/mod_say_fr \
+	say/mod_say_he \
+	say/mod_say_hr \
+	say/mod_say_hu \
+	say/mod_say_it \
+	say/mod_say_ja \
+	say/mod_say_nl \
+	say/mod_say_pl \
+	say/mod_say_pt \
+	say/mod_say_ru \
+	say/mod_say_sv \
+	say/mod_say_th \
+	say/mod_say_zh \
+	xml_int/mod_xml_cdr \
+	xml_int/mod_xml_rpc \
+	xml_int/mod_xml_scgi
+
+define FREESWITCH_ENABLE_MODULES
+	$(Q)echo $(FREESWITCH_ENABLED_MODULES) \
+		| tr ' ' '\n' \
+		> $(@D)/modules.conf
+endef
+FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
+
 $(eval $(autotools-package))
