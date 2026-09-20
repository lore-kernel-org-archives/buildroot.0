Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D31C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B2CC80D3E;
	Sun, 20 Sep 2026 12:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGTdGzV5nQIB; Sun, 20 Sep 2026 12:20:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DB47780EED
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789906857;
	b=gnkAfQ8smHOsCWNoqgBjMc1RvZDS5B+qQTqUjfT4etodJPvUmCOG9a7DgoL1UQxwQ2dU
	 b0s8yg8cHefjzP27SB2TG8f2J/6RAiwp04NfJkTvxLY8jNaSEJkjraUZix0xS7xmwcEMP
	 jZBgLd97wKSZg758+BSw6uM9vcTta+lQxxcMv4YQ4zMxdw7LcGzWHddOcDarVnA6UJQjS
	 3T+9rs5BTda41l3Ny0TRmKxhhq9nFgv/Wm2N1SJxoYf5Dm+hSCQPjHJuxxozdtC2McB3q
	 +/QelLo+ZSMLU9jmL2aodCIPlucs6u3whttIJjDsuCR4eEg7RSdNRrI5N3WDzYFqCwQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789906857;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+Xg4G2W6yuad/BhzFij/YGcPOftWF9rzoW6K/W9pViw=;
	b=Y8SxSekM8Sg8YkkORrCO9k97rJaLjobnfuZdFcG20MgzNBMH49u4pSajKDyU28Brp/S3
	 cF54FHKH0fzAsrD9mcLjsnuHdx44pUTd8PyE1+UGdzi6jt6k7jWeBzJ4rFHmrrlR5jKJX
	 v54bLdNsgo0UGcOdZtCMYc0VEqTJDhbxYeZZyyoxq9QCHx+dX5RXenkH6Q6PSEAKsxt2T
	 NZFX8x6PNvn4hHea5PGI/Z2Uh3+TToZ8PCnPM8NmMGn24qqnHdnJHJZMyD5S3iR0yELKj
	 9ZF0NBQQWjhFagyDI5g7k3A/k23ivMoOrFWi+aBhnycIafQoYgYpX1+HKbRohBG3/1A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789906857;
	bh=+Xg4G2W6yuad/BhzFij/YGcPOftWF9rzoW6K/W9pViw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mXr10rJwXGViHPAf48GomrVE5Ob3z57aMEEFxe3i4K79gWhses0Pi6kFtrj9+ex8j
	 g24JdX+eUY/TIe1qINH8lIcyJ6v7Nsfhk734nkgxj3Eq7+h/rthDb3Tr/h6dfGpWup
	 ijjpxyeGAwWQ1WVWECXz8WBvaWtaZKmfpyRm2NQJfk5FpL9nXSn+tvJoLYa0npOh2U
	 dOHEr/UWOXl2x5dVjRgJ0vHHd0yBKTxQdyuTQww/bjaYYkPz0XwzseSYJIeOHraWRa
	 WCu62pdd2iAyoNQixOydzYHX1xCd6qgXr2G6ahj4aaGpRWGYmCgpF3px9nNil06Xt6
	 U1Pw7rGNvRZSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB47780EED;
	Sun, 20 Sep 2026 12:20:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78C4F371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 645CB40AFC
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmuYbG8V50xZ for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:20:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8C8A440AFA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789906854;
 b=MB48zG/V0TJ3A46T2ETnwhbsvrqabtkNaAuYQGhLPLTfxO0gu5rnpLQTRk5/OEWoWk1T
 hqwOGpgaKSYaEZ/9AF0hqq7nDSsPL4grYi4sogK9Wi6+AkGkJrw/2+52hyYbJI77Pi8eI
 q4zL9aY8cs2c7NSoNoIqvPp5ySE0ckMj87LkARRW2BIK6MzUz5e5BQv29lTygw8Q5fY+L
 KNW7UGM6lT2r/e0nESMUBIGl1u1cckg2gEWjflwGi9SmnXjoYLeKYGa/WZawNc1GaXA/H
 /lPeGT3N/FDX34kkHYv+5wgXy/RgRDlIE2s9wjGuNdAhK/2pG284IUSdtVqcXkumhHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789906854;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Jc0K1sZVsjvFjYKwwe7QBdKb2mgJB8RxPe6f736ZXUY=;
 b=rd+7JMQjuXZeJx0u4lV5qB4Y7ssuRiIDaEtpjZmz7ER8VRjiyBgmX0vbuZHFPurJD+3h
 g6MohhTBd3RC10TQ2VBUepBfIse8ktHmTImU6CNIUoxt2kJmZJohiYr1AYJJGeiKVHo/W
 xm4NVDTlNBFf9hEf4vIFyBg1eH2OUshHgyHwgmP6BT8wHfjgAslL7VK0F4iLnkoBxoNe3
 gdSu44dzcQr7O1KwUp38OiPxosQ5UK3M+9Tzvfq4GoZDwgXI1E22da5EfKCKp+wZnRRQf
 lJm4zk+tc4reXXJZ6hEcxYi+/B5hTE0FpTkWs+JZbRUZyy+HltAABoXEz05XL1Rpimw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C8A440AFA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:20:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D41F8D764; Sun, 20 Sep 2026 12:19:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 14:19:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1380791af28bbec6aef9394c0c5184c1f9ba40d9
X-Git-Newrev: 95b1e8676c0eec0ca039e2554ed00d33258d49a2
X-Patchwork-Hint: ignore
Message-Id: <20260920121946.3D41F8D764@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: sort latest
 version by state
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/95b1e8676c0eec0ca039e2554ed00d33258d49a2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

pkg-stats columns are sorted either alphabetically or numerically. This
does not make much sense for the "Latest version" column.
This commit orders the column by whether the package is up-to-date or
not.

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
