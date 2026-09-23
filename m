Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51906C98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 19:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E7F441280;
	Thu, 24 Sep 2026 19:00:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fGlBUjh_0G2P; Thu, 24 Sep 2026 19:00:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 077CF4127A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276406;
	b=c6a71m/GMjygNhDpMI+jeMXvnnHVjLnk+d1tBCAfDeV49NWPsGEVYh6b+xNbypYewiKc
	 pfwPydK2cdw1lbdLW20++BN4lRUiJ6zMYwDmGnrADYs6kTvr0e7F+lCRp7S24PIe+LjRB
	 1gIp28cMXpXW9LOwZK+g5O9p41Q3I4SIGHuo+j2c/Y/SqTTrgELO8CojMUSGma46OMad7
	 G4no757+X7hu+THGcz1fdl012X4c4+E/KmcAbEwwPg3idyuzAeEgB44MFh8IVuoUVjV7K
	 9bDmoTG1DjffA3HzcQFCjSd8J+09VMAO0yZzSb3hBr4PUdS5McAbvq+d7lydssNftpg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276406;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Iq84MexI6ZM8st4FfAUv+APzNh+xAzXrK3tjvPqis40=;
	b=NcEhbB+ghmh+mq9Nq2y8yHF0SdFqaMLJelBBgaQYyhKxOqA1UTqxggLRffoQ05MDNKfY
	 NlOVJfqJ9bMBLuMj8Qbs4NzEhoxDV5yzOOPNVG6j4DAaqMckIDocWuwO85KH9LtU3uM4i
	 TVM0mvociQSqz26DUSloHx9r09xr3DwVsAIfWFfWWSrPBbFKo9YL+eTe7a5VwQYnKQzJ9
	 1QTrIstskeKtAnTNiEXxuEgwMMKIanUUUdytv1Jksnj145KxygLyAafIgOU90TrcKqBq7
	 cCunZjSw8Q0m3pPjsDCLOLsx+uWAqKgs9Np1YjB1ceGL+c6bZSp/o3Up4jfrQjOwRmg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276406;
	bh=Iq84MexI6ZM8st4FfAUv+APzNh+xAzXrK3tjvPqis40=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Yc3Ueb5JrmAWtekeAU/8LVp/b8dGLAADU4lo3pSlrqSdIvZZwKvuHJUnvgJpNVmAX
	 mNgl2KJVsjtG07/3Ce2nGz91lDXMZSS0nss/1kvxtN1lienwck5exd8UHXeLfWvLvZ
	 p3A7Ys7553yuYonQ4duPPt9YilbRTPQe3AYOp2IhiXFBm1Qd3H1l15EWBsEK2jgVLZ
	 qyf1xIzmuLfA3mxst3ohfK2i+MYVTTS++Cy/yn3rEgJ3Y8SktsdpXGRZ2+zMAb4Scq
	 GS2VzNuYI3XrYjj1PlEmP6gQxZZNwgdV5raMt7ru38aVOfYB/CErmM5590mkcviPY8
	 OaaeW9UwDrHWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 077CF4127A;
	Thu, 24 Sep 2026 19:00:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F12C328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F9B181218
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wtJZlveQAVnK for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 570F081069
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276214;
 b=XivESNEuOjUHORgg0i9G/6/ASUxRTI5UbinNWd6n+yKke/VruqGOulpLXSEOkcj3gQ0I
 pIjn2Q3Mu092C/otdHzR0perKxTku9wpBtt2Y0GiXGK1TJrbn8iD5m9OTbQFn7Sw237aA
 tUEkazZvo99VtkvGQt4gEnKut6mo2pZ2Izn9FWFixUFGyBChAJnDGw7wb2iQ/Q3h6+ILJ
 3ayNLX7CX6Dp86/VnHtFS2PIvJRG8HV7GJeJqTHQL0pnZBB5zk96IMvks79ZORjzsPtAg
 bi9U0zQ70EZGNAqZI5MaVUhZBFUri5/QpvQ/S1Owltj6dai3QmhOyqd45YQYhfsQn9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276214;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nC0hEozz2w0g6hDPnN8rjksROYiv0NJ7J47GlvjADhY=;
 b=JLf/jZ3g+m/7TeyP+NNwkDM7ZSgwFwhnwIG0XrbjWhGa8hn860zEVfxg0b9OJ2MqpZQT
 b+pym8FZbwohzGArc1wTsei9fumSLTRMeU8OQLNvKkOguE+lj56w7aF6pazMcoLg+uJYf
 VJCHWOYDDCeFcvGfs0jbjnEBajKlNyDD+3vLJUJ5AxAlbMIsbFA2Vq6A1exKRCw37G2V1
 uQjWKxFysFtxsaTqQiU02STl5KUh1JRnkwm2nutooEvpGYXXmEX/nlVPoxxqkVd9+z7Wx
 qxTEy+JVnsaAjDM/6lwzIgSceTPbCyT9x0mmCPGsaSBTm9uPmtDferliR+X3W8n3eIg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 570F081069
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF7A898323; Thu, 24 Sep 2026 18:55:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:36:21 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 7f43f542321b2438ae0b53b2c5874e8578061950
X-Git-Newrev: 96ebd145061f0b83e3deb7c99545ddbfae34b97f
X-Patchwork-Hint: ignore
Message-Id: <20260924185543.EF7A898323@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
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
Content-Type: multipart/mixed; boundary="===============3430843474022688598=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3430843474022688598==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/96ebd145061f0b83e3deb7c99545ddbfae34b97f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============3430843474022688598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3430843474022688598==--
