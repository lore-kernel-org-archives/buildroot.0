From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 Jan 2016 22:39:43 +0100
Subject: [Buildroot] [PATCH v6 02/29] package/freeswitch: enable optional
	modules
In-Reply-To: <1452807610-15534-1-git-send-email-bernd.kuhls@t-online.de>
References: <1452807610-15534-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1452807610-15534-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All these modules have no external dependencies.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 56 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 8f8f8e6..9c64cf2 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -79,4 +79,60 @@ FREESWITCH_CONF_OPTS = \
 	--disable-system-xmlrpc-c \
 	--disable-zrtp
 
+# Enable more optional modules
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
+	dialplans/mod_dialplan_asterisk \
+	dialplans/mod_dialplan_xml \
+	endpoints/mod_rtmp \
+	endpoints/mod_rtc \
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
+	say/mod_say_en \
+	xml_int/mod_xml_cdr \
+	xml_int/mod_xml_scgi
+
+define FREESWITCH_ENABLE_MODULE # (option, file)
+	echo '$(1)' >> $(2)
+endef
+
+define FREESWITCH_ENABLE_MODULES
+	$(foreach mod,$(FREESWITCH_ENABLED_MODULES),\
+		$(call FREESWITCH_ENABLE_MODULE,$(mod),$(@D)/modules.conf)$(sep))
+endef
+
+FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
+
 $(eval $(autotools-package))
-- 
2.6.4
