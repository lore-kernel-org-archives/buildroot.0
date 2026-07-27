Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A891C531FC
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 14:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0604D40728;
	Mon, 27 Jul 2026 14:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2yIBAid6g3e; Mon, 27 Jul 2026 14:49:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C855140729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785163784;
	bh=EJleyrK9C9bDD4QNIEgY00PsKBR2drAdIG+an9gHhfw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ebtWu2f8CyjTJ0Nqv8vmYRXNyZfD6yV0OQsa8rmSURZ7vauXv/nD848zfESYMtv1L
	 fjMnZ06JQOTPR6Xsw4XBtxi3T86X+vxPxMM1niv0l2OpzszPY7SiGfFtFTMtuslGaV
	 z7q9Cg3mThQwYiT0Aih+aDSGdFweR+/nqRpTS38ed/HS/Mz/vq7B0LrZr5HX015ayO
	 rnSWgebuKcxb0W0w03XbJLQjg3preRpWqWBZneLL2U6+w7y14a7YHvSQquw0uBOvmT
	 rdk/cQ8b1wiQQeSXseUzFwPNTNGGG0ig+lr6rIKd0x/U2fX4LbO4ssRaNK9Nwc13Ai
	 6+z2GwHtS17Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C855140729;
	Mon, 27 Jul 2026 14:49:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8645F39E
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 14:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77F25606F4
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 14:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GzRQK2fwzXpd for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 14:49:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2205760609
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2205760609
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2205760609
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 14:49:41 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-49553515a8bso33034135e9.1
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 07:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785163780; x=1785768580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Kansxq0m/cqLbNIuqLIq98dPIVjTToZgdHYwPI4C01k=;
 b=MKrXu6TFqpSNeaU/jzB2XSytDstrgXqiYyyHnCu6oNd1a4QijI4coLOBpWQor99mVa
 +SS3H0uu57JnsLtW1ZdVpptYN4jZjcxSyWNw+4PMl0FDmYMkAm5tJs5yvEvPH4HvJRNe
 DkfxFEBvjh5Nz8bEpnUuyR5qkGnw2vs8YmOiWiUq9yfxuBcHyY6/iQJGqB7Sc5zBRgDn
 lexc+BerdK/opDZO4o5ifU8f1u0v9zyAHoDrbnM9yv/im5rGsKbcnIe84bhc1+vVgj6C
 VpBKiFn0kO2r9EF5kKY0lXsSDlpDz4VoZxbPe3/ewEG7XLGu6LQVzzcxneiOJeHXNQvS
 152w==
X-Gm-Message-State: AOJu0Yz+oWfkRQaZZi5Y9lWD4HflwUvAZqPuDdgV5/8JleceaheaoF6p
 /hzjRA8aXgAaayKfmLSvPbkvXhPJcsgjBUKHKW2FhadMUE0r4UcXdDrL1flOZyuqZnDLkWs+Xt9
 p0WgU3nU=
X-Gm-Gg: AR+sD13XXX2jiUsh10jhuLOkpYB9yXDA3BrnisIHVxJM0qHoVOK7rLtJXCaxgnQIhSO
 TivS+L+HhhQCLX0GluuThr81GliJjKY+4PNKYge5hEh7cFdZBhilQ/usJWmiDxougpmKgWz9lyM
 6eoL+3BDOh5NVXphhh/NqJ2aUDSaOYlxtE1rpt0V3lELpoaDKV1MvrLsjFr28QrH6UY2nquE032
 XzkEsny/f7q4ct1Uvy7mTblm6hghpMalRU5+S2nnJlGKCv5nz+NG1l6LoT7wX6FTD0f8J9S3pOf
 capG2aW8TQy2GqtnRv9XYd3TCPvA3R1zdU5GmB7qoDbNYX4F0YKpRntoGBJHQ/lQloPnpiHcbsZ
 8QwQtlJY5gNSmYUCkpDhjDi3a+Eme4YI9Yof+debIan1Dd16r3W+QnE9u72DTDu5Ata4mHvmd6a
 63f3ovUvoY0PvwBNEgaMZguPDnpihr5WQGluj/ISwYoXxvLOLhyDFjpTtqigDBqgRj55hBZHk=
X-Received: by 2002:a05:600c:1da8:b0:493:c845:bc20 with SMTP id
 5b1f17b1804b1-496b56e6ed6mr126004155e9.4.1785163779574; 
 Mon, 27 Jul 2026 07:49:39 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957f9ae5c3sm329507615e9.3.2026.07.27.07.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2026 07:49:39 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Mon, 27 Jul 2026 16:49:36 +0200
