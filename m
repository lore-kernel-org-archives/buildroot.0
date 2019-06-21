From: Victor Huesca <victor.huesca@bootlin.com>
Date: Fri, 21 Jun 2019 14:37:12 +0200
Subject: [Buildroot] [PATCH buildroot-test 4/4] web/request.{js,
 php} and web/stylesheet.css: new page to ease seaching for specific
 results
In-Reply-To: <20190621123712.8060-1-victor.huesca@bootlin.com>
References: <20190621123712.8060-1-victor.huesca@bootlin.com>
Message-ID: <20190621123712.8060-5-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add form page to allow a more advanced and convenient way to search for specific configs.

Currently results are filtered by clicking on a symbol value in the autobuild
results page. With this method, we are limited to one field only (eg. submitter,
reason, etc). Any additional field has to be manually provided in the url.
While this method is great for automation, it is not intuitive nor efficient
for a human especially when it comes to filter by symbols since it it now
possible.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 web/request.js     | 47 +++++++++++++++++++++++++++
 web/request.php    | 67 +++++++++++++++++++++++++++++++++++++++
 web/stylesheet.css | 79 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 193 insertions(+)
 create mode 100644 web/request.js
 create mode 100644 web/request.php

diff --git a/web/request.js b/web/request.js
new file mode 100644
index 0000000..1d348bb
--- /dev/null
+++ b/web/request.js
@@ -0,0 +1,47 @@
+// Avoid empty input to be send by the form (this is clearer
+// and simplify treatment on server)
+function disableEmpties(node) {
+    if (node == undefined) {
+        node = document.getElementById("noblank");
+        prepareSymbols();
+    }
+    if (node.hasChildNodes() && node.tagName != "TEXTAREA" && node.tagName != "SELECT")
+        for(const child of node.children)
+            arguments.callee(child);
+    else if (node.value == "")
+        node.disabled = true;
+}
+
+// Add hidden inputs according to the symbols textarea
+function prepareSymbols() {
+    const container = document.getElementById("symbols-holder");
+    const symbols = document.getElementById("symbols");
+    const arr = symbols.value.trim().split("\n").filter(function (s) {
+        return s.trim() != '';
+    });
+
+    while (container.hasChildNodes())
+        container.removeChild(container.lastChild);
+
+    for (const line of arr) {
+        const [sym, ...rest] = line.split("=");
+        const input = document.createElement("input");
+        input.type = "hidden";
+        input.name = `symbols[${sym.trim()}]`;
+        input.value = rest.join("=").trim();
+        container.appendChild(input);
+    }
+    symbols.disabled = true;
+}
+
+// Re-enable inputs (in case of navigation via cache eg. w/
+// the previous button)
+window.onpageshow = function(node) {
+    if (node.tagName == undefined)
+        node = document.getElementById("noblank");
+    if (node.hasChildNodes() && node.tagName != "TEXTAREA" && node.tagName != "SELECT")
+        for(const child of node.children)
+            arguments.callee(child);
+    else
+        node.disabled = false;
+};
diff --git a/web/request.php b/web/request.php
new file mode 100644
index 0000000..da26491
--- /dev/null
+++ b/web/request.php
@@ -0,0 +1,67 @@
+<?php
+include("funcs.inc.php");
+
+bab_header("Buildroot tests - Request page");
+?>
+
+<script type='text/javascript' src="request.js"></script>
+
+<div class="form-class">
+    <form action="index.php" method="get" class="request-form" id="requester" onsubmit="disableEmpties() && prepareSymbols()">
+        <div id="noblank">
+            <label>Submitter:
+                <input type="text" name="submitter" placeholder="Submitter">
+            </label>
+
+            <label>Failure reason:
+                <input type="text" name="failure-reason"  placeholder="Reason">
+            </label>
+
+            <label>Arch:
+                <input type="text" name="arch" placeholder="Architecture">
+            </label>
+
+            <label>Subarch:
+                <input type="text" name="subarch" placeholder="Sub-Architecture">
+            </label>
+
+            <span style="white-space: nowrap">
+                <label class="checkbox">Static?
+                    <input type="checkbox" name="static" placeholder="Static">
+                </label>
+                <label class="checkbox">Status?
+                    <select class="checkbox" name="status">
+                        <option value="">Unspecified</option>
+                        <option value="OK">OK</option>
+                        <option value="NOK">NOK</option>
+                        <option value="TIMEOUT">TIMEOUT</option>
+                    </select>
+                </label>
+            </span>
+
+            <label>C library:
+                <input type="text" name="libc" placeholder="Library">
+            </label>
+
+            <label>From:
+                <input type="date" name="date[from]" id="date_f" placeholder="From">
+            </label>
+
+            <label>Symbols:
+                <textarea name="symbols" id="symbols" rows="20" cols="80"></textarea>
+            </label>
+
+            <label>To:
+                <input type="date" name="date[to]" id="date_t" placeholder="To">
+            </label>
+        </div>
+        <div id="symbols-holder">
+            <!-- Place here symbols with syntax: symbols[BR2_SYMBOL]=SYMBOL_VALUE -->
+        </div>
+        <input type="submit" value="Search!">
+    </form>
+</div>
+
+<?php
+bab_footer();
+?>
diff --git a/web/stylesheet.css b/web/stylesheet.css
index f2b5ac1..a3c6e50 100644
--- a/web/stylesheet.css
+++ b/web/stylesheet.css
@@ -37,3 +37,82 @@ table tr.nok td {
 table tr.timeout td {
     background-color: #ffe79e;
 }
+
+div .from-class {
+	margin: auto;
+}
+
+form {
+	margin: 0px auto 50px;
+	max-width: 1080px;
+	min-width: 350px;
+	padding: 20px 12px 10px 20px;
+}
+
+form label {
+	display: inline-block;
+	width: 150px;
+	margin: 0px 200px 20px 0px;
+}
+
+form label.checkbox {
+	all: initial;
+	display: inline-block;
+	width: 75px;
+	margin: 0px 100px 20px 0px;
+}
+
+form input,
+form select,
+form textarea {
+	float: left;
+	width: 25%;
+	min-width: 300px;
+	box-sizing: border-box;
+	border: 1px solid #c2c2c2;
+	box-shadow: 1px 1px 4px #ebebeb;
+	border-radius: 3px;
+	outline: none;
+	padding: 7px;
+	margin: 0px 50px 0px 0px;
+}
+
+form input[type=checkbox] {
+	min-width: 20px;
+	width:25px;
+	height:25px;
+	margin-top: 5px;
+}
+
+form select.checkbox {
+	min-width: 120px;
+}
+
+form textarea {
+	height: 100px;
+	vertical-align: top;
+}
+
+form input:focus,
+form textarea:focus,
+form select:focus {
+	border: 1px solid #0c0;
+}
+
+form input[type=submit],
+form input[type=button] {
+	border: none;
+	margin: 0 33%;
+	padding: 8px 15px 8px 15px;
+	margin-bottom: 0 auto;
+	background: #00aaff;
+	color: #fff;
+	box-shadow: 1px 1px 4px #dadada;
+	border-radius: 3px;
+}
+
+form input[type=submit]:hover,
+form input[type=button]:hover {
+	background: #0088ff;
+	color: #fff;
+}
-- 
2.21.0
