From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Apr 2019 13:51:25 +0200
Subject: [Buildroot] [PATCH 10/10] infra: introduce top-level,
 global show-info
In-Reply-To: <cover.1554637858.git.yann.morin.1998@free.fr>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
Message-ID: <9e4d027c3a353fadde428fbba702dcc9dac15d75.1554637858.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that packages and filesystems can report their recursive info, use
that to dump the whole info as a valid JSOn array.

As it is rather complex to ensure soemthing is run before every rules
(to display the eldin opening '[' so as to have a valid JSON array),
re-enter the Makefile and mangle the output with a sed expression, that:

  - 0,/^/s//[\n/;   inserts a '[' before the first line,
  - $!s/$/,/;       appends a ',' at the end of every lines but the last,
  - $s/$/\n]/       appends a ']' after the last line.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index 60bf7d7d08..13c4390ae4 100644
--- a/Makefile
+++ b/Makefile
@@ -876,6 +876,12 @@ graph-depends-requirements:
 	@dot -? >/dev/null 2>&1 || \
 		{ echo "ERROR: The 'dot' program from Graphviz is needed for graph-depends" >&2; exit 1; }
 
+.PHONY: show-info _show-info-private
+show-info:
+	@$(MAKE) -C $(CONFIG_DIR) _show-info-private |sed -r -e '0,/^/s//[\n/; $$!s/$$/,/; $$s/$$/\n]/'
+_show-info-private: $(patsubst %,%-show-recursive-info,$(PACKAGES) $(TARGETS_ROOTFS))
+	@:
+
 .PHONY: show-dependency-tree
 show-dependency-tree: $(patsubst %,%-show-dependency-tree,$(PACKAGES) $(TARGETS_ROOTFS))
 	@:
-- 
2.14.1
