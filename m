Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2009FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B59EC402E8;
	Sat,  8 Jan 2022 22:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dqBy2lpBciDc; Sat,  8 Jan 2022 22:18:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FE48402FE;
	Sat,  8 Jan 2022 22:18:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A4931BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31C19606C0
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id weuUwfL6S-OE for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:18:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1ECFB606B0
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:18:26 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q8so18637480wra.12
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 14:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VJQ3mS1AB35kK8atAV9d1nK2LKc5M////KrEK7MsoBY=;
 b=PxKNz0XfEL4vuLL1v7fe52GNUeUCiayrML1ll/wKCzCwFa6Pv8STsD9xr5MaZx+8H5
 9vz+WiRS+08nRvpe5NfpxZ8AF2ner+3bHw0Q4rqny8IB8aCqwdhyUc3T0xmaORMPp3W4
 QW0baXjlN3wjSPp1jnKPqSIvYIf7pm0XlzTVxOqK6bXzZ8J/GBphlfIEHzD7QZlA3kLu
 gx/xLgzyoe1iFzXSpcY92AQvJZXJxjA5Dt9n4QHSqU6Pfrsj8rKdceyYfycOVj98Ll2O
 583+WsCXT8mBHiVOwo8RftvsXqQ2FSHAsbY1NXp0xblpMw4TYjKDg306UoswR5k81pxC
 G1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VJQ3mS1AB35kK8atAV9d1nK2LKc5M////KrEK7MsoBY=;
 b=P0nbWUUcO0nXpnkpChm+3+Wji4iCIe66bQYAFM/sOmk9vYGOajQTWAtnMZqpsOXPz1
 3VQlOvFFrMh4+n9x3nHcLolbRJGBOV6kbSehHKCnOaPbk8/O2TnnjFbT99fcMAiAqzdG
 +Ori0KaPg6cHBto5INMMh6pFHzojOg1yvIAnp/KIq0agiiy2B08w8joMcqijAlHRBrd9
 euND2ZPIZo3rIUHkWHbujkTpJQOjx0f3/vgXtMhTlZYJfPSVrxVpCrxwc6PwMbEia03u
 LJLr59cqKbifd7uvREUlG9MATAFjIKf2LBjRc/18uMjtireBZHr9hgF0A8B7fajT+Q4X
 ObVA==
X-Gm-Message-State: AOAM530NC1RtEJvcyawFuT8rXMG7pZ4qdUUYeZCIAKowzapUp1oKQM+/
 pzbmckAYNOsPyUtcj5CHMNLA+4pRDxw=
X-Google-Smtp-Source: ABdhPJxdQsCslnjrvBpBmxKeAFng3Vjlr8gwq4WGtMQIHYWb4ZCCQJY3BCzTuyHnYzhK9wT5atllSQ==
X-Received: by 2002:a5d:59a9:: with SMTP id p9mr62759458wrr.251.1641680303838; 
 Sat, 08 Jan 2022 14:18:23 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id n7sm2489418wms.46.2022.01.08.14.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 14:18:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 23:17:07 +0100
Message-Id: <20220108221707.3626671-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/janus-gateway: bump to version
 0.11.6
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
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Add upstream status (rejected) to first and second patches
- Drop third patch (already in version)

https://github.com/meetecho/janus-gateway/blob/v0.11.6/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/janus-gateway/0001-disable-ssp.patch  |   2 +
 ...dd-test-for-Wunused-but-set-variable.patch |   2 +
 ...site-Scripting-XSS-exploits-in-demos.patch | 357 ------------------
 ...> 0003-Fixed-missing-XSS-mitigation.patch} |   0
 package/janus-gateway/janus-gateway.hash      |   2 +-
 package/janus-gateway/janus-gateway.mk        |   7 +-
 6 files changed, 7 insertions(+), 363 deletions(-)
 delete mode 100644 package/janus-gateway/0003-Fix-potential-Cross-site-Scripting-XSS-exploits-in-demos.patch
 rename package/janus-gateway/{0004-Fixed-missing-XSS-mitigation.patch => 0003-Fixed-missing-XSS-mitigation.patch} (100%)

