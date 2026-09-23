Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DA1C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E75A814DC;
	Thu, 24 Sep 2026 18:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v2ubaPv6Ve37; Thu, 24 Sep 2026 18:59:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 56BD9814C2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276385;
	b=pRqEtMzejkK6HDZPs0UaMyTSFap//rLIKxRzNTVpEFFofcgFqluHkLq3vzG/ve8Sura6
	 v5Cs/d78IN4ZQBwELY6d7K0I/zxI6DrCPmrkzOSv6npMdiH5K8GTMVDqf2sMDC5uPUE4N
	 a8ARBbnfZSBVHH6XZiOQaFKDLdhHyMcW4JXPMjWnvHjR/YdRcJYwV8f7jz5GvYQcX/LEw
	 t1kv306FzJo32qq9HdxSxyKOW1P8EwDV8QaV2GWHUXAdA/ugmjZyBGRVE5I7eRY+0T4hb
	 WE0hE17st00uEnHXI0lrnIttsG4idgcToIftaDQy8UpJJYkZzdztyFGJ7yZ/yWSYJ7A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276385;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=s2ghdz4/NLc3rpEfp/SVFA7FoYKWjhL3MKImC4k9vjI=;
	b=EuNYaZ3JB4dkNSGvGQOVJ0euF9M+3cRkLjqIhZq9lF6EbWZxMlP27oKsWysyV1riC+J6
	 c8YRcU33LrzyzSF7x9/vUVHPWDcatOxdu4a3d59aQRkZ6MTlpXtlIQt0q8PMxvpi1A1iB
	 9T0kJN17ItM4p+WrU6x737PBe2yLVXOQGL7q+SlAJJ8e4eHXah9whYYwqRq+0A+NkM7Mq
	 Yh373qIBnBZQvDgCJhSrOnNEm0duNFOUHx6erKuHjjZsZuvEKSF3JpYuf8hCtOfwTHcGI
	 hTp1Y4SfreAgl3m2ceLKir06kc7V7B/ifZfmBOEOkfPUVfRj6CR6OhCMNP1hHzyjD/g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276385;
	bh=s2ghdz4/NLc3rpEfp/SVFA7FoYKWjhL3MKImC4k9vjI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Af5QPt2dfwXL+4mSioEXs4avpfwmZnU6Amo44LTK1AMnAbAJC1D7jO/D7Ob/ZJYl9
	 OCDGfoZt9VFt8IufRp6Bo4u6iftP+83hR4H11GKJWoCUiw2lJwWHJ+MdCYW7zIVnO5
	 NTxo9Yis3MoCfeMn1/fjriaEXl6Ori6L7bOOvyYYXmsf0Zl+EYv0MwkvUnJOaXiCKh
	 Y5301ZUuN7VVcT4dJQr8TCJLh1L/PhOPGqPpO2vTOMLV0LvIevOH1K6rMkaHJBuljq
	 6jnG6M1BATg6fz82h+FZxbvbs/2+pcpK6Ar3qW9BfpdF3cBH4lsi250Vk0UaxUMfXv
	 ckXpRPUJtbRzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56BD9814C2;
	Thu, 24 Sep 2026 18:59:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B25E83B7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0725404D8
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_pZd5EUm1hN for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D3B09404C6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276213;
 b=YjtXamfSgih2Rcj1T8NAGnMBsnDmB273euNk2dFaRLEt5npF6Fga2fEjbdZ0FmsVizD4
 fVtjPqALhkvpw+XgtZ65CdupP53gQQoxeQVYF4/KlcAhAPGvhrLwkg6+cbaidUe1DzOZx
 /K0bzPYn0X7c/3Rj2b/D48gX7HB4lEGZXfxMPJNS+UXAzd26om9kVSGiQUTREqlXYlHKc
 j+y0kx9KS5c5X1V2wv0vRJUC3b5jfDTa/Go5HA7HYSpJh0r1j4zaOXIS5MwrP8cb4sdyO
 D8HF73YxuzBVCVLlWDLPJxQqordoPCADc3Ppka6lir5fBpbLAMHIVVUTDPtee+ctmRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276213;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=I9cCDgoGkB7T6Wtfr2GyrUUCZ351iyjGBMqR0Loi15w=;
 b=M0HrrbimsK5oyRy66RFz8SeSNZ8Il/0Rq5zfIBjN8yLqLcAugo6PHegiuPVML5wmPmOc
 J0WxtWbz0HtPQN3MIRjyVhc+kV5QvNC+LsWNsqj+wzO3NC8TpALFB5D9zuvXctI6CLFh0
 sTdjj8ihu78jQFSNtkcIOxMZiBTmAVFqAoRHxvhr/I7wcazNRiRmbRmX+wmhaLazD9zaM
 q8bGnJolnW5bQg5+baQ6gSZfoHOKtg3RIQUvJtfMXO2L6fEoiYpkqc2aZBw1maAYNZKqt
 R9VzD6K/zaJyEzCiMSRLVNVHPUZXrPeSiYRALHsNMulU0GQBGanr8tKQbowJ2bMTVwA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3B09404C6
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76D2B98323; Thu, 24 Sep 2026 18:55:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:33:15 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 76818c5a85a2342c9ba48c96531187577b9e6e58
X-Git-Newrev: 79c0acaa2d0d6b988d8f01da52a3caecdb7da1d5
X-Patchwork-Hint: ignore
Message-Id: <20260924185543.76D2B98323@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/gnuradio: show
 Config.in comment only when needed
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
Content-Type: multipart/mixed; boundary="===============5420033564276580695=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5420033564276580695==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/79c0acaa2d0d6b988d8f01da52a3caecdb7da1d5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The comment about the toolchain requirements to have Python support in
gnuradio is always displayed, even if architecture requirements are
not met and if Python is not enabled. For the latter: the option
BR2_PACKAGE_GNURADIO_PYTHON also depends on python, so it makes sense
for the Config.in comment to also depend on it.

Fixes: 7a546b87d5b8781b03f3ba5d311d61f4169ee899 ("package/python-numpy: add reverse dependency on packages using python-numpy")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fbb9739dd8012bbd33098a05b6eae91ff13ce71f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/gnuradio/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index e87275de4d..0e8dc66dc4 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -89,6 +89,8 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	  Enable python component
 
 comment "python support needs a glibc or musl toolchain w/ gcc >= 9, host gcc >= 9"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9 || !BR2_HOST_GCC_AT_LEAST_9 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 

--===============5420033564276580695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5420033564276580695==--
