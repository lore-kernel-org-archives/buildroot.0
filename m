Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71D0C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 09:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CEC7409DB;
	Mon,  6 Feb 2023 09:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CEC7409DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pPs8qOpRgYrU; Mon,  6 Feb 2023 09:52:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0D95409FB;
	Mon,  6 Feb 2023 09:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0D95409FB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D73261BF470
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 09:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF1C2402F3
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 09:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF1C2402F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id duww3JnAdSKs for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 09:52:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF04B40151
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 09:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF04B40151
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB95C83988; Mon,  6 Feb 2023 09:52:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 10:51:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee7cf14b5188aca5f17dd38ab0b6673d5789942b
X-Git-Newrev: ca97c78ee0e069c70b8fa051012ea02c911dbf2d
X-Patchwork-Hint: ignore
Message-Id: <20230206095233.BB95C83988@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: fixing js for the new feed
 source
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ca97c78ee0e069c70b8fa051012ea02c911dbf2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Feed source is moved to a local atom file available on the web server to
remove further problems with unreliable feed sources.
Moving the feed required a bit of refactor of the load_activity function
so it won't download two times te same url.

This change requires a cron job like this enabled on the website:
* * * * * wget -O new.atom https://lore.kernel.org/buildroot/new.atom

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/js/buildroot.js | 70 +++++++++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 30 deletions(-)

diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index bf80f11d7a..288e3e745c 100644
--- a/docs/website/js/buildroot.js
+++ b/docs/website/js/buildroot.js
@@ -1,39 +1,50 @@
-function load_activity(feedurl, divid) {
-    let container = document.getElementById(divid);
+function display_activity(result, activity) {
+    let loaded = 0;
+    let nb_display = 8;
+    let container;
+    if (result==null) return;
+    for (let i = 0; i < result.feed.entry.length; i++) {
+        let entry = result.feed.entry[i];
+        if (activity==="commit" && entry.title.toString().indexOf("git commit") !== -1) {
+            container = document.getElementById("commit-activity");
+        } else if (activity==="mailing-list" && entry.title.toString().indexOf("git commit") === -1) {
+            container = document.getElementById("mailing-list-activity");
+        } else {
+            continue;
+        }
+        loaded += 1
+        if (loaded > nb_display)
+            break;
+        let div = document.createElement("p");
+        let link = document.createElement("a");
+        let d = new Date(entry.updated);
+        let data = '[' + d.toLocaleDateString() + '] ' + entry.title;
+        let text = document.createTextNode(data);
+        link.appendChild(text);
+        link.title = entry.title;
+        link.href = entry.link._href;
+        div.appendChild(link);
+        container.appendChild(div);
+    }
+    for (let i = 0; i < (nb_display - loaded); i++) {
+        container.appendChild(document.createElement("p"));
+    }
+}
+
+function load_activity(feedurl) {
     $.ajax({
-      url: "https://cors-anywhere.herokuapp.com/" + feedurl
+      url: feedurl
     })
     .done(function(data){
         let x2js = new X2JS();
         let result = x2js.xml_str2json(data.documentElement.outerHTML);
-        let loaded = 0;
-        let nb_display = 8;
-        if (result==null) return;
-        for (let i = 0; i < result.feed.entry.length; i++) {
-            let entry = result.feed.entry[i];
-            if (entry.title.indexOf("git commit") !== -1)
-                continue;
-            loaded += 1;
-            if (loaded > nb_display)
-                break;
-            let div = document.createElement("p");
-            let link = document.createElement("a");
-            let d = new Date(entry.published);
-            let data = '[' + d.toLocaleDateString() + '] ' + entry.title;
-            let text = document.createTextNode(data);
-            link.appendChild(text);
-            link.title = entry.title;
-            link.href = entry.link._href;
-            div.appendChild(link);
-            container.appendChild(div);
-        }
-        let empty = nb_display - loaded;
-        for (let i = 0; i < empty; i++) {
-            container.appendChild(document.createElement("p"));
-        }
+        display_activity(result, "commit");
+        display_activity(result, "mailing-list");
     });
 }
 
+
+
 function google_analytics() {
     let _gaq = _gaq || [];
     _gaq.push(['_setAccount', 'UA-21761074-1']);
@@ -86,8 +97,7 @@ jQuery(document).ready(function($) {
     url = url.split(/[\\/]/).pop();
     $('.nav a[href="/' + url + '"]').parent().addClass('active');
 
-    load_activity("http://buildroot-busybox.2317881.n4.nabble.com/Buildroot-busybox-ft2.xml", "mailing-list-activity");
-    load_activity("http://git.buildroot.org/buildroot/atom/?h=master", "commit-activity");
+    load_activity("/new.atom");
 
     $('#slides').html('<iframe src="https://docs.google.com/gview?url=http://bootlin.com/doc/training/buildroot/buildroot-slides.pdf&embedded=true" style="position:absolute; width:100%; height:100%; top:0; left:0;" frameborder="0"></iframe>')
 });
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
