Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B69CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09BAC6071E;
	Sat, 10 Oct 2026 20:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a6ZVbVRW6jg2; Sat, 10 Oct 2026 20:26:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 186C560711
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791663960;
	b=OGaeB9NWwhbepdR3bOcXN2dBLh0LBJ4njzU+XbvZom7AfGOPsNBqHIKyOohR67nwaJWR
	 Ul5qc3ThjmiLVivhorf5ZjFF+EvGFt3tyl3mQlBQd7yZmX0Fe6QTN6Cs/UxCeEoZ6fA32
	 aZtlC4SJ7my9aSZv+OpYVqpw12zqkTDLPhs9RsQpnGYsPSwX02gxOUH6IBv0hOH+6VS6p
	 qNbPcDdq1glmMjgWm4XV6AfxYeDsuqAdk9yaJLxo1pmYfk+GKnQW15K95qJr14rxj3DTO
	 bEBY3FBvnj4UODV45lIhcCZq1RCQCKTPA8LDAAwdP3wY25k9t7k1dX89jokXD9zGvoA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791663960;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WdgM8QsmL4C8MBHyzgfrK4CHWAm7bXvznPjo3FHym64=;
	b=fSILbK35PC6xUHokUM2fo8jUBje1Fv7q1YNFX2pYZyVioyfNqgjlbZrt/OgAycX/+Gt2
	 eFOht5X25y0lmzm9BaCdqNfieTAyTNyaTEOj9o2W0S9e4Fbwvm3cDoR45yTB+Z2jfiPBG
	 c5ktnNJa3y5Gpj+RJHJrwIsxVGVpLQStWauAw/6ZFkp4e/c6Ys5kuIUwWJQEdH3jUKcrS
	 T3PUjdUqiN52Kkgga0CLFmWugsDZm3IieLnAdovLBubTKEfdh+DofMOYREKiQN3QFQqnU
	 lHmsra+mfRaydnq8jAzBpiAF6QDGvMzNTT6LYvnUi8jGO84R6lIMtUrwRbRfvIscX3g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791663960;
	bh=WdgM8QsmL4C8MBHyzgfrK4CHWAm7bXvznPjo3FHym64=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rfU2DuZw79nXaUwVil2r492N2I0fR+HjbhhKCkYoVcD+dBm5rOGEpcvaokmbOGgP5
	 oaNXN+BiB6bTwlS84WCb0LzjumCpH/VAc5ze2XinnmUKRodl/UWGNuaLmdPVmFiulu
	 vTi475kS2npZETGs3FG55KghGvCmqCrUMc19VHW78VWSZ82m94q1GK2ObqTpv/Ee1o
	 6DddoquKClgfswlR4vOLFQWfxwC1yYhA6CJ6dbKt5qtz/Do4n7lOwuR6f/v837Zzv3
	 17zwYVDDeV9HDI3TCoupkqkIcibw+/fMNmb0VBfX8XXl4HrMYUzXn0In2HLGlq2/+A
	 vywVIPZCncfRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 186C560711;
	Sat, 10 Oct 2026 20:26:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F03CFDE0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1BA960674
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id miJEdV56tokC for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 13FA16061D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791663954;
 b=T0jQocfX7GF50tNOxaec4l/tEyeRrn7J8pyZpOA/WKW7A+LvZ+ypgU+HzlBUDVDtx3dQ
 DnmDIdtbX5BxMICHVIq2Nu6PAk2CpLEWI1pLSK7vFiBu08ihwnrVeg7RKjmOPEyTrfg99
 gK2Vw21SNDcNSAKZ7QmLDrP9W0aj4yL+8N1cPVYZZe4yDxqidDT7g+O4U078K95mOFK/t
 QCN1gps6Xb/P7Ts2vlM13XNWnBW3uu2HZqCh51M0OrJ7hztuWtBvl6bp7bgm/ED6cUliz
 js0Hof1Oc7ZPR7BCP0MwHPoRHycUdBnkbkPi2n5wIP2xvbavjPfZ17NNeuii+uNmYJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791663954;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=t2SnsCGtgjgOVU4Pf8GKR9nppgaaRZ8jvN5eZkVikH0=;
 b=MIZlIP4JQac5vY3T3tbDYd/MBLoe5CAurzXn1GjbKie5INC5fhmm5bWr/PNSPU7zQi1g
 LN6fFGZCOh/ZKRTXaACJ601UzxM3drmkc/lAfKvW4C2NbSFHJpxcQ1CjLU7WcP4uiMOnh
 FWnGTgC8OWxIbGwq3dPXXL7TyeoFElXH+atIOmLvgLAV+ilMKFyUihPMTnYb4CqmRgfNO
 1WsjcJfJlm3Ca3HWsiUzLvw/17/z2t8vTuPlFMq5KxyZ3kwAQb98z4U7N5UwLXVXFE/i1
 kyCmp3wnbCy7biuYu+H97XnkAqBDiN+e+cnamf+GN07lkgf6GM284zvlqo10afjB9ow==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13FA16061D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B950193537; Sat, 10 Oct 2026 20:24:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 22:24:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 074e650219f98357fe051f82e9fbfe007851a865
X-Git-Newrev: d8d02d28fb64f69e97d2169740687f761f93667f
X-Patchwork-Hint: ignore
Message-Id: <20261010202435.B950193537@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: mark host
 packages as excluded
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d8d02d28fb64f69e97d2169740687f761f93667f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Mark Buildroot's host packages as 'excluded' with the scope
property [1]. The excluded scope is defined like the following:

> Components that are excluded provide the ability to document component
> usage for test and other non-runtime purposes. Excluded components are
> not reachable within a call graph at runtime.

This fits the usage of 'host' packages : a package without a runtime
purpose.

See the mailing list discussion around this property [2][3][4][5]

[1] https://cyclonedx.org/docs/1.6/json/#metadata_tools_oneOf_i0_components_items_scope
[2] https://lore.kernel.org/r/<de0bb761-ca88-4bc6-8d7b-6bd14e9d1cbe@cherry.de>
[3] https://lore.kernel.org/r/<20260409204208.302842-1-thomas.perale@mind.be>
[4] https://lore.kernel.org/r/<bd0f43c9-ebdc-4717-b8d4-783ec712bed2@cherry.de>
[5] https://lore.kernel.org/r/<176c5c42-50bc-4b39-a7b3-845b085f010e@rnout.be>

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 utils/generate-cyclonedx | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 098f62bf2c..44b9b80847 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -371,6 +371,9 @@ def cyclonedx_component(name, comp):
     return {
         "bom-ref": name,
         "type": "library",
+        **({
+            "scope": "excluded"
+        } if comp["type"] == "host" else {}),
         **({
             "name": comp["name"],
         } if "name" in comp else {}),
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
