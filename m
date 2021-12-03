Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C244BC433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 21:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47EC4405B2;
	Fri,  3 Dec 2021 21:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vPHc0ZVyEvGl; Fri,  3 Dec 2021 21:04:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C56E1405B3;
	Fri,  3 Dec 2021 21:04:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 535541BF473
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 21:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 431B08100D
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 21:04:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TfnXZjOmkMYC for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 21:04:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DD5480F6A
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 21:04:27 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso3138955wmr.5
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 13:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s9XGA2CKTiERS3h/QXkwgprkxv5pl2bvtDEF2g5Me4U=;
 b=NeA31vpZXV3WSWygeF+AecNen3I26w4xYeiufoXdN1j8FHN4N495oC0lxoY+AoSamy
 zVlz5sHUyMGzziA3UytD7SoLkNfl0eSA3XT4t4qA0pD4YlJ+PxuWkw8L1iFKlyt+Vqna
 OERqOMJuNtReFu/MUzu1uEYQD6k1cW76eK+0MdFNAMShe++0/jmxzmQ/TmHB0FMBbcBP
 YazYR/UCXYeV2BqL8o8dFu9ga9byMCW4ST97Vct4VXM+PdeDv4fvLZwvt2BxaDCfX6uA
 2YRq6AlKAS/SXII7Kqrf1/x7aVPUBFd+4wGNmTKvL1qkSx166frNHQ9/i58gKrsrnVas
 NQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s9XGA2CKTiERS3h/QXkwgprkxv5pl2bvtDEF2g5Me4U=;
 b=ODQ+QHD6aSBh1kxj0tNwJA2dcnAhUjLIqDRGPh1jnJ/8qqYnN0xKti5WT06izriz0V
 lpUSfE1yQxOUanL+Dg9rGmzcV+f1CBEus6a7qP75AGx05xRL0n16WZ7dR7wEj6erBXTj
 WGG/zsbGsm8ErK5erW02sGGmuamQwDAZfeQ1jqXOGepADk67Nr1hMom6rXe9VR1+IG73
 0QknNiSOazXR6K/cTclP/NQf4gEbuiNuhMALZA1Y7LH9KDiHD3HT+5YG5JG/Ge1EEwOa
 1r8xIutGn+VkPEsGtUjN6G06+Nl/75GmI+cVAszJanZE5IXOHxuc6ihb7aFVVNkcpURn
 KfCg==
X-Gm-Message-State: AOAM532qLEvBOzF962s98k6yM6MC+caEnOzIpmj7WRJCceNFA9D7UFus
 6btPuMfpD6bJOsOJkzFrXDZH82J2gMGOxQ==
X-Google-Smtp-Source: ABdhPJyRiMkENE6BuU938F2d0V0XZ2y/nJ8ISGKLsSaIe4GUJFCsIUA9HZKJ9lHv5Uy0LzydLNOV0w==
X-Received: by 2002:a05:600c:253:: with SMTP id
 19mr18110291wmj.179.1638565465097; 
 Fri, 03 Dec 2021 13:04:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id m125sm6131061wmm.39.2021.12.03.13.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 13:04:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Dec 2021 22:04:34 +0100
Message-Id: <20211203210434.1924441-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/janus-gateway: fix CVE-2021-4020
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

