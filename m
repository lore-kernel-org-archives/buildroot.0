Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B49DCA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 21:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0AE7607ED;
	Tue,  6 Oct 2026 21:10:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ub9Lmu_55v5I; Tue,  6 Oct 2026 21:10:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D3A7F60616
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791321011;
	b=m9yWAE/c3xQKte29AHWadAVa0HbFgaQOd1CA/h/s1DDtfikagMtEXLBymXfPZk3wNKZK
	 TpnAVPLFRk7tGi3xnMYGrlkmn1pc0aVxOBRUgimqbHA7v2lmh15RAI7xkLASJ82WDW5ZW
	 CqSlAzQ3ynnvs92TW6snaE1U9yHSQ6YkbhflQmR3fesJEVB61uqPO/kIbNg0YH5NMi5hJ
	 Y13ERRpHIFs0Oj1R286Z541HLx4gSHP2Bf7CiXDZs1FEcD3+No0IkueEUgWqEN5d3y4aC
	 pyKG9KCv+gW3wFDqszfd0bkpTBTes3jtKMABad483uezbA06pXMsWR8tEhrFfZ+WiuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791321011;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=a9JqyKv0JzqH3jogVRNc/VFQjw1GflmVCpu+rHL/chI=;
	b=n/viVh37xpneiYk+480cCMAyVmzyqqVbaasjo10v/OZuvpF0wPIGY8jZqZL8eMuzzVFG
	 DYZQscjIj0zOiRGsDRAgn7wOZxpkxFilCqDUDbatdSXPyy+BEJC+dGB65q76EWbKOSpWt
	 wQJ9QN89QMMnSdoSBIIUSUeym/HgxrpKnLbdRf1MOC2lqYf0Atd3YFoHBK/v72lSp2xoK
	 Rw8MugXhJC8J95WRzVUcem6hYDs+ZE33RxMhQrCStqhVGHH6BKdc/OwqSEFII/pYpbH9O
	 WdwDvvRHwbDaWL30zM6XZ/7fV4+Cp2ttl2bvLcc3zy6kwsLHoGE6FfzQiaEmKnSs0Cg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791321010;
	bh=a9JqyKv0JzqH3jogVRNc/VFQjw1GflmVCpu+rHL/chI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ui4KcL1M1WpthAvR7WONuIJXW3OH01OPu6XexUExzC1OFZHgckyOwzqzVoZcP2sYS
	 t/prXpO7kBSOx5MkpMkAILQnCq/22YE7vg8rNZ4HPrfGyGc/MWiPmCI0iURZehEFPi
	 zqc9x1O8lpbG77Mm0psw9ZpAeVVCzeEnrDHeELgJ0BesCL3ZdZOYlgAFP0mxdGqhXk
	 witmjcSXbAyjU2/cPGof0JhFGkZmgXwR5hot69A9RL50xMFlc6cdlqPrYh/mqHGE7B
	 qqeeKSg9WdGHo/AFbWCqnv/O2TUiEsXUA1VQRwEHnBtfGgpjB0jWimZIGsx3o6DEqy
	 t+XMwTMEaBskQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3A7F60616;
	Tue,  6 Oct 2026 21:10:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DFBC41D2
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 21:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1C4E402DC
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 21:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7oADvibZPcP for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 21:01:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2EEF3402D6
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791320479;
 b=TDZE2bXoDobQqrKs18zGVyLr2kGLojjSVb7RR6l0dz4+t389j9Jmp0OGEflr7ZK8V4LA
 /6hgez72zJrEhCXh1dLDAkT8ukmCLqODz+xfL+/BwBjDI6ng2N+4NT18rC61iEdZh0SYB
 /zbBw8jLBnc6kFTsqqb7tm7kLfQXP8j/m2fL5tUKtTwV6nog9TX6w0IYzLMIGTHsBAuSm
 jeeG4FrJghCrOA3CwUh8WmLPHJZTVHMFjvgAVLukxhOS2MTiobzIA0cdTzGAfwsv9FB+4
 GDL4fk3Dq9+IF+kxLaVIkKqPwUxdPmrVMDfODpMel6WYuTbM3UWrXj4vIBOxCcr1AHw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791320479;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=F7rtKVD9iKhK+uGuZVwJ3dDm04nbwU7KOe541Ue9AGQ=;
 b=TrEsboUtfVM6LjqIN+Ljftx5Gea6EQSpLMPP2IN/y/LotRtSDcnXJjo6DijIro4xwLg1
 q6o5F2jq0KjjjTgcqrPzg4Dkq7pqDfPiZlmezz4IFMc+t3M3kQqKVyF87h5DHlfEMLWx7
 +2y1WG2zKiW8/i0N+cnYyDt5+f36ObNChR9suZgdVdggVkVFVjrdVJXLrZjjGP1H1Vp1A
 tCB7VcZreFTwTKXX/R48ZQ7YdARosoQAqITxMr8MJwIDv1fH+M91RXLf/ldll19PvboKE
 BC5b49uusVjMBrINHkg1mFsZBU7MaqbrHub8bYCKgMxHK7RzH154Vl9917jln7B+E2A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b="U/SLNGiT"; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=U/SLNGiT
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EEF3402D6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 21:01:18 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=U/SLNGiT70frSPbJv9KzobWlUwTzYvz1wqQ1lELFjFlDjwdT2QOficgjhTuiU94TWsb3PkCFD11dMe4/K5Xn0O15Y/RccpDzEdlZvg9qwaoaI73QAHIYJlTIBQcSSm9rERZOngsdGBikIDkXG28VUZwmlEH7q31T+jYIbytfsHqavpOGyAHmI9JFoIBwkmi24LRMYiT6cvtjNmdVCnUqQWZvklXiqz2GpUX8VzMa8p6xgXsHBzlSwy4aL5w+bK5lTqPgRyNlh99DManGSK+WRfhDWHMI9cYrmfpqKNHknnGNeyAWOfTlJO/bsShPGZN9eV8VXHOsoBth+BOVQkYtNw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=YJxY8nNGON84bvybY/jcoY+qq60MMdEE7arNAnx2ldg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2026908761; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 06 Oct 2026 21:01:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xECHc-0000000EuYV-0hMR;
 Tue, 06 Oct 2026 23:01:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>,
 thomas.petazzoni@bootlin.com
