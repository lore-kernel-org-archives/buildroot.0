Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504D1C982EE
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 18:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8B5D80DA5;
	Mon, 21 Sep 2026 18:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5XFmcqwJDncU; Mon, 21 Sep 2026 18:45:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 053A280DAF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790016310;
	b=iOb4oe7p6oG+bntu4KkkZW9kB79uUC8JiEdwZk9QvZVm9I1XfiFMhAnOC/uG+JZK3Ycr
	 TzJ1iueZFgE/8gVYfIEVCSPAOYJkITX8FJ8ugxb1FBZWO0Wkk5FK+QC6X8oBmiYkhD+uJ
	 Xn/qQLwCuvtzgNvjKLqRoaCnJpIZGIIUB96Davdc4m1VssICkDY5LrUGLA5zQ9KZu7W8O
	 rkOzeH2g7Y9r+JdzoR8yGE7xxlti3Z/oSxcDDcD+9ihXIqne5nU05qBh73HZs/cYavhWm
	 R5lnqn+ylVaQHzD8ofhw9gpg1pQWiiC6tWo5/fUPKCq/yMvQzhmlqTf/6rsJEvPmung==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790016310;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GhhUVYHxSqYCi5MSDIUcFT7wvbBiqgkAG1KNoMNquo8=;
	b=jRNq/QXuS7XnEPCX32rGWUckE5Ok7qVWR+X+ops7+rV68Jivw996j2Z5rkdXrmm5ZurC
	 c/9EW1HqT3/t6uVbLdDp42Pu08ME2ltTiWrxdLNK78rusbW1fBH2WLVPhJz2bH3TlJKST
	 knEVKOgCkHyiOUH0hDpMMN2Wedej+SUZYV+T2nNdTX2Ft1LgixuZN+vflSOwfmzDYe84a
	 SjfI78dZhXWNAaM6U9+/+mutvKALBiFZze86mflTnGSs40dtgVQnChNszkPWSIeWDub/4
	 VvFaLxqmVv6Rt3N9WLlHIo0JvfGALLezh+VmbLOFv7ODkBEzJB6oWM4aq5zrc8H0UxA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790016310;
	bh=GhhUVYHxSqYCi5MSDIUcFT7wvbBiqgkAG1KNoMNquo8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L5ubiZfBQ8sT/lPEkud8UAY3R4cKNrlKDRvAWa8YspsSRz14G1HQClV4AR4yrkOLQ
	 Zhq3RNXNgzHqH8iI9iEPipeDQDHeYcFi0D1HlNqGGXKv6NsI/iNt9oDJ1djDQwdFny
	 OrpJ/1HI27tQ/4zIZ5M++Mjokvi4UVAQKW4Izr4Gb9u9o9e8YKwC+KVZ72RRxZSUcR
	 nHWbA5cvocyk20udW9BJsl4ykYvvGl7QNJ/M1Vs74GPgHYtJcxVRIi3lioG9NXd0YS
	 cz6uNXVPdJbUD6GBGe612qk7igBvLF4pCeuCNyYeU+RJoD4alm06js8PVIvJptTmuT
	 XdR4hsBG6et7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 053A280DAF;
	Mon, 21 Sep 2026 18:45:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E3BD224
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 18:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3488F60737
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 18:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-AjcY4OQwOJ for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 18:45:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7750C60730
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790016307;
 b=qop2+o17wP+VIjb7bw2PrMEUcWV5OIFhMfgZr1LxaKmyPOFI8XKYDKQqDAnwYlkzfwNs
 dZ6LGcDrRd55/m9RIW0sflSM3aDsXoQCycfejwR+qchmOdwFbvPZi1/Gy+Y3gRQ74MAcH
 XJpMEANrXNDQXF688n/JxbxdM7yPY+mvaVTJWdwS7hSa5nfLQu44dcnbw3gJlUl7gLFqE
 MMBPsRZLQT5WQlp3B+iWKuWMlR5tFEQp6/9GhB9H9YALNdrqCz6tVSB9n+R8+t+Drf3EC
 Qs51RLB6qLRCJZ/dFJozeZHVjbDyu1+/3mQbeyrMn7sfsxLR5phmvP3Gim3jV+6cW5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790016307;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=l7jQ+ET62LsFXjnSQW+UG9SwaiY3/KMymHyUWXuDQx0=;
 b=H3pz7qlHfSgk2BP/BaFraw5dkxY87ZQ8GDKUOA+KHfSHqiIuoSXnTLUd1oxpGSz7VkwQ
 MWyB9HGzc05qEUaYQXEbWex6C+epJBJb84gOkJwGopl6bVvXyhKNDhr3k0Hir/Gb/kank
 Eb3avMQ0PzYv14Ws6hOJQWmyQJPECwlcszsrR7HsS3tW15qK/8ye9buMfvHkqOxgEP9z8
 IBM56jAHkWtarYHVeJdiXNGGYyAJze1F/rnii+OnayYUfbOSDtLQx4wLsSUSWv2WyDkhu
 uxQs3pzDtU8kGgzXbLcVwDu3efVvHBvrqaYRTdgERv33Oh7w7Vm98wxPtcNrtA07FZA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7750C60730
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 18:45:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84482935A7; Mon, 21 Sep 2026 18:43:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Sep 2026 19:44:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e80a249f492c0ecb981810c47800514feef59d9c
X-Git-Newrev: b2c69fe0a46294615202471f200390176d7e3bda
X-Patchwork-Hint: ignore
Message-Id: <20260921184358.84482935A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skopeo: security bump to version
 1.24.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b2c69fe0a46294615202471f200390176d7e3bda
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://github.com/podman-container-tools/skopeo/releases/tag/v1.24.1

This releases brings in a fix for:
* CVE-2025-11395

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
[Julien: add info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/skopeo/skopeo.hash | 2 +-
 package/skopeo/skopeo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
index 8a9fb22133..e496eb4410 100644
--- a/package/skopeo/skopeo.hash
+++ b/package/skopeo/skopeo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1eea9364e344c4d6cb398fac53bc387663d19690552003b43c75819e8bb55527  skopeo-1.24.0-go2.tar.gz
+sha256  6a3f342a327ec7684198eb0e15114940b6101506db48d9a96590f5942cb3b335  skopeo-1.24.1-go2.tar.gz
 sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index 354998b175..5a22658611 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKOPEO_VERSION = 1.24.0
+SKOPEO_VERSION = 1.24.1
 SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
