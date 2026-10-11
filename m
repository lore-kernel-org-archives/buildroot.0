Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FB8CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 06:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D76F660603;
	Sun, 11 Oct 2026 06:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0uKdT5oEeKF; Sun, 11 Oct 2026 06:57:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AF02060678
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791701857;
	b=I6QS6cxlI0wDFlataxs7OZCppzjbJ6wP9+4PvFR5+Ljcb7V/0IFyo10xA5g1pwF9h/uU
	 9kvA8UyHYWf4miEznpFsoFvtzTQ8YKp0Invyji80vN69DCA0d+EcBZDMerEHbsiIT9pB+
	 GBJekb8ViU8tvVmfC9Xf381sCIj0NYOhTdtOOUdM5UjvYq4I3hQz8lwj1ll9yRCcHm9yp
	 +Lta32QRu7ZPmWzx9gHTIQ1at7b3twAqSoPhd1LfUkPgBVh9F/bxoUrtZGbCMf0zl/xJ1
	 xvuY7P/xSqjwmWLrJFwEWp+kQ5wHbrDgCDgY7lqGcAImGfP0G5vobOZxcf6RuM/jR9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791701857;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:From:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Transfer-Encoding:
	 Content-Type:Errors-To:Sender;
	bh=6uFr6R8RTJkfhLtf6+UsUj/uu0Nlrnxnz4oSBBP8NqM=;
	b=e80ElVEtRSK7NffYFbGqcK8D8TadG5qv9lF9H1z0KiBCnRM5BNhwMPUlux0qk4FtV8r/
	 Zwuzsdkk6ja7q5Ve2nELbpKuS0aKp2XpOqZdgIqj6EWJpFkk3WqSXyHQP8ib6PXIfiQC4
	 27fVRAa9sLQoiP7EnR4JbSebhDEFqraRezKdWtHowXqr0uie0Ts5yxfUwm75SG6O47mBL
	 bWPkLA3zK8VszSyAUoedMxzjXG9wjGULQU51bKe4iTw+83CKZK+gIS4ahAUiymPSX+hII
	 EugvDKprulIjz48lACkgw0ZWEhYnC4vzRsRuiptc/Jq5wtp4t/FFnUMxqYkaXcy0zgQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791701857;
	bh=6uFr6R8RTJkfhLtf6+UsUj/uu0Nlrnxnz4oSBBP8NqM=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JTbyQG8R65W2aSrorBK0yHbvSHu5CcPHWnaMAfCxsQTnQTakWhQ2bYnl8RbtUV8oN
	 ReQvGEZnqrlnc+M85e5c91JJ73h1FmtKQJfBJYVpbZFpfCCuxtKUJmoaxyDKqHQtdu
	 hwESEyW5KMSzzKDLPMYBJGkNPy8CiuJIdVvKXoNbBN/GRBe23hlqk2cRBfnTSIPGbj
	 W/T3x2SrDXqQX1OQMf2N5tR9VUnNX2X1A49c6uZ1ewJpL74FYsOxWmavZ4MRvSx/kv
	 Vu+MSRcUBPswnUiNETu4WHl81xki6JVQO+4zFYQal72pebWyFH+86KCcw8IlFz93TA
	 ag6ifNpjJt35w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF02060678;
	Sun, 11 Oct 2026 06:57:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ACED51DE
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 06:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E84740764
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 06:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x29RreLtH1Za for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 06:57:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 964E54072B
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791701856;
 b=srEXXgz13D//lbyTM0shulM/ZuRw4SK5aEvPaw3TxilpF6PmNHimEVO1Q2xHqbdQnaqx
 oFoK7Sc8tRwngcDRZ4mDOZFT8lSyKYju8eKuGm/chUsElbZGVb89J7FnBpWxoe5VAxqhj
 GagQMCEx4UONYirLQycflC8Qjp9Tphd2y3TkMMA2OOwX9yQawmiegQUc/f3pZ9D6m9d7Z
 3vUd7IuicqdSKPe6/WUeAbYp/JslQXpfCIVuqvYjJU8m4ahSRbE53Xs01VFhLSor3SEFD
 B/dggXnmX0JOENk79r3FsdEM6EvDXPOxUtzOYbr5TTZbGsJwm6AeN8EsG39J5Xqpfpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791701856;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
 References:Content-Language:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding;
 bh=wmzPZKFU1sqfWdb1N7/f5Ft5UOQyCMcDXNlcocPXFCY=;
 b=iXR1pkM706DA6ErxgkEaCNW1RM1WjfYsngFzrBMZKxJ4xsMog8Ph71hdAG8oIj+sKjHF
 saW1RBMkfcOYlOdXagwOouP6y1fVECbkVSEOvd1o+iA97IK737WvzBY9yPPU6Vh1eHtvj
 aIpj081SZo1A/kqXvebK/nFDOv16UOHBcADiF6fsnWw081BIl6PDBcuf2Sha8vIMkQOl/
 qgVVWqdLGJ1pmjrM/V7V27xLzm14xc2ND/VkJ+5LWV/7vl6l7anxOKlmDqY6n5h/5nYJK
 HRDuKjLP48q4s849PetHixG76IlU0EiANB9sZxDVQtlIGcCpdWRbg7KW/REYB5LO4Hg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=jfEPlV90; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=jfEPlV90
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 964E54072B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 06:57:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=jfEPlV90aLx04Kev+oEqiDRjlbiov6XDggtmcwqd1NuZ1fPZGXvZeum4WBAWO7TQH8Me/Nas9NxX2riMVCLZ/INNNE7az5I0uxzoe4woCRjlXiLtEK/UPe/h9DKsilPABd+4oKzrIY0hfowtVZZuUH0URouco7cbdR5F/f8AVxUhNr4yKjpnxp7A0miEVvczFzHXqfCLSTv3x/BDR4sO9PpJ+x4B1dl8WLgRsGaGYirgXaU4d8rNwBgPcnaDhalzGJeMGjmnllZqDgxKTib6DBFpiN7nfzl8OU4ccBwYXPdSgQJcHSmWDn4IAlXfah96SlYH2cweeSSmkqa6XeG/vA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=wmzPZKFU1sqfWdb1N7/f5Ft5UOQyCMcDXNlcocPXFCY=;
 h=Feedback-ID:Received:Received:Date:Subject:To:From; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1063514791
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 11 Oct 2026 06:57:33 +0000 (UTC)
Received: from [127.0.0.1] by dell.be.48ers.dk with esmtp (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xFnUc-00000004m5m-2kfI
 for buildroot@buildroot.org; Sun, 11 Oct 2026 08:57:31 +0200
Message-ID: <e6a644be-38f3-4504-b1da-7df8662991de@korsgaard.com>
Date: Sun, 11 Oct 2026 08:57:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20251226154652.948817-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20251226154652.948817-1-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] package/flutter-engine: don't write into
 $HOME
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/26/25 16:46, Thomas Petazzoni via buildroot wrote:
> gclient.py tries to not only read from $HOME/.config, but actually
> create some directories/files in there. As $HOME can be inaccessible,
> let's override XDG_CONFIG_HOME to tell the depot-tools code to write
> its stuff into $(@D)/dl-tmp instead (which we already use as a scratch
> directory in this package).

Committed, thanks.

--
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
