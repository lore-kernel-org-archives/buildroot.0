Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEDFC624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 11:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62FB760BE3;
	Fri,  4 Sep 2026 11:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQO_XrfwtEMY; Fri,  4 Sep 2026 11:51:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 88BF760BCC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788522703;
	b=i9RY670MoMgEQ/a267dfNFOZnP6DuIUUpzJsKZk2s/z2AtHQiT0iMkPhjuoZz7yHKdxE
	 3xhCX94GDbZZJW638Ns8tIKTchMnNIj+yNcQg8hg0sZi7vv4ve0Quj/n59syjB9pnt6DM
	 qxYHQxB6C8r0IfookemS21qy5gk3oalIvi1sFIUJeDCfEHBMR4NFL9IP1VNq3sh/4G4ZC
	 9P7RhjoXd6nqA8KV9wl8YWJNJM5Ibkqx4gsoIHIu4p09xM/lj5ohwqNA0KN03bfVk09UV
	 cgT8sHoQLA3t9FmdwGcTKLoUhBiwLKHUGRNMzbEWhmANQPEtH5YqocUTeLFbnoVr2yw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788522703;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4HX7jEusHVvhSxJMi+3FNFkxqD7dzxpiEci9MCPlD4I=;
	b=WSsWiLGhLIa+8mSiUhwIQngvEi8HiT9qMRqyz7PabDWHPmAMSgLoIjSCGqUrGDIcpHXT
	 Efq7BnRjd9KApQLWPKkgXL4Fu312iYz7rVTC2tjGp5sdVFglCVFyABUWd+n+V/pZ11c3O
	 cqsUxhQclbNkdcJnj1jOnXJWCF6Toej65IT03w3Da5etHryruLzGBLRE9syhjab25SktS
	 aMYZ0V/jE5AOa5xHnTHNIbNDDNxIGLOY2m7mEOSKm984zUtaURD/bX4x/++0Gu4tT+vt9
	 OjcyRhmBLsCxxR3ACyD7KmoNFvut1I7TCkI3Pp6n3JVncyPgjRt8BehiDGA6pFeactA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=hTJSLbu+;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788522703;
	bh=4HX7jEusHVvhSxJMi+3FNFkxqD7dzxpiEci9MCPlD4I=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LFaasg27HtYuiFqVXUNucdXnN7Ew0OWx+5cweXmg/M5Xq49quIBbQuitLDbHgK3Vg
	 KGgmAvrhJ0gWEbjsPdAIhzrS0C9axauQzfYMUX2wuMiQB+vr8mj14BWXWxPyWTWJGH
	 e2pYXS5Er8Teek0x+hf2UST3Tormm/Hn8Lv67ncF4PEV0x6Pm0Neie6MaItchNqoYm
	 vm9bV8LDiSYUdzwJ9bs94X9wd7WRfKduERPmGVFaCaVIRNfPuQFOy3Y/EPVKtqCGS9
	 kh1zUMDgRZduw4P08PgVfAu9RasJ3XYWlGtzsyLCg7KzgBE1NVKNOZXPktVh/Xampn
	 uwiHWO19/atoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88BF760BCC;
	Fri,  4 Sep 2026 11:51:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BCBAA10E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD61560BBD
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IP4SNjRSOszR for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 11:51:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4994360BCC
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788522701;
 b=mtMmWX+7mx73abIn4iSBp6EsMOXl7YA3ntAdM1IXrZEQ+CghhUpb2HcDBTD5aw6CdfRL
 IK5G6eqO7X61dHobrkL+2PPiAChdzbg4mvWZvXzMyu/WjgOMBOT6PWLdCPi0xVF4qrv+m
 L8+1tAlPypIHLOh//SUU25qiFKMz93zRGhdg5B5SzHj+0yuYSX3rAQo99vMa22KeYhr1n
 LDywkkML7/gUbJSGXHx4ru0O7QF4mBYs6WUifH2jLR8sCBlSC1MOoPGc7/qvEYwHePLla
 SosyetgJgfzfZxStBZ0gBrhFtgq3RTXEzTZy7seYdoOfdDj5TPDJj4bijPZQs/+3iHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788522701;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=nt5AiDIDSur+KwAK/61Vy/ywJLU5wKOTMbpTPexPFiY=;
 b=dWxOclNMnBEH2QlARPn9thFp2Yt542aWx5Hucb+wyIMzqQlioU6HU1cAsFjGXICkISn3
 A3dWAa/Apy+uyKfuQSjqu5URroUrl2nya2Uj8voXvzsptaHB7yYhv1OxdGRO+8cL+bzII
 DEsBzjDpeIS6r9Zx2917g5ZK8wIfTzh5wBc/jpNiHuy/LUstT9073cDSCXa/4phxO4xLV
 k0aJqNzfVOLYhAxDetpmbAySMeUB6qIJ8OYXgQ4YNZSq43+ZwiCxL4/K2gdib5h0ieaJs
 TcptwCaw6hn0wJ51xSB6kxy/LBXJN4PSFqYm7VcPUvGHTl3TYh6Wjn2cq0PwfZ7OWkw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=hTJSLbu+; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=hTJSLbu+
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4994360BCC
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:51:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=hTJSLbu+RbqTrB92TrpbQbRG3K1mPdvLkZmqGckSkIkkf0oqQ+UpFcNwJrVhF1iVHSQlB+2DGtpX1n/nKUk9/aVM7uSjbWxMRcobHXIdrjHwJZpJFmcYs/Oab/Q44o/BRyFQWyyP77m42nBOnBv7rQV8hJxdu1AErmhMKW8sfCRODRLzIXPYGDuq4KrC37ofU/DhQ71Ha11baSZ+qvcsy54hCi2xfoIosuisHATX/ldkPJnMf2wdBC31sK+vVGe43L+PnbMJdP8ct3cZAh/X3HWCyj+9jBqo9Ejb6nUi+/OcqSbvjWi7Synqkz+JsDI6R4NNhqTYczfVxIya0Lj6Iw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=hUOR4LzC9rJDcZB/tLn0qe/3ClbgBhiJ0zvL/XfLDcY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 653502515; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 04 Sep 2026 11:51:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x2SSF-00000007Lli-0tMY;
 Fri, 04 Sep 2026 13:51:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260903063913.73831-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 3 Sep 2026 08:39:13 +0200")
References: <20260903063913.73831-1-bernd@kuhls.net>
 <20260903063913.73831-2-bernd@kuhls.net>
Date: Fri, 04 Sep 2026 13:51:35 +0200
Message-ID: <87zexxnsjc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/2] package/libcurl: security bump to
 version 8.22.0
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://curl.se/ch/8.22.0.html
 > https://daniel.haxx.se/blog/2026/09/02/curl-8-22-0/

 > Fixes the following CVEs:
 > CVE-2026-13608: OpenLDAP SASL authentication bypass
 > CVE-2026-18924: HTTP/2 server push UAF
 > CVE-2026-19931: Negotiate ambient user conn reuse
 > CVE-2026-80229: OpenSSL provider use-after-free
 > CVE-2026-80230: OpenSSL pinning bypass
 > CVE-2026-80231: native CA store conn reuse
 > CVE-2026-80255: secure cookie attribute bypass with tab
 > CVE-2026-82208: wolfSSL CA-cache hit overrides callback
 > CVE-2026-82209: domain-scoped PSL domain cookie

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > v2: no changes

 > Series passed Gitlab pipelines:
 > https://gitlab.com/bkuhls/buildroot/-/commits/1ee4fc21f8ea0a236ba8681a49400e915f10ff4e

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
