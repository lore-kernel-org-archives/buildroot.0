Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0A6C982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 11:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0589B40B78;
	Fri, 18 Sep 2026 11:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_f1ieH_3iJW; Fri, 18 Sep 2026 11:41:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 368F140B70
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789731682;
	b=dd3lFMLFhevMQGiX0clKwGXGTj5vuJIYhMoUC2ku0Z8iFLujZE/VPjcLZVWm7JuTi4OW
	 pxI0sBp92nPiUJsScUgzzRAC82myU5RUvEm+VfLpfvAbYsIuCVG4LONg/ofwxziW5vV5i
	 S5rrCVwWdtcal0TG0fEOYrndWQgS1Dl1aGEbybJJpfqeDGHv/8fwmjQcm0Q3wa34sEXtg
	 CvEKltjm75Lkr3GbeIapgBCx3X8db/1YeektqJtDGGAvnAdwCU5yovPuOrzOHOebMgBvz
	 fx9AuvA3rOsdIqsfqlYiSSTlW6smgYnYfzUnW7H+/IKajzeXHdJAowy+gFSloBUPi9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789731682;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DqO6eQ+P7OMeS/IVI0MEqERLumInkbbr+W9uDLEnzfQ=;
	b=ioZJAMU6SaRGqgYCCgJ5oFxcunZ8sBaSD5gkJH09pnnqGGESmxZTNRyt0irxibhDefiO
	 Xi7ttfHH/a4wPS2Hf3Nl9Pgr2ioDp4jr76LN+VrEsV4oj0JLOxJumUThnGxtVl8Iy5qG4
	 0oP7Hj//SG82zJGtxUBPsj1NZGOuvrbDoX4NKZajQSx9uB+mE+W93eNPGcOL8VmXjXQNT
	 j1Ik9Xs1+19VLvT4I5md+RAekLKCTxWQSdOKuzqvkWr1vDsqlfyePOgeEeS/jHwvLHhA5
	 ESHZsWEZ/Yi1QYoBWHqT4d3JgZEspbcgW37jCd7sjaemLO3mbK6wXBx/bO8m/vI1+rg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789731682;
	bh=DqO6eQ+P7OMeS/IVI0MEqERLumInkbbr+W9uDLEnzfQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EinyAEf8VjunA4ds1zoOMw0KAPw5CAFK2DOrnu76cM5I/0NLHemoFdxDZNl8aTUc8
	 m5r9C0twOZnn9ZD8ZYQvUjy+RYfcU3ZIIDkIYmaDhmz5oaXX/akP+/iNq0utRGejl/
	 PHVE+PtipzSk0cVxCdjFl3gQsdZGBCRPeeLJgZsRJVzBNW9JrPstq9qMagB2Ph3Dx9
	 exRYa18ac9eGI3GcCUer8YJE6TljmUPxQho/xEBihi0EKKOxUz+NiDFjsDZ9CPPSYx
	 Zb59WZtmc3mmtQIdNfUq97Y29yB6zn6OIP2pI+ivkq/OWmpFszkTXqfBH64CkCCPkv
	 GbWuOVY2P765Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 368F140B70;
	Fri, 18 Sep 2026 11:41:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CD15422
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 11:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F13340B70
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 11:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJW8ywhgvgoT for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 11:41:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5C55B40B6F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789731680;
 b=s7pWUFpoPCnK2wuRKlcbD6LUvTotEBsT6evpSPKkvgb1BEaMHqkrOjsvqE65gM5FFBn5
 K0yBhC8nwlHtE2zo0DIxBHRVXFPMl/Azizo3A6u6rBQ0s2LFAY9eCP3/tsVGw2zs/J9Rn
 CRx+DQYoZd9N5bfqEIJqKTGQTHL398b1r9HsIpD9ch5u7YAHJ+a12AZj8gGmlIoyAYCMT
 SnzBAlOMnZ5rxeHKbnS1AocTFrWC3HjVv+OPAejot4rXMJ9a+Gi2FU6gJCMfIy1rDjgz7
 vUxZslbnE7/Z+83GaWYUC9I53YCGsoaZysWxhaawVYWxTNr1LKpUIsQcuEgwV0lVYaw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789731680;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bmN232PfgMH76SJ9CuzVvNAnKkLpdscgdlZaTv3nxDQ=;
 b=fJI6531gGZFYZoH50ShQlLuzYv8sPZNEEtjiIqcejd1zphq1nex4+pVDvIftgLT2e7eJ
 +dYwzEziTt4XCM12VT8zZyrFdFgLdfmuuiX6VqjjS18FShtq4ltmI0ilpiLmKznNGR8DB
 kS9lm9UzadFLnnbuNYheZf3LraR422DpWa8w7TYbSqBN82liefB2vf+pg7BVCSkhCZ5a1
 3MnC/Bl7b2I8S1X52ck6spuyb47lUG0xE6NY4ek79r9RFwaB3XLsYc1BwhDYPR3i6svkb
 Y8AjZhPFoaqIK/jhLEs7v1AJ4bYepcwn+Eb92JmHDtLp5g4L2RT3j4w3Ls19cXoaFBQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C55B40B6F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 11:41:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0999197466; Fri, 18 Sep 2026 11:40:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 13:38:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35fdb4161039bbe4b8ed0c6e304767d7e1367004
X-Git-Newrev: 72cb1abbcd768c42333125b399b6598923bcaf59
X-Patchwork-Hint: ignore
Message-Id: <20260918114013.0999197466@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: add Texas Instrument as a
 gold sponsor
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/72cb1abbcd768c42333125b399b6598923bcaf59
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Texas Instrument is a semiconductor company that designs, manufactures
and sells analog and embedded processing chips for markets such as
industrial, automotive, personal electronics, enterprise systems and
communications equipment [1][2].

Thank you for sponsoring LTS maintenance !

[1] https://www.ti.com/
[2] https://www.linkedin.com/company/texas-instruments

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/website/images/ti-logo.png | Bin 0 -> 2781 bytes
 docs/website/sponsors.html      |  15 ++++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/docs/website/images/ti-logo.png b/docs/website/images/ti-logo.png
new file mode 100644
index 0000000000..94c8963a0f
Binary files /dev/null and b/docs/website/images/ti-logo.png differ
diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 02622babec..a26a316674 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -47,7 +47,20 @@
 	    </div>
 	  </div>
 	</div>
-
+        <div class="sponsor-entry">
+          <div class="panel panel-default panel-lts-sponsor">
+            <div class="panel-body">
+              <div class="sponsor-title">
+                <a href="https://www.ti.com/">
+                  <img class="img-responsive" src="images/ti-logo.png"/>
+                </a>
+              </div>
+              <div class="sponsor-body">
+                <a href="https://www.ti.com">Texas Instruments</a>
+              </div>
+            </div>
+          </div>
+        </div>
     </div>
     </div>
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