Message-ID: <20260727144936.3553073-1-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1785163780; x=1785768580; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Kansxq0m/cqLbNIuqLIq98dPIVjTToZgdHYwPI4C01k=;
 b=OyBOgoSldPrExh6OfcUUyY5w1KjZaO6YLZUdUMgcFkBkeKElrwcbepP10Vv6PWDc3u
 5Hc2w/z6CnrL0giIgcVhvPxW7DeC8J3GNQwRv66lkOG5Ew5cPRGC19ZeYxvNsGlqaM1C
 SACA+Mi5g2f8oxv/NjdR2dcViYAPYVFml8PBE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=OyBOgoSl
Subject: [Buildroot] [PATCH] utils/pkg-stats: add GitHub upstream status
 column
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There is currently a lot of packages that were added to Buildroot a long
time ago but are no longer maintained upstream. This can cause build
failures due to compatiblity issues, or security problems.
This patch thus adds a new "Upstream Status" column to the HTML output,
located between "Upstream URL" and "CVEs", to track the activity of
GitHub-hosted packages and help maintainers identify packages that may
need to be removed.

The status is determined by querying the GitHub API for the repository's
last push or update date ('pushed_at' or 'updated_at'):
- "active" (green background): last activity <= 3 months
- "lagging" (yellow background): last activity >= 6 months
- "inactive" (red background): last activity >= 1 year
- "API Limit" (white background): rate limit reached
- "N/A" (white background): missing URL, invalid URL, or non-GitHub

Note on API Rate Limits:
To prevent hitting GitHub's unauthenticated API rate limits (60 req/hr)
when scanning the whole package tree, users should export a GitHub
personal access token [1] via the `GITHUB_TOKEN` environment variable
with the command `export GITHUB_TOKEN=your_token` before running the
script. If the rate limit is reached, the status gracefully falls back
to displaying "API Limit".

[1] You can create one at https://github.com/settings/tokens

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 support/scripts/pkg-stats | 177 +++++++++++++++++++++++++++++++++++---
 1 file changed, 167 insertions(+), 10 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 2b2194b9a5..29376b9e78 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -91,6 +91,7 @@ class Package:
     all_licenses = dict()
     all_license_files = list()
     all_versions = dict()
+    all_sites = dict()
     all_ignored_cves = dict()
     all_cpeids = dict()
     # This is the list of all possible checks. Add new checks to this list so
@@ -125,8 +126,10 @@ class Package:
         self.ignored_cves = list()
         self.unsure_cves = list()
         self.stale_cve_ignores = list()
-        self.latest_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None}
+        self.latest_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None, 'backend': None, 'version_url': None}
         self.status = {}
+        self.upstream_status = ("na", "N/A")
+        self.site = None
 
     def pkgvar(self):
         return self.name.upper().replace("-", "_")
@@ -265,6 +268,14 @@ class Package:
         if var in self.all_versions:
             self.current_version = self.all_versions[var]
 
