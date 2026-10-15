Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338F8CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3692613AA;
	Fri, 16 Oct 2026 13:13:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UNvd7pPoxx8P; Fri, 16 Oct 2026 13:13:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DC5C8613A5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156414;
	b=jC4dKwTsPrFi0NnB8jXe0zzhWYPwbWRsx5tLdWSEvIR+UaDnrt4l2wMUpz8bM7RFTDGU
	 05W+T9KKed/plFB6T2x+jviFNXq3lOPli/X0nsOxAN7+pNHJApgo6pps/Qvz5fXyyyr/J
	 XIuZa4oukor20viP7bHQ5lBFc4QJzyJynyOmRa+qhy5zlIzXEhR/GVtJYTRnyFonoynpo
	 emZAqWo5iREjtT6DZZRt6XD56nTHtCy/lAwld8eIjteHtae6CH/dmI4bju8UPXc7Eo1xg
	 8DoJRz3TA1ECwTo2E4YsMYtSdy2Zdppy4VusRIz4qw1S3ZFJlsPuubxiuJ1g/HVdXRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156414;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=F/rdfveNG6G/n4VskqAzPjS78L6WTm8cCev2ialQ2ns=;
	b=UivRATdPkDpjrUQ3mQPM92dD84zmx0yC76a4V5t0Ac83qqNJStbzTU75nr8HbhHj5b0O
	 agoTITLCoU2JjSMCr6CbS4EAGBYr5ABUYgSn4zV+sIw3Pr7VO++bNv0oU5RCGf4iuKzTD
	 Swo28iAEmvF19lswtaYZU6SxKpfVxtpr8IufFEhKmAkdmS4kdKdD4lKPItxLeCB23WTWv
	 tA/oBMJqPFDHn/yFZOMGARKSnTZnlyzmpbHoJgQWKQLuZbwFT63ng1bmjPN2Mot0toVdB
	 zNc5zkc1+zHnfCuTNs/qPHrlJrWcujDLYNUxF92FoAGzcUT/s8DV4MPrLhWRzK2W2zA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156414;
	bh=F/rdfveNG6G/n4VskqAzPjS78L6WTm8cCev2ialQ2ns=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=grbGJhsN8cXh7QVa2/46x15zgtTzJ8gSHNKc0IT4RS/SzgUagDHoHDN6UOz9pA57a
	 3/hcGVVagyVizhGgL12hsPPQkeYN4WVs0xQpU0V/iEULTD8DWLgRWZ6sLeEXYBFj25
	 MoKJ15bujBOqgL4hOp1MCAKnRpzhvVfWlQhZV/yw8BG5ZM+U2OnVfPohIdzX1jzJmD
	 8WML50hxiz4pyzVLnxWBsECprwEq3nybbJPh7UveQCP+fV8ds60lmDyyGITfRqXbvL
	 BWCOIanrLCQjy7Q2a8q81JaJKetYjM/tefu2GB0yJ7BTDoy0M/dpT+amVz2XShjlJ2
	 daUNIolqTwLWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC5C8613A5;
	Fri, 16 Oct 2026 13:13:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 50E02920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 358A860F02
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jFLIMPa_cgfF for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 38FD660F3F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156193;
 b=ra5aeXCh3LWIUZV5RiDLoouDeLoIW1yiyO7jUI1dtnQrB8lHwjzejGsZ4UbqcGewDQMn
 evdZJq9oAlQYQSX6vwP3VrBf19nIzHPDv6N+icyrn1BsaJ4qUclnGVkBBXpyP6a8jhTBL
 fze4Z9QqN7BMY5vfwJ6VDRE7ftP6KI6NeggKMHaIF5sPu9FZNrl0OFRlYu+vT6zxVeQQC
 RuD0oWFWwQ59Nl2s/D81Dq3p+xf6oeWhaH+D13TVjvncy8W6WeT+eaUMDx6lmVvxK7ZTi
 to9HlHkAFNLyMCo26jUuMClSaioTe8OlpDnZdNFoq63ajdsfk+1kgbpl56vfsIZT9Vw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156193;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=82JoRqAdr4E9T+8pZJxJDCOSvOgeDY+PpvsI/ijQ3zw=;
 b=LlnFnsHg7DWVLxufKGI9QrTN9bGegqimU4x74ZSjC+2WIRf4OHWitWUKaRYZr28QPDPO
 o0nrrup80eZTiHAF/qhVRLpfU7fW7CFn6zUAhyFP8VXcQLHBB0olxUGdGV4lNuUKvo7y3
 cqrfMVar+dnuZpkiDv3JyO/48Vd6sujYub6FMW2HgsSLfX4Tgw72Yn0B+/6DLtFCt6NJa
 p4cAmmb+YOgWvUGJVfCJOtRm+RVMWuxCH03uat0njgLXFGA59vfkVUHTFx3bROzMO7ocx
 8AlxPy4Fyzk+yjBIrCFK/FoaJ52OXXn+N/yI2yL3/kQxCH14c4gKrpUcgy1aX6pknng==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38FD660F3F
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 290078D704; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:14:48 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 3ac0f22f90ed9a132d3568d6926a76df38ddeee0
X-Git-Newrev: a6a37ba0db759363cb8e4fdc016385234108025c
X-Patchwork-Hint: ignore
Message-Id: <20261016130832.290078D704@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/iproute2: add
 optional dependency on libtirpc
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
Content-Type: multipart/mixed; boundary="===============1636415175712059152=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1636415175712059152==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a6a37ba0db759363cb8e4fdc016385234108025c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

iproute2's configure script probes for libtirpc through pkg-config and,
when found, enables HAVE_RPC and links ss against it. libtirpc was never
listed in IPROUTE2_DEPENDENCIES though, so whether the feature ends up
enabled depended on whether libtirpc happened to be built before
iproute2.

Add the missing optional dependency to make the build reproducible.

iproute2's configure script checks for libtirpc availability since
v5.18.0 of iproute2, which Buildroot started using in commit
10990c576b2ddd7636f094f510a2ad1a5a80e50d ("package/iproute2: bump version to 5.18.0")

Fixes: 10990c576b2ddd7636f094f510a2ad1a5a80e50d ("package/iproute2: bump version to 5.18.0")
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2b9d1a8aa671982583864ca050380120ccf6ee53)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/iproute2/iproute2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index fe7a6fc304..344a6fa8e4 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -25,6 +25,10 @@ ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 IPROUTE2_DEPENDENCIES += libselinux
 endif
 
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+IPROUTE2_DEPENDENCIES += libtirpc
+endif
+
 ifeq ($(BR2_PACKAGE_IPTABLES)x$(BR2_STATIC_LIBS),yx)
 IPROUTE2_DEPENDENCIES += iptables
 else

--===============1636415175712059152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1636415175712059152==--