diff --git a/package/janus-gateway/0001-disable-ssp.patch b/package/janus-gateway/0001-disable-ssp.patch
index 22f7f1a417..0c9b006ed9 100644
--- a/package/janus-gateway/0001-disable-ssp.patch
+++ b/package/janus-gateway/0001-disable-ssp.patch
@@ -12,6 +12,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 (rebased against v0.6.3)
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+[Upstream status: rejected
+(https://github.com/meetecho/janus-gateway/pull/1801)]
 ---
  configure.ac | 1 -
  1 file changed, 1 deletion(-)
diff --git a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
index b54c8cbec6..2dfcc76d68 100644
--- a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
+++ b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
@@ -18,6 +18,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 (rebased against v0.6.3)
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+[Upstream status: rejected
+(https://github.com/meetecho/janus-gateway/pull/1789)]
 ---
  Makefile.am                 |  1 +
  configure.ac                |  6 ++-
diff --git a/package/janus-gateway/0003-Fix-potential-Cross-site-Scripting-XSS-exploits-in-demos.patch b/package/janus-gateway/0003-Fix-potential-Cross-site-Scripting-XSS-exploits-in-demos.patch
deleted file mode 100644
index 9f3adfcc8e..0000000000
--- a/package/janus-gateway/0003-Fix-potential-Cross-site-Scripting-XSS-exploits-in-demos.patch
+++ /dev/null
@@ -1,357 +0,0 @@
-From ba166e9adebfe5343f826c6a9e02299d35414ffd Mon Sep 17 00:00:00 2001
-From: Lorenzo Miniero <lminiero@gmail.com>
-Date: Thu, 25 Nov 2021 17:20:53 +0100
-Subject: [PATCH] Fix potential Cross-site Scripting (XSS) exploits in demos
- (#2817)
-
-[Retrieved (and backported) from:
-https://github.com/meetecho/janus-gateway/commit/ba166e9adebfe5343f826c6a9e02299d35414ffd]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- html/audiobridgetest.js   | 17 +++++++++++++----
- html/recordplaytest.js    | 13 +++++++++++--
- html/screensharingtest.js | 11 ++++++++++-
- html/streamingtest.js     | 13 +++++++++++--
- html/textroomtest.js      | 23 ++++++++++++++---------
- html/videocalltest.js     | 15 ++++++++++++---
- html/videoroomtest.js     | 13 +++++++++++--
- html/vp9svctest.js        | 13 +++++++++++--
- 8 files changed, 93 insertions(+), 25 deletions(-)
-
-diff --git a/html/audiobridgetest.js b/html/audiobridgetest.js
-index 18e1cc1839..f757789708 100644
---- a/html/audiobridgetest.js
-+++ b/html/audiobridgetest.js
-@@ -178,7 +178,7 @@ $(document).ready(function() {
- 												Janus.debug("Got a list of participants:", list);
- 												for(var f in list) {
- 													var id = list[f]["id"];
--													var display = list[f]["display"];
-+													var display = escapeXmlTags(list[f]["display"]);
- 													var setup = list[f]["setup"];
- 													var muted = list[f]["muted"];
- 													var spatial = list[f]["spatial_position"];
-@@ -222,7 +222,7 @@ $(document).ready(function() {
- 												Janus.debug("Got a list of participants:", list);
- 												for(var f in list) {
- 													var id = list[f]["id"];
--													var display = list[f]["display"];
-+													var display = escapeXmlTags(list[f]["display"]);
- 													var setup = list[f]["setup"];
- 													var muted = list[f]["muted"];
- 													var spatial = list[f]["spatial_position"];
-@@ -267,7 +267,7 @@ $(document).ready(function() {
- 												Janus.debug("Got a list of participants:", list);
- 												for(var f in list) {
- 													var id = list[f]["id"];
--													var display = list[f]["display"];
-+													var display = escapeXmlTags(list[f]["display"]);
- 													var setup = list[f]["setup"];
- 													var muted = list[f]["muted"];
- 													var spatial = list[f]["spatial_position"];
-@@ -429,7 +429,7 @@ function registerUsername() {
- 			return;
- 		}
- 		var register = { request: "join", room: myroom, display: username };
--		myusername = username;
-+		myusername = escapeXmlTags(username);
- 		mixertest.send({ message: register});
- 	}
- }
-@@ -448,3 +448,12 @@ function getQueryStringValue(name) {
- 		results = regex.exec(location.search);
- 	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
- }
-+
-+// Helper to escape XML tags
-+function escapeXmlTags(value) {
-+	if(value) {
-+		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
-+		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
-+		return escapedValue;
-+	}
-+}
-diff --git a/html/recordplaytest.js b/html/recordplaytest.js
-index 74ee7bed95..52b5ccbc4c 100644
---- a/html/recordplaytest.js
-+++ b/html/recordplaytest.js
-@@ -423,11 +423,11 @@ function updateRecsList() {
- 			Janus.debug("Got a list of available recordings:", list);
- 			for(var mp in list) {
- 				Janus.debug("  >> [" + list[mp]["id"] + "] " + list[mp]["name"] + " (" + list[mp]["date"] + ")");
--				$('#recslist').append("<li><a href='#' id='" + list[mp]["id"] + "'>" + list[mp]["name"] + " [" + list[mp]["date"] + "]" + "</a></li>");
-+				$('#recslist').append("<li><a href='#' id='" + list[mp]["id"] + "'>" + escapeXmlTags(list[mp]["name"]) + " [" + list[mp]["date"] + "]" + "</a></li>");
- 			}
- 			$('#recslist a').unbind('click').click(function() {
- 				selectedRecording = $(this).attr("id");
--				selectedRecordingInfo = $(this).text();
-+				selectedRecordingInfo = escapeXmlTags($(this).text());
- 				$('#recset').html($(this).html()).parent().removeClass('open');
- 				$('#play').removeAttr('disabled').click(startPlayout);
- 				return false;
-@@ -545,3 +545,12 @@ function getQueryStringValue(name) {
- 		results = regex.exec(location.search);
- 	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
- }
-+
-+// Helper to escape XML tags
-+function escapeXmlTags(value) {
-+	if(value) {
-+		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
-+		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
-+		return escapedValue;
-+	}
-+}
-diff --git a/html/screensharingtest.js b/html/screensharingtest.js
-index 61eac70f43..c64d8dbd67 100644
---- a/html/screensharingtest.js
-+++ b/html/screensharingtest.js
-@@ -161,7 +161,7 @@ $(document).ready(function() {
- 										if(event === "joined") {
- 											myid = msg["id"];
- 											$('#session').html(room);
--											$('#title').html(msg["description"]);
-+											$('#title').html(escapeXmlTags(msg["description"]));
- 											Janus.log("Successfully joined room " + msg["room"] + " with ID " + myid);
- 											if(role === "publisher") {
- 												// This is our session, publish our stream
-@@ -514,3 +514,12 @@ function newRemoteFeed(id, display) {
- 			}
- 		});
- }
-+
-+// Helper to escape XML tags
-+function escapeXmlTags(value) {
-+	if(value) {
-+		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
-+		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
-+		return escapedValue;
-+	}
-+}
-diff --git a/html/streamingtest.js b/html/streamingtest.js
-index 7dd2e1f681..3f9937f11c 100644
---- a/html/streamingtest.js
-+++ b/html/streamingtest.js
-@@ -323,7 +323,7 @@ function updateStreamsList() {
- 			Janus.debug(list);
- 			for(var mp in list) {
- 				Janus.debug("  >> [" + list[mp]["id"] + "] " + list[mp]["description"] + " (" + list[mp]["type"] + ")");
--				$('#streamslist').append("<li><a href='#' id='" + list[mp]["id"] + "'>" + list[mp]["description"] + " (" + list[mp]["type"] + ")" + "</a></li>");
-+				$('#streamslist').append("<li><a href='#' id='" + list[mp]["id"] + "'>" + escapeXmlTags(list[mp]["description"]) + " (" + list[mp]["type"] + ")" + "</a></li>");
- 			}
- 			$('#streamslist a').unbind('click').click(function() {
- 				selectedStream = $(this).attr("id");
-@@ -345,7 +345,7 @@ function getStreamInfo() {
- 	var body = { request: "info", id: parseInt(selectedStream) || selectedStream };
- 	streaming.send({ message: body, success: function(result) {
- 		if(result && result.info && result.info.metadata) {
--			$('#metadata').html(result.info.metadata);
-+			$('#metadata').html(escapeXmlTags(result.info.metadata));
- 			$('#info').removeClass('hide').show();
- 		}
- 	}});
-@@ -394,6 +394,15 @@ function stopStream() {
- 	simulcastStarted = false;
- }
- 
-+// Helper to escape XML tags
-+function escapeXmlTags(value) {
-+	if(value) {
-+		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
-+		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
-+		return escapedValue;
-+	}
-+}
-+
- // Helpers to create Simulcast-related UI, if enabled
- function addSimulcastButtons() {
- 	$('#curres').parent().append(
-diff --git a/html/textroomtest.js b/html/textroomtest.js
-index 082ae44905..3d0697e35a 100644
---- a/html/textroomtest.js
-+++ b/html/textroomtest.js
-@@ -153,9 +153,7 @@ $(document).ready(function() {
- 									var what = json["textroom"];
- 									if(what === "message") {
- 										// Incoming message: public or private?
--										var msg = json["text"];
--										msg = msg.replace(new RegExp('<', 'g'), '&lt');
--										msg = msg.replace(new RegExp('>', 'g'), '&gt');
-+										var msg = escapeXmlTags(json["text"]);
- 										var from = json["from"];
- 										var dateString = getDateString(json["date"]);
- 										var whisper = json["whisper"];
-@@ -170,9 +168,7 @@ $(document).ready(function() {
- 										}
- 									} else if(what === "announcement") {
- 										// Room announcement
--										var msg = json["text"];
--										msg = msg.replace(new RegExp('<', 'g'), '&lt');
--										msg = msg.replace(new RegExp('>', 'g'), '&gt');
-+										var msg = escapeXmlTags(json["text"]);
- 										var dateString = getDateString(json["date"]);
- 										$('#chatroom').append('<p style="color: purple;">[' + dateString + '] <i>' + msg + '</i>');
- 										$('#chatroom').get(0).scrollTop = $('#chatroom').get(0).scrollHeight;
-@@ -180,7 +176,7 @@ $(document).ready(function() {
- 										// Somebody joined
- 										var username = json["username"];
- 										var display = json["display"];
--										participants[username] = display ? display : username;
-+										participants[username] = escapeXmlTags(display ? display : username);
- 										if(username !== myid && $('#rp' + username).length === 0) {
- 											// Add to the participants list
- 											$('#list').append('<li id="rp' + username + '" class="list-group-item">' + participants[username] + '</li>');
-@@ -282,7 +278,7 @@ function registerUsername() {
- 			username: myid,
- 			display: username
- 		};
--		myusername = username;
-+		myusername = escapeXmlTags(username);
- 		transactions[transaction] = function(response) {
- 			if(response["textroom"] === "error") {
- 				// Something went wrong
-@@ -312,7 +308,7 @@ function registerUsername() {
- 			if(response.participants && response.participants.length > 0) {
- 				for(var i in response.participants) {
- 					var p = response.participants[i];
--					participants[p.username] = p.display ? p.display : p.username;
-+					participants[p.username] = escapeXmlTags(p.display ? p.display : p.username);
- 					if(p.username !== myid && $('#rp' + p.username).length === 0) {
- 						// Add to the participants list
- 						$('#list').append('<li id="rp' + p.username + '" class="list-group-item">' + participants[p.username] + '</li>');
-@@ -418,3 +414,12 @@ function getQueryStringValue(name) {
- 		results = regex.exec(location.search);
- 	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
- }
-+
-+// Helper to escape XML tags
-+function escapeXmlTags(value) {
-+	if(value) {
-+		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
-+		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
-+		return escapedValue;
-+	}
-+}
-diff --git a/html/videocalltest.js b/html/videocalltest.js
-index d1c1ab8d07..18ccbc2c47 100644
---- a/html/videocalltest.js
-+++ b/html/videocalltest.js
-@@ -148,7 +148,7 @@ $(document).ready(function() {
- 										} else if(result["event"]) {
- 											var event = result["event"];
- 											if(event === 'registered') {
--												myusername = result["username"];
-+												myusername = escapeXmlTags(result["username"]);
- 												Janus.log("Successfully registered as " + myusername + "!");
- 												$('#youok').removeClass('hide').show().html("Registered as '" + myusername + "'");
- 												// Get a list of available peers, just for fun
-@@ -163,7 +163,7 @@ $(document).ready(function() {
- 												bootbox.alert("Waiting for the peer to answer...");
- 											} else if(event === 'incomingcall') {
- 												Janus.log("Incoming call from " + result["username"] + "!");
--												yourusername = result["username"];
-+												yourusername = escapeXmlTags(result["username"]);
- 												// Notify user
- 												bootbox.hideAll();
- 												incoming = bootbox.dialog({
-@@ -213,7 +213,7 @@ $(document).ready(function() {
- 												});
- 											} else if(event === 'accepted') {
- 												bootbox.hideAll();
--												var peer = result["username"];
-+												var peer = escapeXmlTags(result["username"]);
- 												if(!peer) {
- 													Janus.log("Call started!");
- 												} else {
-@@ -598,6 +598,15 @@ function getQueryStringValue(name) {
- 	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
- }
- 
-+// Helper to escape XML tags
-+function escapeXmlTags(value) {
-+	if(value) {
-+		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
-+		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
-+		return escapedValue;
-+	}
-+}
-+
- // Helpers to create Simulcast-related UI, if enabled
- function addSimulcastButtons(temporal) {
- 	$('#curres').parent().append(
-diff --git a/html/videoroomtest.js b/html/videoroomtest.js
-index 6a566891d8..5a3ade9be9 100644
---- a/html/videoroomtest.js
-+++ b/html/videoroomtest.js
-@@ -400,7 +400,7 @@ function registerUsername() {
- 			ptype: "publisher",
- 			display: username
- 		};
--		myusername = username;
-+		myusername = escapeXmlTags(username);
- 		sfutest.send({ message: register });
- 	}
- }
-@@ -530,7 +530,7 @@ function newRemoteFeed(id, display, audio, video) {
- 							}
- 						}
- 						remoteFeed.rfid = msg["id"];
--						remoteFeed.rfdisplay = msg["display"];
-+						remoteFeed.rfdisplay = escapeXmlTags(msg["display"]);
- 						if(!remoteFeed.spinner) {
- 							var target = document.getElementById('videoremote'+remoteFeed.rfindex);
- 							remoteFeed.spinner = new Spinner({top:100}).spin(target);
-@@ -685,6 +685,15 @@ function getQueryStringValue(name) {
- 	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
- }
- 
-+// Helper to escape XML tags
-+function escapeXmlTags(value) {
-+	if(value) {
-+		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
-+		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
-+		return escapedValue;
-+	}
-+}
-+
- // Helpers to create Simulcast-related UI, if enabled
- function addSimulcastButtons(feed, temporal) {
- 	var index = feed;
-diff --git a/html/vp9svctest.js b/html/vp9svctest.js
-index eca0239c32..b22ccf3340 100644
---- a/html/vp9svctest.js
-+++ b/html/vp9svctest.js
-@@ -387,7 +387,7 @@ function registerUsername() {
- 			ptype: "publisher",
- 			display: username
- 		};
--		myusername = username;
-+		myusername = escapeXmlTags(username);
- 		sfutest.send({ message: register });
- 	}
- }
-@@ -486,7 +486,7 @@ function newRemoteFeed(id, display, audio, video) {
- 							}
- 						}
- 						remoteFeed.rfid = msg["id"];
--						remoteFeed.rfdisplay = msg["display"];
-+						remoteFeed.rfdisplay = escapeXmlTags(msg["display"]);
- 						if(!remoteFeed.spinner) {
- 							var target = document.getElementById('videoremote'+remoteFeed.rfindex);
- 							remoteFeed.spinner = new Spinner({top:100}).spin(target);
-@@ -630,6 +630,15 @@ function newRemoteFeed(id, display, audio, video) {
- 		});
- }
- 
-+// Helper to escape XML tags
-+function escapeXmlTags(value) {
-+	if(value) {
-+		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
-+		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
-+		return escapedValue;
-+	}
-+}
-+
- // Helpers to create SVC-related UI for a new viewer
- function addSvcButtons(feed) {
- 	var index = feed;
diff --git a/package/janus-gateway/0004-Fixed-missing-XSS-mitigation.patch b/package/janus-gateway/0003-Fixed-missing-XSS-mitigation.patch
similarity index 100%
rename from package/janus-gateway/0004-Fixed-missing-XSS-mitigation.patch
rename to package/janus-gateway/0003-Fixed-missing-XSS-mitigation.patch
diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
index 83afc72c98..7aec3d2aa3 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  21e2fc7dee4b20ed8d749a69577eccd961b0bfe5b863d42f39ddfcd2af903718  janus-gateway-0.10.10.tar.gz
+sha256  b5fe70d95b9288200df15d5f75cb8eb6db66484c6ded159422a81e880ecb7104  janus-gateway-0.11.6.tar.gz
 sha256  91d04c97fa1da3fcd28205873276358aafc071c5b00a9ea8c49dd06d487a9dc6  COPYING
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 83d28ff6c7..84ca0bc116 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,17 +4,14 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = 0.10.10
+JANUS_GATEWAY_VERSION = 0.11.6
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,v$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPL-3.0 with OpenSSL exception
 JANUS_GATEWAY_LICENSE_FILES = COPYING
 JANUS_GATEWAY_CPE_ID_VENDOR = meetecho
 JANUS_GATEWAY_CPE_ID_PRODUCT = janus
 
-# 0003-Fix-potential-Cross-site-Scripting-XSS-exploits-in-demos.patch
-JANUS_GATEWAY_IGNORE_CVES += CVE-2021-4020
-
-# 0004-Fixed-missing-XSS-mitigation.patch
+# 0003-Fixed-missing-XSS-mitigation.patch
 JANUS_GATEWAY_IGNORE_CVES += CVE-2021-4124
 
 # ding-libs provides the ini_config library
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
