Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25C7E77188
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 09:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81DA641735;
	Fri, 20 Dec 2024 09:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id erPZkRodnrkg; Fri, 20 Dec 2024 09:52:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E5764173E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E5764173E;
	Fri, 20 Dec 2024 09:52:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32AFB920
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 09:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 205EC41735
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 09:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nYOvZo8i2S3t for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 09:52:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 510D841711
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 510D841711
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 510D841711
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 09:52:31 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -88701766; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 20 Dec 2024 09:52:21 +0000 (UTC)
Message-ID: <4bd5b931-b405-4b17-9e58-b637e4a49afb@korsgaard.com>
Date: Fri, 20 Dec 2024 10:52:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yegor Yefremov <yegorslists@googlemail.com>,
 buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
References: <6764f1fc.050a0220.142ef5.521b@mx.google.com>
 <CAGm1_ktiWPLOXr6cTGyBxiywHk1Jy8hNKhyS+Vb9dsebNtiqSQ@mail.gmail.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <CAGm1_ktiWPLOXr6cTGyBxiywHk1Jy8hNKhyS+Vb9dsebNtiqSQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=XqY1YlCg4/MPa6456ZT50QHy56eahTIN1TM5Og8yC1/vGuYAhzVx/IVR++tWIvMobAvKsNzyWOJQ9bjiRoHSNeWcE87D8QB6EvRc+E6/9Q95It95koyjq8swb6agX9p9XKY1hL8u5hdmeAqWmkxkqP8Bf/uYp+8AoburhyyhWobq+HzX1/AbGXndqiAEg5pATBNiyaYkcIDUeIHvzrcLwzGVyX8t6bWECAPtpV0FTypleakpuf9QrbC6XYjxf2u9Npj2lAAmv/AMhYFOoY110uwMfksDZvbI6Kz+zA+OL+VKArI4twddMht+S1dGSYREhdZARGyxosNONmzYSO6SgA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=RjlZa2q6riQhn8VhB5DPZ9wv0EhF1Weh51334uv9ZIQ=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=XqY1YlCg
Subject: Re: [Buildroot] [autobuild.buildroot.org] Your daily results for
 2024-12-19
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

On 12/20/24 09:56, Yegor Yefremov wrote:

>> Build failures related to your packages:
>>
>>      arch     |             reason             |                                       url
>> -------------+--------------------------------+---------------------------------------------------------------------------------
>>    riscv64    |   host-python-greenlet-3.1.1   | https://autobuild.buildroot.org/results/6e47383f00b224ddc3be5e56c92f774d79496453
>>     x86_64    |   host-python-greenlet-3.1.1   | https://autobuild.buildroot.org/results/d369c28aea66d1fbb73fbe5817c50a2ed7ef7df6
>>     armeb     |   host-python-greenlet-3.1.1   | https://autobuild.buildroot.org/results/2a41c2d71b51699f47341a0bfc28f50e3d4a32cd
>>    aarch64    |    python-autocommand-2.2.2    | https://autobuild.buildroot.org/results/02670424fd44f10b5ab07f4318172cf0e125debe
>>      arc      |    python-autocommand-2.2.2    | https://autobuild.buildroot.org/results/e33b405df913a0f9ba7e706ea68034186a62af1c
>>      arm      |    python-autocommand-2.2.2    | https://autobuild.buildroot.org/results/7dc2d73b124fdbf1e8560857f53d9c31602e7e12
> 
> Solved via https://patchwork.ozlabs.org/project/buildroot/patch/20241212070845.1623350-1-yegorslists@googlemail.com/

Thanks. Can you add some more details about what triggered this issue? 
Is it related to a version bump of python / setuptools?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
