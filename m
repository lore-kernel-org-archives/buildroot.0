Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33856C98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D907040B8C;
	Thu, 24 Sep 2026 18:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eFVfXh1UEX06; Thu, 24 Sep 2026 18:58:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9962040CAA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276296;
	b=hx8IIZcNqpLZ1n9HJZLoFHyZUodnofk3qFEZ8b1nI3PPGGcAbRbgqkfKgyr7tdrCZAKT
	 iXCAgXJubOI76zQHKSQYaBmD8ZkFQJivq/2XgtmYTJzMn+I8MA1QPKuwFUD6CM0gt8aL9
	 seQfaU2l9JQ5UujF/MaRlutKO24a0Hse97R1shJ+UiW1Jn5uQ5Ht4FsPWXsR7coS7nHJX
	 mVY3bdkzdHPqbV7FeybUijNFm9lfg9BN5fBNjJI1FuW9zqyaxMxU5EpmKl8HoKzIGp1Da
	 M4eFhURLgwcSx4kMujVIB+qGsonOtKL2KcARjq2D3K42CLY41gfHOaaiYkHdyxDd0iA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276296;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=mzA3qqPdFqiezAa75mijWZeG/qHFYlLdiC4vlV4x9o0=;
	b=U8SjdhrmabYyhu0bCYE6WokHJ6qkp1yemln/5Za4unO8GdeOpnhMiNn/dudpmSEdLkZC
	 gWX0FCzKtBCVUltJrJLD4aHg/crZDkQFoSj6MOXdk6SPR3svgeu/SmnhuFLuD+ho8hqyY
	 Q9/vTce5wRkmTVUPT+gxMZAyaRnQ9MjliRPqUIr/Bn7zWyVtP9X0Y0wpnGDveO89Zrhl9
	 UxBf6mV3kas+f6v0Lf5UWLPg8bQTVZR+aI4mjSCInwn574kWPGW/vNwCYpBPRIiCIEbhc
	 JJgWjk1SVwfnufFpZGQygwqp6JXPvZZRjqj4pHi+tiG3dhII+poKS/lkjjIbbxp5wTQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276296;
	bh=mzA3qqPdFqiezAa75mijWZeG/qHFYlLdiC4vlV4x9o0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LDBg+ggwY9juX7ZF7nIVbt7kSVbOObQbXWVAHhNtNoCWevMWn67IVcD5bufi/H3Tt
	 zkWrIjTMG3Dp6jKl4bZ8NE74MxlE/iEK5Rjgocne5s4/Vly7goG6ma9wYtEANZCo1e
	 nUcNZ14PH1BtEzcAfa7vJDtuOdWswD8Xn4pV8cNuY358ocn5XJDhqeoCp33wcgZRCA
	 5PpiFOQpFAMgT50YCp7PXdYY3bsnplBlrisAvwJve/SzP0t7UvAB5jxp5pLRUY3FEB
	 pQAw+KSWTaddEJ2BWvTGcszr7xOCNTAhH3bgOnqMSStySPoA0i/4G6e5XnVZwdeDRM
	 BDuggKbhluGmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9962040CAA;
	Thu, 24 Sep 2026 18:58:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A36EF328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9567140AC6
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OuoKcnd0Mjv for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6C24240AE9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276205;
 b=J87hpwQZAYoxP+w/lnJIZ/wJ4swDFwTYRO1e5aaovUhcfVkE/M3eg1bScd+0q9Q8lSOz
 TJffSQli6W0yqhDDhoJUMkLq/IBU7BP3abIpQzhIW27Lqbvew4XSjN60n09lSdo30Di7y
 LaG4fmTD+eqqn4SjyHK0Xc6jl2iLfv8OuWr5riLn5onUaH5ebpgw0VG9GNVqHE/MZVuNu
 2bZ06STGwj6cOqvP1kvtUM6tuoUUxgv5eCfqARFcYFEuLVVFwikpw+sFGNHqrS7IixyiV
 obdW0GYLHB855YtLhKLKue/9U6sqChdU7bO1kELn1161ciIRf5TeVK7DH7y5V2nIJPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276205;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DLRB815LWoQahOKQMi2Ko+ucWOuQ1yWrcC5FF7UBths=;
 b=iGqjbmD2LfTjoiX51BtdAV3rzF7vWpOgj/nXm7NF9AQsJHdQtQHAcmee4KBS2gOGvNKj
 xFCUd7gS2TvVgGPe058FxjbCmOvqOiYTpHDaPIQu/kPGJHtfg949XCJFr5A5LrIG68ydZ
 mS9rJXOFNZM5gs7xYHQBCQ2xhEY+ydaiXl+XIC1ksFrsIPsCiOb8tq7QTkkF2UyKRAajm
 0+758AMU9yNTZKUAfILwZKhykHC5aXnFEIK4sUUKnoIIKmsdCWL8rO78ZMH5/lWeo8tAG
 Zvi+CarQ78QmAzOMWZZ7kUHiJN2Ql07xVaewgAeLYr9467xdWnKl8QTW3pkcQtftDsA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C24240AE9
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E8D4982D9; Thu, 24 Sep 2026 18:55:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:36:19 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 917f03d0625bf0b8b07fa8b8c3f4ff15be4246d6
X-Git-Newrev: c69b8f3aabef79ed73c30eaa19e4fd00cca279a7
X-Patchwork-Hint: ignore
Message-Id: <20260924185535.0E8D4982D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/scripts/pkg-stats: sort latest version by state
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7953160297540599438=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7953160297540599438==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c69b8f3aabef79ed73c30eaa19e4fd00cca279a7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

