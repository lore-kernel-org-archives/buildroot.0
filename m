Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5A2C982D0
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 10:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B58D180ECF;
	Sun, 20 Sep 2026 10:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TzARh7YTRBxr; Sun, 20 Sep 2026 10:56:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BF16680E9E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789901775;
	b=i9Z5CqLeTvo4/m6waR86ktXOGAfEiT4i3v00MB6sHPPIOLzO13wccqFKRHuS+nZHYAB6
	 MOfslmWKKojHa4UBF25vFWE26nNCYEWyQgrM34qggdPwuwvso+2BZlSCjynVSSQEvFBZR
	 k1aIzMScGs92f1C6G/dfrEWCIZjCxiKrQyCaXBgOJdNhlQJ6ZrWkOGqz1fVgCIIbt7OtJ
	 Y2LzAkrTjDxIBoTlU5oIr+Dsnwh6JNb0XdB+r/jSRzQpOXDzNeI44d2q6YqciazuojqcD
	 qGAOtNFxDdIh5Gk8mcu4Doc0J5RHQjNFq9DK8wapzxGwHYR8XUgG89ePqgnxA41Y2Jg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789901775;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=M0+t8itzBSoNTov3m4ov+IaQapRVcim1ujK3yejvIpo=;
	b=X0Lc1Y2MxLFaBwqYDj8/UfSIiC1DChhj9P3ZhIeLejjoQt5iGXM1Gj3625/jyYu0kJ3W
	 ulvxL72jQN+ZxwMslis07o4qwV2VzOnLK2aDaRCoYwsgMJMf9eJfZXdi43LDVrLs7l6ZP
	 J+p7JyQdJ81h6/JKrCRB6o6R3n5utVbGqgW0wHJIvnZsk13Jputap7nM8xHYHuTjXr5kQ
	 tmZ1Zd7N7RiabjUKFhd7EiF2mw6/8wUJqG1TqsNaZ/G1WcZdk4CosMm9Jdy6cUEMxfGfc
	 gV+CU452PZUPe6EmaFyqlZ/3HNgYl+PHHRkXzSPzvfL+QB2NUdzklFlbEUTIfy6tp0A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789901775;
	bh=M0+t8itzBSoNTov3m4ov+IaQapRVcim1ujK3yejvIpo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=atauyY1hSNEg74UgnprmGqG4657OT5yaxF8OAK+HrfxaY48XNcD9ta4h3W7kp8pRf
	 jILQ1HNvcDWrSPI6XeECOfWL/wWQV19KO7jux8rcqG8Q2+vbhO136vBn0KC9Os/tet
	 B922OtbS01jLfNBMkHuSRlJMp7iyEas57FR5C6spbWYrZb4R7gxonj4BxeL1MuT3O3
	 aAdZuRHxA94cbLq3miwcQLKsQrp9t2BmPcHLEOWFZISqsqDMV+UMUMGbfS2rLzsuEu
	 +4FiJdSO7yGku4y+xgm0sdaBNfY9y2FyYExqdSH/puYTY9CkKldhaWqHwhcxhBSYrs
	 cDtZgKYrXd96g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF16680E9E;
	Sun, 20 Sep 2026 10:56:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FD0D224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1207F400C7
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ej3qrTkIvuxF for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 10:56:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 1791B4005A
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789901773;
 b=YOIvllSGhboOWpNzfeUEpD+tydMgCSZEhXq5QJk6mxazmzBBAxoh3VadP2A/VNLw1c0s
 p3YG1DlZ75sKbl6eDWs1e2YMfrSNoP0AxCSie1JkWAny16SAIKrvgzMB//JTBy3GQIc6z
 R/fBoyQ7/ym0xRs+y2Afme6odT9yIAmnPA+sj7uAp3w793xfVvsDUmYLhuOicQBxEt4en
 esjby7XuOqfgoFnXrqoL3B8MMbWESC63Eez/mYQ+a7OIOphdk1s8wVoHxrxLPVc3h09VF
 ovyQob3j+kSk/DzDZ1JT1xKYMHvxq1swmDhim8gMDyBQS0ENVbvb692tcXTo2o+0RGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789901773;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=m3AOi0HwPV1hFi3+RptNpx0GyEvBOZRdSqxYx2BRR68=;
 b=WdqAsd42NapBlervzhMhQZ6vsupJagGy2//B06OwD0l6ur+1GeamRN2KDoL5JX78Nckf
 1OrbdBykTdxF6rlsL0tlc6sBQVYWNYU1eZ25MxQ9xxr31JR50IUA1FDgrIaqqkileJSac
 I4ks2R5mybWNM+s8uv92snQCiLOVQ4PNxgFvfU3Go1YxUhi6hs/URTq+iDs9ImWnpIESD
 zVKHBTBRca7Wu3YtBVBogH6rQ5aQB8VYq9bZIW69ByFMSIuvTT4nHCkt/fVlaS/KyoVgS
 DMlCkAHU8A9RaPlEN2K+JMs0iepPMYiR4w4tGCMFZrOLkt/PINizgjTpQV47xxlpIGQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=VANRh925; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=fbstachura@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=VANRh925
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1791B4005A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:56:12 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912d37b6so8775385e9.0
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 03:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789901770; x=1790506570; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=m3AOi0HwPV1hFi3+RptNpx0GyEvBOZRdSqxYx2BRR68=;
 b=VANRh925m9rqfEnm3tJTz6QK8oKqzuzi3bwrc5qZmH5+KvQhLSWPCWbMBbMkdBxdQ5
 5LYvVx/w0BhoeG+CXiG4mDSeR3WvmBRF8/uqYyWZBe3c82m0dq0l6FNd3wXC81A628/6
 C/mmN2qYnvO6wd+0BLTxk8ThT8puTgqo8l+4LF46V7vyins+qbCby//sUMgcvRBUmiRC
 bNueDmxEGbC4s7rTPkctHkNV4bd/yoscwKVSeUOFMuVSnauiPHGbGotzpg9HoZDmSmlK
 zcnqPT0JrgIGGuf9Pe2Sv5/z4HdgCKUdAFUdL+Pa/TCfxW6tdcTCSlOmKNwyEJ/2QD9Z
 35Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789901770; x=1790506570;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=m3AOi0HwPV1hFi3+RptNpx0GyEvBOZRdSqxYx2BRR68=;
 b=mfb3qlutaGx4NbpJyY+oms1oLBRNVKa/3yEle2HgtWYYU99ZvQyGuAXD7VxzCCqnkm
 LYJZFVKIFr3aJUg1EQU1TipB38fiznUdKkl0JEt7gpZYELbiMjLBeYsnyL0uWmQrlgYl
 pHuXJgBPWz8Lj566s/5wHhKfOOk2mLcQAQ9NbUCCDln7dQpIQjS2F9uHjIQAHsfdCW1J
 UJ4kp9DIhl5bTE2QIjYAZ9fbOCryEI9t6nkAhmfzqveMvcOz7hcoB0mNHtUuJVN2AvZh
 +GGiGwpmK8vIaOr5AKdtXSsCutJIpfPFT8TgdUL81eWOE7lqZkJWaI7I4XSshdnZS8s/
 0Q6g==
