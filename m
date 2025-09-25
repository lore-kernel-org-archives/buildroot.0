Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEE8CAC5A5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 04:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4435A613B5;
	Thu, 25 Sep 2025 04:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYA-uZuDAiHp; Thu, 25 Sep 2025 04:51:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E3C3613B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E3C3613B2;
	Thu, 25 Sep 2025 04:51:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5FA1177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 04:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F4EF4096D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 04:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jjvvxhYmArfB for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 04:51:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f64; helo=mail-qv1-xf64.google.com;
 envelope-from=git@jdknight.me; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E19F5409B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E19F5409B7
Received: from mail-qv1-xf64.google.com (mail-qv1-xf64.google.com
 [IPv6:2607:f8b0:4864:20::f64])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E19F5409B7
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 04:51:40 +0000 (UTC)
Received: by mail-qv1-xf64.google.com with SMTP id
 6a1803df08f44-70ba7aa131fso5236406d6.2
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 21:51:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758775899; x=1759380699;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A7j5UpoHJKs6U0F1FuG8TQR5ALgGRzAcQbK1cqNLgOw=;
 b=BJPugSkZBdOd96WNaQa5xYonpVwr4y0/9a4EC1RtRh8aidmQv5y8dyM/XawEQkvh3M
 jiV61T++Zde75oSl8PS8rwZXjE5yND9xuBXaxNkrCbF+9SBY73qNlVLZfqwOTvqLfN8f
 MnAVHWwZ3CHnbNd5Bc4Yj16jy2RKMrft/uZmOE/OLVv/XaHDc3sTPHNw3WaE+6vbP5ng
 30EZadGIF7w036yw+ieyhoAavmtduyBKbUuthsmZXZRYxaHeXGmku0558VtUuTowTq1o
 u3LYgPcNdlRanfceVrMHp0XqZtXrPIjLCBx0lrW7nQi3GgcpLWg61VEPP8CraK1W00ab
 EwZw==
X-Gm-Message-State: AOJu0YxysqBNJnWyz/8xEUqSNLs9ld+nIOfjYF/sNLJSjvJiMEvngBhr
 O6iLsNgXb5mL/RfYv5iDbheXsBYFm3+pnDZAMNH/a4Z759pY/mk3SicUWkQ3MzvSLzP6oZjL1vZ
 VWPyVMfNyXGY7euCtCtmZbKEe4mHLUv09jUz2/X4Aw7fCSek=
X-Gm-Gg: ASbGncur9hL1CUy+7X0ftHXoFBrrW7YOohE7WA/YXFtc0jSEdweAXIS/qpCEgjagDlX
 njaQYHi1ZDm66ZIWIguii4WVauE/ZpF6v8GlIeCw4DrbFS3tndwiHn+j1TaDjjOinsz1/yYwiBP
 GGFuFbj3te+uDdsLZr1xDhZCiYopmcCI5hAujvuQ3OSRfZOjRP4D3GRu++IAiwwtQhKeLSuuIBs
 J9atOx0dfzDE3QqA+PkdAd73opZywjXScUi+cl/HtPkeaO+T6XxGgEeDH0EhRVEsnZ2OPy4mAbq
 fPrB3D6eqOP+vIf5I1EWRIqn3o4MOzNSSOPE5GvA0l+eSDsNbpmuBTa14A==
X-Google-Smtp-Source: AGHT+IFOGcN+kJBQKCHEkThDfCdY9AJXB1lToBoqSnY5TK7jndbX5crTLDQqC+OaH75iBFw6e6klkNmtGCoa
X-Received: by 2002:ad4:594c:0:b0:798:7d70:9cfa with SMTP id
 6a1803df08f44-7fc3f52e79amr40328786d6.39.1758775899466; 
 Wed, 24 Sep 2025 21:51:39 -0700 (PDT)
Received: from localhost.localdomain ([70.53.89.16])
 by smtp-relay.gmail.com with ESMTPS id
 6a1803df08f44-8016193d064sm655356d6.28.2025.09.24.21.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 21:51:39 -0700 (PDT)
X-Relaying-Domain: jdknight.me
From: James Knight <git@jdknight.me>
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>,
	James Knight <git@jdknight.me>
Date: Thu, 25 Sep 2025 00:51:15 -0400
Message-ID: <20250925045115.1655-1-git@jdknight.me>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jdknight-me.20230601.gappssmtp.com; s=20230601; t=1758775899; x=1759380699;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A7j5UpoHJKs6U0F1FuG8TQR5ALgGRzAcQbK1cqNLgOw=;
 b=xOah2dqhI5opfPRIWFlXzBTpJ6zqKcicBhMNPJOhY3WxwEXs2vGfCKL8ioTLGLy0VE
 a5jjwo8FhokmqTGrzvEVjOxGzlDk2tLATXLTLYfcLAdWlzrc3dxn89U+N+3++4VZGm5H
 h1lkLKvyW4qtqrVLTZXCfCKQJnsuWpOuX5ny2om0YlTeBHaL7rWM1+hCHZ6a947SuS4r
 29v7ocJAUXAL0A1MJLkz3KeFH8Cc2QPxUnDjIt/qwbDVhrKZfY4n7I7Z30cOzyeYWjFC
 PMtXbb5/ZxWEBnhPSKoOJoBvqSTFVxtQqUDMjTW7xZLFveDqtRuuWbxBFh6vX3zLbXMx
 6Gzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jdknight.me
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jdknight-me.20230601.gappssmtp.com
 header.i=@jdknight-me.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=xOah2dqh
Subject: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: configurable
 upstream-check api endpoint
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Provide the ability for a caller to override the API endpoint used for
upstream checks. This can be helpful for environments which support a
reverse proxy for caching an Anitya target.

