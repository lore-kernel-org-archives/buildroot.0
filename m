Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D81CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DA8D4094B;
	Sat, 10 Oct 2026 15:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63wVr-AGuMRw; Sat, 10 Oct 2026 15:18:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AD2EE408AC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645536;
	b=NIdinjD0FOKIkOuNOXPClEgS5KlfLwE5fPO7D55JOtE5U+/mqMy0f1FneLNH7yGKsArD
	 6mpTZfQDabO9piL7BfjG/EfvwBZE2mZrBrbzyqhShwZWXnfagfcWohoOr3hVxxe9hgFWs
	 x2RlXwPvyBJ+y9dSNmq39pNjOPlOVVYJ69fbk+gAsePYOBVVAJ6SBtiAzzRm4WiUKmlay
	 X7QPOqoSbLBjHO6PxmmTI8yIFPpI3ma/pEciPE7Di9dE09FTeEBRSxwG3rCA6sggm2hM+
	 PI0DHuTKK7a2CrBe0oYz4tNn1wldrt3BKQ3b3tqdpgZVNYfkOBrsWrUGLo+KUMQ4tXg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645536;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FKMJYeBf51ha96mpLxWxEgX6B5sFBBhdCak9hFnirI4=;
	b=izMIH2wVyn6igmiZHX/Z3ogWRAPxVJcuLcn3gnXoiSF5hGk9vV3CKjwoDjG6Mgb5SumV
	 j2KN/l8g3gs9eXa+nT6jQ/jApD0NHfIGgcPtegOW2iiIGKbAHx0qWcypE35w16r8ntXiq
	 HooysHtqaRgDtPFu6NSaFC+mGP1cRXiSai1EDqmKShh85mqC/7BmJ/nmCKUHO78o5Mg+y
	 JWRujfJuQP1QsOuzevvo5DUY/S30MDe9vYr53tbO0aobebqnTbi/jwMOKtIRB6oP5yr/9
	 9M00IWkpdYULrHoNSH921jMZASTeyH7Lo7X267Hf6xFBz76O/Hc6pOF8kPRt9DKlbLA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645536;
	bh=FKMJYeBf51ha96mpLxWxEgX6B5sFBBhdCak9hFnirI4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZBjTG4VZRb2uL8vKw5BA9DmrMzSEt8YVYEiYEs+P4wsw0FpEpG222Ihz4MAkC6a0W
	 PO7uhtwmS2ayhPnEK8LkurpboqewkVzymqtLAow9VSeJ9xGdsQ811ZM2/1E6Ri1boT
	 3+FkS4iTgs8MTdOw4e/C5HoRgGUsugRvUvKfjI+4P1wuyuFIkX2IZDSPPWzhAWWI+f
	 UG8/bzY7bvn5BjbllcbLdSfTl7G8LLmaboMZQwxsxzxd5fxKMstcFO0EFMd67HxXAs
	 ajRGuwEjCDXdZxwI5UDaTM7sHq6RE/WG6Taf2dVazIW5GO8lnFSCxcPWc+ghfEv7zT
	 3+26aErfUVXUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD2EE408AC;
	Sat, 10 Oct 2026 15:18:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AABDC356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8D72408AC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TLUnmTHYREnR for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:18:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D19674089B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645532;
 b=TZIBxkxpIjqW0XFofMEDb6eawBEZhI7tq/WQz/iiU/8VAMClSLoERrzPEVbu7QZrQ8nL
 JiuSc5GoHteXKCmjRdbMkJC64Xwh5dJV+MFZyOrq5h1vqCw4mUtIGX1E8bO96PMU/MSNl
 oMNmRzHDKZoth5aTWblzRw/X+6U+TYvwhKsuG93nrcYI9ehAafg3rAwsB69rrWgt8OE5q
 UBubmRZCihtmzqDizmnlqUul7uVO073oteSca6cf0dWpREyqH2p1eAM9vvk65HLSY5HLe
 KiqcLlSFFPm3DYDVbFOu7tWfQGofsYxrnXNseYVgngZRLlNM9stMlxXOvTkp+dDqfyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645532;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CdsiJsnTfR3QJx24/L3QlPjx3aq4sPXLNr8RO6TQncQ=;
 b=DHRjxD+HeF/gJCJuGK/AzD9Jx7IPEmryGZyvXy8v7nLaqREJh5wbYnva/s5op1ddmL/x
 mdnjRRn1yDbzKSKXj8aU52CUmzLR0OejLY/pxZ6uQW7G913KU3wQndlvbx86sB/AlrqjY
 TIZTa2K88aTQn+s+/iRtPn/+9v1Y8oK6MGF7CyRY56CaQm+m0xNfbs2hWlXmubbkfP2WE
 6AgEUHRo8/ocAtwqc3aUc6YgO2ambpxUa6VumBzYZ4IG5FUk862tzT37LfK6AMVKBH3RJ
 XInfqFwMnLp7M7yPXrqaODzycMKruG30bX1ceNd+rx7SWbyIyHbB/kH49/FC0lTxrPg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D19674089B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91E469222A; Sat, 10 Oct 2026 15:17:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:17:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5dbba2616f287cf6d333a0849ef870b0ce49f24f
X-Git-Newrev: 2ee591714dec4ea3921e2da33c8022447492f0bc
X-Patchwork-Hint: ignore
Message-Id: <20261010151734.91E469222A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gawk: add CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2ee591714dec4ea3921e2da33c8022447492f0bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The resulting CPE ID is:

cpe:2.3:a:gnu:gawk:5.4.1:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2023-4156

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/gawk/gawk.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index dd465a40f9..0a8e9b5d14 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -10,6 +10,7 @@ GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
 GAWK_LICENSE = GPL-3.0+
 GAWK_LICENSE_FILES = COPYING
+GAWK_CPE_ID_VENDOR = gnu
 
 ifeq ($(BR2_PACKAGE_LIBSIGSEGV),y)
 GAWK_DEPENDENCIES += libsigsegv
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
