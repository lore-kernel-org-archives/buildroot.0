Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1807CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C184408BA;
	Sat, 10 Oct 2026 09:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xb74AzOsK9Ak; Sat, 10 Oct 2026 09:27:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B3096408AF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624462;
	b=m36RZYdFPpwJinW+VdmawWG2D7FT9tDlXA9oTpfY24F8VDbj7pOBJHucAFkXha8cTZAX
	 CG24dqNmjazFDmqN6ogSW2Rtnh1MhJrRa+6cEfTPFgFuM4optURY5n5bhk2wFW73Gyj5n
	 XGas0LE0cGugvrwXqMc88d5RtZM9Xk1oB8pg5PMuAVkzirU5iRePPCyPQq9ro/EL9K59s
	 Az+CmzB2Ty2Y0uWQ+7vWdq3U2vT8YSVRk0c54UNfq9w240tK+ol3hNbI2NQs1TFJwzTTt
	 6Ec0iTN1Ww2T607X6xI9FRoNbRfM/774VH4WgZgjfl1FaCA/pbL3l6F7hysfGvaMa1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624462;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=8mRsfxRRJrfOJX6fHcN7YrFzFv2ulolvh62k+qE7/X4=;
	b=IUfSbclPmltbBqUlpNTBsdPjQ96SR75+vqJgcWHiaM7PvJPy5f35FZZxw4EXjG8fUC0t
	 q9K9Da5BeceJ7EdGP8z2/ZEjG3tVmh+LFtuMZ6aXBHHF6aD0couaVpmmL3wgrUZLACYIW
	 ugywpvE4+wzacvCuGb83ZQ78AWIplf0NPuM6I3rmrPIlqaxcTy5m3KKWB7aWW36mx2dB9
	 G27LWlg3xJdGpY0QeYS0R+m41zGILmVp5fJsFw1htiswxjviopJ9x7aDnmBw6oRs9alqy
	 fg3OsbVN8ZZN/rVr38weQs6ysA9gMRdV00sTuCmuHtjENYxhUSGLQS2LJa4jYd7P4zA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624462;
	bh=8mRsfxRRJrfOJX6fHcN7YrFzFv2ulolvh62k+qE7/X4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rL4GVx5eTnnx92JvFTL01Wa60W5eyNa4B1LYir1V/h0cRPJ5xXVCpIa+UruAfzGNc
	 a1U5J7cUvCqnzkt7CuwysW2O8/2KAwm+sFNtIS+zi1NvuHKKUvf579QiRsXalAecTM
	 fAaanOuInbjnizLBFcdGCBTJQSwYbRNLHtxr4TcozuMjlXpX1/v54B2rSRUzjKYXmw
	 ghohKRzP4TPCAmi4H96ty26EiBC9SwrMgcU6SmiyCg6vfSd3owjv0VR5T2dqXXgCHB
	 8gJjFXsgw2a1BSOWdK1xfjMwCGSQF9NQCvdkpPA2QDe2TZHROIcAEyr6HNL8G0MdJA
	 UjR+GWqSFfLCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3096408AF;
	Sat, 10 Oct 2026 09:27:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C0D675
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78C1E81209
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qrv3_HCx6BB for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8A98A81170
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624441;
 b=YcUO6KPyvRtK+liKfwCSP8rK1C51tyYdsYiUHRukOF/yTBJO56HcqyFo8/MrgEvP2F/J
 GvV7pJsi7ZjAYT+AAemlm4/ulxSI5KWL0WD8ROIgMQ4Y/Kp0pYua3joE+QPWIQT7/alCB
 L7t7ARlQGbdxW1wJkWuAqDYR40d7uJk5uTtnQDRsQBE6l++P21opUjaIDdhqfrQJOhTVe
 vTFgIp7k+OI300siCT3/ll59XFOSY7n91xGxTpMwFFOZXRcaxlT7pAgDZzF5b/YCr33aU
 JtsEMr9KQ70nlgMs6MCgzfn2iSWOGKiFDHyhoSEUcuICpiOvINOTLJPVmuDhzEQyb5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624441;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=MXQxxH0WS9go2MKePNaPnqsuaT4/++bfqp1Wcw3ebwY=;
 b=QreuAWcPMPcfrIhXQNH4JmRgMC+hOjVd17sMVm45R1yim6GE4xKy/piTS7oeZ//8B/j2
 DF7B12V32i+IRstDyls1IEoJqz7cwwH7WfLEdVeSZAyReHmECCmiAbtzRFLodFzZL0C7q
 SObkVQY6ZFQlrcBtq5gHyhiAksg67G87amxy8zuQgZE9oFIv6zU4yUq5uTAAD3RX6mKtO
 +ZWjfw+CsD3EqjhqzArAQburjACTqN6x3oZwP0GuU5W9f2jayQSXVSOfbagLI48+VPVRb
 I6cGkHPgsZgjHlH4SxsTYsxQMZHR2ymS2cp7vQKHh6bY6dvOtCvr9jEoMXW9mHGQLlw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A98A81170
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7460F8F0B1; Sat, 10 Oct 2026 09:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:01:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 11e72b07674268188fda614923b1bb43add80c45
X-Git-Newrev: 975fea490f5257887fefcf7ce90e7b6a85299061
X-Patchwork-Hint: ignore
Message-Id: <20261010092603.7460F8F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 docs/manual/common-usage.adoc: correct generate-cyclonedx invocation
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
Content-Type: multipart/mixed; boundary="===============0547971128988415992=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0547971128988415992==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/975fea490f5257887fefcf7ce90e7b6a85299061
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Commit e09bf9e9511 ("docs/manual: add information on CycloneDX")
unfortunately introduced a typo.  The make target is 'make show-info', not
just 'make show'.

Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit d703573765eff4fb658fb660ce9ab029f5ef1e77)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 docs/manual/common-usage.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/common-usage.adoc b/docs/manual/common-usage.adoc
index 631c2f7788..67c3e06567 100644
--- a/docs/manual/common-usage.adoc
+++ b/docs/manual/common-usage.adoc
@@ -214,7 +214,7 @@ Similarly to +pkg-stats+, CycloneDX SBOM's can be enriched with vulnerability
 analysis from the NVD database.
 
 ----
-make show | utils/generate-cyclonedx > sbom.cdx.json
+make show-info | utils/generate-cyclonedx > sbom.cdx.json
 cat sbom.cdx.json | support/scripts/cve-check --nvd-path dl/buildroot-nvd/
 ----
 

--===============0547971128988415992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0547971128988415992==--
