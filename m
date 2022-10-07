Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2E6C433FE
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 15:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F30360B44;
	Fri,  7 Oct 2022 15:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F30360B44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8O-2Mdtqj29W; Fri,  7 Oct 2022 15:42:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E49D61192;
	Fri,  7 Oct 2022 15:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E49D61192
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 424871BF408
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 15:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29AB441C75
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 15:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29AB441C75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3-0BHpv6HEbF for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 15:42:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE9F941900
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 15:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE9F941900
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C93ED86B8D; Fri,  7 Oct 2022 15:42:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Oct 2022 17:38:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66d29ddf531059aa0ae9e1f2c528e905d3f7168b
X-Git-Newrev: bd9f138b5a9419c5a251411e2abbdc4bbf3a43f7
X-Patchwork-Hint: ignore
Message-Id: <20221007154207.C93ED86B8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosquitto: add host variant
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bd9f138b5a9419c5a251411e2abbdc4bbf3a43f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mosquitto can be configured to use password files. Those have a very
trivial layout, with one "username:password" tuple per line, not unlike
Apache's htpasswd file format, but unlike htpasswd files, the password
can be either in clear (boo!), or encrypted (by calling into openssl's
libcrypto).

Encryption of passwords is done with an ad-hoc tool, mosquitto_passwd,
again very like Apache's htpasswd, but the encrypted form is different
(of course). This encryption is handled by mosquitto_passwd, which can
create, update, or delete users, all while storing their encrypted
password, or it can also convert a password file with clear-text
passwords into a password file with encrypted passwords, e.g. it turns
each "foo:bar" entry to their corresponding encrypted form, like
"foo:$7$101$yLPgk5fn46d....==".

It can be very interesting to maintain a clear-text DB of
users:passwords in configuration management [0], and only convert it to
encrypted passwords when embedded on the target.

Add a host variant for mosquitto, which only installs mosquitto_passwd.

[0] ensuring safety, confidentiality, and integrity of that DB is left
as an exercise to the user, and is clearly out of scope for Buildroot,
like storing the root password in the .config is.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouanchristophe@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in.host           |  1 +
 package/mosquitto/Config.in.host |  4 ++++
 package/mosquitto/mosquitto.mk   | 20 ++++++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index f437ef680c..84517787cc 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -57,6 +57,7 @@ menu "Host utilities"
 	source "package/mfgtools/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
 	source "package/moby-buildkit/Config.in.host"
+	source "package/mosquitto/Config.in.host"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
 	source "package/mxsldr/Config.in.host"
diff --git a/package/mosquitto/Config.in.host b/package/mosquitto/Config.in.host
new file mode 100644
index 0000000000..39e287ee89
--- /dev/null
+++ b/package/mosquitto/Config.in.host
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_HOST_MOSQUITTO
+	bool "host mosquitto (mosquitto_passwd)"
+	help
+	  Only installs mosquitto_passwd.
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 12de2946b7..a95a2cac4d 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -128,4 +128,24 @@ define MOSQUITTO_USERS
 endef
 endif
 
+HOST_MOSQUITTO_DEPENDENCIES = host-pkgconf host-openssl
+
+HOST_MOSQUITTO_MAKE_OPTS = \
+	$(HOST_CONFIGURE_OPTS) \
+	UNAME=Linux \
+	STRIP=true \
+	prefix=$(HOST_DIR) \
+	WITH_WRAP=no \
+	WITH_DOCS=no \
+	WITH_TLS=yes
+
+define HOST_MOSQUITTO_BUILD_CMDS
+	$(MAKE) -C $(@D)/apps/mosquitto_passwd $(HOST_MOSQUITTO_MAKE_OPTS)
+endef
+
+define HOST_MOSQUITTO_INSTALL_CMDS
+	$(MAKE) -C $(@D)/apps/mosquitto_passwd $(HOST_MOSQUITTO_MAKE_OPTS) install
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
