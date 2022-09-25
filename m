Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00AAC04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 16:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66A7A60758;
	Sun, 25 Sep 2022 16:03:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66A7A60758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6qCvzslY5-pT; Sun, 25 Sep 2022 16:03:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72B3A6072A;
	Sun, 25 Sep 2022 16:03:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72B3A6072A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62EDF1BF36A
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 16:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FF826072A
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 16:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FF826072A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TqhNFztkkm6D for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 16:03:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4F11605EC
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4F11605EC
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 16:03:26 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id lh5so9531957ejb.10
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 09:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=F45/FuT2PFU/djBkEmyFKoU9jnaAlcDVrTQ0hw75vXA=;
 b=7Js7Kgex+pcY8qdpmb9HN2nldjM3+yYt0arCpbcMa2ols3eBfRO/ewFHANc23Z7iAV
 vowag+TRr0Hay8HJfBYEmvR/moukypcwGFHblskkWMCmI+Bra5RGeWskd81iJ/OMh6pu
 DoItnvWgGYExyDjFoEh9Y66ZDDAqRhnHSAAFWnIR0eh7BnPUJ3ED/SFKfNTNDOdsN3RJ
 26ZLA8HKOAn8+zj9OgvMiFu+XaoeYhLFKX8ZPj4b6vT64RMzlp8zEnVryV6z/IbKWdYm
 VI+aPQCy8x9upK6L5BhRXrWbUGvrF5Z2jh6qz1rE01jaRWeOG4Oi9RoC5ztw9yIFosbw
 OB1w==
X-Gm-Message-State: ACrzQf3F0MPNeUqz9jC3K0Rf70q04L5DqPoR0wK9QJoah6hnqbLfrlsA
 emjwN/erWxKOBTjqq4JcP8SxskRfKBu0dw==
X-Google-Smtp-Source: AMsMyM7995sxcB4ufXSk/VNJpSqdw4EhJQBkgQNjkIlPDvln7lXZe6zNrVg2cf0i7Ovt9rxW114T8g==
X-Received: by 2002:a17:907:7fa0:b0:782:948b:e212 with SMTP id
 qk32-20020a1709077fa000b00782948be212mr11249387ejc.231.1664121804749; 
 Sun, 25 Sep 2022 09:03:24 -0700 (PDT)
Received: from angelo-ThinkPad-X270.. (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 g11-20020a1709063b0b00b0073cf6ec3276sm6789512ejf.207.2022.09.25.09.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 09:03:24 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 18:03:20 +0200
Message-Id: <20220925160320.80027-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=F45/FuT2PFU/djBkEmyFKoU9jnaAlcDVrTQ0hw75vXA=;
 b=qcnoeSzUSpzjLlNPxwcXdfshv4t8p4+dRTtbWN4M4HZt1fMOMxjOoO6CMg+a4UuK+u
 XLRDQ4WpFkqssHdpsDiHYlzwy8uA2Lwj6cwPgFhiH8N3Wdwr2slmpUJeOZhX7hfG0Ps0
 bXnSA9qgwLxoYYqfqUxoHPVL5Obnv5xFxE6/c=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=qcnoeSzU
Subject: [Buildroot] [PATCH] docs/website: fixing js for the new feed source
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Feed source is moved to a local atom file available on the web server to
remove further problems with unreliable feed sources.
Moving the feed required a bit of refactor of the load_activity function
so it won't download two times te same url.

This change requires a cron job like this enabled on the website:
* * * * * wget -O new.atom https://lore.kernel.org/buildroot/new.atom

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 docs/website/js/buildroot.js | 70 ++++++++++++++++++++----------------
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
