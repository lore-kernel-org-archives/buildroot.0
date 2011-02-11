From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Feb 2011 10:27:18 -0300
Subject: [Buildroot] [PATCH] openssh: security bump to version 5.8p1
Message-ID: <1297430838-28868-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://www.openssh.com/txt/legacy-cert.adv
CVE-2011-0539

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssh/S50sshd    |    8 ++++++++
 package/openssh/openssh.mk |    2 +-
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index 3821449..f0d2aef 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -25,6 +25,14 @@ if [ ! -f /etc/ssh_host_dsa_key ] ; then
 	echo
         /usr/bin/ssh-keygen -t dsa -f /etc/ssh_host_dsa_key -C '' -N ''
 fi
+
+# Check for the SSH2 ECDSA key
+if [ ! -f /etc/ssh_host_ecdsa_key ]; then
+	echo Generating ECDSA Key...
+	echo THIS CAN TAKE A MINUTE OR TWO DEPENDING ON YOUR PROCESSOR!
+	echo
+	/usr/bin/ssh-keygen -t ecdsa -f /etc/ssh_host_ecdsa_key -C '' -N ''
+fi
                 
 umask 077
 
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 3db7156..104977e 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENSSH_VERSION = 5.6p1
+OPENSSH_VERSION = 5.8p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
 OPENSSH_CONF_OPT = --libexecdir=/usr/lib --disable-lastlog --disable-utmp \
-- 
1.7.3.4
