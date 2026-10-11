Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBB8CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 10:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CAC080DCA;
	Sun, 11 Oct 2026 10:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aquqqaIQ0N6b; Sun, 11 Oct 2026 10:18:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9C9E680F3C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791713915;
	b=r1llOYjNXzDHpmUzuK87NIHlGdzFXb+VoPCyWM0qN9aygOav7qFww78Lp6NFCKsE55wv
	 /MyWdcNv/D+fo8o711cFWJU/3kQRq3jCO/dQWqLupgPJ6FLqSIrTHnsY92cp5Ueka+wg3
	 fLkAw/CPPefs/RmkBVPWDuK58tvUD0S1aEkReSXuM9/tRhBLwVdSPIbntkeAIxqVzfbN+
	 y1HFVSp4jEtKMT357IZxVae+8zpPpYTpLPqzGFQjwlLjEyk4WfmtpCBp8kGcn1jRKtepI
	 hSjzBNvNBwuC8zmslYCztpagxrKL2X2vOuJIomzizWtDlJYhjrFWbT7Nb0OONWzlWfg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791713915;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mQ855btTLAhci+nriLK0wtql75DBcvA8XhNULZusxo4=;
	b=Biw5DmVkaqbOUfP1wz/ovv/a/LraZ2LAmIyX526h4o2TCl3Ja2m38YwZnsjk/sPep1Ku
	 GORi/hJ+Y7bJxe/XmsHBm4GZMmim5/J500/4elHdqK+UlMa+MKh1aPx8ZNPaAnp0YEhlb
	 XmFwbkawa1+01r+TjriykQ9vscEht0CuafUR7sbINe9OdfueF7jIWHk6cUyUjYvspCo52
	 x1hyQcwMKeX5rpuqX2em3mhZJwEViEch8k3qzL2Lxy4ocUtsuLF4uk754nLLGTg0pZezo
	 fjFctmPs555pVDkTSGMK84uz+4KFFzfwv+y9uG6HTgSNPssb1ArvQT6DloPRecDEYDA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791713915;
	bh=mQ855btTLAhci+nriLK0wtql75DBcvA8XhNULZusxo4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=svTs7qOiD/JIFsjv7lsAuWSmRw+9MBIosNRXtw8ajGvtqaWC+cispbTT3AedVeqOa
	 BBQ5dql7d6QWUm+kAnEuAXeoakdBwO/Fu4D1b7NbNdxYWkV+eg+SSatJIa2Fp6QMV8
	 hQQqt/3eO56YfwGHhVh39SlU2kgo3O1uqCk8MwGXJ+JA7qX7Gm9WubLC7vo4PyrzZI
	 RuUR2eXW3k9sqx8gMDhkabkk4aELyODexOjP0w7ZzNa80GmngUrEIBlv/BqXqc5AT/
	 siSUdlzSQzyw5onP2J3Psb+9xrthkmP9JMRmIrrGyY30e/YmfYxWUDfH9TOKjo/M50
	 4tIZg7ut7eCzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C9E680F3C;
	Sun, 11 Oct 2026 10:18:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D1E009DF
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7FD14065F
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:18:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qb7TB0kKr9c for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 10:18:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2577640656
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791713912;
 b=MVqOwC8fWb4jpyf/+0e164RtOM5Goz4tdWeGKBSyX+b5BMlNJGPzaTEdR8mp/0pm+Bca
 LSxski+rMrWLR/fzGAcqTKV6mZ3UysaShRdWz65hd8NzXelQLwQtABh2mdDwTB8mHrKRi
 o6zT/cgcvKc2BDdw1UNgCTJN94pFCieu1zOLnWtqS5B7Ba8ak/e26mAgUtYty9PfNTl/g
 2EjE8B6QF4/oDZ/YLfDi+4egB9aiY7N6pRfalqMaxMqHutJXBegF6AvBJyDgd27fzmGAb
 +CScE6vRvcYp5HYgfBrfEodiYHIzyNAKyl87naL8AsTU9qZQ0jFxV3p29G0FxSMEn4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791713912;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=B3he3NLDDlJHw77NIUET9N7M1kWhdAAVOCE6OfbOCnA=;
 b=aOP7AIhKe/NaM31vp4Lvjp5eJxaTFfiL+NStnZviQPLFaB8myKRot3GFGnaBmTenn8Jx
 XBYWjiZdvWRAaaBYaQEJNvPX2snQVY4QtL0CTd4vrrJvlD63+53DDMehwyLLU302tfk+S
 tzOWN9oyaQ91unFXM1jSqy7p8tgbWbRIZVI76uSMyobEOWj7t9Ug33Cn+cPbId0zZP3Kv
 uztSmKDQrGSlVRF72ukp+Hc0YHWizf2Swevnbsh75pckLDnpoGXB1au0Xyc7S2R5nRgwF
 d7E6QnbQWEjEVrZYA1IE9bHZoI0oF5nfHtFh7k3sy2Wizv/gwbfUYKj4IyQxoLEjJAQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2577640656
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:18:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A77C9429C; Sun, 11 Oct 2026 10:17:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 12:18:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c13eabf18f6541bb264aa1b041ee56206c95c810
X-Git-Newrev: 319aa2b9ed30f542124a32efbd3b27e92261b4bb
X-Patchwork-Hint: ignore
Message-Id: <20261011101713.6A77C9429C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: add comment to
 explain spec_version
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/319aa2b9ed30f542124a32efbd3b27e92261b4bb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The commit [1] introduced the `cdx_spec_version` variable.
The reason for that variable is not immediately clear. Only the license
schema can use patch revision while the spec version should always
exclude the patch revision.

This commit adds a comment clarifying this.

[1] 504bb61bc6 utils/generate-cyclonedx: support custom schema version

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 utils/generate-cyclonedx | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 9d3baa23f1..1fbf020a3d 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -562,6 +562,10 @@ def main():
     filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
                                if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
 
+    # Only keep the first two numbers of the 'cdx-version' argument.
+    # While the patch revision (e.g. 1.6.2) can be used for the license list,
+    # only the first two numbers (e.g. 1.6) are valid in the schema and the
+    # 'specVersion'.
     cdx_spec_version = ".".join(args.cdx_version.split(".")[:2])
     cyclonedx_dict = {
         "bomFormat": "CycloneDX",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
