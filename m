Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD411C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 21:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E87F860A5B;
	Fri, 24 Jan 2025 21:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 65xeExt7WgE1; Fri, 24 Jan 2025 21:13:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C80C608FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C80C608FE;
	Fri, 24 Jan 2025 21:13:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 20CE5941
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00E0C60903
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:13:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-VrNPICV8js for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 21:13:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D184608A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D184608A9
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D184608A9
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:13:29 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3ce7a77e5a1so7249615ab.0
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 13:13:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737753208; x=1738358008;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p5sjBjTtckECqcYg+NR2uOoEZpsPIMBlJpjauqkDF/g=;
 b=DV9hl2HvJzg1O4vuXx86a8lvw53toBuDXNxKxgHhBc326N9GJv/SKR4QRnDDaQ42LA
 Nk0y6ZORjvdh9McIwBlKZEBfhvNkj4GGja3rbIvrp13UwyefKrEuT4MMgyA02bzKCThN
 xzaCNSyotGiquC18UfrWjL3NgJup3K03KD7jJ12qTkoDUC5kfph7q2HIZVoI4Sl3nRk8
 N45ubI1Agrw7MToRjnj+O9PuqM+6bvLnwbw1flpChI6XOYmkUuDkfD/88OKFRJgkaZGl
 PVkt8yWu8eHNEz2suq/Gr0g5RobrsOzzcl/uWbQx/2bO7d02+23n0+shuWjmwSSmT8Qp
 oIqA==
X-Gm-Message-State: AOJu0YygGY7or9B7ttAncQqbaze51sxPoFFhgSaVLwJBjERLtd7/FFT5
 q+EI1fOpcmzNWyMMkpOTdeWM1sY7mRWxTWW0rCgUBxMkD/s9G46YESlJDd/3
X-Gm-Gg: ASbGncsY4+AuOqQ8UdcNoE/aCqYqlGigmZHscdaTv4GpNwNrcv8y1JqgKdVrPtH+aeb
 NuDqT4eEiP7ZAUK/zHb3WSopKjg9QeNJSWzQuOVIr8bxGlUhFREkg0eol1k76xvSFJYg1t1YGm8
 e/PZE4fY9bRrep0nJQmDy/L2R/wddqJeBPKdP1ETYvVFF6uekNbJo8TatUipQzhl6wSHDq2Bn7w
 /kF0R99ybofdADIzsrmGvgcgwHy4+5+NylajqfAimW8V/nY9piwpmzw6e7ZAReumc3BpK/AkBoT
 4Q79lHbbTUbzG2JeTe2WAuJlfqnmN2gCGbP7dNPUilJuRxsj9js0pus=
X-Google-Smtp-Source: AGHT+IE70UWpsl1baQOYrlB9GIcDk2LMSWHpqs1FLyCKQrgWv2z1LDWrPPUf635OHPU91J/hchdGKg==
X-Received: by 2002:a05:6e02:1389:b0:3ce:6aa7:fe96 with SMTP id
 e9e14a558f8ab-3cf744957f7mr234163475ab.22.1737753208307; 
 Fri, 24 Jan 2025 13:13:28 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc744be59sm8943785ab.37.2025.01.24.13.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 13:13:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 14:13:25 -0700
Message-Id: <20250124211325.3873333-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737753208; x=1738358008; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p5sjBjTtckECqcYg+NR2uOoEZpsPIMBlJpjauqkDF/g=;
 b=ZsQ46AR1IHeWm2donOzEuPlR78BpLrapb0e5arVKiCLlMCrNQrsclxsh/5ZBSPo9Pa
 kvzuV01iyfTezvCp5N6IRMVj/iNiOLvx76sLe71dwXrnd1NCZOyBxd3fNoEFMYGiCySL
 RLWKPh35OfLCyxzFhvojO5jlqweiG8fM7zcqmvgYmqlv31P3zVwN9NijdJUrtvygVgYF
 NPamsaqpBY7VV2afS4PxFoAddpKTNS6BBzjiQ19TmtempVjfyqtG8Cyn4IYK8C3DGUOb
 gnb2bbz/gUbLsW9rxB+ugLEfve1eOV7LVsM6QN+BVwy7asKVYkom/kQfh8MmSGzfoP4D
 zN8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZsQ46AR1
