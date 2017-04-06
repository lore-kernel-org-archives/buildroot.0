From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 6 Apr 2017 20:18:53 +0200
Subject: [Buildroot] [PATCH v5 13/13] [RFC] list-defconfigs: support
	defconfigs in subdirectories
In-Reply-To: <cover.1491502445.git.arnout@mind.be>
References: <cover.1491502445.git.arnout@mind.be>
Message-ID: <20170406181854.5242-13-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now defconfigs in subdirectories are supported, list-defconfigs should
also report them.

The obvious way to do this would be to use

	find $(1)/configs -name \*_defconfig

However, it is difficult to keep its output sorted properly: we don't
want defconfigs in subdirectories to appear intermingled with the rest.

The output tends to become a little bit messy, because defconfigs in
subdirectories will typically need more than 35 characters. If we can
find a solution for that, it can be done in a later patch.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
With the ugly output, and the uglification of the code, I'm not entirely
sure that we really want this patch.
---
 Makefile | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index b68e464da6..186e8b6d88 100644
--- a/Makefile
+++ b/Makefile
@@ -1013,18 +1013,20 @@ help:
 # $(2): br2-external name, empty for bundled
 define list-defconfigs
 	@first=true; \
-	for defconfig in $(1)/configs/*_defconfig; do \
-		[ -f "$${defconfig}" ] || continue; \
-		if $${first}; then \
-			if [ "$(2)" ]; then \
-				printf 'External configs in "$(call qstrip,$(2))":\n'; \
-			else \
-				printf "Built-in configs:\n"; \
+	for dir in `find $(1)/configs/ -type d`; do \
+		for defconfig in $${dir}/*_defconfig; do \
+			[ -f "$${defconfig}" ] || continue; \
+			if $${first}; then \
+				if [ "$(2)" ]; then \
+					printf 'External configs in "$(call qstrip,$(2))":\n'; \
+				else \
+					printf "Built-in configs:\n"; \
+				fi; \
+				first=false; \
 			fi; \
-			first=false; \
-		fi; \
-		defconfig="$${defconfig##*/}"; \
-		printf "  %-35s - Build for %s\n" "$${defconfig}" "$${defconfig%_defconfig}"; \
+			defconfig="$${defconfig##$(1)/configs/}"; \
+			printf "  %-35s - Build for %s\n" "$${defconfig}" "$${defconfig%_defconfig}"; \
+		done; \
 	done; \
 	$${first} || printf "\n"
 endef
-- 
2.11.0
