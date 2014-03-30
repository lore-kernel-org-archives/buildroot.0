From: =?UTF-8?q?Marcelo=20Guti=C3=A9rrez?= <kuyurix@gmail.com>
Date: Sun, 30 Mar 2014 18:48:51 -0300
Subject: [Buildroot] [PATCH 1/1] mysql: fix build failure on MIPS
Message-ID: <1396216131-3222-1-git-send-email-kuyurix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/6b61f90d1a36ba43ff568933bb74975128380516/

Signed-off-by: Marcelo Guti?rrez <kuyurix@gmail.com>
---
 .../mysql-0006-fix_build_failure_on_MIPS.patch     |  115 ++++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 package/mysql/mysql-0006-fix_build_failure_on_MIPS.patch

diff --git a/package/mysql/mysql-0006-fix_build_failure_on_MIPS.patch b/package/mysql/mysql-0006-fix_build_failure_on_MIPS.patch
new file mode 100644
index 0000000..b4d58ce
--- /dev/null
+++ b/package/mysql/mysql-0006-fix_build_failure_on_MIPS.patch
@@ -0,0 +1,115 @@
+Fix compiler error about empty if body and uninitialized variables.
+
+Signed-off-by: Marcelo Gutierrez <kuyurix@gmail.com>
+--- mysql-5.1.73.old/mysys/my_read.c	2013-11-04 15:52:27.000000000 -0300
++++ mysql-5.1.73.new/mysys/my_read.c	2014-03-30 16:41:49.343613055 -0300
+@@ -35,7 +35,8 @@
+ 
+ size_t my_read(File Filedes, uchar *Buffer, size_t Count, myf MyFlags)
+ {
+-  size_t readbytes, save_count;
++  size_t readbytes=0;
++  size_t save_count=0;
+   DBUG_ENTER("my_read");
+   DBUG_PRINT("my",("Fd: %d  Buffer: 0x%lx  Count: %lu  MyFlags: %d",
+                    Filedes, (long) Buffer, (ulong) Count, MyFlags));
+--- mysql-5.1.73.old/sql/set_var.cc	2013-11-04 15:52:27.000000000 -0300
++++ mysql-5.1.73.new/sql/set_var.cc	2014-03-30 17:35:30.983501123 -0300
+@@ -127,7 +127,9 @@
+ static void fix_net_retry_count(THD *thd, enum_var_type type);
+ static void fix_max_join_size(THD *thd, enum_var_type type);
+ static void fix_query_cache_size(THD *thd, enum_var_type type);
++#ifdef HAVE_QUERY_CACHE
+ static void fix_query_cache_min_res_unit(THD *thd, enum_var_type type);
++#endif
+ static void fix_myisam_max_sort_file_size(THD *thd, enum_var_type type);
+ static void fix_max_binlog_size(THD *thd, enum_var_type type);
+ static void fix_max_relay_log_size(THD *thd, enum_var_type type);
+@@ -2484,7 +2486,7 @@
+   char path[FN_REFLEN], buff[FN_REFLEN];
+   MY_STAT f_stat;
+   String str(buff, sizeof(buff), system_charset_info), *res;
+-  const char *log_file_str;
++  const char *log_file_str=NULL;
+   size_t path_length;
+ 
+   if (!(res= var->value->val_str(&str)))
+--- mysql-5.1.73.old/sql/sql_delete.cc	2013-11-04 15:52:27.000000000 -0300
++++ mysql-5.1.73.new/sql/sql_delete.cc	2014-03-30 16:58:00.115579378 -0300
+@@ -836,9 +836,9 @@
+     DBUG_VOID_RETURN;
+ 
+   /* Something already deleted so we have to invalidate cache */
+-  if (deleted)
++  if (deleted){
+     query_cache_invalidate3(thd, delete_tables, 1);
+-
++  }
+   /*
+     If rows from the first table only has been deleted and it is
+     transactional, just do rollback.
+--- mysql-5.1.73.old/sql/sql_insert.cc	2013-11-04 15:52:27.000000000 -0300
++++ mysql-5.1.73.new/sql/sql_insert.cc	2014-03-30 16:57:07.723586220 -0300
+@@ -3363,8 +3363,9 @@
+         }
+         if (!thd->current_stmt_binlog_row_based && !can_rollback_data())
+           thd->transaction.all.modified_non_trans_table= TRUE;
+-	if (changed)
+-	  query_cache_invalidate3(thd, table, 1);
++        if (changed){
++          query_cache_invalidate3(thd, table, 1);
++        }
+     }
+     DBUG_ASSERT(transactional_table || !changed ||
+ 		thd->transaction.stmt.modified_non_trans_table);
+--- mysql-5.1.73.old/sql/sql_rename.cc	2013-11-04 15:52:27.000000000 -0300
++++ mysql-5.1.73.new/sql/sql_rename.cc	2014-03-30 17:37:11.895508466 -0300
+@@ -184,8 +184,9 @@
+       my_ok(thd);
+   }
+ 
+-  if (!error)
++  if (!error){
+     query_cache_invalidate3(thd, table_list, 0);
++  }
+ 
+   pthread_mutex_lock(&LOCK_open);
+   unlock_table_names(thd, table_list, (TABLE_LIST*) 0);
+--- mysql-5.1.73.old/sql/sql_update.cc	2013-11-04 15:52:27.000000000 -0300
++++ mysql-5.1.73.new/sql/sql_update.cc	2014-03-30 16:59:52.647579411 -0300
+@@ -1886,8 +1886,9 @@
+     return;
+ 
+   /* Something already updated so we have to invalidate cache */
+-  if (updated)
++  if (updated){
+     query_cache_invalidate3(thd, update_tables, 1);
++  }
+   /*
+     If all tables that has been updated are trans safe then just do rollback.
+     If not attempt to do remaining updates.
+--- mysql-5.1.73.old/sql/sql_view.cc	2013-11-04 15:52:27.000000000 -0300
++++ mysql-5.1.73.new/sql/sql_view.cc	2014-03-30 17:39:05.355507167 -0300
+@@ -697,8 +697,9 @@
+   }
+ 
+   VOID(pthread_mutex_unlock(&LOCK_open));
+-  if (mode != VIEW_CREATE_NEW)
++  if (mode != VIEW_CREATE_NEW){
+     query_cache_invalidate3(thd, view, 0);
++  }
+   start_waiting_global_read_lock(thd);
+   if (res)
+     goto err;
+diff -uNr mysql-5.1.73.old/storage/myisam/mi_search.c mysql-5.1.73.new/storage/myisam/mi_search.c
+--- mysql-5.1.73.old/storage/myisam/mi_search.c	2013-11-04 15:52:27.000000000 -0300
++++ mysql-5.1.73.new/storage/myisam/mi_search.c	2014-03-30 16:43:18.611614365 -0300
+@@ -185,7 +185,7 @@
+                    uchar *buff __attribute__((unused)), my_bool *last_key)
+ {
+   reg4 int start,mid,end,save_end;
+-  int flag;
++  int flag=0;
+   uint totlength,nod_flag,not_used[2];
+   DBUG_ENTER("_mi_bin_search");
+ 
-- 
1.7.10.4
