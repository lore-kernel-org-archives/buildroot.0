Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D784FC982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 09:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6298781257;
	Fri, 18 Sep 2026 09:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yino-taVyIq9; Fri, 18 Sep 2026 09:37:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 267DF81259
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789724228;
	b=i/snSsmkK7pGB591CAnLvcMBZCplaFR+c9elRxnaWkGucA5GLkAxiKlZcHs17MSQMXTz
	 jpaJUbr9/E6irxIdWB3Bg3mhlRHYGPFUXRMhVAGatZZsiuAf1hSG43WHz0f3v+uS8UA7a
	 bh1FFMICvvtlDUyVHLSaRrCnJLWCvLsDOJDJh63hXJTVQk84mtVxAmG1uyZAeU0Xq/vrH
	 wES2A0XypIMXaayNgGXk245Igcc4au462jbjfKy1ydixO3Klrdfu1PQQCQ3MsT8Kr42SN
	 8i6UY6xVoHs8JQPixj6n2sad4KJc6gZ96A2osa39IqUHO6RvVix3WZNCYxdeYiKhT4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789724228;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LPUY+5JxcHol4KEY3mVHFXsKlqNtnbB0YkM2kxZhTnQ=;
	b=D+fBg+CQ3j8XbS9HQ+PFDU5f+lYPKKCFdD1dJWOu6CG0pFvIclZYa1mzE+WMIbfXmZZU
	 riRg3QFkrjVxYsnTdV9dsL7NR3XIGRNUOYbdVG4TMnN1jCmqw2CXRRe9WdiR6rnHLFeov
	 kSBe1YjzCBoZ+0D0b13TIkVn0RIVNB0E4HilByIUtkwmKUPAr3idM/5l+AK6PhP8yV/kU
	 yfnegi0vSWanuhAvOCcO3sk8k2ST8HX6T92LQ6XTIdD74EvEMH33Y/Bo8T5ZvLHJVffFP
	 oFb2D0isDA9ypK0oczXjudajrj1cNUuL6TBPnfeDLW7zqK+lZPjl2g1otuUtgxQcWvg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789724228;
	bh=LPUY+5JxcHol4KEY3mVHFXsKlqNtnbB0YkM2kxZhTnQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=azsfPJiJAG1n04veIcskzHASqb4ZEVyrjog/mDKXiXlcOCtmBVr2v59NWRYSn0CY3
	 rxTghXoz0xgFg0Ixhi80pVcuOcqsvjGuCGL5E0w5nEum20dxEpdhUNDmBVj2laY3Sc
	 XhDy/KGvtMO57IZ+mvttAJinVjbQomUwcN45Dol2iFQdMAAs3fAPvfs561BqX2SWSf
	 eQ6Sa4wZHpAqS64prdsRqHpCZUZLNEgyCrRqerGdSW7YWoLgnYefKW15Z457N9TNiV
	 DEJn5ExyJsowGxCMRiWqFNwYNdrPLrI4QmIo8bOhylumnC4Ct7qPh+t7O+Xx+rFS3m
	 xLNwl9CboQ2qQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 267DF81259;
	Fri, 18 Sep 2026 09:37:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 307A4362
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 09:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2204040B24
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 09:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tF-BfMlpIseN for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 09:37:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6D73940B1D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789724225;
 b=qI7B6NW/c4wsNcJm6pdVf6oNHACuDHFTp0NnnQlkzJXHmQAqmMN+LF2MLo3rHiJ4xiNT
 wMduHu1MCnYygV6J7yPbdVAVVbUD+2snS+MfIG/3dB4T2CsSEtEcuvwdP/LKsWqKuBuhy
 G+w2n0MxGcd1WzQoxoxldY/BlltdkYZsVAgbDnf5UBAawbcXZ3it5I5HUwXOaJfxB7/5B
 VuGuqtbehPP6cpwkC2O20SIDiV8h4RfWZXsnZdIHwgK2MH7OjY5kMXxLb8UbIIXSlC8ww
 xW/+zq6wT8C0aHK4w9BdNd3Cge5BJ1VKtNfYwGZQAls6uT/odd1irmgPTmeDoCY535g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789724225;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=6TgnOH2x20seGBB9LleVZZjJ+OaCAVQ83gbKMCPTHL0=;
 b=LJbLXxW3UlAd2AlhTo8CXeqFJsu1rYK7dyGCFljM/3lxVjQ3ZBNMbg52eoa1k5Bml3dy
 FmW/3DMuHQu9fxc0gT/+NJQ/Ksu/CYtJW1aPJq7TJuAxBb0CJDVv/82J378xExiQ8qtYn
 Kl11xVMqbo9hT5ZhCTsi3tdkmBVf1bHeSe13K71GNMqhsLobQ3ZHA0mky6N+ewtnsgYan
 bbTkZdHwsFV1jR01cDx8NqAZp2q842r8Gpmb4xMn7lLBmAwJXB+7UVs/MWqmbUuVw/KZe
 hUfPQsTqVsou3dmDrz+bLDmU16uPQLtLR3jyd+uqkKvKkScp7fFaWTL3lCoxLuAQGoQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Mo+ZMYvf; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D73940B1D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 09:37:03 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48442ea8f59so688227f8f.1
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 02:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789724221; x=1790329021;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=6TgnOH2x20seGBB9LleVZZjJ+OaCAVQ83gbKMCPTHL0=;
 b=NpxXhmEGniz/uTnWlWUEs1BKWoA6PhnNnHsPvJ+MF4MBQl9b7SKwFBhTnGKBAtD/nF
 n9OQPLNyNpan0gVdIUBvznxlU2VqVYBbG65IMPIO2dt23C9cl14TyctHnrcEScUelR+T
 sItnNxz8yIotZfcV2s2otwoGHp5FQVa4RuHBBVjOA+IcZ7IK9YUmPueOPIw2h5kLHIXr
 6N7dj/gaEww31SldsDHh1rCddkKRqVh1PUhSnI61sJyq6ZHW4Puq756gFLUOg4nGR0OC
 gua+H4anb11AyU42HzajMeFxk0EdNG30AcN6MS4guRxsDZcmcJXUSiA2ymSMXP0REJjF
 wL6A==
