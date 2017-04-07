From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 7 Apr 2017 21:44:48 +0200
Subject: [Buildroot] [PATCH] core: add rule to dump packages' build order
In-Reply-To: <20170407192458.GA3420@scaer>
References: <20170402130338.12542-1-yann.morin.1998@free.fr>
 <39bc6b12-1dfd-8ada-f1bc-8597c6872a1c@mind.be>
 <20170404185928.GA3828@scaer>
 <fd9c07fd-2e86-ed73-2fd1-bfcf27522664@mind.be>
 <20170407192458.GA3420@scaer>
Message-ID: <20170407194448.GB3420@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-04-07 21:24 +0200, Yann E. MORIN spake thusly:
> >  So, I can think of no viable alternative, so there is no way to stop this patch :-)
> What about the following (just proof-of-concept):

Hmmm, it seems there was a bad copy-paste failure.

Here it is again:

diff --git a/Makefile b/Makefile
index 919d589..a1540fc 100644
--- a/Makefile
+++ b/Makefile
@@ -759,6 +759,14 @@ show-targets:

 show-build-order: $(patsubst %,%-show-build-order,$(PACKAGES))

+define show-build-order-deps
+	$(foreach p,$($(call UPPERCASE,$(1))_FINAL_ALL_DEPENDENCIES),\
+		$(call show-build-order-deps-deps,$(p))) $(1)
+endef
+
+show-build-order-2:
+	@./toto $(foreach p,$(PACKAGES),$(call show-build-order-deps-deps,$(p)))
+
 graph-build: $(O)/build/build-time.log
 	@install -d $(GRAPHS_DIR)
 	$(foreach o,name build duration,./support/scripts/graph-build-time \
diff --git a/toto b/toto
new file mode 100755
index 0000000..6962083
--- /dev/null
+++ b/toto
@@ -0,0 +1,30 @@
+#!/bin/bash
+
+# input on stdin: list of packages, each rpreceded by its
+# direct dependencies; so, packages may be listed more than
+# once, but at least the build order is gurranteed for the
+# first occurence of each package.
+
+# We first output each item of the list on its own line.
+# Then we number those lines.
+# We sort by package name as first key, and on line number
+# as second key.
+# For each package, we keep only the first occurence, which
+# is the one with the lowest line number.
+# We re-sort on the line number.
+# And eventually, we remove the line number and only keep
+# the package name.
+
+# The output is thus the build order.
+
+printf "%s\n" "${@}"
+|cat -n \
+|sort -k 2,2 -k 1,1n \
+|while read n p; do
+    if [ "${p}" != "${prev}" ]; then
+        printf "%d %s\n" "${n}" "${p}"
+        prev="${p}"
+    fi
+done \
+|sort -n \
+|sed -r -e 's/^[[:digit:]]+ //'


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
