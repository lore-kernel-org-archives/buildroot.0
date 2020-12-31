From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Jan 2021 00:20:22 +0100
Subject: [Buildroot] [PATCH 2/2] package/mosquitto: bump to v2.0.4
In-Reply-To: <20201231141021.168761-1-titouanchristophe@gmail.com>
References: <20201231141021.168761-1-titouanchristophe@gmail.com>
Message-ID: <20201231232022.GH2902@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Titouan, All,

On 2020-12-31 15:10 +0100, Titouan Christophe spake thusly:
> mosquitto 2.0.3 and 2.0.4 are bugfixe releases, read the detailed announcements:
>   * https://mosquitto.org/blog/2020/12/version-2-0-4-released/
>   * https://mosquitto.org/blog/2020/12/version-2-0-3-released/
> 
> Also drop the 3 patches that were released in 2.0.3.
> 
> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>

I'm confused: this patch is labeled 2/2, but I haven't seen 1/2 yet...

Regards,
Yann E. MORIN.

> ---
>  ...tall-target-when-using-WITH_CJSON-no.patch |  62 --------
>  ..._passwd-b-using-username-as-password.patch |  31 ----
>  ...WT-not-being-sent-on-client-takeover.patch | 138 ------------------
>  package/mosquitto/mosquitto.hash              |   4 +-
>  package/mosquitto/mosquitto.mk                |   2 +-
>  5 files changed, 3 insertions(+), 234 deletions(-)
>  delete mode 100644 package/mosquitto/0001-Fix-install-target-when-using-WITH_CJSON-no.patch
>  delete mode 100644 package/mosquitto/0002-Fix-mosquitto_passwd-b-using-username-as-password.patch
>  delete mode 100644 package/mosquitto/0003-Fix-LWT-not-being-sent-on-client-takeover.patch
> 
> diff --git a/package/mosquitto/0001-Fix-install-target-when-using-WITH_CJSON-no.patch b/package/mosquitto/0001-Fix-install-target-when-using-WITH_CJSON-no.patch
> deleted file mode 100644
> index 0bd3fedaee..0000000000
> --- a/package/mosquitto/0001-Fix-install-target-when-using-WITH_CJSON-no.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -From f7dc138157ca2252d7ed58b61daad19b63fcfe4c Mon Sep 17 00:00:00 2001
> -From: "Roger A. Light" <roger@atchoo.org>
> -Date: Fri, 11 Dec 2020 00:02:43 +0000
> -Subject: [PATCH] Fix `install` target when using WITH_CJSON=no.
> -
> -Closes #1938. Thanks to apple3306 and JulianCaruso.
> -
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> -[Peter: drop ChangeLog.txt hunk]
> ----
> - apps/mosquitto_ctrl/Makefile      | 6 +++++-
> - plugins/dynamic-security/Makefile | 6 +++++-
> - 2 files changed, 13 insertions(+), 2 deletions(-)
> -
> -diff --git a/apps/mosquitto_ctrl/Makefile b/apps/mosquitto_ctrl/Makefile
> -index 3a4843bf..d2122abc 100644
> ---- a/apps/mosquitto_ctrl/Makefile
> -+++ b/apps/mosquitto_ctrl/Makefile
> -@@ -36,7 +36,7 @@ else
> - TARGET:=
> - endif
> - 
> --all : $(TARGET)
> -+all : ${TARGET}
> - 
> - mosquitto_ctrl : ${OBJS}
> - 	${CROSS_COMPILE}${CC} ${APP_LDFLAGS} $^ -o $@ $(PASSWD_LDADD) $(LOCAL_LDFLAGS) $(LIBMOSQ) -lcjson -ldl
> -@@ -84,8 +84,12 @@ password_mosq.o : ../../src/password_mosq.c ../../src/password_mosq.h
> - 	${CROSS_COMPILE}${CC} $(APP_CPPFLAGS) $(APP_CFLAGS) -c $< -o $@
> - 
> - install : all
> -+ifeq ($(WITH_TLS),yes)
> -+ifeq ($(WITH_CJSON),yes)
> - 	$(INSTALL) -d "${DESTDIR}$(prefix)/bin"
> - 	$(INSTALL) ${STRIP_OPTS} mosquitto_ctrl "${DESTDIR}${prefix}/bin/mosquitto_ctrl"
> -+endif
> -+endif
> - 
> - uninstall :
> - 	-rm -f "${DESTDIR}${prefix}/bin/mosquitto_ctrl"
> -diff --git a/plugins/dynamic-security/Makefile b/plugins/dynamic-security/Makefile
> -index 203fbc3e..810a17ba 100644
> ---- a/plugins/dynamic-security/Makefile
> -+++ b/plugins/dynamic-security/Makefile
> -@@ -74,9 +74,13 @@ clean:
> - check: test
> - test:
> - 
> --install: ${PLUGIN_NAME}.so
> -+install: all
> -+ifeq ($(WITH_CJSON),yes)
> -+ifeq ($(WITH_TLS),yes)
> - 	$(INSTALL) -d "${DESTDIR}$(prefix)/lib"
> - 	$(INSTALL) ${STRIP_OPTS} ${PLUGIN_NAME}.so "${DESTDIR}${prefix}/lib/${PLUGIN_NAME}.so"
> -+endif
> -+endif
> - 
> - uninstall :
> - 	-rm -f "${DESTDIR}${prefix}/lib/${PLUGIN_NAME}.so"
> --- 
> -2.20.1
> -
> diff --git a/package/mosquitto/0002-Fix-mosquitto_passwd-b-using-username-as-password.patch b/package/mosquitto/0002-Fix-mosquitto_passwd-b-using-username-as-password.patch
> deleted file mode 100644
> index 8aafc4eb45..0000000000
> --- a/package/mosquitto/0002-Fix-mosquitto_passwd-b-using-username-as-password.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From f63386bf4a8a6e07621a3f4ecae2897b4ea01294 Mon Sep 17 00:00:00 2001
> -From: Roger Light <roger@atchoo.org>
> -Date: Sun, 13 Dec 2020 20:32:30 +0000
> -Subject: [PATCH] Fix `mosquitto_passwd -b` using username as password.
> -
> -Only applies if if `-c` is not also used.
> -
> -Closes #1949. Thanks to J. Augusto de Oliveira.
> -
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> -[Peter: drop ChangeLog.txt hunk]
> ----
> - apps/mosquitto_passwd/mosquitto_passwd.c | 2 +-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/apps/mosquitto_passwd/mosquitto_passwd.c b/apps/mosquitto_passwd/mosquitto_passwd.c
> -index 92613f0f..9495c3c5 100644
> ---- a/apps/mosquitto_passwd/mosquitto_passwd.c
> -+++ b/apps/mosquitto_passwd/mosquitto_passwd.c
> -@@ -505,7 +505,7 @@ int main(int argc, char *argv[])
> - 	}else if(batch_mode == true && idx+3 == argc){
> - 		password_file_tmp = argv[idx];
> - 		username = argv[idx+1];
> --		password_cmd = argv[idx+1];
> -+		password_cmd = argv[idx+2];
> - 	}else if(batch_mode == false && idx+2 == argc){
> - 		password_file_tmp = argv[idx];
> - 		username = argv[idx+1];
> --- 
> -2.20.1
> -
> diff --git a/package/mosquitto/0003-Fix-LWT-not-being-sent-on-client-takeover.patch b/package/mosquitto/0003-Fix-LWT-not-being-sent-on-client-takeover.patch
> deleted file mode 100644
> index 61972869f4..0000000000
> --- a/package/mosquitto/0003-Fix-LWT-not-being-sent-on-client-takeover.patch
> +++ /dev/null
> @@ -1,138 +0,0 @@
> -From 113603168bb644715395f86b78e0803f1e6b67a0 Mon Sep 17 00:00:00 2001
> -From: Roger Light <roger@atchoo.org>
> -Date: Sun, 13 Dec 2020 23:11:02 +0000
> -Subject: [PATCH] Fix LWT not being sent on client takeover.
> -
> -This was not happening for the case when the existing session wasn't
> -being continued.
> -
> -Closes #1946. Thanks to Rory Piper.
> -
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> -[Peter: drop ChangeLog.txt hunk]
> ----
> - src/handle_connect.c            |  8 +++++
> - test/broker/07-will-takeover.py | 53 ++++++++++++++++++++++++---------
> - 2 files changed, 48 insertions(+), 14 deletions(-)
> -
> -diff --git a/src/handle_connect.c b/src/handle_connect.c
> -index 7be9833a..5a33fdde 100644
> ---- a/src/handle_connect.c
> -+++ b/src/handle_connect.c
> -@@ -165,6 +165,14 @@ int connect__on_authorised(struct mosquitto *context, void *auth_data_out, uint1
> - 		if(context->clean_start == true){
> - 			sub__clean_session(found_context);
> - 		}
> -+		if((found_context->protocol == mosq_p_mqtt5 && found_context->session_expiry_interval == 0)
> -+				|| (found_context->protocol != mosq_p_mqtt5 && found_context->clean_start == true)
> -+				|| (context->clean_start == true)
> -+				){
> -+
> -+			context__send_will(found_context);
> -+		}
> -+
> - 		session_expiry__remove(found_context);
> - 		will_delay__remove(found_context);
> - 		will__clear(found_context);
> -diff --git a/test/broker/07-will-takeover.py b/test/broker/07-will-takeover.py
> -index 8e04b423..1024a46a 100755
> ---- a/test/broker/07-will-takeover.py
> -+++ b/test/broker/07-will-takeover.py
> -@@ -5,7 +5,7 @@
> - from mosq_test_helper import *
> - 
> - 
> --def do_test(proto_ver, clean_session):
> -+def do_test(proto_ver, clean_session1, clean_session2):
> -     rc = 1
> -     keepalive = 60
> - 
> -@@ -13,17 +13,34 @@ def do_test(proto_ver, clean_session):
> -     connect1_packet = mosq_test.gen_connect("will-helper", keepalive=keepalive, proto_ver=proto_ver)
> -     connack1_packet = mosq_test.gen_connack(rc=0, proto_ver=proto_ver)
> - 
> --    connect2_packet = mosq_test.gen_connect("will-test", keepalive=keepalive, proto_ver=proto_ver, will_topic="will/test", will_payload=b"LWT", clean_session=clean_session)
> --    connack2a_packet = mosq_test.gen_connack(rc=0, proto_ver=proto_ver)
> --    if clean_session == False and proto_ver == 4:
> --        connack2b_packet = mosq_test.gen_connack(rc=0, flags=1, proto_ver=proto_ver)
> -+    if proto_ver == 5:
> -+        if clean_session1 == False:
> -+            connect_props1 = mqtt5_props.gen_uint32_prop(mqtt5_props.PROP_SESSION_EXPIRY_INTERVAL, 60)
> -+        else:
> -+            connect_props1 = mqtt5_props.gen_uint32_prop(mqtt5_props.PROP_SESSION_EXPIRY_INTERVAL, 0)
> -+
> -+        if clean_session2 == False:
> -+            connect_props2 = mqtt5_props.gen_uint32_prop(mqtt5_props.PROP_SESSION_EXPIRY_INTERVAL, 60)
> -+        else:
> -+            connect_props2 = mqtt5_props.gen_uint32_prop(mqtt5_props.PROP_SESSION_EXPIRY_INTERVAL, 0)
> -     else:
> --        connack2b_packet = mosq_test.gen_connack(rc=0, proto_ver=proto_ver)
> -+        connect_props1 = b""
> -+        connect_props2 = b""
> -+
> -+    connect2_packet = mosq_test.gen_connect("will-test", keepalive=keepalive, proto_ver=proto_ver, will_topic="will/test", will_payload=b"LWT", clean_session=clean_session1, properties=connect_props1)
> -+    connack2_packet = mosq_test.gen_connack(rc=0, proto_ver=proto_ver)
> -+
> -+    connect3_packet = mosq_test.gen_connect("will-test", keepalive=keepalive, proto_ver=proto_ver, clean_session=clean_session2, properties=connect_props2)
> -+    if clean_session1 == False and clean_session2 == False:
> -+        connack3_packet = mosq_test.gen_connack(rc=0, flags=1, proto_ver=proto_ver)
> -+    else:
> -+        connack3_packet = mosq_test.gen_connack(rc=0, proto_ver=proto_ver)
> - 
> -     subscribe_packet = mosq_test.gen_subscribe(mid, "will/test", 0, proto_ver=proto_ver)
> -     suback_packet = mosq_test.gen_suback(mid, 0, proto_ver=proto_ver)
> - 
> -     publish_packet = mosq_test.gen_publish(topic="will/test", qos=0, payload="Client ready", proto_ver=proto_ver)
> -+    publish_lwt_packet = mosq_test.gen_publish(topic="will/test", qos=0, payload="LWT", proto_ver=proto_ver)
> - 
> -     port = mosq_test.get_port()
> -     broker = mosq_test.start_broker(filename=os.path.basename(__file__), port=port)
> -@@ -34,17 +51,21 @@ def do_test(proto_ver, clean_session):
> -         mosq_test.do_send_receive(sock1, subscribe_packet, suback_packet, "suback")
> - 
> -         # Connect client with will
> --        sock2 = mosq_test.do_client_connect(connect2_packet, connack2a_packet, timeout=5, port=port)
> -+        sock2 = mosq_test.do_client_connect(connect2_packet, connack2_packet, timeout=5, port=port)
> - 
> -         # Send a "ready" message
> -         sock2.send(publish_packet)
> -         mosq_test.expect_packet(sock1, "publish 1", publish_packet)
> - 
> -         # Connect client with will again as a separate connection, this should
> --        # take over from the previous one but not trigger a Will.
> --        sock3 = mosq_test.do_client_connect(connect2_packet, connack2b_packet, timeout=5, port=port)
> -+        # take over from the previous one but only trigger a Will if we are taking
> -+        # over a clean session/session-expiry-interval==0 client
> -+        sock3 = mosq_test.do_client_connect(connect3_packet, connack3_packet, timeout=5, port=port)
> -         sock2.close()
> - 
> -+        if clean_session1 == True or clean_session2 == True:
> -+            mosq_test.expect_packet(sock1, "publish LWT", publish_lwt_packet)
> -+
> -         # Send the "ready" message again
> -         sock3.send(publish_packet)
> -         mosq_test.expect_packet(sock1, "publish 2", publish_packet)
> -@@ -63,11 +84,15 @@ def do_test(proto_ver, clean_session):
> -         (stdo, stde) = broker.communicate()
> -         if rc:
> -             print(stde.decode('utf-8'))
> --            print("proto_ver=%d clean_session=%d" % (proto_ver, clean_session))
> -+            print("proto_ver=%d clean_session1=%d clean_session2=%d" % (proto_ver, clean_session1, clean_session2))
> -             exit(rc)
> - 
> - 
> --do_test(proto_ver=4, clean_session=True)
> --do_test(proto_ver=4, clean_session=False)
> --do_test(proto_ver=5, clean_session=True)
> --do_test(proto_ver=5, clean_session=False)
> -+do_test(proto_ver=4, clean_session1=True, clean_session2=True)
> -+do_test(proto_ver=4, clean_session1=False, clean_session2=True)
> -+do_test(proto_ver=4, clean_session1=True, clean_session2=False)
> -+do_test(proto_ver=4, clean_session1=False, clean_session2=False)
> -+do_test(proto_ver=5, clean_session1=True, clean_session2=True)
> -+do_test(proto_ver=5, clean_session1=False, clean_session2=True)
> -+do_test(proto_ver=5, clean_session1=True, clean_session2=False)
> -+do_test(proto_ver=5, clean_session1=False, clean_session2=False)
> --- 
> -2.20.1
> -
> diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
> index 91166a7a4e..e57a036b4a 100644
> --- a/package/mosquitto/mosquitto.hash
> +++ b/package/mosquitto/mosquitto.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking gpg signature
> -# from https://mosquitto.org/files/source/mosquitto-2.0.2.tar.gz.asc
> -sha256  5ea9ebf0a5ed3e95cecd75f30ebcf84f054584eff5617ac0f2e60428d3ad9707  mosquitto-2.0.2.tar.gz
> +# from https://mosquitto.org/files/source/mosquitto-2.0.4.tar.gz.asc
> +sha256  ba3126d82533fe40a18cf1a989e61eaea887e81829cd93518149e73553d20f10  mosquitto-2.0.4.tar.gz
>  
>  # License files
>  sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
> diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
> index 74fd7401da..6842ee4e49 100644
> --- a/package/mosquitto/mosquitto.mk
> +++ b/package/mosquitto/mosquitto.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MOSQUITTO_VERSION = 2.0.2
> +MOSQUITTO_VERSION = 2.0.4
>  MOSQUITTO_SITE = https://mosquitto.org/files/source
>  MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
>  MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
> -- 
> 2.25.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
