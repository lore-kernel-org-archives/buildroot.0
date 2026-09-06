Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624CAC79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 09:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28E6D80DDF;
	Sun,  6 Sep 2026 09:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLlYyJWasj_E; Sun,  6 Sep 2026 09:20:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2E44680DCC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788686459;
	b=tWR1FIYGZzgyrcgCoKopqVXoRbPEd0k1Iopl0Q5yf/bkpACprj+qU3On9ez5GcAe4rpi
	 BkeeMvYfBsmxqcvg/DPY6xAWJtkLvm8Ld+dovx8FF56WV1uCgwJLN7g2UeT6dXlfaJhio
	 l4B+LmX2iMj7aE7ag2ZLFrnxFPaumOyeEtRRUDKOLkrYyuwWFebJKikSt7lcma7Whi161
	 En6FvMUnlIkuiJWTDC5nDyaN4bsYCjbb7amubusxg+Cpt9hNDreWOoafyoRX/o/mCKF+Y
	 9L3nszehQBbJ3lHX2MSQW8bkBRMLMA8Vmw6FxJUz8FRstGvtkFJ0Nk7RpZIC//5fdew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788686459;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=E3iAiw4thGvKh3VKB+J5FI2UGQ+TenMyqxx84vkIFZg=;
	b=N84vfjCsAH/XPaffbgBCISAdbpemxAvigFxpzqGSZcrjHkYdMuEIdJ68YGqTJ9M8FWoT
	 DsbGNrD4FAcYvH0mKLpo9MITmZECOzkDQgatpnyXNAfvcMWuSx2PrLIyri+gu/C99wrGG
	 I5WAIWv5MqBR9tUiatwSo5oDv8fiROzI98CBlTCRAkPskkgxAL0avd4adEfKc+e3tAqKe
	 zj9zfK4tmGnHsM7A/z3+lrfo8aAaPqNzVzLon/NzciKPckX79CU2nQYiI7jAgjXYUlB3H
	 4IK2TTqSjF+0i+YGyKeMulug56ZUuRp8lb66mIDYDIqcCY3jGyzXXkyW7IwrivN9qDg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788686459;
	bh=E3iAiw4thGvKh3VKB+J5FI2UGQ+TenMyqxx84vkIFZg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J4AemqY5/vULP9kV1+2B3w27uoqSbRkf3swoPGUbUeB9j+On2JF519hQYclvXMFG1
	 JtOLcBoxmLbKZp20lf2IOKXRPB5IbqMs+xx6uJ4smLl0nFje7Hv5STrQAUOyn7hR5q
	 BQ5TdrZ7tdjkmnF1fhtAwVC7u7mg+QH576btbwaDDPp7g0HCVxAUUerlvlW+lAJHxB
	 Cl62gEZ/EWQQNXKE6i3acVyRrXVFapBL65xrB3NJkuMKTXuvlKtL2yhepsfpITTPEZ
	 FkCM/tmYgirHJKTAzjgpcIsobjX/LrblCdRZRwPTiB1Id08Mfy7r2U7+1tPq0GZb5T
	 YYF68fxxqhB9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E44680DCC;
	Sun,  6 Sep 2026 09:20:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 877EB72C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 793C64008B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pe__EW00s-WH for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 09:20:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2096F4007B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788686456;
 b=lAXrznEoEq+7qlUlQ4gvV7CLk/cH6+O+z9984JC59Tp4Om9vFJiU0qbNaYZCmA0N9fJt
 nVbKB/z6N4ULvAJT5AWBVE28viCZ0wMePCtkc118uBsxoXujJNGQSPU9wu4P89XZhy0ZX
 Rv/G6ffGnVt693ulwmnX/3C1wh8q1xR6GkdQCDP15oSaIt/52Zl6JPoeIZK7ltVF4dgOP
 M4tCYz6zoVmWyPWSsR6BFWyEGJit59R73Seb7572x0Auk57hRn+G2I9Ol7wE/qPk6oW6S
 f+YZCHB/2I3BDrA23p28raqvPtvOaqRpi5Gp6cUh03a0O5c8fBDsGtRWzbL6oywj6GQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788686456;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=C4PJqp63SWRpIhBBfXC28+uIEONrCcm2pATtR2j7XFU=;
 b=FRRSXxMCMQ9veK3BLWEnvZD+cSuMKW2U6ZvIMQRGLCsYxdLosb6JSAV5tx3WQuiWWCq1
 x5F/saKnCJc87UAsuhcTAZaplamuhg3q1spJmxYpSH5XcLGXoCyZxv9cQznzybZ9nDPkm
 cAyqV2cAwBZEMk55/VQXXyl1tnyyDVtL8Y3ftmJjS8sQfzmpJSycztB8KD/xWbgjtH1+t
 S2RYnfY7MO6/JJyTpDH9UlpXkEap0Yip7xS+hxamgSXmaZYv9Eh4TkIA3+saQO6bImHNm
 jMMs+0eDctl9k82/9IG2Fa+Hwf+Ju/f6GVYyb7srclHC6MRc1x+npYA1gvO6v1ofQEA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aqlPT+f9; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2096F4007B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:20:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id EE3F719F593;
 Sun,  6 Sep 2026 11:20:51 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Sep 2026 11:20:51 +0200
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 11:20:51 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260905201943.2314688-1-peter@korsgaard.com>
References: <20260905201943.2314688-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <67c5e6edc9bd60bffa4f65be8a2b4779@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/agec: bump version to 1.0.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 05/09/2026 22:19, Peter Korsgaard wrote:
> Largely a bugfix release.  Fixes an encryption issue if the cleartext 
> was
> exactly 8KB + N*64KB long.
> 
> https://git.sr.ht/~min/agec/refs/1.0.0
> 
> Drop now upstreamed 
> 0001-io.c-isarmor-do-not-set-eof-for-35-byte-files.patch:
> 
> https://git.sr.ht/~min/agec/commit/7a529662f9c113ca284c99161b32278f17e278da
> 
> Upstream renamed the agec-keygen utility to agecgen, so update the test 
> to
> match.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
