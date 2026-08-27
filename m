Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B99C61DBE
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 03:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB75480B84;
	Thu, 27 Aug 2026 03:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjZiZQLowREl; Thu, 27 Aug 2026 03:27:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787801245;
	bh=TLgny0y1k2MaAusr0MJbXBvoY9Yoo/Zf1dbeCU5UOuc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lJXWz8bZWPxPXNE8inKAWsa/Am9V2wnH14A8kMIWWtLqr51dz2yA23G1gCacF1Inv
	 4Iyw8giRZ2nFrk10TTZ0N36iPQ9hGHIB498Vzbfz9otpoo6a8G9pWxm5UfcgI2zQe+
	 zf1ElZJU18pp0rxl6+U/GyKrtFD/TtBeOysrnBIRX5MAIh7dUEi3Big4OmikTwe90k
	 HVc4iR0gT78Zlzf/QOX9OHtZbbKSkmFvSsPc3FMRMlrgX+P8edsBpb9e9Krge3yI67
	 YIKYM5t1xaarkAN4QPylNRyyWv9EPnFJg3Y5kHO+tcDKuktR529ukFGQAM4v3yM3ZV
	 QuKMfNDzG3sQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9168F80B6D;
	Thu, 27 Aug 2026 03:27:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 58D9E7AA
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 03:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E544402E6
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 03:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFGjoSwSBYJ4 for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 03:27:20 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=dzvcOkoA
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EA2E402A3
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 03:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1787801235; bh=yHhQrQu4ysjdeJyJdGixQXADv0oo9PKbGezEDmw9W9Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=dzvcOkoAPzeqQT4lACARVYsADljk9gq6bQVznH0sDjNVAuC9mtnHcz4dMyHLLqhJU
 oMvGXlAQNftmsBvDLqWv9rGZVjX/s00UTJTC7IbRYrz57IsGQlkFOFZCNgHfYyEfkf
 XIt6RgZ6eBVdT4CO/yu44nYSK6QhEVGnzwHMyOsM=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 1BB97BDE2A44;
 Thu, 27 Aug 2026 05:27:14 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Andreas Ziegler <br025@umbiko.net>
Date: Thu, 27 Aug 2026 05:26:38 +0200
Message-ID: <20260827032643.1940-2-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827032643.1940-1-br025@umbiko.net>
References: <20260827032643.1940-1-br025@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH v3 1/2] package/mpd: use upstream mpd.conf w/
 buildroot modifications
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The configuration file supplied by Buildroot is only a sample; it will
not start MPD on a default installation. In a production build, a custom
mpd.conf has to be supplied via rootfs overlay.

Treat Buildroot mpd.conf as a fragment file, containing the minimum
modifications necessary to run mpd in a default build. Install the
upstream sample and inject the values from the Buildroot fragment.

* log_file, pid_file: Buildroot specific; referenced in mpd.mk and S95mpd
* audio_output: At least one output has to be defined to run mpd

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
Changes v2 -> v3:
	reintroduce Buildroot mpd.conf as fragment file

 package/mpd/mpd.conf | 31 ++++++++-----------------------
 package/mpd/mpd.mk   | 22 +++++++++++++++++++++-
 2 files changed, 29 insertions(+), 24 deletions(-)

diff --git a/package/mpd/mpd.conf b/package/mpd/mpd.conf
index 5956b75e24..db81d69d73 100644
--- a/package/mpd/mpd.conf
+++ b/package/mpd/mpd.conf
@@ -1,32 +1,17 @@
 #
-# Sample configuration file for mpd
-# This is a minimal configuration, see the manpage for more options
+# The configuration file is provided by the mpd package. This file
+# contains values that will override settings from the main config
+# file to make mpd startable in a default configuration.
 #
 
-# Directory where the music is stored
-music_directory		"/var/lib/mpd/music"
-
-# Directory where user-made playlists are stored (RW)
-playlist_directory	"/var/lib/mpd/playlists"
-
-# Database file (RW)
-db_file			"/var/lib/mpd/database"
-
 # Log file (RW)
 log_file		"/var/log/mpd.log"
 
 # Process ID file (RW)
 pid_file		"/var/run/mpd.pid"
 
-# State file (RW)
-state_file		"/var/lib/mpd/state"
-
-# User id to run the daemon as
-#user			"nobody"
-
-# TCP socket binding
-bind_to_address		"any"
-#bind_to_address	"localhost"
-
-# Unix socket to listen on
-bind_to_address		"/var/lib/mpd/socket"
+# One output has to be defined
+audio_output {
+	type	"null"
+	name	"/dev/null"
+}
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index d063d509f4..d8e1d22611 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -345,8 +345,28 @@ else
 MPD_CONF_OPTS += -Dzzip=disabled
 endif
 
+# sed snippet from https://stackoverflow.com/a/37911473
+# single-line configurations will be inserted behind the last matching line
+# in the target file, multi-line blocks are just appended at the bottom.
 define MPD_INSTALL_EXTRA_FILES
-	$(INSTALL) -m 0644 -D package/mpd/mpd.conf $(TARGET_DIR)/etc/mpd.conf
+	$(INSTALL) -m 0644 -D $(@D)/doc/mpdconf.example $(TARGET_DIR)/etc/mpd.conf
+	export multiline=0
+	while read -r line; do \
+		if [[ $$line =~ ^[a-zA-Z] ]]; then \
+			if [ "$${line##*[[:space:]]}" == "{" ]; then \
+				export multiline=1; \
+				printf "%s\n" "$$line" >> "$(TARGET_DIR)"/etc/mpd.conf; \
+			else \
+				[ $$multiline ] && \
+					printf "\t%s\n" "$$line" >> "$(TARGET_DIR)"/etc/mpd.conf; \
+				[ ! $$multiline ] && \
+					sed '/#'$${line%%[[:space:]]*}'[^\n]*/,$$!b;//{x;//p;g};//!H;$$!d;x;s||&\n'"$$line"'|' -i "$(TARGET_DIR)"/etc/mpd.conf; \
+			fi \
+		elif [ "$$line" == "}" ]; then \
+			printf "%s\n" "$$line" >> "$(TARGET_DIR)"/etc/mpd.conf; \
+			export multiline=0; \
+		fi \
+	done < package/mpd/mpd.conf
 	mkdir -p $(TARGET_DIR)/var/lib/mpd/music
 	mkdir -p $(TARGET_DIR)/var/lib/mpd/playlists
 endef
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