+    def set_site(self):
+        """
+        Fills in the .site field from _SITE make variable
+        """
+        var = self.pkgvar()
+        if var in self.all_sites:
+            self.site = self.all_sites[var]
+
     def set_cpeid(self):
         """
         Fills in the .cpeid field
@@ -421,7 +432,7 @@ def package_init_make_info():
     # Fetch all variables at once
     variables = subprocess.check_output(["make", "--no-print-directory", "-s",
                                          "BR2_HAVE_DOT_CONFIG=y", "printvars",
-                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_IGNORE_CVES %_CPE_ID"])
+                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_IGNORE_CVES %_CPE_ID %_SITE"])
     variable_list = variables.decode().splitlines()
 
     # We process first the host package VERSION, and then the target
@@ -454,6 +465,10 @@ def package_init_make_info():
                 continue
             pkgvar = pkgvar[:-8]
             Package.all_versions[pkgvar] = value
+        
+        elif pkgvar.endswith("_SITE"):
+            pkgvar = pkgvar[:-5]
+            Package.all_sites[pkgvar] = value
 
         elif pkgvar.endswith("_IGNORE_CVES"):
             pkgvar = pkgvar[:-12]
@@ -504,8 +519,124 @@ async def check_package_urls(packages, verbose=False):
             tasks.append(asyncio.ensure_future(check_url_status(sess, pkg, len(packages), verbose=verbose)))
         await asyncio.wait(tasks)
 
+async def check_git_status(session, pkg, npkgs, verbose=False):
+    urls_to_try = []
+    
+    if hasattr(pkg, 'site') and pkg.site:
+       urls_to_try.append(pkg.site)
+
+    if pkg.latest_version and 'rmo_data' in pkg.latest_version:
+            rmo = pkg.latest_version['rmo_data']
+            if rmo:
+                backend = str(rmo.get('backend') or '').lower()
+                
+                for key in ['version_url', 'check_url', 'homepage', 'repository']:
+                    val = rmo.get(key)
+                    if val and isinstance(val, str):
+                        # If Anitya only gives "owner/repo" for a known backend
+                        if not val.startswith('http') and '/' in val:
+                            if 'github' in backend:
+                                urls_to_try.append(f"https://github.com/{val}")
+                            elif 'gitlab' in backend:
+                                urls_to_try.append(f"https://gitlab.com/{val}")
+                            else:
+                                urls_to_try.append(val)
+                        else:
+                            urls_to_try.append(val)
+
+    if pkg.url:
+        urls_to_try.append(pkg.url)
+
+    api_url = None
+    is_github = False
+
+    for url in urls_to_try:
+        if not isinstance(url, str):
+            continue
+            
+        # Nettoyage de l'URL
+        url = url.split('?')[0].split('#')[0]
+
+        match_github = re.search(r"https?://github\.com/(.+)", url)
+        match_gitlab = re.search(r"https?://(gitlab[^/]*\.[^/]+|code\.videolan\.org)/(.+)", url)
+
+        if match_github:
+            path = match_github.group(1)
+            path = re.sub(r'\.git$', '', path)
+            path = re.sub(r'/(?:tags|releases|tree|blob|commits).*$', '', path)
+            path = path.strip('/')
+            parts = path.split('/')
+            if len(parts) >= 2:
+                owner, repo = parts[0], parts[1]
+                api_url = f"https://api.github.com/repos/{owner}/{repo}"
+                is_github = True
+                break
+                
+        elif match_gitlab:
+            import urllib.parse
+            domain = match_gitlab.group(1)
+            path = match_gitlab.group(2)
+            path = re.sub(r'\.git$', '', path)
+            path = re.sub(r'/(?:tags|releases|tree|blob|commits|-).*$', '', path)
+            path = path.strip('/')
+            project_path = urllib.parse.quote(path, safe='')
+            api_url = f"https://{domain}/api/v4/projects/{project_path}"
+            is_github = False
+            break
+
+    if not api_url:
+        pkg.upstream_status = ("na", "N/A")
+        return
+
+    try:
+        async with session.get(api_url) as resp:
+            if resp.status in (403, 429) and is_github:
+                if verbose:
+                    print(f"[{pkg.name}] API Limit reached for {api_url}")
+                pkg.upstream_status = ("na", "API Limit")
+                return
+            if resp.status == 200:
+                data = await resp.json()
+                # pushed_at is the last time a commit was pushed to the default branch on github or gitlab
+                published_at = data.get('pushed_at') or data.get('updated_at') or data.get('last_activity_at')
+                if published_at:
+                    published_at = published_at.replace('Z', '+00:00')
+                    pub_date = datetime.datetime.fromisoformat(published_at)
+                    now = datetime.datetime.now(datetime.timezone.utc)
+                    delta = now - pub_date
+
+                    if delta.days >= 365:
+                        pkg.upstream_status = ("inactive", "inactive")
+                    elif delta.days >= 180:
+                        pkg.upstream_status = ("lagging", "lagging")
+                    else:
+                        pkg.upstream_status = ("active", "active")
+                    return
+            else:
+                if verbose:
+                    print(f"[{pkg.name}] HTTP {resp.status} - {api_url}")
+                    
+    except Exception as e:
+        if verbose:
+            print(f"[{pkg.name}] Network error at {api_url} : {e}")
+    
+    pkg.upstream_status = ("na", "N/A")
+
 
-def check_package_latest_version_set_status(pkg, status, version, identifier):
+async def check_packages_upstream_status(packages, verbose=False):
+    tasks = []
+    connector = aiohttp.TCPConnector(limit_per_host=5)
+    headers = HTTP_HEADERS.copy()
+    if 'GITHUB_TOKEN' in os.environ:
+        headers['Authorization'] = f"token {os.environ['GITHUB_TOKEN']}"
+        
+    async with aiohttp.ClientSession(connector=connector, trust_env=True, headers=headers) as sess:
+        for pkg in packages:
+            tasks.append(asyncio.ensure_future(check_git_status(sess, pkg, len(packages), verbose=verbose)))
+        if tasks:
+            await asyncio.wait(tasks)
+
+def check_package_latest_version_set_status(pkg, status, version, identifier, backend=None, version_url=None):
     pkg.latest_version = {
         "status": status,
         "version": version,
@@ -542,7 +673,10 @@ async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
             check_package_latest_version_set_status(pkg,
                                                     RM_API_STATUS_FOUND_BY_DISTRO,
                                                     version,
-                                                    data['id'])
+                                                    data['id'],
+                                                    data.get('backend'),
+                                                    data.get('version_url'))
+            pkg.latest_version['rmo_data'] = data
             return True
 
     except (aiohttp.ClientError, asyncio.TimeoutError):
@@ -573,7 +707,10 @@ async def check_package_get_latest_version_by_guess(session, pkg, retry=True):
             check_package_latest_version_set_status(pkg,
                                                     RM_API_STATUS_FOUND_BY_PATTERN,
                                                     projects[0]['stable_versions'][0],
-                                                    projects[0]['id'])
+                                                    projects[0]['id'],
+                                                    projects[0].get('backend'),
+                                                    projects[0].get('version_url'))
+            pkg.latest_version['rmo_data'] = projects[0]
             return True
 
     except (aiohttp.ClientError, asyncio.TimeoutError):
@@ -862,10 +999,10 @@ function expandField(fieldId){
   background: white;
   padding: 10px 2px 10px 2px;
 }
-#package-grid, #results-grid {
+#package-grid {
   display: grid;
   grid-gap: 2px;
-  grid-template-columns: min-content 1fr repeat(12, min-content);
+  grid-template-columns: min-content 1fr repeat(13, min-content);
 }
 #results-grid {
   grid-template-columns: 3fr 1fr;
@@ -895,6 +1032,10 @@ function expandField(fieldId){
  .cve_ignored, .version-error {
   background: #ccc;
  }
+ .status-inactive { background: #ff9a69; }
+ .status-lagging { background: #ffd870; }
+ .status-active { background: #d2ffc4; }
+ .status-na { background: #ffffff; }
 
 </style>
 
@@ -1072,6 +1213,14 @@ def dump_html_pkg(f, pkg):
             url_str = pkg.status['url'][1]
     f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{url_str}</div>\n')
 
+    # Upstream Status (New GitHub Check)
+    data_field_id = f'upstream_status__{pkg_css_class}'
+    div_class = ["centered upstream_status data"]
+    div_class.append(f'_{pkg_css_class}')
+    status_val, status_text = pkg.upstream_status
+    div_class.append(f"status-{status_val}")
+    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{status_text}</div>\n')
+
     # CVEs
     data_field_id = f'cves__{pkg_css_class}'
     div_class = ["centered cves data"]
@@ -1176,11 +1325,13 @@ def dump_html_all_pkgs(f, packages):
      class="centered warnings data label"><span>Warnings</span><span></span></div>
 <div style="grid-column: 11;" onclick="sortGrid(this.id)" id="upstream_url"
      class="centered upstream_url data label"><span>Upstream URL</span><span></span></div>
-<div style="grid-column: 12;" onclick="sortGrid(this.id)" id="cves"
+<div style="grid-column: 12;" onclick="sortGrid(this.id)" id="upstream_status"
+     class="centered upstream_status data label"><span>Upstream Status</span><span></span></div>            
+<div style="grid-column: 13;" onclick="sortGrid(this.id)" id="cves"
      class="centered cves data label"><span>CVEs</span><span></span></div>
-<div style="grid-column: 13;" onclick="sortGrid(this.id)" id="ignored_cves"
+<div style="grid-column: 14;" onclick="sortGrid(this.id)" id="ignored_cves"
      class="centered ignored_cves data label"><span>CVEs Ignored</span><span></span></div>
-<div style="grid-column: 14;" onclick="sortGrid(this.id)" id="cpe_id"
+<div style="grid-column: 15;" onclick="sortGrid(this.id)" id="cpe_id"
      class="centered cpe_id data label"><span>CPE ID</span><span></span></div>
 """)
     for pkg in sorted(packages):
@@ -1374,6 +1525,7 @@ def main():
         if "warnings" not in args.disable:
             pkg.set_check_package_warnings()
         pkg.set_current_version()
+        pkg.set_site()
         pkg.set_cpeid()
         pkg.set_url()
         pkg.set_ignored_cves()
@@ -1388,6 +1540,11 @@ def main():
         loop = asyncio.new_event_loop()
         asyncio.set_event_loop(loop)
         loop.run_until_complete(check_package_latest_version(packages, verbose=args.verbose))
+    if "upstream_status" not in args.disable:
+        print("Checking GitHub upstream status")
+        loop = asyncio.new_event_loop()
+        asyncio.set_event_loop(loop)
+        loop.run_until_complete(check_packages_upstream_status(packages, verbose=args.verbose))
     if "cve" not in args.disable and args.nvd_path:
         print("Checking packages CVEs")
         check_package_cves(args.nvd_path, packages)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
