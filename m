Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63A3CA5FD4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 11:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89C4E40CD5;
	Fri,  2 Oct 2026 11:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fCqmaKYUGkVj; Fri,  2 Oct 2026 11:30:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 99A3D40CAC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790940627;
	b=c3sd6Kii0wYsTYAlNSqnPnbI93M28OOkvCAbXcPtN0s2UFvBUoOozkvTEPKb5ttOIJtG
	 S9zX1NuUS4w52o90sQAkKVmdHjqvjpQlCLoXHDFPqE+O9IxwXrKuGbQiFGs7qRXJocTz2
	 c1n8X0XA0sCs9HLx7NSB5O0lM76ayAS7opeqovEB494GQKs8S+r4/BcERRTATxUvtIodQ
	 rGGYfEJJEPTZj/8DSHUk5+Jqw/r6mnhCjOtPAa/72lLaDwpfAJcvWGkQgfK8ZoH6FICWA
	 6OSk13bHrVVPjVdg0IUaneyECQoR1sHJqQMaeCVPZFnBBS9lFN1Bsfg3huCDEAjQ/XA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790940627;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=azYys4jFcSW0lxQ1YVkWNYT2M8Ah6qwGmyUfOlWb2n4=;
	b=BiV37MH8gEkZq1U9h7RFBgYYEhwxbvKiYkQnMMv+Ayi00X6pujAiH9CRkb2cSfmV//mN
	 rPIzuJg/zb2lU9VeCVgdyrDe/lFmzX59RU0BOPycoZg1khLoeB42AG3TCvMVISRTvJnya
	 OD21OdjNrxRYiXj56T2DwuCa1Ctux9q6Btti+dh2bbRQ0D3mCDNGHSiLZf77R35ZNQImu
	 SbHJyv8SLN8OtOj62uLQy8xMOS0IFFOiHz6nvyTPN1/ND5IpkWmGHm2L+uFEF4Vzcu8BL
	 Z2CdD2z6zLy9C1vhj+Y6RpcavLqojqraXtuq8sX5SW59LmKGQPllRrz+qLUZunJ1AnA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790940627;
	bh=azYys4jFcSW0lxQ1YVkWNYT2M8Ah6qwGmyUfOlWb2n4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LsHPc94eHno/QwpR0+psWlYDZnHGCVuT4PC48+KqtgqDWGzfGR8xkEIjeX9S+iPTA
	 goPl7nuKIwdJE1xcRnz2lM+246VOAJjC7+K9Q1f8rKYyouSoL3qrXYkZ92zJWdVQnn
	 51bGxAkjJgwzDN7VgLPjQ4u2u20oZ1fXltSwob992X3clFkeE5/pvt1QDeIL10PQM9
	 2vs53TlZkqDglxfdQXL3+RU1A7BwIW8KJEMDfm99QJ0+WivvmB7OwGTNorJAYPQINO
	 exi1adlEzvAEZYvOxhiIZSy7FTGOIuxiHpDWUSSJ0ANBlVkT77tJmbH44VltwjAEW2
	 vdpayAb2jl2zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99A3D40CAC;
	Fri,  2 Oct 2026 11:30:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12EBB32F
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 11:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB85E400B3
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 11:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tL7CwcvtILMD for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 11:30:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 36D304004A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790940625;
 b=jr9djAkmQFdGmrmAx44OjCvaCM0gXNNSnDtQp1tfEZFGYTmGjlxzZaZ3oTGYL+i/VD65
 Cu0AobQxG36oXIAwEOs+SgQtIEcXpnB05gqmn4LgGjaAYM1fr0p2iXcXL4wy+ICTHlK/w
 omyVaoDzkehjTa1dJLsdGkADOV2IbYE5+1DgnIeG2j9xQzPElfRWQJuaczvBEDfohkqOu
 M5z68clhEn/rqM6Vtad1w2nEuTL2gwUHT635z/KmCsIQRrCkhNNSkyBNjhOp7JxlLqNHo
 otSfFh9Pz4Q41rPLM+tk5wQHLY1rPoot3aTYO1XnB9GhfcRoSZaz1Z4Nkq35h0PAakw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790940625;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ITo8UfKczm+BqThNkuR+zm7u8TKJ+EODAtaK8h47v5E=;
 b=lr/e4iytBXlkj2a83lMW7KRzUhI7oKq7uAdAT0cahVSZAIqq4flHQcoI+BnLoerwok8O
 3TopSZ+WihxXf567Zz90jE3XM+Gls/wT3bh+4IoVUDrFqg/NPOu3ZHzABv0hiqxnURZ98
 miyuyKMCx9WtR0Ep3p/B9u93MyjqQTnRseRniKW0wZsBimxQxTHoXl023W3eGcnWH0XZD
 i7Tgu3MfA3dUNFyn2c2w0+kbK0/J0qpLlphZ9J7qcmLYVz05RfREi3s1n0sVpGJSvz1zz
 eJknpcUG4DnY0HN2TqfKvVznQn3FmIHtCcP5lBGn7zcLhF0GP1D+71B4jFgSJOsQAQA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36D304004A
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 11:30:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00440885A4; Fri,  2 Oct 2026 11:29:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Oct 2026 13:28:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d703573765eff4fb658fb660ce9ab029f5ef1e77
X-Git-Newrev: d0b92359082ca48896038af7cf47313eeb614421
X-Patchwork-Hint: ignore
Message-Id: <20261002112911.00440885A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/sponsors.html: TI is
 sponsoring the Buildroot Association
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d0b92359082ca48896038af7cf47313eeb614421
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

We're happy to welcome Texas Instruments (TI) as a sponsor of the
Buildroot Association.

Since Armadeus hasn't (yet?) sponsored this year, we replace them by
TI.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/sponsors.html | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index a26a316674..2a9606e23d 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -157,24 +157,23 @@
 	    </div>
 	  </div>
 	</div>
-
-	<div class="sponsor-entry">
-	  <div class="panel panel-default panel-sponsor">
-	    <div class="panel-body">
-	      <div class="sponsor-title">
-		<a href="http://www.opossom.com/english/index.html">
-		  <img class="img-responsive" src="images/armadeus-systems-logo.png"/>
-		</a>
-	      </div>
-	      <div class="sponsor-body">
-		<a href="http://www.opossom.com/english/index.html">Armadeus
-		Systems</a> financially sponsored
-		the <a href="/association.html">Buildroot
-		Association</a> in 2024.</div>
-	    </div>
-	  </div>
+        <div class="sponsor-entry">
+          <div class="panel panel-default panel-lts-sponsor">
+            <div class="panel-body">
+              <div class="sponsor-title">
+                <a href="https://www.ti.com/">
+                  <img class="img-responsive" src="images/ti-logo.png"/>
+                </a>
+              </div>
+              <div class="sponsor-body">
+                <a href="https://www.ti.com">Texas Instruments</a> is
+                financially sponsoring
+                the <a href="/association.html">Buildroot
+                Association</a> in 2026.
+              </div>
+            </div>
+          </div>
 	</div>
-
 	<div class="sponsor-entry">
 	  <div class="panel panel-default panel-sponsor">
 	    <div class="panel-body">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
