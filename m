From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon,  8 Jul 2019 10:17:06 +0200
Subject: [Buildroot] [PATCH buildroot-test v2 3/4] web/schema.sql: add
 indexes on the database schema
In-Reply-To: <20190708081707.28348-1-victor.huesca@bootlin.com>
References: <20190621123712.8060-1-victor.huesca@bootlin.com>
 <20190708081707.28348-1-victor.huesca@bootlin.com>
Message-ID: <20190708081707.28348-4-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add indexes on the two columns of `symbol_per_result` to improve significantly
queries involving symbols (this is an over 80M rows table).
This table is heavily used to retrieve results matching a symbols and it is not
an option filter symbols without these indexes.

Also mark these same columns as foreign keys to ensure integrity of the
database.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 web/schema.sql | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/web/schema.sql b/web/schema.sql
index 65fd883..8b854a2 100644
--- a/web/schema.sql
+++ b/web/schema.sql
@@ -27,5 +27,10 @@ CREATE TABLE `symbol_per_result` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `result_id` int(11) NOT NULL DEFAULT '0',
   `symbol_id` int(11) NOT NULL DEFAULT '0',
-  PRIMARY KEY (`id`)
+  PRIMARY KEY (`id`),
+  CONSTRAINT `fk_result_id` FOREIGN KEY (`result_id`) REFERENCES `results`(`id`),
+  CONSTRAINT `fk_symbol_id` FOREIGN KEY (`symbol_id`) REFERENCES `config_symbol`(`id`),
+  INDEX `ix_symbol_id`(`symbol_id`),
+  INDEX `ix_result_id`(`result_id`)
+
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- 
2.21.0