pkg-stats columns are sorted either alphabetically or numerically. This
does not make much sense for the "Latest version" column.
This commit orders the column by whether the package is up-to-date or
not.

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 95b1e8676c0eec0ca039e2554ed00d33258d49a2)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 support/scripts/pkg-stats | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 2b2194b9a5..eb6d1836c3 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -44,6 +44,11 @@ RM_API_STATUS_NOT_FOUND = 4
 
 HTTP_HEADERS = {'User-Agent': 'buildroot.org pkg-stats'}
 
+LATEST_SORT_GOOD = 3
+LATEST_SORT_ERROR = 2
+LATEST_SORT_UNKNOWN = 1
+LATEST_SORT_NEEDS_UPDATE = 0
+
 
 class Defconfig:
     def __init__(self, name, path):
@@ -766,7 +771,15 @@ addedCSSRules = [
 
 addedCSSRules.forEach(rule => styleSheet.insertRule(rule));
 
-function sortGrid(sortLabel){
+function byInnerText(el) {
+        return el.innerText;
+}
+
+function byIsLatest(el) {
+        return el.getAttribute('data-latest-sort');
+}
+
+function sortGrid(sortLabel, sortBy=byInnerText){
 	let i = 0;
 	let pkgSortArray = [], sortedPkgArray = [], pkgStringSortArray = [], pkgNumSortArray = [];
 	const git_hash_regex = /[a-f,0-9]/gi;
@@ -786,10 +799,10 @@ function sortGrid(sortLabel){
         columnValues.forEach((listing) => {
                 let sortArr = [];
                 sortArr[0] = listing.id.replace(sortLabel+"_", "");
-                if (!listing.innerText){
+                if (!sortBy(listing)) {
                         sortArr[1] = -1;
                 } else {
-                        sortArr[1] = listing.innerText;
+                        sortArr[1] = sortBy(listing);
                 };
                 pkgSortArray.push(sortArr);
         });
@@ -1011,14 +1024,20 @@ def dump_html_pkg(f, pkg):
     div_class = ["centered"]
     div_class.append(f'_{pkg_css_class}')
     div_class.append("latest_version data")
+    data_latest_sort = None
     if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
         div_class.append("version-error")
+        data_latest_sort = LATEST_SORT_ERROR
     if pkg.latest_version['version'] is None:
         div_class.append("version-unknown")
+        if data_latest_sort != LATEST_SORT_ERROR:
+            data_latest_sort = LATEST_SORT_UNKNOWN
     elif pkg.latest_version['version'] != pkg.current_version:
         div_class.append("version-needs-update")
+        data_latest_sort = LATEST_SORT_NEEDS_UPDATE
     else:
         div_class.append("version-good")
+        data_latest_sort = LATEST_SORT_GOOD
 
     if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
         latest_version_text = "<b>Error</b>"
@@ -1038,7 +1057,8 @@ def dump_html_pkg(f, pkg):
         else:
             latest_version_text += "found by guess"
 
-    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{latest_version_text}</div>\n')
+    f.write(f'  <div id="{data_field_id}" data-latest-sort="{data_latest_sort}" \
+        class="{" ".join(div_class)}">{latest_version_text}</div>\n')
 
     # Warnings
     data_field_id = f'warnings__{pkg_css_class}'
@@ -1170,7 +1190,7 @@ def dump_html_all_pkgs(f, packages):
      class="centered hash_file data label"><span>Hash file</span><span></span></div>
 <div style="grid-column: 8;" onclick="sortGrid(this.id)" id="current_version"
      class="centered current_version data label"><span>Current version</span><span></span></div>
-<div style="grid-column: 9;" onclick="sortGrid(this.id)" id="latest_version"
+<div style="grid-column: 9;" onclick="sortGrid(this.id, byIsLatest)" id="latest_version"
      class="centered latest_version data label"><span>Latest version</span><span></span></div>
 <div style="grid-column: 10;" onclick="sortGrid(this.id)" id="warnings"
      class="centered warnings data label"><span>Warnings</span><span></span></div>

--===============7953160297540599438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7953160297540599438==--