X-Gm-Message-State: AFuF++mmiLIj+7SR3A+2ez329MwsQ2DvwW7l7g7oAC3UcdZ/Zj+JuKPm
 sRGo+GMKmwKEcuF7fNWiLixVlYdVhRLKj3DWxCaLuFcigMkfnKXPqWuX6FBWY2nx6hDQBx4S7AJ
 Ft2+o
X-Gm-Gg: AYBFou0qsNtA+qPfhL/1rAP5smkvTpeYdzPGFP0oMUzd2LLsgKbU2c125M7igTAmGBN
 1jASRz/gcA7ovQCsB5e+uDoeiVJxX0lUlMTcqTbgA4/KZF6NWYoD9UW2aL32ZmDkuHgb8F1YQ41
 WeBmtH8C+vmPvXdq96CXGukpikjcRJkg/MQtR/rw806KITcmk3OXoealDLEBuJiyF+jdDLJ1Bc/
 ZtG52Q+VHq7nrqxDZDkZI8CqaEXq4eqXLaDTKMOvD4ov3kQb+S47f5PUYEHCSwckals3wpsF64d
 9RBE3Si05PBfOqHS09FOTv59ly0UrNa6m3Wje1TgAtp2LggoE+HfPe5LTdcRQxgaFbW/oUewhkY
 4cwaA1+ea1Rcjra26ixj+0nOha5N+IS6iqOhgYQIn8QScJdfoWVFNoC8taJxRAb9noWU8PGxtjU
 sdaEd6mY6+eSE+e5lLb04tmp+0W/g5dV8OA4sOzMfZDapXE8wS9HLhyU7GxycrY8AA
X-Received: by 2002:a5d:6f16:0:b0:485:8226:c69e with SMTP id
 ffacd0b85a97d-48713c71ee5mr9466358f8f.29.1789724221096; 
 Fri, 18 Sep 2026 02:37:01 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4871feb5d9asm2849167f8f.2.2026.09.18.02.37.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 02:37:00 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 11:36:59 +0200
Message-ID: <20260918093659.85791-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] docs/website: add Texas Instrument as a gold
 sponsor
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Texas Instrument is a semiconductor company that designs, manufactures
and sells analog and embedded processing chips for markets such as
industrial, automotive, personal electronics, enterprise systems and
communications equipment [1][2].

Thank you for sponsoring LTS maintenance !

[1] https://www.ti.com/
[2] https://www.linkedin.com/company/texas-instruments

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/website/images/ti-logo.png | Bin 0 -> 2781 bytes
 docs/website/sponsors.html      |  15 ++++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 docs/website/images/ti-logo.png

diff --git a/docs/website/images/ti-logo.png b/docs/website/images/ti-logo.png
new file mode 100644
index 0000000000000000000000000000000000000000..94c8963a0f01d968dd56994223224779d2e74d85
GIT binary patch
literal 2781
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
Z|6i7_H(PXq2?GNIgQu&X%Q~loCIHUsI5_|S

literal 0
HcmV?d00001

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
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
