From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon, 26 Aug 2019 14:14:05 +0200
Subject: [Buildroot] [PATCH buildroot-test] web/search.{js,
 php}: pass the event to the submit handler
Message-ID: <20190826121405.23134-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some web-browsers do not define the global event object on functions
callback (see [1]). This cause an 'undefined event' error on the search
page. Passing the event argument from the function caller fix this (at
least it does on Firefox ESR 60.0.8).

[1] http://buildroot-busybox.2317881.n4.nabble.com/New-search-features-on-autobuild-buildroot-org-tt230624.html

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 web/search.js  | 2 +-
 web/search.php | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/web/search.js b/web/search.js
index cf52478..d624ade 100644
--- a/web/search.js
+++ b/web/search.js
@@ -1,4 +1,4 @@
-function submitForm() {
+function submitForm(event) {
     // Do not send the form
     event.preventDefault();
 
diff --git a/web/search.php b/web/search.php
index bcdd62e..821308f 100644
--- a/web/search.php
+++ b/web/search.php
@@ -7,7 +7,7 @@ bab_header("Buildroot tests - Search page");
 <script type='text/javascript' src="search.js"></script>
 
 
-<form action="index.php" method="get" onsubmit="submitForm()">
+<form action="index.php" method="get" onsubmit="submitForm(event)">
     <label>
         <span>Submitter:</span>
         <input type="text" name="submitter" placeholder="Submitter">
-- 
2.21.0
