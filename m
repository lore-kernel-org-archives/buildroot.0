Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7250C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 390DD501B0;
	Fri, 28 Feb 2025 17:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3CFvmMlUkve; Fri, 28 Feb 2025 17:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D24334F487
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D24334F487;
	Fri, 28 Feb 2025 17:12:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03E58711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC4C94249B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYmnjQUh8tLF for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FB9A42F5F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FB9A42F5F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79D6886A4C; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 13:18:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b2e6cff38f34eff37f8edea6a80094788a33bc19
X-Git-Newrev: 9320989053e72e3554a0ec4ccdade1ef641cf97e
X-Patchwork-Hint: ignore
Message-Id: <20250228163029.79D6886A4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mender: remove
 /var/lib/mender symlinking
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9320989053e72e3554a0ec4ccdade1ef641cf97e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The logic behind making /var/lib/mender a symlink to itself is to
detect if a filesystem is read-only. However, this creates a few problems:

  1) The logic confusing.

  2) The official mender documentation suggests four partitions minimum:
     - boot
     - rootfs A
     - rootfs B
     - data

     If a user is to follow the official documentation, which they should,
     then there is no need for any additional logic for a system setup with
     a read-only filesystem, as the data partition is always read-write.

  3) The post-build.sh script in the board/mender/x86_64 directory removes
     the symlink.

  - Remove symlinking /var/lib/mender to itself

  - Remove the difficult to understand logic dealing with the symlinks
    in S42mender, mender-client.service.

  - Remove the logic dealing with the symlink in
    board/mender/x86_64/post-build.sh

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 board/mender/x86_64/post-build.sh    |  5 -----
 package/mender/S42mender             | 16 ----------------
 package/mender/mender-client.service | 11 -----------
 package/mender/mender.mk             |  3 +--
 4 files changed, 1 insertion(+), 34 deletions(-)

diff --git a/board/mender/x86_64/post-build.sh b/board/mender/x86_64/post-build.sh
index bc4f4b8f11..0c52eb7be5 100755
--- a/board/mender/x86_64/post-build.sh
+++ b/board/mender/x86_64/post-build.sh
@@ -31,11 +31,6 @@ parse_args() {
 # Create a persistent directory to mount the data partition at.
 mender_fixup() {
     pushd "${TARGET_DIR}"
-    if [[ -L var/lib/mender ]]; then
-        rm var/lib/mender
-        mkdir -p var/lib/mender
-    fi
-
     # The common paradigm is to have the persistent data volume at /data for mender.
     if [[ ! -L data ]]; then
         ln -s var/lib/mender data
diff --git a/package/mender/S42mender b/package/mender/S42mender
index 0f2077d089..70116ed4eb 100644
--- a/package/mender/S42mender
+++ b/package/mender/S42mender
@@ -8,22 +8,6 @@ PIDFILE="/var/run/${DAEMON}.pid"
 DAEMON_ARGS="daemon"
 
 start() {
-	# If /var/lib/mender is a symlink to /var/run/mender, and
-	#   - the filesystem is RO (i.e. we can not rm the symlink),
-	#     create the directory pointed to by the symlink.
-	#   - the filesystem is RW (i.e. we can rm the symlink),
-	#     replace the symlink with an actual directory
-	if [ -L /var/lib/mender ] && [ "$(readlink /var/lib/mender)" = "/var/run/mender" ]
-	then
-		if rm -f /var/lib/mender >/dev/null 2>&1; then
-			mkdir -p /var/lib/mender
-		else
-			echo "No persistent location to store mender data. Data will be lost"
-			echo "at reboot. Are you sure this is what you want to do?"
-			mkdir -p "$(readlink /var/lib/mender)"
-		fi
-	fi
-
 	printf "Starting mender service: "
 	umask 077
 	start-stop-daemon -bmSqp "$PIDFILE" -x ${DAEMON_PATH} -- ${DAEMON_ARGS}
diff --git a/package/mender/mender-client.service b/package/mender/mender-client.service
index 5539a56fd6..47e439993c 100644
--- a/package/mender/mender-client.service
+++ b/package/mender/mender-client.service
@@ -6,17 +6,6 @@ After=systemd-resolved.service
 Type=idle
 User=root
 Group=root
-ExecStartPre=/bin/sh -c '\
-if [ -L /var/lib/mender \
-     -a "$(readlink /var/lib/mender)" = "/var/run/mender" ]; then \
-    if rm -f /var/lib/mender >/dev/null 2>&1; then \
-        mkdir -p /var/lib/mender; \
-    else \
-        echo "No persistent location to store mender data. Data will be lost" \
-        echo "at reboot. Are you sure this is what you want to do?"; \
-        mkdir -p "$(readlink /var/lib/mender)"; \
-    fi; \
-fi'
 ExecStart=/usr/bin/mender daemon
 Restart=on-abort
 
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index ee1398244b..e6a2740e80 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -72,8 +72,7 @@ define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -D -m 0755 $(MENDER_PKGDIR)/device_type \
 			$(TARGET_DIR)/etc/mender/device_type
 
-	mkdir -p $(TARGET_DIR)/var/lib
-	ln -snf /var/run/mender $(TARGET_DIR)/var/lib/mender
+	mkdir -p $(TARGET_DIR)/var/lib/mender
 	$(foreach f,$(MENDER_UPDATE_MODULES_FILES), \
 		$(INSTALL) -D -m 0755 $(@D)/support/modules/$(notdir $(f)) \
 			$(TARGET_DIR)/usr/share/mender/modules/v3/$(notdir $(f))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
