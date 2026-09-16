Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6BBC982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 18:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23D4A809C0;
	Wed, 16 Sep 2026 18:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7-U8hKD0cEA; Wed, 16 Sep 2026 18:35:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DBD9380BFF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789583704;
	b=GVuWAoA5w6TSfjaNtp8CXaHXc+ksMl8ffUbJiX6oS8yh6h3iWPtu0DwCLnKp9w6ZjNQk
	 3LzhpgKxwQTIia0YQIV8RVzS9ScoJ0+YR1BLEilJ/s86/lkMiheXAo9AcuWtNKcLexVvH
	 7k1mBcvROCjkaGE+xjWArW1N+ewUIQFn3qoIYm3SE8LsHdFL4FrVGqlSogkUao0pSXL/9
	 Ccj2BSK8B/B/aBxPRZrL/tc5pnRtQQ+jJKrhnf4rZ808ez459rFliuIZJBh9bq5cgY83s
	 cuBUcF7q20X5T1EMGGg1yFOW+Jb+0dNDLZ9JPtUJyfl15j0VKf7lczAVpKG7LvyP4VQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789583704;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=X1LNK8RpqPpC+89UM5NekoxtvBEjtfZzbPjaBGnVPWA=;
	b=YCTYDUnZJsDvefdKS+fD590zNAo94lUxXbswvVPUkx5fU2JeTSjyGY0+BwXutElOB0PT
	 haR+bPcSiOcklwRPLKidEUmOXkFkVxErIIdeS7u7vSGuAoXKqAdHVkvIhfDQFJlCG6tap
	 Y8maxqTIv4COR1CV2/KWsHz0EvsmLFv6tIDjW1HH20JxEzIA3rpU/Sf2uVexnZVIj1Iey
	 be0yJHdUuvDf26G/n0UgRv+5UtpiKfculxGmEjkPBpMDD3jl2XnxZEATnocMdGoAA2HNt
	 uTuKf+0WM655FraFwbdg5f8oIUrWJd2UmCIG5C1N+o8kuuzhoFOTimn7o74iikAz+gA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789583703;
	bh=X1LNK8RpqPpC+89UM5NekoxtvBEjtfZzbPjaBGnVPWA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pm2G4HNdEBsysBkiHPqOHvZ6uwboxVKit8c7r1hONfYTaUytEYK8/eFTJyH3xU1sf
	 tnTLHa7QZ86cTYWcTrzrJM5EM203epoP7IHdaYfiNBb2QwRwWEJtxLuOgqdesV8kkN
	 m3x32J5QhDz2dfPnN1tgyRfm2qq2A406WdheLGJhET32J8TPaQ9DJGUq5TJN2kZwmb
	 NUHqqa213szQGASSxsKisKL8O2/+DdPIxdS0ydJGM6aEoAqJiTxTsta+bv9UpA8wUY
	 zL/yE9e9kPWNYtV6yzntJZ1cI3lq8z2TUwouSQ18nhkMHdHc+C0iBB8JWpwCIFQ/Jc
	 xxQBpNAVIuajg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBD9380BFF;
	Wed, 16 Sep 2026 18:35:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 96653268
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B8C76062C
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dWq82rRiKy6 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 18:35:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BC9EF6061D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789583701;
 b=OYh7z/lGlEbZLdloAQr4kvjgvtnVc2w9GGwIIujZ5ohO2E267fsEdHYkEfSBbL5Bv8eM
 g2ks8LWph2+HrSjQwzKqiSjwB2VrMNgkI0NMSvvXAgVyoOc/j4C0+MUKpwPDUmD+elXUF
 rEBTmNX9izijIhsfVjOFIi8ptj1TpuUJiWdo27jx9M8Ovx1IZQSerTDVZnE1kHKceaeXb
 Eo0JTOdt8c91Ydf56Q6GHZllZjUqbLlETvO/JMQTwst4sDvFf4FyHgaTYqNa4QKqtjjtS
 rc+Arun75kNz2e1eu5FWUAivZSJxlTTaIdxYil8nnvuGf5Mqz+rfKOrOdmr7AaeEVtQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789583701;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=a+6NIJV739NumvNektYF6eust+Q3ayeNU7xU4itE8VY=;
 b=J6IH/0strf5SbAwebZs01EraB5GN6cJlRzlDvZLnDSuFUE51cr7LcXALyudf9EO8j+9X
 kjEYtlG6fiJxNKwtgWYkMJjuewr1fGCsPvKHQDirp2WAXrUUpcbgBJo125396Mssw3HH9
 lkfcnRR4I/ZeGrQwR0e9zTGKYXuOa23dfL4IKrbksq6c6a/zDy9NcLAlms910IjB8QKsF
 y10g1isyTRaVT0dI2B3+w7o+CCeSspWcwxKET8gp/fJePVAegVatSZVIHxJPF8I6OYg33
 RnIK0jOfGiw2LQUUGEp+FD6A9YQQA9YCOvp+s7bDItKGrZi2VbdkMbmDNuLlJ90JZsg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=RcDjtbG2; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC9EF6061D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:34:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Wuq-1xCQmD05rg-003CRo; Wed, 16
 Sep 2026 20:34:57 +0200
Message-ID: <c245e93b-d27e-454b-bba5-bc2eaf2fbb53@gmx.de>
Date: Wed, 16 Sep 2026 20:34:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>
Cc: buildroot@buildroot.org, sakari.ailus@iki.fi,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20260916090705.2796356-1-paul.elder@ideasonboard.com>
 <20260916164355.GA191870@killaraus.ideasonboard.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260916164355.GA191870@killaraus.ideasonboard.com>
