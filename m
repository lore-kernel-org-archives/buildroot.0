Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725E1CC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 20:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B74EF4091B;
	Thu, 15 Oct 2026 20:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EiNDCwcrMLni; Thu, 15 Oct 2026 20:12:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8A8364089E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792095137;
	b=A+ZGkh3ZhB03vc+Sx41RC8gyqjRksANJ1MrVM0oJAgi7JI7Gxa5fnqgPZ+lTKBtMdzXC
	 4xbRY7AC61kOfWuiunNDBzetdPU+T87VYM5TA41vKUpxacr5a7Som8c3wgFPIN9vAy4Mo
	 zf7oy/HmEDcgDCBYLe5iLD5aIjUft5lE0RIq14yYU1cLCkege6uI1uGo1skQJ31IPTjWN
	 BS+2/hIkmys0F90iJEtc4eQ9gp+lSTpixgkonKZoKvARds2XK1lgoUJOdccLZ3pu/y/p5
	 8mvMuWMVx+rDOf/WFAyAUCYuj/Lsi4HnNO/7x2uJFGKyR8rbm0ZBkPuSsj5o3A8EElQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792095137;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JWFEWYijy0ztbC6O9C53XD+zmuJ8zq5LpuuO6C6tGFs=;
	b=kaS3uxzc4wi8VdA+LIXsDWssCZZ5FchyFSY8Lude4PTrh1VysrxfVbu3K0QQM7c3WIlE
	 SUBsDltItFwhtpoA8ZQRyoanfufgKjnhinrwrEOyBZA+AKNVE57l+haPDdwb8s/qllrce
	 aoe4gUlZf6EglgMCDoJEyyqxfeccDKPdJOC0pOuvGqaA+xmE+OyBtdGCI0IV8ZxeSdqeg
	 lYvZfnr+h2HU6VW6zE2IvMIPmjIOHU8k0SFXYtv11qsguZHCh0+cjGmaUFh3i5thKSmlL
	 ljGIpeIqE0rekNzVuUd574lZD6Vq6w45adnCdLs96CwYyLekBmdipm2kvLgxpHnbgRg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792095137;
	bh=JWFEWYijy0ztbC6O9C53XD+zmuJ8zq5LpuuO6C6tGFs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gzkOwXg/K5JSMl42zJm8ex6IVNWK05dlPDYqwXQ3CZNZO96y2rqPg0BWfufyRJBUP
	 o3yFwt87FSN0IppeOm50icdD4bEZ5cDvUhki0csjJFjoRx8D9IBjCG+0TdwXxtbaQ6
	 QEj6jZpmwF2p2aDVkcQLOBoX3bxJUfkJBLQa30NLyp9cv2YLYvbfknWQctw2IbxWYx
	 Lof06trHsOi9z2gfbLqzSL+PdfLk9js5jJVPcKBSVQJWq2QntTImuPi2T633u5Nmeu
	 a/vswpyAkMrnNNgopCoz7SjlTvgPON3JMY4aA4pJ5v/xaw32z3TYaaxwARKQhLb/py
	 upsPv15toaGmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A8364089E;
	Thu, 15 Oct 2026 20:12:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 614861E9
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 528AA4086D
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fz-jcDDMXkh5 for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 20:12:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5FF7D4089E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792095133;
 b=TWVLjU3RbR+0rGGmo1bzugWe84MJE/1/TgDMxkLY8KJi1CrDgFLOavt1x2QY1r8SGNad
 z7/gWQqxOXzjDn3hTAG6STdQPOHa7pr079FPr6hR/B+XSmQG3QBMMkRpBa5in5myc8dX3
 bMPkxdQ0ygb1NA4ftjn9bMQqr4nk+bhRJMF2jvGRshzja5Uuqhk4ybLXh7TXYz0wBAk+n
 7Zrpp402KqYfePvXEYEpzddE+6t2IaGinjLsV83YJphWdloAAdruzAJ0THoiNTIx2SwtC
 cZdDX/yCVfdLzGycRlyHPB8yoAye1khZ4Fc09HOK05rXDvdZTeB4OBG3gb8rSaZLoxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792095133;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pa9LYbPiZoCiHTFnTavtPpbvvu/WJniMerY/6HQ83nQ=;
 b=f8qPrUUa1HY6jR3hqm7aVaet6VCYV5Y8k1yH9HHuIcpoeUa3SVJu+gFfOcJ2jBcHFHw5
 dtoUCMgtjGGZuJ3oTxBC0RO+eA+LU9HYfRk/aXDt/TbRnU1DQ2mACpNLWnSNrAvtYSIo4
 aLAyYh9DQH3IkG6mvxG0qNS6zBTSW49lgBdKYxdF8LKmywJOZnMo/p2UlHOK1hKe3isGH
 /zaT4wCdD0QoyiG4mVB9Z3dBm3YYRnu7UCkjMDdfUOLB8ChCNa2UFV4lJn5ooIOwzICAS
 Qrs0z6x64X354UdtRfjsGd6bWL4MfmisttPUVVDIHzgW25j44QYK3NhmGs0eiKrh9kw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FF7D4089E
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:12:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94FD795D68; Thu, 15 Oct 2026 20:10:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 22:11:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58aedd45baf9406ed36e9e90b554d3a689440b7d
X-Git-Newrev: bafb66de2d6cecfd5e6b8c10d77f8936c1910338
X-Patchwork-Hint: ignore
Message-Id: <20261015201052.94FD795D68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libplist: add host variant
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bafb66de2d6cecfd5e6b8c10d77f8936c1910338
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

shairport-sync 5.6 needs plistutil on the host to build with AirPlay 2
support. libplist builds its tools by default.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libplist/libplist.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libplist/libplist.mk b/package/libplist/libplist.mk
index 2c7edd38ef..f4ffbdbd7b 100644
--- a/package/libplist/libplist.mk
+++ b/package/libplist/libplist.mk
@@ -15,5 +15,7 @@ LIBPLIST_CPE_ID_VENDOR = libimobiledevice
 # Disable building Python bindings, because it requires host-cython, which
 # is not packaged in Buildroot at all.
 LIBPLIST_CONF_OPTS = --without-cython
+HOST_LIBPLIST_CONF_OPTS = --without-cython
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
