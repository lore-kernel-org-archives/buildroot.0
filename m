Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3806BCCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 13:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F12F5605FA;
	Sun, 18 Oct 2026 13:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzYS9-1HpD9h; Sun, 18 Oct 2026 13:55:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 24AF960601
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792331717;
	b=kcXP0fYm1+2qeuv2FR3VVqi0KE+l25DQCGpsVXRsTln0GzZ3MO3jKyrvwz2Y1v5aS7we
	 bWJsLXCZU4Eq2Vqq717OUZOviRh/tk070a7JNDadmN7Hwa66an24CaDLwOqf1hvWauwPr
	 pMooOGNWrLiVz6Wfep3ceW65f9UVywu4o7OWzp+HU/EVAeEsajR14XzZ187gJElBvD5Q4
	 t+Ijt+f0/tWeVejC2TjuUfGchQvH7LgTgXZzmJNNfklDJhNSSnV9lSIlnlODSkWZJQy2p
	 rqWzrmTgcjj7NRGz7JJ6RA1cu8mV78zRc+cPNpLZUQa7QnH2E0XahJTQSh0nWW4Xt5Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792331717;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=D1xbDv4PVftFgCjcwLxzNve9GCJCDoYp9k9YeQVyKKw=;
	b=OC68q/+IBSTTUjpwRY6sBYXu0UdAwKXMlHlLKgeW8m25nDjTn1nS0/4QFD7bn+TICaYa
	 NqWjPSC+UiHKDaRIV/Au3aBXNCktH24W7Xlj7CnHJoTgGhczs+wtkDVmLHjXS3xlO6qz7
	 nBer5awm4BYZnHLBfg/j4xhhJb16qintfstDJk0Ddb4FWF2yUygFYpFDu+u2U0Wo+LILQ
	 yP7P93QoH+4afK0p1izoH011FAsWU8gMOXRO0lqT0r97LHOC6i9kAfF74nCznokQhF5FS
	 k2P3cLnCILGCaRUmjNXyphoIrHm3I5Y2CNHWO5O8McYNxmF/hiKFea8WJ1mUE04Hzyg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792331717;
	bh=D1xbDv4PVftFgCjcwLxzNve9GCJCDoYp9k9YeQVyKKw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ll/KOfzORH7PUyyz9nRFvmIKCaceoicxTjWlXS5xAMKWixwLDvpA8g/taH8dEM7tB
	 9yoCu8PLUK9iM0WtdK+PhDSclowwsij2qw/va15VksLhGMk8GVhXU0vcz989wntfVS
	 94FAjuGEvA2mADbMnAuFxuzsEfRVLbVCybzCcZJIs1kAMc0tX126BQ9whNUxlpoPYF
	 +k8QoVemdOAdhSNx4UcJwwJSk/n1LL4d3HKks+UyFdbwB+ZNoxbRIhTxNHY7l+rqi4
	 Eq8W2TJYw1NyMd107MHzfoxIcEa6+uObIyf1uSTbkNa4tV9mw8jnjRUVNLQgjBG/vF
	 l3ci2Kc2EDTjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24AF960601;
	Sun, 18 Oct 2026 13:55:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12C4C255
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECB2F8104D
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hhWnHVAjFVFt for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 13:55:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 46B5081036
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792331715;
 b=WSzxawbpKLJHZ54PUIJ8jVl+y4cAXVu9OLWqI1IUkk46TVnxIbKjLgtMJqFZ7jI9d1dl
 AK9QewKwRzBywCBPZsgRAzSe+20e5vVk2uUAFfhlvYugBzYrnfigahhOOIAIC4NndyAW9
 mxh8HqXxQIQ8Y8zPfPQD0sTqcH3WT/ZruRIJASgd0Q/f3pMdYuP9lQ1z+iGK8bt/64KSV
 ClgZtD5kIEPc+UssqITwQh6iLkcvkK5NCzV+HMWRqjKWBnrLQO4F2XsmwNIWYZ8ofeD8f
 ybSNHiEbInonPth3oZzvHvzZLeXn+vbDmGSsMtFLWmPDmAUkgvCCm5WQgznRgCCoUng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792331715;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=qspuxNl4h9ZXVNlZ/1N+SQx9pB1DA4G5aUF1UO5jQI0=;
 b=g24/LVV1KvEsveOyWBr9IYTWossMe4m6cj9sqv+NQbKgJ2sAQPXYbMZpFAjjicaFGSXc
 GdTKfVTdaz20K49NH2dyDl0OD4Xw4WYPIs6qB2YBeoIpSuDX6dpxdq9zApJcSxyDG9W5A
 pd5eCyZWEvZ+DMSS3yzn7hDC70w40/tZhZLB7m0l2MNdwieO8Gpk2pduFyhQre4PAeEo+
 /cH35bl+lCmJlfse1eyDwIkQtzCTuJqxDqItfX+t8ua7IUwERXh3AjSDUPsWvLjlknqGU
 IRyUF2HO6MoIkl6+7bfeAP9zwuNsMXTefONliWb5t7vooQpD/qqp5i6MHqLyayufaqw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=VUkXZEbN; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46B5081036
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:55:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7127213F89C;
 Sun, 18 Oct 2026 15:55:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 15:55:10 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 15:55:10 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>
In-Reply-To: <20261015215454.3428556-1-james.hilliard1@gmail.com>
References: <20261015215454.3428556-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <4e22be707ee89822e6ebcd4c278ba2a0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/python-botocore: bump to
 version 1.43.114
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

On 15/10/2026 23:54, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
