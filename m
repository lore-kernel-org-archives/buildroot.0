Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDA3C88E77
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 06:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E85A6607D2;
	Wed, 16 Sep 2026 06:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akEg5o4amWrf; Wed, 16 Sep 2026 06:47:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 810AD607CC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789541224;
	b=WxXXzO0SWnN8V5U0hCWdeu/3xg+Lnn6HkCP7ynWGG3//kAu/Z4miLocydZK9GsaKl+2Y
	 YBx418rPAjtrAyPYlO4tX2UAw8W7qEeWKxqfQLm6rYF33aKazcBpWdp/vn77uDWC4N9bo
	 ZXy8MkcgdJkZIGJZJNNmqrbg0Qyu1ybe9KbCqFPu4R7fE3S8VIgndIIlyB/TyFSOYxFjP
	 vtNkiyW4b+5B4wGYuPbRtUe0ntf6YcZhPbiba0KsKWvzAtSTQV4aymFcj+wsh2Q49p6zp
	 ZSyuGw82QRN9FwIUwHKJlKiXT5XWQ0ywjl89o3isfFRQAgHqPQfJMgtXlY/BrKACvhg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789541224;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=C3mvLtSBIRfirJY+gCNzlKXAecJ5yEt+8iMBqyOJuzM=;
	b=R2KmvITqn1Pw/Fycj6U3LZ8R43xVzxLimjAIaXCpkoHMpC7bWVMqi9b8iJFIgQ1gspHp
	 HzVmBkkapoqmejK2Ffqb2MeNK/jRXNLlUcfaNDn12/hZCxggzj2DUdki7rp9YIFPHVrdl
	 My66TSahY2NOzmdKCf81d0bVWTZfqTLKRynp5r9KpS1pgD8pM13hSrBINoy8duoC03C9b
	 l8L4RrY25Um7nqSt6fboolfPCwzBd/+ztchHR7oDSdWLsRao7C3KApCzJjsE+sbGuVAKY
	 2PcVWr/J3yTP8jWDKPWF5w83mTwbvXA2f43rh1bbFg+p5C2CpNR+hJl5uYWKHKMhnPA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789541224;
	bh=C3mvLtSBIRfirJY+gCNzlKXAecJ5yEt+8iMBqyOJuzM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RyQdTk1disIHdrl4hUuptG0trtZgTCkV6qmgRUaQSkeYYb3F/XFwIxhRF8jqNzqeY
	 IEjxKLCgUM/jjba6A4bZ4Tfek2/yd69JkaJUuhOWgIyiL4YeBOzm1uPGrMghOvab+l
	 NH2Y9Q/vfFKrz39CM2sx5PIqdsZQCZGPts8pTBfVwCrHc4Y83CUNN5SiHkVjDM8mSI
	 ancuKqROshmZoJll7jtyWyT41wgYo0WltU30Qs/G26596M/sGO0Z9oXhpYrKIuVBjT
	 kBz27bbMBpSq6LqrXTBPrWkL6lXzheikm0ZEGS7YwhHgg/giUdhR6x8H/lAOQ6Vh2p
	 kc3alYlcrfRaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 810AD607CC;
	Wed, 16 Sep 2026 06:47:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A44CF224
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 06:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82868400E9
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 06:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uxm6StIeA-4q for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 06:47:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org F2E9440076
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789541222;
 b=P/VS018O6kqAfrBTybhdI3V2GVyu/w+uZaZVjDLEQ1QQeL9VH/RGjwMbbld+4VZc9+vW
 4sknCUA/CKJK/E7IEeCNt5cshBK1u3qZOi9KaSMQKsvBePdl5VDXKXKgNaiFEQ+aZklIV
 GkquuhmqRpiOIuK9U2K8EOijEgLmMMwXJ9eYngmhxQtyaB8nGbOXYy4iZxVnQrF1sl9q/
 BJ5xW4EWnQhkRNX2yZUvVXZgcRPJyCNx5qnqDg+6AGc3oh5RBtHKvKJto83IFji1DjTTJ
 kp6vCxg25T2ISMS1b78WNlAHzp8pAv93f98ths1qNFvCdd5NyuC6qv7Rhv1oNGz/eBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789541222;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=u1WY9oJzorYPSrXM3jCgHz4eXB8/ejDOjF7Od7f3/hs=;
 b=tG2LZlO5UG9cXA2xjpFBBQ3T5Jc8l1NXIVhYVUhTwFcUPphX1+rxuVw0vPZOouhGNNhp
 /sGr90REHFRiRpF/NqUGyQT37WONrVNLahnEPs+NMi7yzzTQXrC/KR8jUVSZY2reOHbxe
 qpayiah9svSA+HGYsSOek/9orT1PTt0s4/oAWAIWdrl5UJlv1n+C061n32kfEq8wVg9nN
 wVePMSR82BZJPdVnjb2GQHqhetgImshDTFnRzZlaCg/Ir/FX7dzWaI3+qNDJGtKBiSfew
 RyPHlDpWuarxNjMFxiV7aENNZWJjfoy9KIKfU3fbZdFnqUow4azA2eARj/VOyDQHwxQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b="nT/KwI6I"; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=nT/KwI6I
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2E9440076
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 06:47:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=nT/KwI6IB6GiAPk8Hb46Ew7SH4hgNrHZZKhnk8JYQIjoC5ftOev9XanyrMubseT+YVqT3dUwIyWY3MCMr8/ZgBmrDmJO2jbBYB6HkyxWrnmG8XWblQDvYFMqQQtuMPapSzgSWXfWztxx35soi82LlRhQndQS1ja+nPZXVJOvc/ATAYGDaSbNcpRPQ0h7idIdJCgqTHmUHEASWj7sbJSt3LaRrHNsAlz6iaUSzmvmbeGdUxkAUFDU9Tgonk+Yj/AaMFtAuEbydYlVLmkeqqWhZzVvdEqlsdzkMWqqbrMt2PbAukkGdnx0btT0Fw/tcsRLQUpgTHdZYOt7l9RZYgmOTw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=rlFlq0zLRbxrPv8EtT2MNJLL6AQdLhi/DqtDdpW/W6w=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1160803555; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 16 Sep 2026 06:46:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x6jPw-0000000GfP4-0nAf;
 Wed, 16 Sep 2026 08:46:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260906151935.1343650-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 6 Sep 2026 17:19:35 +0200")
