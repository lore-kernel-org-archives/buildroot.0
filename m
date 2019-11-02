From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Nov 2019 22:32:19 +0100
Subject: [Buildroot] [git commit] package/proftpd: bump to 1.3.6b
Message-ID: <20191102212528.053558E587@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f5ea32aede9007a7beb711d7b501984602f289d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump incorporates the changes found while preparing the 1.3.7
release and drops the CVE 2019-12815 patch which was incorporated in
https://github.com/proftpd/proftpd/commit/a73dbfe3b61459e7c2806d5162b12f0957990cb3.

Adjusted the site location to point at github.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/proftpd/0002-fix-CVE-2019-12815.patch | 382 --------------------------
 package/proftpd/proftpd.hash                  |   4 +-
 package/proftpd/proftpd.mk                    |   4 +-
 3 files changed, 3 insertions(+), 387 deletions(-)

diff --git a/package/proftpd/0002-fix-CVE-2019-12815.patch b/package/proftpd/0002-fix-CVE-2019-12815.patch
deleted file mode 100644
index 8b56d08866..0000000000
--- a/package/proftpd/0002-fix-CVE-2019-12815.patch
+++ /dev/null
@@ -1,382 +0,0 @@
-From 71cd49ea82313f78d52a52d0c628a3770dc96608 Mon Sep 17 00:00:00 2001
-From: TJ Saunders <tj@castaglia.org>
-Date: Wed, 17 Jul 2019 09:25:31 -0700
-Subject: [PATCH] Bug #4372: Ensure that mod_copy checks for <Limits> for its
- SITE CPFR/CPTO commands.
-
-https://tbspace.de/cve201912815proftpd.html
-
-Downloaded from upstream commit
-https://github.com/proftpd/proftpd/commit/d19dd64161936d70c0a1544bd2c8e90850f4b7ae
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- contrib/mod_copy.c                            |  36 ++-
- tests/t/lib/ProFTPD/Tests/Modules/mod_copy.pm | 253 +++++++++++++++++-
- 2 files changed, 285 insertions(+), 4 deletions(-)
-
-diff --git a/contrib/mod_copy.c b/contrib/mod_copy.c
-index 26b72a91d..c8672c40d 100644
---- a/contrib/mod_copy.c
-+++ b/contrib/mod_copy.c
-@@ -1,7 +1,7 @@
- /*
-  * ProFTPD: mod_copy -- a module supporting copying of files on the server
-  *                      without transferring the data to the client and back
-- * Copyright (c) 2009-2016 TJ Saunders
-+ * Copyright (c) 2009-2019 TJ Saunders
-  *
-  * This program is free software; you can redistribute it and/or modify
-  * it under the terms of the GNU General Public License as published by
-@@ -657,7 +657,7 @@ MODRET copy_copy(cmd_rec *cmd) {
- MODRET copy_cpfr(cmd_rec *cmd) {
-   register unsigned int i;
-   int res;
--  char *path = "";
-+  char *cmd_name, *path = "";
-   unsigned char *authenticated = NULL;
- 
-   if (copy_engine == FALSE) {
-@@ -705,6 +705,21 @@ MODRET copy_cpfr(cmd_rec *cmd) {
-     path = pstrcat(cmd->tmp_pool, path, *path ? " " : "", decoded_path, NULL);
-   }
- 
-+  cmd_name = cmd->argv[0];
-+  pr_cmd_set_name(cmd, "SITE_CPFR");
-+  if (!dir_check(cmd->tmp_pool, cmd, G_READ, path, NULL)) {
-+    int xerrno = EPERM;
-+
-+    pr_cmd_set_name(cmd, cmd_name);
-+    pr_response_add_err(R_550, "%s: %s", (char *) cmd->argv[3],
-+      strerror(xerrno));
-+
-+    pr_cmd_set_errno(cmd, xerrno);
-+    errno = xerrno;
-+    return PR_ERROR(cmd);
-+  }
-+  pr_cmd_set_name(cmd, cmd_name);
-+
-   res = pr_filter_allow_path(CURRENT_CONF, path);
-   switch (res) {
-     case 0:
-@@ -758,6 +773,7 @@ MODRET copy_cpfr(cmd_rec *cmd) {
- MODRET copy_cpto(cmd_rec *cmd) {
-   register unsigned int i;
-   const char *from, *to = "";
-+  char *cmd_name;
-   unsigned char *authenticated = NULL;
- 
-   if (copy_engine == FALSE) {
-@@ -816,6 +832,20 @@ MODRET copy_cpto(cmd_rec *cmd) {
- 
-   to = dir_canonical_vpath(cmd->tmp_pool, to);
- 
-+  cmd_name = cmd->argv[0];
-+  pr_cmd_set_name(cmd, "SITE_CPTO");
-+  if (!dir_check(cmd->tmp_pool, cmd, G_WRITE, to, NULL)) {
-+    int xerrno = EPERM;
-+
-+    pr_cmd_set_name(cmd, cmd_name);
-+    pr_response_add_err(R_550, "%s: %s", to, strerror(xerrno));
-+
-+    pr_cmd_set_errno(cmd, xerrno);
-+    errno = xerrno;
-+    return PR_ERROR(cmd);
-+  }
-+  pr_cmd_set_name(cmd, cmd_name);
-+
-   if (copy_paths(cmd->tmp_pool, from, to) < 0) {
-     int xerrno = errno;
-     const char *err_code = R_550;
-@@ -940,7 +970,7 @@ static conftable copy_conftab[] = {
- 
- static cmdtable copy_cmdtab[] = {
-   { CMD, 	C_SITE, G_WRITE,	copy_copy,	FALSE,	FALSE, CL_MISC },
--  { CMD, 	C_SITE, G_DIRS,		copy_cpfr,	FALSE,	FALSE, CL_MISC },
-+  { CMD, 	C_SITE, G_READ,		copy_cpfr,	FALSE,	FALSE, CL_MISC },
-   { CMD, 	C_SITE, G_WRITE,	copy_cpto,	FALSE,	FALSE, CL_MISC },
-   { POST_CMD,	C_PASS,	G_NONE,		copy_post_pass, FALSE,	FALSE },
-   { LOG_CMD, 	C_SITE, G_NONE,		copy_log_site,	FALSE,	FALSE },
-diff --git a/tests/t/lib/ProFTPD/Tests/Modules/mod_copy.pm b/tests/t/lib/ProFTPD/Tests/Modules/mod_copy.pm
-index 778bff839..2018e71bc 100644
---- a/tests/t/lib/ProFTPD/Tests/Modules/mod_copy.pm
-+++ b/tests/t/lib/ProFTPD/Tests/Modules/mod_copy.pm
-@@ -121,6 +121,15 @@ my $TESTS = {
-     test_class => [qw(bug forking)],
-   },
- 
-+  copy_cpfr_config_limit_read_bug4372 => {
-+    order => ++$order,
-+    test_class => [qw(bug forking)],
-+  },
-+
-+  copy_cpto_config_limit_write_bug4372 => {
-+    order => ++$order,
-+    test_class => [qw(bug forking)],
-+  },
- };
- 
- sub new {
-@@ -3248,6 +3257,12 @@ sub copy_config_limit_bug3399 {
- 
-   my ($port, $config_user, $config_group) = config_write($config_file, $config);
- 
-+  my $config_subdir = $sub_dir;
-+  if ($^O eq 'darwin') {
-+    # MacOSX hack
-+    $config_subdir = '/private' . $sub_dir;
-+  }
-+
-   if (open(my $fh, ">> $config_file")) {
-     print $fh <<EOC;
- <Directory />
-@@ -3256,7 +3271,7 @@ sub copy_config_limit_bug3399 {
-   </Limit>
- </Directory>
- 
--<Directory $sub_dir>
-+<Directory $config_subdir>
-   <Limit WRITE>
-     AllowAll
-   </Limit>
-@@ -3652,4 +3667,240 @@ sub copy_cpto_timeout_bug4263 {
-   test_cleanup($setup->{log_file}, $ex);
- }
- 
-+sub copy_cpfr_config_limit_read_bug4372 {
-+  my $self = shift;
-+  my $tmpdir = $self->{tmpdir};
-+  my $setup = test_setup($tmpdir, 'copy');
-+
-+  my $src_file = File::Spec->rel2abs("$tmpdir/foo.dat");
-+  if (open(my $fh, "> $src_file")) {
-+    unless (close($fh)) {
-+      die("Can't write $src_file: $!");
-+    }
-+
-+  } else {
-+    die("Can't open $src_file: $!");
-+  }
-+
-+  my $config = {
-+    PidFile => $setup->{pid_file},
-+    ScoreboardFile => $setup->{scoreboard_file},
-+    SystemLog => $setup->{log_file},
-+    TraceLog => $setup->{log_file},
-+    Trace => 'copy:20 timer:20',
-+
-+    AuthUserFile => $setup->{auth_user_file},
-+    AuthGroupFile => $setup->{auth_group_file},
-+    TimeoutIdle => 3,
-+
-+    IfModules => {
-+      'mod_delay.c' => {
-+        DelayEngine => 'off',
-+      },
-+    },
-+  };
-+
-+  my ($port, $config_user, $config_group) = config_write($setup->{config_file},
-+    $config);
-+
-+  if (open(my $fh, ">> $setup->{config_file}")) {
-+    print $fh <<EOC;
-+<Directory />
-+  <Limit READ>
-+    DenyAll
-+  </Limit>
-+</Directory>
-+EOC
-+    unless (close($fh)) {
-+      die("Can't write $setup->{config_file}: $!");
-+    }
-+
-+  } else {
-+    die("Can't open $setup->{config_file}: $!");
-+  }
-+
-+  # Open pipes, for use between the parent and child processes.  Specifically,
-+  # the child will indicate when it's done with its test by writing a message
-+  # to the parent.
-+  my ($rfh, $wfh);
-+  unless (pipe($rfh, $wfh)) {
-+    die("Can't open pipe: $!");
-+  }
-+
-+  my $ex;
-+
-+  # Fork child
-+  $self->handle_sigchld();
-+  defined(my $pid = fork()) or die("Can't fork: $!");
-+  if ($pid) {
-+    eval {
-+      my $client = ProFTPD::TestSuite::FTP->new('127.0.0.1', $port, 0, 1);
-+      $client->login($setup->{user}, $setup->{passwd});
-+
-+      eval { $client->site('CPFR', 'foo.dat') };
-+      unless ($@) {
-+        die("SITE CPFR succeeded unexpectedly");
-+      }
-+
-+      my $resp_code = $client->response_code();
-+      my $resp_msg = $client->response_msg();
-+
-+      my $expected = 550;
-+      $self->assert($expected == $resp_code,
-+        test_msg("Expected response code $expected, got $resp_code"));
-+
-+      $expected = 'Operation not permitted';
-+      $self->assert(qr/$expected/, $resp_msg,
-+        test_msg("Expected response message '$expected', got '$resp_msg'"));
-+
-+      $client->quit();
-+    };
-+    if ($@) {
-+      $ex = $@;
-+    }
-+
-+    $wfh->print("done\n");
-+    $wfh->flush();
-+
-+  } else {
-+    eval { server_wait($setup->{config_file}, $rfh, 30) };
-+    if ($@) {
-+      warn($@);
-+      exit 1;
-+    }
-+
-+    exit 0;
-+  }
-+
-+  # Stop server
-+  server_stop($setup->{pid_file});
-+  $self->assert_child_ok($pid);
-+
-+  test_cleanup($setup->{log_file}, $ex);
-+}
-+
-+sub copy_cpto_config_limit_write_bug4372 {
-+  my $self = shift;
-+  my $tmpdir = $self->{tmpdir};
-+  my $setup = test_setup($tmpdir, 'copy');
-+
-+  my $src_file = File::Spec->rel2abs("$tmpdir/foo.dat");
-+  if (open(my $fh, "> $src_file")) {
-+    unless (close($fh)) {
-+      die("Can't write $src_file: $!");
-+    }
-+
-+  } else {
-+    die("Can't open $src_file: $!");
-+  }
-+
-+  my $dst_file = File::Spec->rel2abs("$tmpdir/bar.dat");
-+
-+  my $config = {
-+    PidFile => $setup->{pid_file},
-+    ScoreboardFile => $setup->{scoreboard_file},
-+    SystemLog => $setup->{log_file},
-+    TraceLog => $setup->{log_file},
-+    Trace => 'copy:20 timer:20',
-+
-+    AuthUserFile => $setup->{auth_user_file},
-+    AuthGroupFile => $setup->{auth_group_file},
-+    TimeoutIdle => 3,
-+
-+    IfModules => {
-+      'mod_delay.c' => {
-+        DelayEngine => 'off',
-+      },
-+    },
-+  };
-+
-+  my ($port, $config_user, $config_group) = config_write($setup->{config_file},
-+    $config);
-+
-+  if (open(my $fh, ">> $setup->{config_file}")) {
-+    print $fh <<EOC;
-+<Directory />
-+  <Limit WRITE>
-+    DenyAll
-+  </Limit>
-+</Directory>
-+EOC
-+    unless (close($fh)) {
-+      die("Can't write $setup->{config_file}: $!");
-+    }
-+
-+  } else {
-+    die("Can't open $setup->{config_file}: $!");
-+  }
-+
-+  # Open pipes, for use between the parent and child processes.  Specifically,
-+  # the child will indicate when it's done with its test by writing a message
-+  # to the parent.
-+  my ($rfh, $wfh);
-+  unless (pipe($rfh, $wfh)) {
-+    die("Can't open pipe: $!");
-+  }
-+
-+  my $ex;
-+
-+  # Fork child
-+  $self->handle_sigchld();
-+  defined(my $pid = fork()) or die("Can't fork: $!");
-+  if ($pid) {
-+    eval {
-+      my $client = ProFTPD::TestSuite::FTP->new('127.0.0.1', $port, 0, 1);
-+      $client->login($setup->{user}, $setup->{passwd});
-+
-+      my ($resp_code, $resp_msg) = $client->site('CPFR', 'foo.dat');
-+
-+      my $expected = 350;
-+      $self->assert($expected == $resp_code,
-+        test_msg("Expected response code $expected, got $resp_code"));
-+
-+      $expected = 'File or directory exists, ready for destination name';
-+      $self->assert($expected eq $resp_msg,
-+        test_msg("Expected response message '$expected', got '$resp_msg'"));
-+
-+      eval { $client->site('CPTO', 'bar.dat') };
-+      unless ($@) {
-+        die('SITE CPTO succeeded unexpectedly');
-+      }
-+
-+      my $resp_code = $client->response_code();
-+      my $resp_msg = $client->response_msg();
-+
-+      my $expected = 550;
-+      $self->assert($expected == $resp_code,
-+        test_msg("Expected response code $expected, got $resp_code"));
-+
-+      $expected = 'Operation not permitted';
-+      $self->assert(qr/$expected/, $resp_msg,
-+        test_msg("Expected response message '$expected', got '$resp_msg'"));
-+
-+      $client->quit();
-+    };
-+    if ($@) {
-+      $ex = $@;
-+    }
-+
-+    $wfh->print("done\n");
-+    $wfh->flush();
-+
-+  } else {
-+    eval { server_wait($setup->{config_file}, $rfh, 30) };
-+    if ($@) {
-+      warn($@);
-+      exit 1;
-+    }
-+
-+    exit 0;
-+  }
-+
-+  # Stop server
-+  server_stop($setup->{pid_file});
-+  $self->assert_child_ok($pid);
-+
-+  test_cleanup($setup->{log_file}, $ex);
-+}
-+
- 1;
diff --git a/package/proftpd/proftpd.hash b/package/proftpd/proftpd.hash
index 47bc8fe815..0f2acd3a20 100644
--- a/package/proftpd/proftpd.hash
+++ b/package/proftpd/proftpd.hash
@@ -1,5 +1,3 @@
-# From ftp://ftp.proftpd.org/distrib/source/proftpd-1.3.6.tar.gz.md5
-md5 13270911c42aac842435f18205546a1b proftpd-1.3.6.tar.gz
 # Locally calculated
-sha256 91ef74b143495d5ff97c4d4770c6804072a8c8eb1ad1ecc8cc541b40e152ecaf proftpd-1.3.6.tar.gz
+sha256 fe5baf6c469a2b0b7f0e2611561b6fd5414300e32a76b96adb2ccfe05b5efb60 proftpd-1.3.6b.tar.gz
 sha256 391a473d755c29b5326fb726326ff3c37e42512f53a8f5789fc310232150bf80 COPYING
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 67d8eb8c6f..da1c07b410 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PROFTPD_VERSION = 1.3.6
-PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source
+PROFTPD_VERSION = 1.3.6b
+PROFTPD_SITE = $(call github,proftpd,proftpd,v$(PROFTPD_VERSION))
 PROFTPD_LICENSE = GPL-2.0+
 PROFTPD_LICENSE_FILES = COPYING
 