Signed-off-by: James Knight <git@jdknight.me>
---
 support/scripts/pkg-stats | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index a0a46aa8cbac1532f84d67bed9924dace4f6778b..3b9c9bd5b11d6434ffab847fe5de18154936e34e 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -37,6 +37,7 @@ from getdeveloperlib import parse_developers  # noqa: E402
 INFRA_RE = re.compile(r"\$\(eval \$\(([a-z-]*)-package\)\)")
 URL_RE = re.compile(r"\s*https?://\S*\s*$")
 
+DEFAULT_RM_API_ENDPOINT = "https://release-monitoring.org/api"
 RM_API_STATUS_ERROR = 1
 RM_API_STATUS_FOUND_BY_DISTRO = 2
 RM_API_STATUS_FOUND_BY_PATTERN = 3
@@ -523,8 +524,8 @@ def check_package_latest_version_set_status(pkg, status, version, identifier):
         pkg.status['version'] = ('ok', 'up-to-date')
 
 
-async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
-    url = "https://release-monitoring.org/api/project/Buildroot/%s" % pkg.name
+async def check_package_get_latest_version_by_distro(rm_url, session, pkg, retry=True):
+    url = f"{rm_url}/project/Buildroot/{pkg.name}"
     try:
         async with session.get(url) as resp:
             if resp.status != 200:
@@ -545,13 +546,13 @@ async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
 
     except (aiohttp.ClientError, asyncio.TimeoutError):
         if retry:
-            return await check_package_get_latest_version_by_distro(session, pkg, retry=False)
+            return await check_package_get_latest_version_by_distro(rm_url, session, pkg, retry=False)
         else:
             return False
 
 
-async def check_package_get_latest_version_by_guess(session, pkg, retry=True):
-    url = "https://release-monitoring.org/api/projects/?pattern=%s" % pkg.name
+async def check_package_get_latest_version_by_guess(rm_url, session, pkg, retry=True):
+    url = f"{rm_url}/projects/?pattern={pkg.name}"
     try:
         async with session.get(url) as resp:
             if resp.status != 200:
@@ -576,7 +577,7 @@ async def check_package_get_latest_version_by_guess(session, pkg, retry=True):
 
     except (aiohttp.ClientError, asyncio.TimeoutError):
         if retry:
-            return await check_package_get_latest_version_by_guess(session, pkg, retry=False)
+            return await check_package_get_latest_version_by_guess(rm_url, session, pkg, retry=False)
         else:
             return False
 
@@ -584,16 +585,16 @@ async def check_package_get_latest_version_by_guess(session, pkg, retry=True):
 check_latest_count = 0
 
 
-async def check_package_latest_version_get(session, pkg, npkgs, verbose=False):
+async def check_package_latest_version_get(rm_url, session, pkg, npkgs, verbose=False):
     global check_latest_count
 
-    if await check_package_get_latest_version_by_distro(session, pkg):
+    if await check_package_get_latest_version_by_distro(rm_url, session, pkg):
         check_latest_count += 1
         if verbose:
             print("[%04d/%04d] %s" % (check_latest_count, npkgs, pkg.name))
         return
 
-    if await check_package_get_latest_version_by_guess(session, pkg):
+    if await check_package_get_latest_version_by_guess(rm_url, session, pkg):
         check_latest_count += 1
         if verbose:
             print("[%04d/%04d] %s" % (check_latest_count, npkgs, pkg.name))
@@ -607,7 +608,7 @@ async def check_package_latest_version_get(session, pkg, npkgs, verbose=False):
         print("[%04d/%04d] %s" % (check_latest_count, npkgs, pkg.name))
 
 
-async def check_package_latest_version(packages, verbose=False):
+async def check_package_latest_version(rm_url, packages, verbose=False):
     """
     Fills in the .latest_version field of all Package objects
 
@@ -630,7 +631,7 @@ async def check_package_latest_version(packages, verbose=False):
     async with aiohttp.ClientSession(connector=connector, trust_env=True) as sess:
         packages = [p for p in packages if p.is_actual_package]
         for pkg in packages:
-            tasks.append(asyncio.ensure_future(check_package_latest_version_get(sess, pkg, len(packages), verbose=verbose)))
+            tasks.append(asyncio.ensure_future(check_package_latest_version_get(rm_url, sess, pkg, len(packages), verbose=verbose)))
         await asyncio.wait(tasks)
 
 
@@ -1303,6 +1304,9 @@ def parse_args():
                           help='List of packages (comma separated)')
     parser.add_argument('--nvd-path', dest='nvd_path',
                         help='Path to the local NVD database', type=resolvepath)
+    parser.add_argument('--upstream-url', dest='upstream_url',
+                        help='Upstream API endpoint to use',
+                        default=DEFAULT_RM_API_ENDPOINT)
     parser.add_argument('--disable', type=list_str,
                         help='Features to disable, comma-separated (cve, upstream, url, warnings)',
                         default=[])
@@ -1317,6 +1321,9 @@ def parse_args():
 def __main__():
     global cvecheck
 
+    loop = asyncio.new_event_loop()
+    asyncio.set_event_loop(loop)
+
     args = parse_args()
 
     if args.nvd_path:
@@ -1365,7 +1372,7 @@ def __main__():
     if "upstream" not in args.disable:
         print("Getting latest versions ...")
         loop = asyncio.get_event_loop()
-        loop.run_until_complete(check_package_latest_version(packages, verbose=args.verbose))
+        loop.run_until_complete(check_package_latest_version(args.upstream_url, packages, verbose=args.verbose))
     if "cve" not in args.disable and args.nvd_path:
         print("Checking packages CVEs")
         check_package_cves(args.nvd_path, packages)
-- 
2.49.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