In-Reply-To: <20261006202041.452004-1-titouan.christophe@mind.be> (Titouan
 Christophe via buildroot's message of "Tue, 6 Oct 2026 22:20:41
 +0200")
References: <20261006202041.452004-1-titouan.christophe@mind.be>
Date: Tue, 06 Oct 2026 23:01:08 +0200
Message-ID: <87ld8atugb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] docs/website: add opengraph image and meta
 tags
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

>>>>> "Titouan" == Titouan Christophe via buildroot <buildroot@buildroot.org> writes:

 > When linking Buildroot website pages on social media, some platforms will
 > attempt to display an image. If such an image is not explicitly specified,
 > then the social media platform will usually take the first "large" image
 > from that page.

 > Recently, there was a post on LinkedIn announcing the new sponsorship from
 > Texas Instruments, linking to https://buildroot.org/sponsors.html [1].
 > However, because the first "large image" on that page is the logo from
 > another sponsor (EVS), this is the one that got displayed and it looks
 > awkward.

 > To avoid this situation, let's implement the OpenGraph protocol [2], which
 > is adopted by LinkedIn. Explicitly specify the image, which is the Buildroot
 > logo with text, exported from the Gimp (.xcf) original image. To avoid
 > rendering issues due to transparent background on social media platforms,
 > the logo is exported with a background color.

 > [1] https://gitlab.com/-/project/2648174/uploads/5e518b0ec5a2f48d154466aaf117e6ab/image.png
 > [2] https://ogp.me/

 > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Heh, indeed not so nice ;)

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
