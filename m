Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22E8C982D0
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 20:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5412060B26;
	Thu, 17 Sep 2026 20:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ChWUQm5GYN_a; Thu, 17 Sep 2026 20:29:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0393D60A8A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789676993;
	b=d8tdgpnYmuozgN5Woksj9sQ9gGs2EJlO1GaoG6i9INMX2xQbM3DqqI2OYzNylURRo+N1
	 Rn+lmxXYFsrOkaJy6gxTsAOu0nP0E6fHdNqylx/9jxImAoPW1HZyo09k6LPvWdcL8y859
	 sklknngsMoEx3rJqVhnVg8eCtJpxJfik/3/Q+0Emijvm5sDXylMFqe9rLuMluX5uk5nMp
	 4A3XKLJmoRie1jtNQlJs/JihiU2jwMkAwmGkg7gWr7927qfMNEOM06QbMQBpR4pwWU9rb
	 2BtSveyVjXmYy+JKKFWmT7PAWUVpcIHmn89o5zh1v/dZjthnjmxeIG+5jko8NSif4AA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789676993;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rr8ho/NjTH69xV9nY2UU7rjZpSbaa2RIoz4+gFM4+04=;
	b=nsfbwTzqwBsEI+D6djqHHz+vN3SJufIcK6lcEQqQHIs3tyPuc3JVtpv4KrN0D7adJCOF
	 c0NevAeOceKTtKhJRG6FT0g44MO4xoblezKIQPSCl78w8R9FjDTV9V7jmJaCG6Qvk02T3
	 mKbYVkPWXKS1UfJVh7IsaA4d++6QpPtrrc5Gd7RcB+EOK65tGU3ocU3Hnkly3SIT3X2C3
	 c8NzshqDtI7RhAyeYoXn0GLfR6/u+SoN7AbwpJVvNRX8Mk2jtVCwF74TueOhxG6sGD4eP
	 XmyfMmBbVh+ul52CJ3Qoll25bDRcP6DhE8/CryICjZkq7D6aNK0d+gBhwUgPSW66Ldg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789676993;
	bh=rr8ho/NjTH69xV9nY2UU7rjZpSbaa2RIoz4+gFM4+04=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f8/uvB+LkgfLLuN4Fgzu+r/TJamrVBNUcl8I8bBNmG3E8X55K98I+s04Eq+/RRK+C
	 RNpJROKG5Qn9vJg2RP/fMouF4iX1vsrLTFIQRCe0GWvLzkA2+3yZUy7myEO1jVdbWB
	 vlGe6z8spLjtlidYKj/SBXnTXZN8HFb8pTz1orQ2drqqGBe3sodXK9Kt4XCph1scT/
	 Kml3jjow5JOKfL7MQ9l/ET4guE5ZaZnvu6XMxiJP4UZ7h6raxLGD64vWDiPdo62tCY
	 w3pdnwve+PsEyOsbiEd3mvCpxVn3pbUIElmVDxmVU/b+xPybLL6MZ7u1D8B5WSqXSM
	 5CdrfXGKKBSVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0393D60A8A;
	Thu, 17 Sep 2026 20:29:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A218F29B
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87A10810C6
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0enfS3fu7iNe for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 20:29:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F22108109E
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789676990;
 b=Ap3IWwqojf8kB3cyhpQw/1AIvYhb8yDcbXmO5exxqfFDuJUXCUg4ReYIHvArjT9a/cpd
 94T52uWn/RvaNUcwk8d7hI8OTfu0v65iBOpkIWkNMLUA1vn28fev8xPsRWEtJvlHic58z
 dLHnT6I4H1w+leW5RMZ4CdiJcNSnWnbCQEIMc0uj5Mwo9AMZXy/SW6rDh2tmSGQbY6hcE
 CXC5Ja4tGfN98bu1iZ54aR3YCKsAa12KASNDPrIIrNuZcosR53JxJEWwdsBgZm2lNoA7/
 mp6hRBXLD4nWqxmWEU75lPiT7bU4KVtEv67D9i5iz/Or790H5TBLA7cJUEEYjnKte1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789676990;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=ryhC4FrymcAIJWJcZvTgBsoqPPvBQOlWbZsfzPoFd08=;
 b=hqKD60P/z3VXS3jqXFiEJXmuD+BdvWq96Ghgps6xq3PTulOjIBAbKpAfYv5bGbSrplZ0
 6e1vaXcham2Cc5SsI2m5XGn7FkfABtWtMWzUodwRVMo6P0ENJDbWVN6SRdbKpjm+Hj2l8
 krpzes+149j6T+rJoRRJ2lVuouCIdW8lskyV2QSUzeBuF0Tx10nc5u9YzhT15Jm6t6L5c
 lBwwhCrILqJXJASVZ3w5389Jag0qayuo0Jo/zqESKikvQJMjn5Tpmox4BkSRRZaURViQ2
 OpU6X6AmCqvYUCVS8uG0oKx0cuTHZoF+1Bw/Xkjvx03Skeqrpf0J5ZC8QM8nnRyDJcw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=k9ZpaN9i; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=k9ZpaN9i
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F22108109E
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:29:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=k9ZpaN9i2Uhyd7Kx2wOxjHQLV0WnuDSMHzdMfykRa4UuZKGyiCxsu0sTD5e1r8vdzPzMWRRYFEXvAdDldz7TBHYbL40IGTWdRx/gVF3zEbzLsblwMRFqq3N8y40FhOZ50I8ntyxhfBQvVg5KdLHzKJ4Ms3DIuu+tsJ+tTGxXujMBYepQHFsvsO7TPNfTRA/8NPwZIoa3MAoPPdW5QfjZDWK9gT6p4V6opGiWT+Z2HTcJ1wtCwtRMGGlwTiJwNKYFOcqg5YNbZ69MC1hZM5dn63U5DTwt1MdOVbU+T2/214DGrdnlR3KoRMtNwmQynD/CzAGdlQSab+YBgLzdIStS3Q==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=UD6tawLvbbVn7utMzrsKgeEHeWZBFV/jmdRNsoFmy1g=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -298774843; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 17 Sep 2026 20:29:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x7Ijl-0000000H8Qo-2Uv9;
 Thu, 17 Sep 2026 22:29:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: yann.morin@orange.com
Cc: <buildroot@buildroot.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Vincent Fazio <vfazio@xes-inc.com>
In-Reply-To: <aqurjVe5-DeDVRh6@yd-6wlzhs3> (yann morin's message of "Thu, 17
 Sep 2026 10:57:49 +0200")
References: <cover.1789390115.git.yann.morin@orange.com>
 <aqurjVe5-DeDVRh6@yd-6wlzhs3>
Date: Thu, 17 Sep 2026 22:29:41 +0200
Message-ID: <878q4zmxje.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 0/2 v2] support/size-stats: actually handle
 .pyc files
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

>>>>> "yann" == yann morin <yann.morin@orange.com> writes:

 > All,
 > +Peter, +Thomas

 > On 2026-09-14 14:48 +0200, yann.morin@orange.com spake thusly:
 >> This small two-patch series properly associates .pyc files to the
 >> corresponding package, to account for the PEP 3147 layout.

 > Weird: this patch series did not end up in patchwork, although it is on
 > lore:
 >     https://lore.kernel.org/buildroot/cover.1789390115.git.yann.morin@orange.com/

 > Should I resend it?

It it certainly easier to have it in patchwork, please do.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