X-Provags-ID: V03:K1:AS+ZY3YzFMlb5a7qHXYybo9xQL16L5nAGuH3/+a3tT1i1KpGC+K
 Npz7BZRQmJJu5KEXmrRXVaX1Z35uZiIyUYEl5Px01x3ag7AyhosoR+MllO5tOj9EiJ64Ass
 0GBE3Xe7edFYHLw8+eKPIJQKxxO5D8YjORPBrKA5LFn6BmoxkxYlfMOQ9wtEgB8nM379y7t
 dS2aHeVruCT/Wzdin7Dbw==
UI-OutboundReport: notjunk:1;M01:P0:/04WyU4bj6w=;bkyJi1TU1ZLtnUGOMPZE3AHsTtR
 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
 eKww9A0tpFR/R
Subject: Re: [Buildroot] [PATCH] package/raw2rgbpnm: Add package for
 raw2rgbpnm
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Paul, Laurent, everyone!

Am 16.09.26 um 18:43 schrieb Laurent Pinchart:
> On Wed, Sep 16, 2026 at 06:07:04PM +0900, Paul Elder wrote:
>> Add package for raw2rgbpnm. It is a tool for converting raw images to
>> RGB PNM. While the original repo is at:
>> https://git.retiisi.eu/?p=~sailus/raw2rgbpnm.git
>> A mirror is hosted on freedesktop:
>> https://gitlab.freedesktop.org/camera/raw2rgbpnm
>> so use that instead.

Why use a mirror instead of the primary repository?

>> As the build is simple and has no dependencies nor releases, use the
>> master branch for the version.
> 
> I don't know what buildroot's policy is with this, but using the master
> branch will make builds non-reproducible. I would instead use the commit
> ID of the current master branch head. It can be updated in future
> buildroot releases.

That is indeed against policy: "Note: Using a branch name as FOO_VERSION 
is not supported, because it does not and can not work as people would 
expect it should" [1]. The version must be fixed, if there are no 
releases using a commit hash is the right thing to do.

Also, Buildroot policy is that a package must contain a hash file that 
gives hashes of relevant archives and license files, see section 18.4. 
"The .hash file" [2] in the manual. That is missing here, and would 
necessarily break with a branch HEAD.

>> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
>>
>> ---
>> This patch is based on 2026.08.
>> ---
>>   package/Config.in                |  1 +
>>   package/raw2rgbpnm/Config.in     |  6 ++++++
>>   package/raw2rgbpnm/raw2rgbpnm.mk | 16 ++++++++++++++++
>>   3 files changed, 23 insertions(+)
>>   create mode 100644 package/raw2rgbpnm/Config.in
>>   create mode 100644 package/raw2rgbpnm/raw2rgbpnm.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 6058800682b4..6d9daeadafec 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -195,6 +195,7 @@ menu "Development tools"
>>   	source "package/mawk/Config.in"
>>   	source "package/patch/Config.in"
>>   	source "package/pkgconf/Config.in"
>> +	source "package/raw2rgbpnm/Config.in"
>>   	source "package/ripgrep/Config.in"
>>   	source "package/sed/Config.in"
>>   	source "package/subversion/Config.in"
>> diff --git a/package/raw2rgbpnm/Config.in b/package/raw2rgbpnm/Config.in
>> new file mode 100644
>> index 000000000000..3d8f36459f4e
>> --- /dev/null
>> +++ b/package/raw2rgbpnm/Config.in
>> @@ -0,0 +1,6 @@
>> +config BR2_PACKAGE_RAW2RGBPNM
>> +	bool "raw2rgbpnm"
>> +	help
>> +	  Convert raw bayer images to RGB PNM for easier viewing
>> +
>> +	  https://gitlab.freedesktop.org/camera/raw2rgbpnm
>> diff --git a/package/raw2rgbpnm/raw2rgbpnm.mk b/package/raw2rgbpnm/raw2rgbpnm.mk
>> new file mode 100644
>> index 000000000000..275fe6f32be3
>> --- /dev/null
>> +++ b/package/raw2rgbpnm/raw2rgbpnm.mk
>> @@ -0,0 +1,16 @@
>> +################################################################################
>> +#
>> +# raw2rgbpnm
>> +#
>> +################################################################################
>> +
>> +RAW2RGBPNM_SITE = https://gitlab.freedesktop.org/camera/raw2rgbpnm
>> +RAW2RGBPNM_SITE_METHOD = git
>> +RAW2RGBPNM_VERSION = master
>> +
>> +RAW2RGBPNM_LICENSE = GPL-2.0

SPDX has deprecated "GPL-2.0" because it's easily confused with the "or 
later" version, this should be "GPL-2.0-only" [3].

@Laurent, you appear to be the author of the raw2rgbpnm meson.build 
file. The license is listed as "GPL 2.0+" there, which is not an SPDX 
identifier (dash, not space) and does not match the C file headers, 
which indicate 2.0 *only*.

>> +RAW2RGBPNM_LICENSE_FILES = LICENSE
>> +
>> +RAW2RGBPNM_INSTALL_TARGET = YES

This is the default, so remove it. If you run "make check-package", it 
should warn you about that.

@Paul: Also the initial patch didn't go over the mailing list, only 
Laurent's reply. Have you subscribed to the ML?

Best regards,
Fiona


[1] https://nightly.buildroot.org/#generic-package-reference
[2] https://nightly.buildroot.org/#adding-packages-hash
[3] https://spdx.org/licenses/GPL-2.0.html
[4] 
https://git.retiisi.eu/?p=~sailus/raw2rgbpnm.git;a=commitdiff;h=HEAD;hp=c23c8fa65fcfdfbb6c3ebd63d101fe9844e3c19f

>> +$(eval $(meson-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