Fix CVE-2021-4020: janus-gateway is vulnerable to Improper
Neutralization of Input During Web Page Generation ('Cross-site
Scripting')

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...site-Scripting-XSS-exploits-in-demos.patch | 357 ++++++++++++++++++
 package/janus-gateway/janus-gateway.mk        |   3 +
 2 files changed, 360 insertions(+)
 create mode 100644 package/janus-gateway/0003-Fix-potential-Cross-site-Scripting-XSS-exploits-in-demos.patch

diff --git a/package/janus-gateway/0003-Fix-potential-Cross-site-Scripting-XSS-exploits-in-demos.patch b/package/janus-gateway/0003-Fix-potential-Cross-site-Scripting-XSS-exploits-in-demos.patch
new file mode 100644
index 0000000000..9f3adfcc8e
--- /dev/null
+++ b/package/janus-gateway/0003-Fix-potential-Cross-site-Scripting-XSS-exploits-in-demos.patch
@@ -0,0 +1,357 @@
+From ba166e9adebfe5343f826c6a9e02299d35414ffd Mon Sep 17 00:00:00 2001
+From: Lorenzo Miniero <lminiero@gmail.com>
+Date: Thu, 25 Nov 2021 17:20:53 +0100
+Subject: [PATCH] Fix potential Cross-site Scripting (XSS) exploits in demos
+ (#2817)
+
+[Retrieved (and backported) from:
+https://github.com/meetecho/janus-gateway/commit/ba166e9adebfe5343f826c6a9e02299d35414ffd]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ html/audiobridgetest.js   | 17 +++++++++++++----
+ html/recordplaytest.js    | 13 +++++++++++--
+ html/screensharingtest.js | 11 ++++++++++-
+ html/streamingtest.js     | 13 +++++++++++--
+ html/textroomtest.js      | 23 ++++++++++++++---------
+ html/videocalltest.js     | 15 ++++++++++++---
+ html/videoroomtest.js     | 13 +++++++++++--
+ html/vp9svctest.js        | 13 +++++++++++--
+ 8 files changed, 93 insertions(+), 25 deletions(-)
+
+diff --git a/html/audiobridgetest.js b/html/audiobridgetest.js
+index 18e1cc1839..f757789708 100644
+--- a/html/audiobridgetest.js
++++ b/html/audiobridgetest.js
+@@ -178,7 +178,7 @@ $(document).ready(function() {
+ 												Janus.debug("Got a list of participants:", list);
+ 												for(var f in list) {
+ 													var id = list[f]["id"];
+-													var display = list[f]["display"];
++													var display = escapeXmlTags(list[f]["display"]);
+ 													var setup = list[f]["setup"];
+ 													var muted = list[f]["muted"];
+ 													var spatial = list[f]["spatial_position"];
+@@ -222,7 +222,7 @@ $(document).ready(function() {
+ 												Janus.debug("Got a list of participants:", list);
+ 												for(var f in list) {
+ 													var id = list[f]["id"];
+-													var display = list[f]["display"];
++													var display = escapeXmlTags(list[f]["display"]);
+ 													var setup = list[f]["setup"];
+ 													var muted = list[f]["muted"];
+ 													var spatial = list[f]["spatial_position"];
+@@ -267,7 +267,7 @@ $(document).ready(function() {
+ 												Janus.debug("Got a list of participants:", list);
+ 												for(var f in list) {
+ 													var id = list[f]["id"];
+-													var display = list[f]["display"];
++													var display = escapeXmlTags(list[f]["display"]);
+ 													var setup = list[f]["setup"];
+ 													var muted = list[f]["muted"];
+ 													var spatial = list[f]["spatial_position"];
+@@ -429,7 +429,7 @@ function registerUsername() {
+ 			return;
+ 		}
+ 		var register = { request: "join", room: myroom, display: username };
+-		myusername = username;
++		myusername = escapeXmlTags(username);
+ 		mixertest.send({ message: register});
+ 	}
+ }
+@@ -448,3 +448,12 @@ function getQueryStringValue(name) {
+ 		results = regex.exec(location.search);
+ 	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
+ }
++
++// Helper to escape XML tags
++function escapeXmlTags(value) {
++	if(value) {
++		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
++		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
++		return escapedValue;
++	}
++}
+diff --git a/html/recordplaytest.js b/html/recordplaytest.js
+index 74ee7bed95..52b5ccbc4c 100644
+--- a/html/recordplaytest.js
++++ b/html/recordplaytest.js
+@@ -423,11 +423,11 @@ function updateRecsList() {
+ 			Janus.debug("Got a list of available recordings:", list);
+ 			for(var mp in list) {
+ 				Janus.debug("  >> [" + list[mp]["id"] + "] " + list[mp]["name"] + " (" + list[mp]["date"] + ")");
+-				$('#recslist').append("<li><a href='#' id='" + list[mp]["id"] + "'>" + list[mp]["name"] + " [" + list[mp]["date"] + "]" + "</a></li>");
++				$('#recslist').append("<li><a href='#' id='" + list[mp]["id"] + "'>" + escapeXmlTags(list[mp]["name"]) + " [" + list[mp]["date"] + "]" + "</a></li>");
+ 			}
+ 			$('#recslist a').unbind('click').click(function() {
+ 				selectedRecording = $(this).attr("id");
+-				selectedRecordingInfo = $(this).text();
++				selectedRecordingInfo = escapeXmlTags($(this).text());
+ 				$('#recset').html($(this).html()).parent().removeClass('open');
+ 				$('#play').removeAttr('disabled').click(startPlayout);
+ 				return false;
+@@ -545,3 +545,12 @@ function getQueryStringValue(name) {
+ 		results = regex.exec(location.search);
+ 	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
+ }
++
++// Helper to escape XML tags
++function escapeXmlTags(value) {
++	if(value) {
++		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
++		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
++		return escapedValue;
++	}
++}
+diff --git a/html/screensharingtest.js b/html/screensharingtest.js
+index 61eac70f43..c64d8dbd67 100644
+--- a/html/screensharingtest.js
++++ b/html/screensharingtest.js
+@@ -161,7 +161,7 @@ $(document).ready(function() {
+ 										if(event === "joined") {
+ 											myid = msg["id"];
+ 											$('#session').html(room);
+-											$('#title').html(msg["description"]);
++											$('#title').html(escapeXmlTags(msg["description"]));
+ 											Janus.log("Successfully joined room " + msg["room"] + " with ID " + myid);
+ 											if(role === "publisher") {
+ 												// This is our session, publish our stream
+@@ -514,3 +514,12 @@ function newRemoteFeed(id, display) {
+ 			}
+ 		});
+ }
++
++// Helper to escape XML tags
++function escapeXmlTags(value) {
++	if(value) {
++		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
++		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
++		return escapedValue;
++	}
++}
+diff --git a/html/streamingtest.js b/html/streamingtest.js
+index 7dd2e1f681..3f9937f11c 100644
+--- a/html/streamingtest.js
++++ b/html/streamingtest.js
+@@ -323,7 +323,7 @@ function updateStreamsList() {
+ 			Janus.debug(list);
+ 			for(var mp in list) {
+ 				Janus.debug("  >> [" + list[mp]["id"] + "] " + list[mp]["description"] + " (" + list[mp]["type"] + ")");
+-				$('#streamslist').append("<li><a href='#' id='" + list[mp]["id"] + "'>" + list[mp]["description"] + " (" + list[mp]["type"] + ")" + "</a></li>");
++				$('#streamslist').append("<li><a href='#' id='" + list[mp]["id"] + "'>" + escapeXmlTags(list[mp]["description"]) + " (" + list[mp]["type"] + ")" + "</a></li>");
+ 			}
+ 			$('#streamslist a').unbind('click').click(function() {
+ 				selectedStream = $(this).attr("id");
+@@ -345,7 +345,7 @@ function getStreamInfo() {
+ 	var body = { request: "info", id: parseInt(selectedStream) || selectedStream };
+ 	streaming.send({ message: body, success: function(result) {
+ 		if(result && result.info && result.info.metadata) {
+-			$('#metadata').html(result.info.metadata);
++			$('#metadata').html(escapeXmlTags(result.info.metadata));
+ 			$('#info').removeClass('hide').show();
+ 		}
+ 	}});
+@@ -394,6 +394,15 @@ function stopStream() {
+ 	simulcastStarted = false;
+ }
+ 
++// Helper to escape XML tags
++function escapeXmlTags(value) {
++	if(value) {
++		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
++		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
++		return escapedValue;
++	}
++}
++
+ // Helpers to create Simulcast-related UI, if enabled
+ function addSimulcastButtons() {
+ 	$('#curres').parent().append(
+diff --git a/html/textroomtest.js b/html/textroomtest.js
+index 082ae44905..3d0697e35a 100644
+--- a/html/textroomtest.js
++++ b/html/textroomtest.js
+@@ -153,9 +153,7 @@ $(document).ready(function() {
+ 									var what = json["textroom"];
+ 									if(what === "message") {
+ 										// Incoming message: public or private?
+-										var msg = json["text"];
+-										msg = msg.replace(new RegExp('<', 'g'), '&lt');
+-										msg = msg.replace(new RegExp('>', 'g'), '&gt');
++										var msg = escapeXmlTags(json["text"]);
+ 										var from = json["from"];
+ 										var dateString = getDateString(json["date"]);
+ 										var whisper = json["whisper"];
+@@ -170,9 +168,7 @@ $(document).ready(function() {
+ 										}
+ 									} else if(what === "announcement") {
+ 										// Room announcement
+-										var msg = json["text"];
+-										msg = msg.replace(new RegExp('<', 'g'), '&lt');
+-										msg = msg.replace(new RegExp('>', 'g'), '&gt');
++										var msg = escapeXmlTags(json["text"]);
+ 										var dateString = getDateString(json["date"]);
+ 										$('#chatroom').append('<p style="color: purple;">[' + dateString + '] <i>' + msg + '</i>');
+ 										$('#chatroom').get(0).scrollTop = $('#chatroom').get(0).scrollHeight;
+@@ -180,7 +176,7 @@ $(document).ready(function() {
+ 										// Somebody joined
+ 										var username = json["username"];
+ 										var display = json["display"];
+-										participants[username] = display ? display : username;
++										participants[username] = escapeXmlTags(display ? display : username);
+ 										if(username !== myid && $('#rp' + username).length === 0) {
+ 											// Add to the participants list
+ 											$('#list').append('<li id="rp' + username + '" class="list-group-item">' + participants[username] + '</li>');
+@@ -282,7 +278,7 @@ function registerUsername() {
+ 			username: myid,
+ 			display: username
+ 		};
+-		myusername = username;
++		myusername = escapeXmlTags(username);
+ 		transactions[transaction] = function(response) {
+ 			if(response["textroom"] === "error") {
+ 				// Something went wrong
+@@ -312,7 +308,7 @@ function registerUsername() {
+ 			if(response.participants && response.participants.length > 0) {
+ 				for(var i in response.participants) {
+ 					var p = response.participants[i];
+-					participants[p.username] = p.display ? p.display : p.username;
++					participants[p.username] = escapeXmlTags(p.display ? p.display : p.username);
+ 					if(p.username !== myid && $('#rp' + p.username).length === 0) {
+ 						// Add to the participants list
+ 						$('#list').append('<li id="rp' + p.username + '" class="list-group-item">' + participants[p.username] + '</li>');
+@@ -418,3 +414,12 @@ function getQueryStringValue(name) {
+ 		results = regex.exec(location.search);
+ 	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
+ }
++
++// Helper to escape XML tags
++function escapeXmlTags(value) {
++	if(value) {
++		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
++		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
++		return escapedValue;
++	}
++}
+diff --git a/html/videocalltest.js b/html/videocalltest.js
+index d1c1ab8d07..18ccbc2c47 100644
+--- a/html/videocalltest.js
++++ b/html/videocalltest.js
+@@ -148,7 +148,7 @@ $(document).ready(function() {
+ 										} else if(result["event"]) {
+ 											var event = result["event"];
+ 											if(event === 'registered') {
+-												myusername = result["username"];
++												myusername = escapeXmlTags(result["username"]);
+ 												Janus.log("Successfully registered as " + myusername + "!");
+ 												$('#youok').removeClass('hide').show().html("Registered as '" + myusername + "'");
+ 												// Get a list of available peers, just for fun
+@@ -163,7 +163,7 @@ $(document).ready(function() {
+ 												bootbox.alert("Waiting for the peer to answer...");
+ 											} else if(event === 'incomingcall') {
+ 												Janus.log("Incoming call from " + result["username"] + "!");
+-												yourusername = result["username"];
++												yourusername = escapeXmlTags(result["username"]);
+ 												// Notify user
+ 												bootbox.hideAll();
+ 												incoming = bootbox.dialog({
+@@ -213,7 +213,7 @@ $(document).ready(function() {
+ 												});
+ 											} else if(event === 'accepted') {
+ 												bootbox.hideAll();
+-												var peer = result["username"];
++												var peer = escapeXmlTags(result["username"]);
+ 												if(!peer) {
+ 													Janus.log("Call started!");
+ 												} else {
+@@ -598,6 +598,15 @@ function getQueryStringValue(name) {
+ 	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
+ }
+ 
++// Helper to escape XML tags
++function escapeXmlTags(value) {
++	if(value) {
++		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
++		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
++		return escapedValue;
++	}
++}
++
+ // Helpers to create Simulcast-related UI, if enabled
+ function addSimulcastButtons(temporal) {
+ 	$('#curres').parent().append(
+diff --git a/html/videoroomtest.js b/html/videoroomtest.js
+index 6a566891d8..5a3ade9be9 100644
+--- a/html/videoroomtest.js
++++ b/html/videoroomtest.js
+@@ -400,7 +400,7 @@ function registerUsername() {
+ 			ptype: "publisher",
+ 			display: username
+ 		};
+-		myusername = username;
++		myusername = escapeXmlTags(username);
+ 		sfutest.send({ message: register });
+ 	}
+ }
+@@ -530,7 +530,7 @@ function newRemoteFeed(id, display, audio, video) {
+ 							}
+ 						}
+ 						remoteFeed.rfid = msg["id"];
+-						remoteFeed.rfdisplay = msg["display"];
++						remoteFeed.rfdisplay = escapeXmlTags(msg["display"]);
+ 						if(!remoteFeed.spinner) {
+ 							var target = document.getElementById('videoremote'+remoteFeed.rfindex);
+ 							remoteFeed.spinner = new Spinner({top:100}).spin(target);
+@@ -685,6 +685,15 @@ function getQueryStringValue(name) {
+ 	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
+ }
+ 
++// Helper to escape XML tags
++function escapeXmlTags(value) {
++	if(value) {
++		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
++		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
++		return escapedValue;
++	}
++}
++
+ // Helpers to create Simulcast-related UI, if enabled
+ function addSimulcastButtons(feed, temporal) {
+ 	var index = feed;
+diff --git a/html/vp9svctest.js b/html/vp9svctest.js
+index eca0239c32..b22ccf3340 100644
+--- a/html/vp9svctest.js
++++ b/html/vp9svctest.js
+@@ -387,7 +387,7 @@ function registerUsername() {
+ 			ptype: "publisher",
+ 			display: username
+ 		};
+-		myusername = username;
++		myusername = escapeXmlTags(username);
+ 		sfutest.send({ message: register });
+ 	}
+ }
+@@ -486,7 +486,7 @@ function newRemoteFeed(id, display, audio, video) {
+ 							}
+ 						}
+ 						remoteFeed.rfid = msg["id"];
+-						remoteFeed.rfdisplay = msg["display"];
++						remoteFeed.rfdisplay = escapeXmlTags(msg["display"]);
+ 						if(!remoteFeed.spinner) {
+ 							var target = document.getElementById('videoremote'+remoteFeed.rfindex);
+ 							remoteFeed.spinner = new Spinner({top:100}).spin(target);
+@@ -630,6 +630,15 @@ function newRemoteFeed(id, display, audio, video) {
+ 		});
+ }
+ 
++// Helper to escape XML tags
++function escapeXmlTags(value) {
++	if(value) {
++		var escapedValue = value.replace(new RegExp('<', 'g'), '&lt');
++		escapedValue = escapedValue.replace(new RegExp('>', 'g'), '&gt');
++		return escapedValue;
++	}
++}
++
+ // Helpers to create SVC-related UI for a new viewer
+ function addSvcButtons(feed) {
+ 	var index = feed;
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 40652d802a..98e00aeeb8 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -11,6 +11,9 @@ JANUS_GATEWAY_LICENSE_FILES = COPYING
 JANUS_GATEWAY_CPE_ID_VENDOR = meetecho
 JANUS_GATEWAY_CPE_ID_PRODUCT = janus
 
+# 0003-Fix-potential-Cross-site-Scripting-XSS-exploits-in-demos.patch
+JANUS_GATEWAY_IGNORE_CVES += CVE-2021-4020
+
 # ding-libs provides the ini_config library
 JANUS_GATEWAY_DEPENDENCIES = host-pkgconf jansson libnice \
 	libsrtp host-gengetopt libglib2 openssl libconfig \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