Subject: [Buildroot] [PATCH v2 1/1] package/python-web2py: bump to version
 3.0.11
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is now upstream.

License file renamed without content changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - fix license file name
---
 .../0001-fix-regexen-and-classname.patch      | 294 ------------------
 package/python-web2py/python-web2py.hash      |   4 +-
 package/python-web2py/python-web2py.mk        |   4 +-
 3 files changed, 4 insertions(+), 298 deletions(-)
 delete mode 100644 package/python-web2py/0001-fix-regexen-and-classname.patch

diff --git a/package/python-web2py/0001-fix-regexen-and-classname.patch b/package/python-web2py/0001-fix-regexen-and-classname.patch
deleted file mode 100644
index f134c3d31b..0000000000
--- a/package/python-web2py/0001-fix-regexen-and-classname.patch
+++ /dev/null
@@ -1,294 +0,0 @@
-From ad5cbbfdfacdcd3b4663e91a638de022d6e20477 Mon Sep 17 00:00:00 2001
-From: eevelweezel <eevel.weezel@gmail.com>
-Date: Mon, 6 Nov 2023 00:17:20 -0600
-Subject: [PATCH] fix regexen and classname
-
-Upstream: https://github.com/web2py/web2py/commit/ad5cbbfdfacdcd3b4663e91a638de022d6e20477
-[yann.morin.1998@free.fr: backport from upstream]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-
----
- applications/admin/controllers/default.py | 64 +++++++++++------------
- gluon/compileapp.py                       |  4 +-
- gluon/contrib/appconfig.py                |  2 +-
- 3 files changed, 35 insertions(+), 35 deletions(-)
-
-diff --git a/applications/admin/controllers/default.py b/applications/admin/controllers/default.py
-index 88697267..c53a3a76 100644
---- a/applications/admin/controllers/default.py
-+++ b/applications/admin/controllers/default.py
-@@ -85,7 +85,7 @@ def safe_open(a, b):
-         return tmp()
-
-     a_for_check = os.path.abspath(os.path.normpath(a))
--    
-+
-     web2py_apps_root = os.path.abspath(up(request.folder))
-     web2py_deposit_root = os.path.join(up(web2py_apps_root), 'deposit')
-
-@@ -230,7 +230,7 @@ def site():
-     class IS_VALID_APPNAME(object):
-
-         def __call__(self, value):
--            if not re.compile('^\w+$').match(value):
-+            if not re.compile(r'^\w+$').match(value):
-                 return (value, T('Invalid application name'))
-             if not request.vars.overwrite and \
-                     os.path.exists(os.path.join(apath(r=request), value)):
-@@ -321,7 +321,7 @@ def site():
-             session.flash = T(msg, dict(appname=form_update.vars.name))
-         redirect(URL(r=request))
-
--    regex = re.compile('^\w+$')
-+    regex = re.compile(r'^\w+$')
-
-     if is_manager():
-         apps = [a for a in os.listdir(apath(r=request)) if regex.match(a) and
-@@ -341,7 +341,7 @@ def site():
- def report_progress(app):
-     import datetime
-     progress_file = os.path.join(apath(app, r=request), 'progress.log')
--    regex = re.compile('\[(.*?)\][^\:]+\:\s+(\-?\d+)')
-+    regex = re.compile(r'\[(.*?)\][^\:]+\:\s+(\-?\d+)')
-     if not os.path.exists(progress_file):
-         return []
-     matches = regex.findall(open(progress_file, 'r').read())
-@@ -609,7 +609,7 @@ def test():
-     if len(request.args) > 1:
-         file = request.args[1]
-     else:
--        file = '.*\.py'
-+        file = r'.*\.py'
-
-     controllers = listdir(
-         apath('%s/controllers/' % app, r=request), file + '$')
-@@ -869,12 +869,12 @@ def todolist():
-     app_path = apath('%(app)s' % {'app': app}, r=request)
-     dirs = ['models', 'controllers', 'modules', 'private']
-
--    def listfiles(app, dir, regexp='.*\.py$'):
-+    def listfiles(app, dir, regexp=r'.*\.py$'):
-         files = sorted(listdir(apath('%(app)s/%(dir)s/' % {'app': app, 'dir': dir}, r=request), regexp))
-         files = [x.replace(os.path.sep, '/') for x in files if not x.endswith('.bak')]
-         return files
-
--    pattern = '#\s*(todo)+\s+(.*)'
-+    pattern = r'#\s*(todo)+\s+(.*)'
-     regex = re.compile(pattern, re.IGNORECASE)
-
-     output = []
-@@ -1126,7 +1126,7 @@ def design():
-         redirect(URL('site'))
-
-     # Get all models
--    models = listdir(apath('%s/models/' % app, r=request), '.*\.py$')
-+    models = listdir(apath('%s/models/' % app, r=request), r'.*\.py$')
-     models = [x.replace('\\', '/') for x in models]
-     defines = {}
-     for m in models:
-@@ -1136,7 +1136,7 @@ def design():
-
-     # Get all controllers
-     controllers = sorted(
--        listdir(apath('%s/controllers/' % app, r=request), '.*\.py$'))
-+        listdir(apath('%s/controllers/' % app, r=request), r'.*\.py$'))
-     controllers = [x.replace('\\', '/') for x in controllers]
-     functions = {}
-     for c in controllers:
-@@ -1149,7 +1149,7 @@ def design():
-
-     # Get all views
-     views = sorted(
--        listdir(apath('%s/views/' % app, r=request), '[\w/\-]+(\.\w+)+$'))
-+        listdir(apath('%s/views/' % app, r=request), r'[\w/\-]+(\.\w+)+$'))
-     views = [x.replace('\\', '/') for x in views if not x.endswith('.bak')]
-     extend = {}
-     include = {}
-@@ -1164,17 +1164,17 @@ def design():
-         include[c] = [i[1] for i in items]
-
-     # Get all modules
--    modules = listdir(apath('%s/modules/' % app, r=request), '.*\.py$')
-+    modules = listdir(apath('%s/modules/' % app, r=request), r'.*\.py$')
-     modules = modules = [x.replace('\\', '/') for x in modules]
-     modules.sort()
-
-     # Get all private files
--    privates = listdir(apath('%s/private/' % app, r=request), '[^\.#].*')
-+    privates = listdir(apath('%s/private/' % app, r=request), r'[^\.#].*')
-     privates = [x.replace('\\', '/') for x in privates]
-     privates.sort()
-
-     # Get all static files
--    statics = listdir(apath('%s/static/' % app, r=request), '[^\.#].*',
-+    statics = listdir(apath('%s/static/' % app, r=request), r'[^\.#].*',
-                       maxnum=MAXNFILES)
-     statics = [x.replace(os.path.sep, '/') for x in statics]
-     statics.sort()
-@@ -1267,7 +1267,7 @@ def plugin():
-         redirect(URL('site'))
-
-     # Get all models
--    models = listdir(apath('%s/models/' % app, r=request), '.*\.py$')
-+    models = listdir(apath('%s/models/' % app, r=request), r'.*\.py$')
-     models = [x.replace('\\', '/') for x in models]
-     defines = {}
-     for m in models:
-@@ -1277,7 +1277,7 @@ def plugin():
-
-     # Get all controllers
-     controllers = sorted(
--        listdir(apath('%s/controllers/' % app, r=request), '.*\.py$'))
-+        listdir(apath('%s/controllers/' % app, r=request), r'.*\.py$'))
-     controllers = [x.replace('\\', '/') for x in controllers]
-     functions = {}
-     for c in controllers:
-@@ -1290,7 +1290,7 @@ def plugin():
-
-     # Get all views
-     views = sorted(
--        listdir(apath('%s/views/' % app, r=request), '[\w/\-]+\.\w+$'))
-+        listdir(apath('%s/views/' % app, r=request), r'[\w/\-]+\.\w+$'))
-     views = [x.replace('\\', '/') for x in views]
-     extend = {}
-     include = {}
-@@ -1304,17 +1304,17 @@ def plugin():
-         include[c] = [i[1] for i in items]
-
-     # Get all modules
--    modules = listdir(apath('%s/modules/' % app, r=request), '.*\.py$')
-+    modules = listdir(apath('%s/modules/' % app, r=request), r'.*\.py$')
-     modules = modules = [x.replace('\\', '/') for x in modules]
-     modules.sort()
-
-     # Get all private files
--    privates = listdir(apath('%s/private/' % app, r=request), '[^\.#].*')
-+    privates = listdir(apath('%s/private/' % app, r=request), r'[^\.#].*')
-     privates = [x.replace('\\', '/') for x in privates]
-     privates.sort()
-
-     # Get all static files
--    statics = listdir(apath('%s/static/' % app, r=request), '[^\.#].*',
-+    statics = listdir(apath('%s/static/' % app, r=request), r'[^\.#].*',
-                       maxnum=MAXNFILES)
-     statics = [x.replace(os.path.sep, '/') for x in statics]
-     statics.sort()
-@@ -1331,7 +1331,7 @@ def plugin():
-         safe_write(crontab, '#crontab')
-
-     def filter_plugins(items):
--        regex = re.compile('^plugin_' + plugin + '(/.*|\..*)?$')
-+        regex = re.compile(r'^plugin_' + plugin + r'(/.*|\..*)?$')
-         return [item for item in items if item and regex.match(item)]
-
-     return dict(app=app,
-@@ -1363,14 +1363,14 @@ def create_file():
-                 request.vars.location += request.vars.dir + '/'
-             app = get_app(name=request.vars.location.split('/')[0])
-             path = apath(request.vars.location, r=request)
--        filename = re.sub('[^\w./-]+', '_', request.vars.filename)
-+        filename = re.sub(r'[^\w./-]+', '_', request.vars.filename)
-         if path[-7:] == '/rules/':
-             # Handle plural rules files
-             if len(filename) == 0:
-                 raise SyntaxError
-             if not filename[-3:] == '.py':
-                 filename += '.py'
--            lang = re.match('^plural_rules-(.*)\.py$', filename).group(1)
-+            lang = re.match(r'^plural_rules-(.*)\.py$', filename).group(1)
-             langinfo = read_possible_languages(apath(app, r=request))[lang]
-             text = dedent("""
-                    #!/usr/bin/env python
-@@ -1518,7 +1518,7 @@ def create_file():
-         redirect(request.vars.sender + anchor)
-
-
--def listfiles(app, dir, regexp='.*\.py$'):
-+def listfiles(app, dir, regexp=r'.*\.py$'):
-     files = sorted(
-         listdir(apath('%(app)s/%(dir)s/' % {'app': app, 'dir': dir}, r=request), regexp))
-     files = [x.replace('\\', '/') for x in files if not x.endswith('.bak')]
-@@ -1533,12 +1533,12 @@ def editfile(path, file, vars={}, app=None):
-
- def files_menu():
-     app = request.vars.app or 'welcome'
--    dirs = [{'name': 'models', 'reg': '.*\.py$'},
--            {'name': 'controllers', 'reg': '.*\.py$'},
--            {'name': 'views', 'reg': '[\w/\-]+(\.\w+)+$'},
--            {'name': 'modules', 'reg': '.*\.py$'},
--            {'name': 'static', 'reg': '[^\.#].*'},
--            {'name': 'private', 'reg': '.*\.py$'}]
-+    dirs = [{'name': 'models', 'reg': r'.*\.py$'},
-+            {'name': 'controllers', 'reg': r'.*\.py$'},
-+            {'name': 'views', 'reg': r'[\w/\-]+(\.\w+)+$'},
-+            {'name': 'modules', 'reg': r'.*\.py$'},
-+            {'name': 'static', 'reg': r'[^\.#].*'},
-+            {'name': 'private', 'reg': r'.*\.py$'}]
-     result_files = []
-     for dir in dirs:
-         result_files.append(TAG[''](LI(dir['name'], _class="nav-header component", _onclick="collapse('" + dir['name'] + "_files');"),
-@@ -1559,7 +1559,7 @@ def upload_file():
-         path = apath(request.vars.location, r=request)
-
-         if request.vars.filename:
--            filename = re.sub('[^\w\./]+', '_', request.vars.filename)
-+            filename = re.sub(r'[^\w\./]+', '_', request.vars.filename)
-         else:
-             filename = os.path.split(request.vars.file.filename)[-1]
-
-@@ -1628,7 +1628,7 @@ def errors():
-
-         hash2error = dict()
-
--        for fn in listdir(errors_path, '^[a-fA-F0-9.\-]+$'):
-+        for fn in listdir(errors_path, r'^[a-fA-F0-9.\-]+$'):
-             fullpath = os.path.join(errors_path, fn)
-             if not os.path.isfile(fullpath):
-                 continue
-@@ -1727,7 +1727,7 @@ def errors():
-         func = lambda p: os.stat(apath('%s/errors/%s' %
-                                        (app, p), r=request)).st_mtime
-         tickets = sorted(
--            listdir(apath('%s/errors/' % app, r=request), '^\w.*'),
-+            listdir(apath('%s/errors/' % app, r=request), r'^\w.*'),
-             key=func,
-             reverse=True)
-
-diff --git a/gluon/compileapp.py b/gluon/compileapp.py
-index 45fa8a0e..be0446e1 100644
---- a/gluon/compileapp.py
-+++ b/gluon/compileapp.py
-@@ -14,7 +14,7 @@ Note:
-
- import copy
- import fnmatch
--import imp
-+from importlib import import_module
- import marshal
- import os
- import py_compile
-@@ -345,7 +345,7 @@ def local_import_aux(name, reload_force=False, app="welcome"):
-     """
-     items = name.replace("/", ".")
-     name = "applications.%s.modules.%s" % (app, items)
--    module = __import__(name)
-+    module = import_module(name)
-     for item in name.split(".")[1:]:
-         module = getattr(module, item)
-     if reload_force:
-diff --git a/gluon/contrib/appconfig.py b/gluon/contrib/appconfig.py
-index 1160e08a..2bf81841 100644
---- a/gluon/contrib/appconfig.py
-+++ b/gluon/contrib/appconfig.py
-@@ -120,7 +120,7 @@ class AppConfigLoader(object):
-         self.read_config()
-
-     def read_config_ini(self):
--        config = configparser.SafeConfigParser()
-+        config = configparser.RawConfigParser()
-         config.read(self.file)
-         settings = {}
-         for section in config.sections():
---
-2.45.1
-
diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index ce3896a1ad..8d4ae3df28 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  2221840e4ef2c1e3810017921b2a72f2d5d1f888ca1f771cf7263bfead60570c  python-web2py-2.27.1.tar.gz
-sha256  2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE
+sha256  52b3e2bc1ab300e2546bfa12cb2d836607853f3c74cd86e777ea57d493458224  python-web2py-3.0.11.tar.gz
+sha256  2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE.web2py.txt
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index ed10333f53..6cab12c20c 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = 2.27.1
+PYTHON_WEB2PY_VERSION = 3.0.11
 PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,v$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPL-3.0
-PYTHON_WEB2PY_LICENSE_FILES = LICENSE
+PYTHON_WEB2PY_LICENSE_FILES = LICENSE.web2py.txt
 PYTHON_WEB2PY_CPE_ID_VENDOR = web2py
 PYTHON_WEB2PY_CPE_ID_PRODUCT = web2py
 PYTHON_WEB2PY_DEPENDENCIES = host-python3 python3 \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
