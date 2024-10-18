Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4209FD3C549
	for <buildroot@archiver.kernel.org>; Fri, 18 Oct 2024 05:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA40140766;
	Fri, 18 Oct 2024 05:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ay9tyML8_Fo1; Fri, 18 Oct 2024 05:16:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B616406D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B616406D2;
	Fri, 18 Oct 2024 05:16:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF1D82804
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 05:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D588660736
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 05:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 64vHxl6qv5Vq for <buildroot@buildroot.org>;
 Fri, 18 Oct 2024 05:16:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A9D660596
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A9D660596
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A9D660596
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 05:16:55 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 22EF84402B5;
 Fri, 18 Oct 2024 08:13:51 +0300 (IDT)
To: "Kennedy, Andy Collins via buildroot" <buildroot@buildroot.org>
Cc: "Kennedy, Andy Collins" <Andy.A.Kennedy@collins.com>
In-Reply-To: <BN2P110MB1060B7C18C429384A20EF037C840A@BN2P110MB1060.NAMP110.PROD.OUTLOOK.COM>
 (Andy Collins via buildroot Kennedy's message of "Fri, 18 Oct 2024
 02:43:10 +0000")
References: <BN2P110MB1060B7C18C429384A20EF037C840A@BN2P110MB1060.NAMP110.PROD.OUTLOOK.COM>
Date: Fri, 18 Oct 2024 08:16:48 +0300
Message-ID: <87froung73.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1729228431;
 bh=U2BabFoDoN+vAuGHOqOxnDWwap0/JyPL/LurijujYmA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=piKiiXI8j/aFxm6tZQhDUlWM94DLv2Y0B/j5R42DypTm2RZ0KCUZqxvj0cT0+Xw+p
 5+eFnRjquqmmrtVAzavrvX8G8k6c89a8aosxwBip4zRJpF9lv98cE7Wa6odfbVQX1P
 wENuKdqvGSKGJkqM0qXzFnHJVK2O571I9WJSg6If+0MJdB/56yGI75s7PFc5JI9gwo
 22hre63dxi8HkzelTnWk2pfh9HBFwugqvGBmh1bcQ7k/b0Vq3xn293V9NdNi8f9r9J
 q1G+T3MVAqImRUJu6zAzgHxXECQ3Cui0YlEBO/fWTcfaQugcwNolReVztSaEdBvvb9
 y4gWSQz9IPTRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=piKiiXI8
Subject: Re: [Buildroot] Python for host?
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andy,

On Fri, Oct 18 2024, Kennedy, Andy Collins via buildroot wrote:
> I'm in need of Python 3 and supporting libraries for the host.  I do not
> want to build Python3 and the libraries for my limited storage embedded
> system, but I do have requirements on it for the host.  One of the
> libraries I need is python-pylibfdt.  It seems that I can only select to
> build the host version of this package if I have selected packages ->
> Python3, then choose the external package at that time.  Given that I
> have a build need for this tool (a support package from a vendor that
> needs that library and I'm working on a super old Ubuntu distro and
> am unable to update) I would really like to select and build the host
> package.  I can go through and add in a Config.in.host for this
> particular package and dup the .mk file as HOST (removing the
> $(eval host-python-package) into the host-...mk file but I feel like
> this is the wrong way.
>
> Anyone else in the WORLD having to run BR on a 20yo system and need
> Python host?  Anyone have a clue an easy solution?  Am I just being
> dumb?  <<<<  I HOPE that is the easy answer.

Adding host-python-pylibfdt to the list of your target package
<PKG>_DEPENDENCIES should be enough. No need for Config.in.host
file. See for example boot/ti-k3-r5-loader/ti-k3-r5-loader.mk, and
boot/uboot/uboot.mk, that both use host-python-pylibfdt.

Hope this helps,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
