Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C4ACA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 458F381109;
	Sat, 10 Oct 2026 15:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jyLia2rwy_Y3; Sat, 10 Oct 2026 15:18:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5136381126
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645535;
	b=dRN1zxrX5p0ut3HEpKfyGP4kxYb0a0SwYJk4LJyUc88BrIkoY3WadZPsc0+r9hhUu1Ne
	 eEplLuC+M1NDNsSAddK7Jp476p1a6MqpQ9GPjLzmqKU7D4/B3t6s2Z8/LWNP+UBa/kzSo
	 faMMX3HzULLV3zYAQamMXF60bK9XPVFsM76YBFqOiQDP+LAjfYxbDhraIjI0i4GifTfbr
	 ECra7D4++OF0jWIrH6YlkVFTt4z7sjx6Zn92z8hNjB8X1gpZ2LQY8XltltPM41LQqOA8i
	 gN4es0PoBJzznc0VW+Poybpufmlr1ID2m2JzIAuVl7O7V4i7gZO0gMv4Efev3NqNo3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645535;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oEpAHS34hX1ibVpSHUpMdqN78uGe8gK1GvCIzbF3hJI=;
	b=S1SCiLfKByghtWsMHsZFmXcdf5t6EVRCNxl9uKeYiBsKJevtQzuVf6+is9NO3gZ9YJ13
	 V/HSAzhjVfywz30Wj1omLQ2HYOFU7qEKcKRhExkn9h0ASoV+r5k/Sw6CnVRIauXofbsdX
	 OIai4TFAUh4qd6dfEgy0wRthacPXhVasj0MzgFR4C9IKojYUxdtHKibZN/ZMIl8PPr+/K
	 9DbgI44jp4lADF/BVo1GhAJIEIJf3NNiBvlVOiC7gTHdWji2CHYzM23kOMA8A3vXR8TvH
	 Zwgl9BWwrVuAUMkACyfVrYA3gNxabrGGrJ3gVRVz8YTYCM9/Tp8CBp3wrW9R42DUFjg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645535;
	bh=oEpAHS34hX1ibVpSHUpMdqN78uGe8gK1GvCIzbF3hJI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HzRYkrKf94MPS2GvqF4sgAvMlxxgrMWa0IJjO0KpiUE17hbym/nLV6T8CWpj+7h4L
	 C8s0Ut8+2bljwHCj+vml5hTEL1QM3UqoJJHT91FYypv6Hjjqiq+/J8lGHdkWrJACYL
	 HgVgYbxNH+9qNwoJnsitL7CDvWnUTlKSMImoOKvA919a+tJsMkzKPO9/nOd3gu1Wp1
	 DIMf+V8mPkmGL7QcvLTBjU3BKIGKvhF+m/6nn+OLdKC36lULXA5Wh+lNSAfIxvE0g5
	 2xl9uC0QyIlXG/novxWbK7t7R7S137EP7C1NDqoHcv9qefizEQuUfRS0Lx79+YRjOn
	 oDT0xc3He4jlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5136381126;
	Sat, 10 Oct 2026 15:18:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A7B53317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D6A08115F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGrzhavygpok for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E63978111D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645532;
 b=nNomvgHj3tYO8iWjG6gXDG+ojENh1QK84Yn6WwOUmXRh/JaWd8rNc9Wd7zutw+hStNFm
 DUqTFOnX6FNNoP6lSCCita04xlywEwgIyniApS3Ll/7fHNVILungnp3Z88yDMo2hSe8MR
 mqabMRfAzWGHlOOmowCJzRRH35X0ZrCtiv/NHhGuKrRqC3Bynr3PUDyRuv4fURec1SaIK
 jiQi8ioYM2pqgjgiTIEgIxyMLxMOGDVmukrdl62Kq5mD/829Z+tifQcEfhXhWr3lAc337
 cjcgDooChZbd60sV2cFPQggyjH6zEDSBIWdo0YnC2Djfshib6NPsxUKUhWe/v8eduTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645532;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XXE6VnXY0bfbC5zkSvTw6h4YhmdIHZBdab3CFk0VTWU=;
 b=hAvqI6/JZhZ5+722teqGdSWQGuT4RbEzYA43oqIXGqy5jzk6/SVVdbLcrsaFwNG4iB02
 x8pCAVHquGgVxjAQMcFBAF/DMWKBa96jpdoi2p8+WhdoRX0LsnOWWNtOtaw7rSovp8L3e
 VMTIcQFmqzMUL2G6jbhbHfHk+8vXK5xOFUeSW5NXsohizdgPiPmL5SUQMkHxY1i74Y3u/
 pqL7wHpfT4MngAjcnSwn1546GONSHRjrIgY1N94Imbi1qZeIaoC8rKWYfKKqrSzvC02Bf
 SfKGZdwlGdK6VDvcRHOUfd6HwoieEG1Wofy8d5mvUhfJUs1/zkjjLB8qYbD/PNlf9sg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E63978111D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B15E69223C; Sat, 10 Oct 2026 15:17:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:17:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35dc65563dbe9ecc226c09473289f3e8cdb8855e
X-Git-Newrev: 93df82900d7774672f8d37bc8d967dbf2798c195
X-Patchwork-Hint: ignore
Message-Id: <20261010151734.B15E69223C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kbd: add CPE
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/93df82900d7774672f8d37bc8d967dbf2798c195
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The resulting CPE ID is:

cpe:2.3:a:kbd-project:kbd:2.10.0:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2011-0460

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/kbd/kbd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 024f49603c..701b3dc3a8 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -9,6 +9,7 @@ KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 KBD_LICENSE = GPL-2.0+
 KBD_LICENSE_FILES = COPYING CREDITS
+KBD_CPE_ID_VENDOR = kbd-project
 
 KBD_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
