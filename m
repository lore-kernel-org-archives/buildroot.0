From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 20 Feb 2019 23:26:04 +0100
Subject: [Buildroot] [git commit] package/syslog-ng: add optional rabbitmq-c
 dependency
Message-ID: <20190220222409.4FDA88B910@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fb86873db4deaa49ac3c247d753a759568cf4a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rabbitmq-c is not an embedded submodule since version 3.16.1 and
https://github.com/balabit/syslog-ng/commit/c0559593c377f04662368dbecf282d2670aad12f

So enable/disable amqp depending on rabbitmq-c availability and remove
uneeded -lrt from LIBS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Fabrice Fontaine &lt;<a href="mailto:fontaine.fabrice@gmail.com" target="_blank" rel="noreferrer">fontaine.fabrice at gmail.com</a>&gt;<br></blockquote></div></div><div dir="auto"><br></div><div dir="auto">Looks good to me</div><div dir="auto"><br></div><div dir="auto">Reviewed-by: Chris Packham &lt;<a href="mailto:judge.packham@gmail.com">judge.packham at gmail.com</a>&gt;<br><br></div><div dir="auto"><div class="gmail_quote"><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/syslog-ng/syslog-ng.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 0c92b091b4..4ac25a675b 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -14,8 +14,6 @@ SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
 	eventlog libglib2 openssl pcre
 # We're patching configure.ac
 SYSLOG_NG_AUTORECONF = YES
-# rabbit-mq needs -lrt
-SYSLOG_NG_CONF_ENV = LIBS=-lrt
 SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
 	--disable-java --disable-java-modules --disable-mongodb
 
@@ -83,6 +81,13 @@ else
 SYSLOG_NG_CONF_OPTS += --disable-http
 endif
 
+ifeq ($(BR2_PACKAGE_RABBITMQ_C),y)
+SYSLOG_NG_DEPENDENCIES += rabbitmq-c
+SYSLOG_NG_CONF_OPTS += --enable-amqp
+else
+SYSLOG_NG_CONF_OPTS += --disable-amqp
+endif
+
 ifeq ($(BR2_INIT_SYSTEMD),y)
 SYSLOG_NG_DEPENDENCIES += systemd
 SYSLOG_NG_CONF_OPTS += \
