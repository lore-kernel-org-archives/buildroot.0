Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D116EC0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 23:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 232E460802;
	Sat, 25 Jan 2025 23:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2lE7hCE1YkWm; Sat, 25 Jan 2025 23:27:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B52DF60B21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B52DF60B21;
	Sat, 25 Jan 2025 23:27:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A4053A6A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 23:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E7BF40F57
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 23:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDdPx5D_-b85 for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 23:27:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A296A40F4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A296A40F4B
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A296A40F4B
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 23:27:33 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-844eb33827eso88009439f.2
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737847652; x=1738452452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ottq79X+gtKYavtUssB1PwrqnPTolpq2t0iitozXc0g=;
 b=klyr9IeWm0/2wa4odlfd1z7Pj/XmGwQGVxOjRSI3EK5e04rIXdPbMRz6WJvvqTcbio
 ecPWB2mZPOjeO0m600HK2cxLeUkJXi8hlyE3+7K/+VrBDPIJfi28JT2QJW97iT/hwzgp
 yKusHsAJ2xuRfY6BQ3j1Eg7YJrS9ah9WNQ/NjhZh4rpbSUIGaq+DlhyD+Up2jAUFWc3a
 RANK9sqUzVhCz52fGFGDF/oj9wnGG19cKbiNCQQuYM9U2WqHEhmaK2myL9sYuvRfCGvU
 m0smZDTj9/mUDRdOmNqDSFPPPRMgaEyMP7bgHj2qYQSaaItsAUwlyM49L0Odiqzj1d78
 sTbA==
X-Gm-Message-State: AOJu0Ywrr0un97LwIf5yia/dQ38b1zF5g74uEQMIz+aTcgZLGgmSr5Xm
 +TsRgZmtRayCCmlk2YzmutAnQz4t5I/BBz6YnKi0ewDyGz6jLjVYafgEclzL
X-Gm-Gg: ASbGncv0wGkuczk+9STxpD4VAt4RkIOkTEAIPLP6Dp4IBhnepIPHE2dypE55Edxz5Pd
 yPmuWN7JiXJWAEnR97Ud+4/MdIRc1WlcpVzGwspAShYF2Yof8lrEQjndTKaQHigaRaP4Et7LAxT
 uxSnyJGCHaqf5h6kTvBtJopRXFz1CF5tZk2DMavJeQF64tqle3BjpFizV/iaec50E6IRsM7CWBt
 JiFs8n4FvFDS7CMg/CnIwm/3jtYP51xq3gsjOTzF2u2mnvuNhWiLTotD7u10ibPKQne7PJzUclv
 HsIvPbBsyEBS/2Yn6lTjmng9khKUc7iYkuh90VhlbH8fzOnv86gr0gg=
X-Google-Smtp-Source: AGHT+IEGx0PPpCCYpcE1v23+RlbfKM/ayKJ5Xe6ImU/Xkjm54by/yFWiHay1p5e088ilUMDA9uEfOQ==
X-Received: by 2002:a05:6602:134c:b0:847:37fe:e25b with SMTP id
 ca18e2360f4ac-851b62842eamr2886351739f.11.1737847651912; 
 Sat, 25 Jan 2025 15:27:31 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1db86375sm1616014173.128.2025.01.25.15.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2025 15:27:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 16:27:29 -0700
Message-Id: <20250125232729.219531-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737847652; x=1738452452; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ottq79X+gtKYavtUssB1PwrqnPTolpq2t0iitozXc0g=;
 b=ilF1Dk+gAxD29UdNk68bCtCfYR6bhLhqOhJt7zq/pW6CCDC98lgeKvTWIAurocoHx8
 Pp72rf9ykr4WiF7qsN8IBtFU57C8f4QFA45eAZaKP+6QhY3wpS+WdJwMHbmlsnLfa6lN
 Gz2M3ji0mhCjAR42kExy6qRl1yagxsTlrbn3/qyytZ88Y0MZVoP36Qmr00QoHWpUHEPJ
 IQawRn3QUCkj1z7oVkUVHcf1SUDC9s0aUQTQJ09sOU1iY8RKJgBa4eT0WC4rZ9dFDmwc
 kc1azNByNoWz73VKO2rfa2kt1TXAAqcHgyoV1kvERkjlcht6PUjj9KyEnxZYVsQpVGaL
 8G0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ilF1Dk+g
Subject: [Buildroot] [PATCH v3 1/1] package/python-web2py: bump to version
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

Download submodules which are now required.

Drop patch which is now upstream.

License file renamed without content changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - fetch git submodules
Changes v1 -> v2:
  - fix license file name
---
 .../0001-fix-regexen-and-classname.patch      | 294 ------------------
 package/python-web2py/python-web2py.hash      |   4 +-
 package/python-web2py/python-web2py.mk        |   8 +-
 3 files changed, 7 insertions(+), 299 deletions(-)
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
index ce3896a1ad..098f8dc490 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  2221840e4ef2c1e3810017921b2a72f2d5d1f888ca1f771cf7263bfead60570c  python-web2py-2.27.1.tar.gz
-sha256  2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE
+sha256  12669396396044f68a3f0ae9c44137f1a3b327c26e963f52b5e8b2bb20c51561  python-web2py-v3.0.11-git4.tar.gz
+sha256  2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE.web2py.txt
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index ed10333f53..9e1de5c932 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = 2.27.1
-PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,v$(PYTHON_WEB2PY_VERSION))
+PYTHON_WEB2PY_VERSION = v3.0.11
+PYTHON_WEB2PY_SITE = https://github.com/web2py/web2py.git
+PYTHON_WEB2PY_SITE_METHOD = git
+PYTHON_WEB2PY_GIT_SUBMODULES = YES
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
