From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 30 May 2020 19:14:28 +0200
Subject: [Buildroot] [PATCH for-next] package/optee-benchmark: fix gcc 10
 warning
Message-ID: <20200530171428.562778-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The function yaml_mapping_start_event_initialize()
take yaml_mapping_style_t style as last argument:

int yaml_mapping_start_event_initialize(
    yaml_event_t *event,
    const yaml_char_t *anchor,
    const yaml_char_t *tag,
    int implicit,
    yaml_mapping_style_t style)

Use YAML_ANY_MAPPING_STYLE instead of YAML_ANY_SEQUENCE_STYLE

Fixes:
main.c:173:5: error: implicit conversion from ?enum yaml_sequence_style_e? to ?yaml_mapping_style_t? {aka ?enum yaml_mapping_style_e?} [-Werror=enum-conversion]
  173 |     YAML_ANY_SEQUENCE_STYLE))
      |     ^~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Etienne Carriere <etienne.carriere@linaro.org>
---
 .../optee-benchmark/0001-main-fix-typo.patch  | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/optee-benchmark/0001-main-fix-typo.patch

diff --git a/package/optee-benchmark/0001-main-fix-typo.patch b/package/optee-benchmark/0001-main-fix-typo.patch
new file mode 100644
index 0000000000..8ad5a26f13
--- /dev/null
+++ b/package/optee-benchmark/0001-main-fix-typo.patch
@@ -0,0 +1,55 @@
+From ffa935dc881c394a824e063c8fde7dd102e06d8c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 8 May 2020 23:39:59 +0200
+Subject: [PATCH] main: fix typo
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The function yaml_mapping_start_event_initialize()
+take yaml_mapping_style_t style as last argument:
+
+int yaml_mapping_start_event_initialize(
+	yaml_event_t *event,
+	const yaml_char_t *anchor,
+	const yaml_char_t *tag,
+	int implicit,
+	yaml_mapping_style_t style)
+
+Use YAML_ANY_MAPPING_STYLE instead of YAML_ANY_SEQUENCE_STYLE
+
+Fixes:
+main.c:173:5: error: implicit conversion from ?enum yaml_sequence_style_e? to ?yaml_mapping_style_t? {aka ?enum yaml_mapping_style_e?} [-Werror=enum-conversion]
+  173 |     YAML_ANY_SEQUENCE_STYLE))
+      |     ^~~~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ main.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/main.c b/main.c
+index 29a7c42..1685d3e 100644
+--- a/main.c
++++ b/main.c
+@@ -170,7 +170,7 @@ static bool init_emitter(FILE *ts_file)
+ 	/* Mapping start */
+ 	if (!yaml_mapping_start_event_initialize(&event,
+ 				NULL, NULL , YAML_IMPLICIT,
+-				YAML_ANY_SEQUENCE_STYLE))
++				YAML_ANY_MAPPING_STYLE))
+ 		ERROR_GOTO(emitter_delete,
+ 			"Failed to initialize YAML mapping start event");
+ 	if (!yaml_emitter_emit(&emitter, &event))
+@@ -263,7 +263,7 @@ static bool fill_timestamp(uint32_t core, uint64_t count, uint64_t addr,
+ 	/* Mapping start */
+ 	if (!yaml_mapping_start_event_initialize(&event,
+ 				NULL, NULL , YAML_IMPLICIT,
+-				YAML_ANY_SEQUENCE_STYLE))
++				YAML_ANY_MAPPING_STYLE))
+ 		ERROR_RETURN_FALSE(
+ 			"Failed to initialize YAML mapping start event");
+ 	if (!yaml_emitter_emit(&emitter, &event))
+-- 
+2.25.4
+
-- 
2.25.4
