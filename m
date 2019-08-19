From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon, 19 Aug 2019 11:00:36 +0200
Subject: [Buildroot] [PATCH buildroot-test v2 1/3] web/request: new page to
 help making request to the autobuild database
In-Reply-To: <20190819090038.28808-1-victor.huesca@bootlin.com>
References: <20190819090038.28808-1-victor.huesca@bootlin.com>
Message-ID: <20190819090038.28808-2-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current way to make request is to manually pass GET parameters to the
URL, which is nice for automation and simple request but it gets messy
with more complicated requests -- especially with the introduction of
configuration symbols.

This patch provides a handy interface to ask more sophisticated configs
to the autobuild database.

The implementation uses normal HTML forms but implements a hook to the
submit method in order to handle config symbols from the textarea and
keep the URL clean.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 web/request.js  | 69 ++++++++++++++++++++++++++++++++++++++
 web/request.php | 88 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 157 insertions(+)
 create mode 100644 web/request.js
 create mode 100644 web/request.php

diff --git a/web/request.js b/web/request.js
new file mode 100644
index 0000000..cf52478
--- /dev/null
+++ b/web/request.js
@@ -0,0 +1,69 @@
+function submitForm() {
+    // Do not send the form
+    event.preventDefault();
+
+    // Read the form
+    const html_form = event.target;
+    const form = new FormData(html_form);
+
+    // Drop empty fields
+    for (const k of getEmptyValues(form)) {
+        form.delete(k);
+    }
+
+    // Prepare the symbols entry
+    if (form.has('symbols')) {
+        const raw_symbols = form.get('symbols');
+        const extracted_symbols = textBoxToDict(raw_symbols);
+        for (const [k, v] of extracted_symbols) {
+            form.append(`symbols[${k}]`, v);
+        }
+        form.delete('symbols');
+    }
+
+    // Charge the requested page
+    if (html_form.method == 'get') {
+        const data = new URLSearchParams(form);
+        const url = html_form.action + '?' + data.toString();
+        window.history.pushState(null, 'Searching...', url);
+        document.location = url;
+    } else {
+        // This approach only works for 'GET' forms.
+        // To handle 'POST' forms, a hidden html form must be
+        // created and filled with the write elements.
+    }
+}
+
+
+/**
+ * Return keys with an empty associated value.
+ * @param {FormData} form Form to extract empty values from.
+ */
+function getEmptyValues(form) {
+    const empty = [];
+    for (const [k, v] of form)
+        if (v == '')
+            empty.push(k);
+    return empty;
+}
+
+
+/**
+ * Parse a multi-line string and generates all couple `key: value` from it.
+ * @param {String} symbols_text String to parse.
+ * @param {String} line_sep Line separator, each lines have at most one couple `key: value`.
+ * @param {String} data_sep Key/value separator.
+ */
+function* textBoxToDict(symbols_text, line_sep='\n', data_sep='=') {
+    const arr = symbols_text.split(line_sep);
+
+    for (const line of arr) {
+        const [sym, ...rest] = line.split(data_sep);
+        const key = sym.trim();
+        if (key == '')
+            continue
+        const value = rest.join(data_sep).trim();
+        yield [key, value];
+    }
+}
+
diff --git a/web/request.php b/web/request.php
new file mode 100644
index 0000000..5331ffa
--- /dev/null
+++ b/web/request.php
@@ -0,0 +1,88 @@
+<?php
+include("funcs.inc.php");
+
+bab_header("Buildroot tests - Request page");
+?>
+
+<script type='text/javascript' src="request.js"></script>
+
+
+<form action="index.php" method="get" onsubmit="submitForm()">
+    <label>
+        <span>Submitter:</span>
+        <input type="text" name="submitter" placeholder="Submitter">
+    </label>
+
+    <label>
+        <span>Failure reason:</span>
+        <input type="text" name="reason"  placeholder="Reason">
+    </label>
+
+    <label>
+        <span>Arch:</span>
+        <input type="text" name="arch" placeholder="Architecture">
+    </label>
+
+    <span>
+        <label>
+            <span>Subarch:</span>
+            <input type="text" name="subarch" placeholder="Sub-Architecture">
+        </label>
+
+        <label>
+            <span>From:</span>
+            <input type="date" name="date[from]" id="date_f" placeholder="From">
+        </label>
+
+        <fieldset>
+            <legend>Static?</legend>
+            <label>
+                <input type="radio" name="static" value="1">
+                <span>Y</span>
+            </label>
+            <label>
+                <input type="radio" name="static" value="0">
+                <span>N</span>
+            </label>
+        </fieldset>
+    </span>
+
+    <label>
+        <span>Symbols:</span>
+        <textarea name="symbols" id="symbols"></textarea>
+    </label>
+
+    <span>
+        <label>
+            <span>C library:</span>
+            <input type="text" name="libc" placeholder="Library">
+        </label>
+
+        <label>
+            <span>To:</span>
+            <input type="date" name="date[to]" id="date_t" placeholder="To">
+        </label>
+
+        <fieldset>
+            <legend>Status?</legend>
+            <label>
+                <input type="radio" name="status" value="OK">
+                <span>OK</span>
+            </label>
+            <label>
+                <input type="radio" name="status" value="NOK">
+                <span>NOK</span>
+            </label>
+            <label>
+                <input type="radio" name="status" value="TIMEOUT">
+                <span>TIMEOUT</span>
+            </label>
+        </fieldset>
+    </span>
+
+    <input type="submit" value="Search!">
+</form>
+
+<?php
+bab_footer();
+?>
-- 
2.21.0
