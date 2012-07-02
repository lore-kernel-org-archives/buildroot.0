From: Romain Izard <romain.izard.pro@gmail.com>
Date: Mon, 2 Jul 2012 08:33:24 +0000 (UTC)
Subject: [Buildroot] [PATCH] Add /var/www to device table
References: <1340654541-10427-1-git-send-email-spdawson@gmail.com>
Message-ID: <jsrmck$gt1$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-06-25, spdawson at gmail.com <spdawson@gmail.com> wrote:
> From: Simon Dawson <spdawson@gmail.com>
>
> The /var/www directory is listed in /etc/passwd in the skeleton target
> filesystem as the home directory of the www-data user (uid 33).
>
> In the final target filesystem, /var/www should be owned by www-data. This
> is important for the lighttpd package, for example.
>
> Signed-off-by: Simon Dawson <spdawson@gmail.com>

Shouldn't it be changed by using a LIGHTTPD_PERMISSIONS variable,
instead of modifying the common device table ? This makes the
relationship more evident.

See the following example:
---

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index b8aa310..34f59b2 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -62,4 +62,9 @@ define LIGHTTPD_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/lib/lighttpd
 endef
 
+#<name>		<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
+define LIGHTTPD_PERMISSIONS
+var/www		d	755	33	33	-	-	-	-	-
+endef
+
 $(eval $(call AUTOTARGETS))

-- 
Romain Izard