References: <20260906151935.1343650-1-bernd@kuhls.net>
Date: Wed, 16 Sep 2026 08:46:52 +0200
Message-ID: <87h5jpofqb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/haproxy: bump version to 3.4.4
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

 > https://www.haproxy.org/news.html
 > https://www.haproxy.com/blog/announcing-haproxy-3-4
 > http://www.haproxy.org/download/3.4/src/CHANGELOG
 > https://git.haproxy.org/?p=haproxy-3.4.git;a=blob_plain;f=CHANGELOG

 > Version 3.4.x is the new LTS release which also added OpenSSL 4.0
 > compatibility.

 > Removed patch which is included in this release.

 > Disabled static builds due to upstream commit
 > https://git.haproxy.org/?p=haproxy-2.8.git;a=commitdiff;h=eaba76b02dd41e0a1a2e85a3e71f91dfc529916d
 > which was added to version 2.8 and causes build errors during static
 > linking:

 > /builds/bkuhls/buildroot/br-test-pkg/br-arm-full-static/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
 >  /builds/bkuhls/buildroot/br-test-pkg/br-arm-full-static/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/bin/../../usr/lib/libc.a(free.os):
 >  in function `malloc_trim':
 > free.c:(.text+0x24c): multiple definition of `malloc_trim';
 >  src/pool.o:pool.c:(.text+0xa14): first defined here

 > as suggested by Julien:
 > https://lists.buildroot.org/pipermail/buildroot/2025-July/782675.html

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipelines passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/31415f6b2f596562f3e26b72bd6c6b7d04ff0499

 > tests.package.test_haproxy.TestHaproxy.test_run:
 > https://gitlab.com/bkuhls/buildroot/-/commits/61aea38f365ef4ef9486c56e17d6201fd3e60970

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
