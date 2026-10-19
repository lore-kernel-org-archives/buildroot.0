Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4437ACCF2DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 08:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06C5080F6C;
	Mon, 19 Oct 2026 08:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2RoQemT6_l2Q; Mon, 19 Oct 2026 08:40:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 284B980DD8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792399237;
	b=b8fpIFZZMZ6xdR5z2ozCgxBvHA7IaN5O0MvVsjZQ1lsEoFciSr/1Y3HFIsC6JpE6k+Vx
	 EbDNZ0o6NhSs1eDSGp1yUrQJXK6yjWDsuMTHIhNYxiYdvuyHTq4GhmTiDPDvuYc5YyNSh
	 h0FV+19yf7fCzX0GQsjAH1t9ZMiHNs/AO9vM2Pdk4mUvXKPoWU2TwckmBdIgmGbQ6gDvE
	 lZxisQl4cqvjdb3xGls+RtCEP17G+4RvGGzgqKxFUPHW4NCtHo0UkGnhQard9XTDhOhvD
	 ix3JIYK3NFohzTq+9YKzwk3mJkC/EhtyynIyJTl4JN8N+aIZbV4wh7ieyjK7eZKa+Jw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792399237;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4XbY5rq94+Gl2Lv1AC6NFW1rday5h7ZBwqLbrKFkTSo=;
	b=CJLdAwypYJgBSSzlY8EXoZV4bVU7PaA6FshMwLY8wVF3o6C3BknUwbqGler18VjZF/Ih
	 X1jNTbAe+W5Np32qJoF/9HPSglFGeC+Dee3Qr75OGAaM57ms6TQywYkSJXx2rGabbXFNJ
	 zMsAo/r23IzzQFE0IP6gehv3uvzE1I7VUrifxSfKy94TJdvUzWb26WogRaE5xZU+jYkj/
	 ClRheoeTRgx+15gwDaS98gXJc/4uhKV8WWJfKXRtFKTjUjPi0AzTpnmYsZnqSmK4cU663
	 3o3YRmdtCXJGYs7Mp8xija84quaiRerDhqG89pNOs4V6fiRiTgZNdQFhOeiftW01K/g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792399237;
	bh=4XbY5rq94+Gl2Lv1AC6NFW1rday5h7ZBwqLbrKFkTSo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YeUb6LsToyWLtBbqK2rUavI7IkVqdoxH3lhgWIKIK82uulzgXWtt6XIffXE59U9f5
	 IJF8tGRoRRR4WxfK6jonzP/PqTSFplcs8nuSe1luUI2DJoZbafAUUz7ILmVAva6DeA
	 2WV0yMFwuBCsCTp601vQ1wQS7HB7CqZwBjfdtZnPpuJuQwrrXGlj3xuVE3AS5ACLyh
	 17PMVWy7Sq1Hll4ZLAkkpcs2h4HOLd+fUVMigr52aDCQeBJE3osivWJ/6SlGvI2r4F
	 GWDMXKzrM8K2dF8olXyVt4U2xyNOD0BkH7Vl0HcjEToBrsRf/N/aUMnqBnFIGQuy9U
	 NBhTzLoxOhA/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 284B980DD8;
	Mon, 19 Oct 2026 08:40:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE5CA465
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE9CF4073B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-yrBXxglKkV for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 08:40:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0C6A740738
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792399233;
 b=plwcEsXBeNhtzjQtURIMZOD7Hnw32X7QklE8+Q7VeRLdP4hGINpNdOrooOFk1bN1G2Vv
 y6Tl/R+11JqpyDJFaiigHMCkiVSFZ2z7vL3um1OSaO3wzAFcTJFamYRDAL5Pdv/mwgz1R
 /fdGJJba3at0r0i41l7Wuwetvhx3+R+cmZZk7Wp+6kFet7E4yPG9Qb36jrRIqmb0kMK+5
 0nzJccgytSWxIP5Am+OLqsetZxxdlN1ka9U7u+xfOZoBvrOaqpG7JilSKYkZDBVJxllm5
 McAelvm13AJVNA5mfJd/2Mquccv5hbj9MZyyNAugIBxjI2w+1qy8pTOMMgVU1SS6tPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792399233;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pEe6bc1pQPF/NfrbZ2L7UlGLCwIC++HmMnwYmbAACUg=;
 b=QPyoQzIsP4gwv5dK2iBSP0yjkAviFgiQAVhLTUCWsG5u2EJBn40wM4aIIlRIHfhVgbRe
 6hDtNhPXHE+NsaM4m3BZmnBy9815piAPs+bCVrzOGMujzDHbhc6LcN/phYszeTS8Up5tT
 ADOvyJEvfFOU86BTSF09OZQF8DEEi+KqxNLWQH6k29f+0YhcGR2hycYWYyiaP5JciLFFD
 8+iwipxGlDz5LfdghoU6Nr2mJRHhnHHTVaVVtK1XTrmJW0I+ewBpjozfv4nEmWtBF6XUw
 LeTesySL8l4dR36iRgTilCqdI/clB9NnFlT8HX/0UFHoOOdcnWXyq6C3xCphU0xNUuQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C6A740738
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:40:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 917A0984A1; Mon, 19 Oct 2026 08:39:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 10:39:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2107d22b592616eb8f571536d0e34a16f5dc14eb
X-Git-Newrev: d58f66c106e1f814383ed3d868f86510c4b10bf3
X-Patchwork-Hint: ignore
Message-Id: <20261019083910.917A0984A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sigsum-go: bump version to v1.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d58f66c106e1f814383ed3d868f86510c4b10bf3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://git.glasklar.is/sigsum/core/sigsum-go/-/blob/v1.0.0/NEWS#L1-34

Note in particular that this package now requires Go version 1.27.

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sigsum-go/sigsum-go.hash | 2 +-
 package/sigsum-go/sigsum-go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sigsum-go/sigsum-go.hash b/package/sigsum-go/sigsum-go.hash
index 4e3cbeb2d2..70b0dfe67e 100644
--- a/package/sigsum-go/sigsum-go.hash
+++ b/package/sigsum-go/sigsum-go.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  01ff9b579012bd36715de96f5474c8bfe7778daf4cb04d3049004797fa6cb5e3  sigsum-go-v0.14.1-git4-go2.tar.gz
+sha256  048ec174f8fdaae3237472198ad0e4c9c81fac1d9b83a86290ab3a6c48ed8d31  sigsum-go-v1.0.0-git4-go2.tar.gz
 sha256  6a1e3378dcd18baade08ac30ec4ba33b72d1b1697c00226ef85b9c9cefdb4e65  LICENSE
diff --git a/package/sigsum-go/sigsum-go.mk b/package/sigsum-go/sigsum-go.mk
index cd99e786b7..9f0176644d 100644
--- a/package/sigsum-go/sigsum-go.mk
+++ b/package/sigsum-go/sigsum-go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SIGSUM_GO_VERSION = v0.14.1
+SIGSUM_GO_VERSION = v1.0.0
 SIGSUM_GO_SITE = https://git.glasklar.is/sigsum/core/sigsum-go
 SIGSUM_GO_SITE_METHOD = git
 SIGSUM_GO_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