X-Gm-Message-State: AFuF++n8UGkInMCf2RWmgdXqK8zJSEIhBkU1wBm78+hqYz1f90hyBcJx
 sxQ7eVd45c4pzMmzv9JnSn/lR+I7iHtBd9yE8yop2dAMAuJnbcFCPXXfELnXeQ==
X-Gm-Gg: AYBFou0y3p1d64lhs1S+5wDSoLJkjghT+TUN74kdHeEAfBPN3yP4RiA0inqMknW6KTh
 lvUW0ttXY77fLlBH+ocmFGnqNzv4UvaoEP9lJKlj74/BJK3ZofCsQ3Kpt2wrrL+n11DA4DFpLSL
 fcSk51az/A8lJCxDM485tR1CiP/lCINH28FNSbkFRXHsEYucxTPQdNqs+eD8TrDN2B7/GUBNmUK
 wU9hIw1RbskDMJVLhP9NIoQ77vddglItOnSdCGtkBMwBI0pdD3D7+efUNrFFFM/SSDvBoMcBTQB
 6EU387cG6z3uuELyWXClO73VPjk/4RELPAU4qmD4afNLYfcAlxCJ5ZUqDjbRd2pIOO5g2tX0iDX
 vAh5niHvDoFSSZPkUkiWReDofywb6SBACzN6FDexeW+dgOY6GJhqRY3t0BiATZAv5IvtVPj/SR+
 fIbXkg4kgvU8aBuefbNgkcpcg7xvFHdu4SOQ1tuiathV7xmcjIWAF95LWmKroD2BOdskDay8sN/
 SMBAO0zkCTJr6xGBayrS0xMAGHKhG/tsTSBKQrIhHbNvcq0mq+C7HSMvEhYxAuyg+k9GidotbU2
 mYk5wJhoTszAso051Lm5fB8R0NvZ8KKsjtnjutNMaA==
X-Received: by 2002:a05:600c:470d:b0:49f:ce78:356b with SMTP id
 5b1f17b1804b1-49fce7836bdmr48196055e9.28.1789901770119; 
 Sun, 20 Sep 2026 03:56:10 -0700 (PDT)
Received: from trial (user-31-175-128-13.play-internet.pl. [31.175.128.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fcd0ece6esm193464235e9.2.2026.09.20.03.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2026 03:56:09 -0700 (PDT)
From: Franciszek Stachura <fbstachura@gmail.com>
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>, Franciszek Stachura <fbstachura@gmail.com>
Date: Sun, 20 Sep 2026 12:55:54 +0200
Message-ID: <20260920105553.859978-2-fbstachura@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: sort latest version
 by state
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

pkg-stats columns are sorted either alphabetically or numerically. This
does not make much sense for the "Latest version" column.
This commit orders the column by whether the package is up-to-date or
not.

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
---
 support/scripts/pkg-stats | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 2b2194b9a5..842e78f8c0 100755
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
@@ -1038,7 +1057,7 @@ def dump_html_pkg(f, pkg):
         else:
             latest_version_text += "found by guess"
 
-    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{latest_version_text}</div>\n')
+    f.write(f'  <div id="{data_field_id}" data-latest-sort="{data_latest_sort}" class="{" ".join(div_class)}">{latest_version_text}</div>\n')
 
     # Warnings
     data_field_id = f'warnings__{pkg_css_class}'
@@ -1170,7 +1189,7 @@ def dump_html_all_pkgs(f, packages):
      class="centered hash_file data label"><span>Hash file</span><span></span></div>
 <div style="grid-column: 8;" onclick="sortGrid(this.id)" id="current_version"
      class="centered current_version data label"><span>Current version</span><span></span></div>
-<div style="grid-column: 9;" onclick="sortGrid(this.id)" id="latest_version"
+<div style="grid-column: 9;" onclick="sortGrid(this.id, byIsLatest)" id="latest_version"
      class="centered latest_version data label"><span>Latest version</span><span></span></div>
 <div style="grid-column: 10;" onclick="sortGrid(this.id)" id="warnings"
      class="centered warnings data label"><span>Warnings</span><span></span></div>
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
