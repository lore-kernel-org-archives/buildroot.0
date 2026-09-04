Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083B0C79F82
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 15:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A694040BF1;
	Fri,  4 Sep 2026 15:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TEQXs-KJhWR3; Fri,  4 Sep 2026 15:33:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CBEE240BEA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788536029;
	b=po5Zlx0tsSLHqz9B0Gsx7LIo82BcnXB74xfQlFaI7wCpINPJW3HA9vrEFTdSavZurszX
	 LFBurPsOMoSDIydUTmmrk1lXNzFMaTCVsqUbC8bssRHK6m/VglYO612mVA0fFbWvMnpxH
	 MvKX94UH9HK9JRp55tVtOAsxeSYENCvDicI13bWeZDdtx6gLO5ST4DfgQPZ3fBvLuTpVr
	 tASMY2gTM55afSeOOsr9jxCrbn4iup7ir5f9pxU4ee3p04rEukw7UoPPR6LCrtadxJ8Bc
	 obccJDqk6NKQLQFCu+k4LHitKKqDgFdZeWPk/aNg0Vw8goxa3c4qEQtSgN4XrlYTYLA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788536029;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=HAOW+x2nY2sF634axJmrs1P4+2oZdTgl0xWnYW7m3Oo=;
	b=IInMRi5P7HkWRF/T6irGHJ3upgOmK9N4jhM2GfR0580boVz0/b0CMBhhbCyhrGogclnb
	 ixQy2vG3uzPcgqQoVBmpp1ltFKkpzF7Xte5jhM2IqDmNdt2XisES2RYM/Q6O8DdxFNhA7
	 S9ibypy8xT8Qeo7gi5w61bUtIMOiB0fSPNT8bJyCGbaqgMmHYfgBDuINll0M/QZATH4xe
	 zBY0+V4NpliD0G+yiU6jMMsmGwa7kqg91/GOerHJmUH7e7Lhv974TC/TJf9BmArqln0E8
	 5GXPhH99fpjmDPnLPJUmHfGi2dFptPdikf/rFrKaA9Mo6hHrJeyR9GXzUhIjm2km6UQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788536029;
	bh=HAOW+x2nY2sF634axJmrs1P4+2oZdTgl0xWnYW7m3Oo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R4AHB1XEqr8dr3m/MfONp6dGEYFl9fGRwGtMMAqVmOYjhiSZ1iCvxpBVop7nnxZ83
	 NIaW5C7ayYdVMgm9sXk4EA5La4p8NCeDanlxxu5HRaKdesuYqIq5GsVq4/5/kiB0gY
	 uKuiOymH5xaqdVYLa5kQFchrXpQf/s/Wai3JsGkRmD/lf4JJpviKTDIX7Abvhe2w1q
	 nmgmy+fe/GsmUlpGz5JPUyE/QbKVc6m9Sn8NFjFTY1Ql0/Cv7uYzne/IUVsHDIQr6u
	 zTmIHkeyHHK7SBzb6MJEzkDbP8AOOtKLYazTlpIX4evNaaCHBlYN0AIb36P7yjFt24
	 AzEr8y51YpLkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBEE240BEA;
	Fri,  4 Sep 2026 15:33:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E98413DA
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 15:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7A0160BFF
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 15:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7qETgmv3Kwcp for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 15:33:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3C6F060BB2
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788536028;
 b=jzzQKjWGISVWUrw6ZgQ/Ly0RZ9KsLGapAcTZtRIq/tHSASOPI3Qd9fEm/rFJnfXxIHJi
 7X+xcbGd1An+rAVlOVaUAw2MODqWjXEvVbMiDiq73wHUijhf9V6vJfaHpcrHS1/DO7wNe
 1hZgDoXpK/BeN+pMAMJ3BN5mmjyie58Ck5iiGwRpcRbjtRjmFkl4co2gVe0mOP/QkxnN8
 uYlw1gfe5CRgaFFyPSG/zNMo3pCxVrR699kUqHiJZ2V4wyEXYq1kqAw90zDeHmXeLGNPd
 VWLABgE5mb6EssINFxtGtXpZZMK2yz/ldcu+1j6BhMAM57mYbX6Pru3biWfJvTiOwxQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788536028;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Pq36fSaab9aW+oUTfKOyMFwg3RA+AGLJTSJsnMxu8/A=;
 b=pcZpRl5o+sKqup+OrrpiDtzpkLY8NNf4T74f9r4D4Mqkl596nOEXsYlK38sWgPc6OkUf
 bR/Z3quHYYcw/pq4FzfYdVihpn3YnsiwSjlBJNcT35FB5HsGykTao4ZcFDpymmeob13vH
 pY1Jzf2tMlNhT93vw7hvnZmaR4+vcQSNdb8reJLhrokVcP1qP1QMr9rBR6yhDqoO00K7u
 SMbbSmdqerAobTwWMgr/6o6nLqEjfgCs5/6l8iBp7WA7QuYGW8rLI0ipn5QCWCJZtRsfw
 e3A0BE2nCsFkOtcG31sazLQi7rXi2JFlekOtD+kSRjRmDyFM9AWRACWiIIhdvhexiUQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C6F060BB2
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 15:33:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F70094702; Fri,  4 Sep 2026 15:32:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 4 Sep 2026 17:30:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05ee0ab1e0a52cde42ce8c3aa77c980339b906b4
X-Git-Newrev: f3a1c36e84d1564805dfc02f85d6ba03a962f2dc
X-Patchwork-Hint: ignore
Message-Id: <20260904153247.8F70094702@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/news.html: add 2026.08-rc3
 announcement
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f3a1c36e84d1564805dfc02f85d6ba03a962f2dc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Was missed when the download page was updated for 2026.08-rc3 in commit
e6b06b8d9c ("Update for 2026.08-rc3").

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/docs/website/news.html b/docs/website/news.html
index 4a4f2a3061..340e302c79 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,27 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li>
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2026.08-rc3 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>29 August 2026</small></p>
+      </div>
+      <div class="timeline-body">
+        <p>Another week, another release candidate with more cleanups and build fixes. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08-rc3/CHANGES">CHANGES</a>
+	  file for more details.</p>
+
+	<p>Go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2026.08-rc3.tar.xz">2026.08-rc3
+	  release</a>, and report any problems found to the
+         <a href="support.html">mailing list</a> or
+         <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline-inverted">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
