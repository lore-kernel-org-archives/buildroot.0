Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B40C982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 07:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD9AB60644;
	Tue, 22 Sep 2026 07:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQux2f7396iT; Tue, 22 Sep 2026 07:37:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A4C2D60606
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790062646;
	b=dZ1uwF1WSaArWZGY8AZQz9P2iYJZ0gqstLJajngOtH1QjQhBuvRq0e8W6RZwnwUmRc/h
	 vwm1+xWADL2dhuCtfQLWuDTdzqUdLDZatROjIKhvwnpHkY9d/i2KPTc47hKt+iDqxDIvo
	 QcTGSauTLztx58kpkrJc8mNfn605roefVEXEN8EbQ0o0ZEIA29ZhwnrMstOd/KyUmjZqK
	 3jUBzbZxcm9l9EREyIKEsQxv+WeZAjOOnmouseoEsxjTyAancPYp8fGmr9hfbXktMBdE6
	 hg+gQgY519bmPZSr3GZOY84UHrTAyNAl3mPNTobnQSQTlVRxL82Y9A85DDFclNcOdyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790062646;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received-SPF:
	 Received:DKIM-Signature:X-Authentication-Warning:Message-ID:From:To:
	 Date:User-Agent:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=/w5Fkmmy0zPAsLBclzRNZzCJ0SIGWwqXkcF0cybN2OU=;
	b=HtcQI8GV24JmZcJBAsRnXdtzdAK5EyAy3XscuA6gIzaeP8jcVgPyJ26lOGPSHA54qkKS
	 UnuxAy4Bb2vCEAlFr6eMZ3w3msqa6DYM6qxqW4riLepM38USuxDh/IdJDwQ8xt32un6bc
	 5szTaiyOAt+LYPeMz4ke3ARyJieZKBD5yZba+1mPw/SfiyGdD/NDNlI6BHiDPKPXDvoaw
	 dO3B5daScLgdJ6RvZVWfmERut9lmt11ZUdxn9zQkyji2xII0tSosPrwxzpHrjB0Q7IfZt
	 LlL5BaNKRyVnUjrsu3qWimaX5+NglRk2NNQArAlr5TJfSLGpkqbHS3HOCHh3RZZKn/w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=sonologic.nl;
	dkim=pass header.d=sonologic.nl header.i=@sonologic.nl header.a=rsa-sha256 header.s=dkim header.b=N6jnLZzp;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790062646;
	bh=/w5Fkmmy0zPAsLBclzRNZzCJ0SIGWwqXkcF0cybN2OU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=phm4BvDM9rI4Y2AMAix0FPYnNDLXYwvC2exjpHU66bnQaYxc+h1oAKfn2v+4aumY6
	 E+Wftl+D7RXY+u0QAeMIupKzU7ZBOTvOozPjx7WbHGjwkoUEY1fnToy+0u601TR54Q
	 YQfSpEECRU8pN6HPPTEqukAEos372LYwBZTxHc7rLoYTjFTGR4e/Ke4lO+Uaq4SXTl
	 GttTtwllEhJflEAypKfhXbuUn/dnzCMXdQ5L8rHKDMtLGnpZ1v7yJAznBYe0Glgzab
	 Fo034ZTjsinUKeTyKVcJ5z7Oh+YL1d9WeTj9OHDFSaSRCcWuNQ+0IeBY2jrEZQVzqG
	 jeOcVjJCECkcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4C2D60606;
	Tue, 22 Sep 2026 07:37:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AA533A9
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 07:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8811C60607
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 07:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l77f3gEg_Sez for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 07:37:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 81AFA605E4
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a0e:73c2:602:2002::118"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790062643;
 b=qr9jCIcTW/6gi9+Q8bJmQLTYkTtcKS3ETVnQ39GjUUMVrWr0JNJFlskRZHbg5dsstCob
 QsUmtZX8Xdy6bxnTm4pAq9hB3KTLEGby3hK5XP4i2Xh0FEtmTn8zcLa0TdcNdSTISavUo
 sySZctUQix6vIYKyWiZ5Coxs1RMM3jXaOwMMO2ycU1AcXA00tFqFooxAnhvbu7CpE9m5S
 ZIjp4pnaIzcDAtVQhb5BBGnAmsQIt+1ugOGh/Iz6ncuzzASxMf2vsWz6j0QZ270mlvMvv
 jjkdOCgKx0OnYw4cmmWSudK/W5xZ1WE0/b5eYBmqAeRxln6lT5wgpLxbLNKkpfHvPpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790062643;
 h=Received-SPF:Received-SPF:Received:DKIM-Signature:
 X-Authentication-Warning:Message-ID:Subject:From:To:Date:Content-Type:
 Content-Transfer-Encoding:User-Agent:MIME-Version;
 bh=pfqnuEMay+sspTLcvxHwVL9btAHI72O26C1RYI2CWVo=;
 b=qdTL5FWKvk1CwFHwGhBWdVMLunBLXLmTLM8t4MBiPZ+qErhkdWTG7MF60EC60H5Fx2UU
 7D78MNQnfr7olNI+GMuK/IT92USPqwFVBkIW/75xjr3KSYpkz62pHU5YDqWjiL+2gDF52
 5PxMN1lByTkAHiCpgNNQ5rFZQiawnMehEPddTsD2AtuS7VI42xgsLXSUIQbnCJYMbJtLN
 TQ1iCv4pE9Gwxokc0zF9nQ1svpT0AOceEG/aFaIB+VGGxmFj7NcDp8/BheeF9Gb3Jp6Vu
 iDWRYpravWnPE2BT4NAL4hNSo1ALxpeQyg9HVIuO1SIMLBWg9ab3EmdYgrVP3aHhbmQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=sonologic.nl; 
 dkim=pass header.d=sonologic.nl header.i=@sonologic.nl header.a=rsa-sha256
 header.s=dkim header.b=N6jnLZzp; 
 arc=none smtp.remote-ip="2a0e:73c2:602:2002::118"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a0e:73c2:602:2002::118; helo=mx1.sonologic.net;
 envelope-from=gmc@sonologic.nl; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=sonologic.nl
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=sonologic.nl header.i=@sonologic.nl header.a=rsa-sha256
 header.s=dkim header.b=N6jnLZzp
