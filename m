Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05734C636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 12:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7792D60BFB;
	Sun, 12 Feb 2023 12:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7792D60BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qq3fcSSeYK44; Sun, 12 Feb 2023 12:44:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC7C860B96;
	Sun, 12 Feb 2023 12:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC7C860B96
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 433821BF593
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 12:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D44060B96
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 12:44:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D44060B96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bmLlac0oTWX3 for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 12:44:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFB9D60B95
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFB9D60B95
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 12:44:29 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 l37-20020a05600c1d2500b003dfe46a9801so7171758wms.0
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 04:44:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HamzXKSmL3EXG0UubYc5t3Ub8fBNjsLO7NJTJjtVh1Q=;
 b=LBKK/Qz6mkV6chG0/WcliXVJUuClVrwf88olNYt9/VN0jGBQL9uLZ61d328pmCUfAu
 Hkd/8pc9xZKJW5EPN61E6qLRTkEXTw3JcnSkCOw3ixwyrq+ScyVdpkOHIsilXN1kywfY
 n5TiEWZWBpt+WmfD7BFwgPLzxdo7nAToJkVu1Md5yRBDQr0+yjJMjYUmTk/EEK0LZb1s
 qFUk8QIBJ7HcVq9+oBN0w4pkOKYr3Pb1H065q15iUAo1pel4/a4u777loNdPOSAG6eLb
 2koJHIvnNaIuTTm0hklUywXxZ+FJwcwn9ogW1BiR9dCVhj+FN+JBJ8lL5XHQofsJVxiy
 Y1jw==
X-Gm-Message-State: AO0yUKV+1tiZ9ZNnDrbPnW0PZpR0F9IWtyamEqOn3uoAp+Erl7Pmya+1
 Ybo163hR0FzlAe5krnwtv2m9F6bqmsU=
X-Google-Smtp-Source: AK7set/+PwIvaD0LEuWvVehXzgFpJDcAGsLWTM6/VzMvJsPeLNjzkErFOdH9r1K1orf1CkqwTtp5qg==
X-Received: by 2002:a1c:f315:0:b0:3da:2500:e702 with SMTP id
 q21-20020a1cf315000000b003da2500e702mr17099308wmq.32.1676205867564; 
 Sun, 12 Feb 2023 04:44:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 q14-20020a05600c46ce00b003db12112fcfsm12001880wmo.4.2023.02.12.04.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 04:44:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 13:44:21 +0100
Message-Id: <20230212124421.17787-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HamzXKSmL3EXG0UubYc5t3Ub8fBNjsLO7NJTJjtVh1Q=;
 b=FI0CDI8+0iQkBtMH+7eJNPLpgKWmI0LQfAfAvMDOexN8RTOmWOC0ElC05OC5RkT5rm
 65ftfoKf03VzrCU9jyaw5LCBbFPHNQbbEy3ZIIYYt2gOGZRr7Z3Zi/ezycOu3caRXird
 kJQg1Wmh2yyij/3KsoGHAlRpE2/YNhW3aNsS0pvtp4clC6iNbeigk5OfQNrbJXa9s09c
 XrPlapbABDnAgpQCvIPQciGWiXJrumTlfzlYY3527HP0hg6C8akL8f0JxK5oXyB8//nq
 qWLae6drmq0K60D3K4dQafeqv3XKy3PxAI4dzeFlPONFpvqPYwBJ3XFLI4vhSAWVOz4v
 bJ+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FI0CDI8+
Subject: [Buildroot] [PATCH v2,
 1/1] package/zabbix: fix BR2_SHARED_STATIC_LIBS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Alexey Lukyanchuk <skif@skif-web.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

zabbix uses custom --enable-{static,shared} options, instead of standard
libtool directives resulting in the following build failure with openssl
or libcurl:

configure:13132: /home/autobuild/autobuild/instance-6/output-1/host/bin/or1k-buildroot-linux-gnu-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Ofast -g0  -I/home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -rdynamic  -static -L/home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/lib conftest.c -lssl -lcrypto -lm   >&5
/home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/10.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: /home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.a(dso_dlfcn.o): in function `dlfcn_globallookup':
dso_dlfcn.c:(.text+0x2c): warning: Using 'dlopen' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
/home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/10.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: /home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.a(b_addr.o): in function `BIO_lookup_ex':
b_addr.c:(.text+0x1128): warning: Using 'getaddrinfo' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
/home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/10.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: /home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.a(b_sock.o): in function `BIO_gethostbyname':
b_sock.c:(.text+0x90): warning: Using 'gethostbyname' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
/home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/10.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: /tmp/cceWHjDi.o: in function `main':
conftest.c:(.text.startup+0x8): undefined reference to `SSL_connect'

[...]

configure: error: OpenSSL library libssl or libcrypto not found

---

configure:15199: checking for main in -lz
configure:15219: /home/autobuild/autobuild/instance-13/output-1/host/bin/s390x-buildroot-linux-gnu-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Ofast -g0 -D_FORTIFY_SOURCE=2  -I/home/autobuild/autobuild/instance-13/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/bin/../../usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -rdynamic  -static   -L/home/autobuild/autobuild/instance-13/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/bin/../../usr/lib conftest.c -lz   -lm    >&5
/home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/10.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld: cannot find -lz
collect2: error: ld returned 1 exit status

[...]

configure: error: static library z required for linking libcurl not found

Fixes:
 - http://autobuild.buildroot.org/results/c05230d13fa0538323bb77e8f35533e6dd02453f
 - http://autobuild.buildroot.org/results/cc947038510e16417298b381521f226f7c45f986

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Update commit log and comment

 package/zabbix/zabbix.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index 23172a358d..06d12dbef4 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -125,6 +125,13 @@ endif
 
 endif # BR2_PACKAGE_ZABBIX_SERVER
 
+# zabbix uses custom --enable-{static,shared} options, instead of
+# standard libtool directives resulting in a build failure with libcurl
+# or openssl.
+ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+ZABBIX_CONF_OPTS += --disable-static
+endif
+
 define ZABBIX_INSTALL_INIT_SYSTEMD
 	$(foreach unit,$(ZABBIX_SYSTEMD_UNITS),\
 		$(INSTALL) -D -m 0644 $(ZABBIX_PKGDIR)/$(unit) $(TARGET_DIR)/usr/lib/systemd/system/$(unit) && \
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