Received: from mx1.sonologic.net (unknown [IPv6:2a0e:73c2:602:2002::118])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 81AFA605E4
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 07:37:20 +0000 (UTC)
Received-SPF: pass (mx1.sonologic.net: authenticated connection)
 receiver=mx1.sonologic.net; client-ip=2a0e:73c2:602:2001:9745:3c6e:b6a6:dcd5;
 helo=[IPv6:2a0e:73c2:602:2001:9745:3c6e:b6a6:dcd5];
 envelope-from=gmc@sonologic.nl;
 x-software=spfmilter 2.2 http://www.acme.com/software/spfmilter/ with
 libspf2-1.2.11; 
Received: from [IPv6:2a0e:73c2:602:2001:9745:3c6e:b6a6:dcd5]
 (2a0e-73c2-602-2001-9745-3c6e-b6a6-dcd5.ipv6.karabro.net
 [IPv6:2a0e:73c2:602:2001:9745:3c6e:b6a6:dcd5]) (authenticated bits=0)
 by mx1.sonologic.net (8.18.2/8.18.1) with ESMTPSA id 68M76xWR020145
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:07:00 +0200 (CEST)
 (envelope-from gmc@sonologic.nl)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sonologic.nl; s=dkim;
 t=1790060820; bh=jCzQJ9z69DtHDywGIAMdFUiPu4eYSt4Fm7HM9n8LXK4=;
 h=Subject:From:To:Date;
 b=N6jnLZzpttS5SkSzJHEjlDDHysXSfHzSrbkIqOG+Yconh5NByr8eU7DgXwFhHv84d
 rlBEIbaW6vNfQV3N/wuzwgm/pLicrviNr4v6lzqfA8SseZ3cFLHNCRgEzem3OAJi8q
 qVUc8SqZw/D1dHA+P/tVkjbB57PWze5RvRaBCuqeXijc/XonZzBbIbfc4I6lXgCQ/j
 nxnWqqJhLYN9dgoyyLE1iSIoqvq4N+13vCeS20HJL11QupRjntrUj8gQCVswiL8w6j
 G3lnj/loL+QBzpUKgW65UDngKC/6hE/d2+DCf0jbCDZhRXpBZPB2t4Y3d+4eZyzQfK
 wqaJGs5zXHgJw==
X-Authentication-Warning: mx1.sonologic.net: Host
 2a0e-73c2-602-2001-9745-3c6e-b6a6-dcd5.ipv6.karabro.net
 [IPv6:2a0e:73c2:602:2001:9745:3c6e:b6a6:dcd5] claimed to be
 [IPv6:2a0e:73c2:602:2001:9745:3c6e:b6a6:dcd5]
Message-ID: <ce3892224b3907d22a3bcdf96a8685ae39d55380.camel@sonologic.nl>
From: Koen Martens <gmc@sonologic.nl>
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 09:06:59 +0200
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Koen Martens from
 capnproto and linuxconsoletools
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I have left the field of software engineering and will no longer
contribute.

Signed-off-by: Koen Martens <gmc@sonologic.nl>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 62e3eb278d..5cce270296 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2131,10 +2131,6 @@ F:	package/rockchip-rkbin/
 N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
 F:	package/wqy-zenhei/
 
-N:	Koen Martens <gmc@sonologic.nl>
-F:	package/capnproto/
-F:	package/linuxconsoletools/
-
 N:	Kory Maincent <kory.maincent@bootlin.com>
 F:	board/octavo/osd32mp1-brk/
 F:	board/octavo/osd32mp1-red/
-- 
2.47.3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
