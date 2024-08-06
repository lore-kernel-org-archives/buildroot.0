Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC9DC3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 10:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEFCE4020B;
	Tue,  6 Aug 2024 10:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nNedB1pK38Vf; Tue,  6 Aug 2024 10:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9785B40206
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9785B40206;
	Tue,  6 Aug 2024 10:45:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA80B1BF31F
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 10:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C644780F43
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 10:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L254YLoLMg2V for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 10:45:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7218680F7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7218680F7C
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7218680F7C
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 10:45:53 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 80F773520C9B; Tue,  6 Aug 2024 12:45:51 +0200 (CEST)
Date: Tue, 6 Aug 2024 12:45:51 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <ZrH+30Im+xoA7Ipw@waldemar-brodkorb.de>
References: <ZrBvFLSlPYjjwCKj@waldemar-brodkorb.de> <87cymm2okx.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87cymm2okx.fsf@tarshish>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1722941151; bh=V2g6tty7TGZl9NEAGlL1waqSoasosiQvt3NmUjM0/RY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n+gK/UPKZb/bYxIC5lAkyVnPAgUyIWAYQtKcxVzULfcRZEux5zYerS0Wt2P3GcVmv
 J5lW3m+eX3DSRv86KhHDzYWTC9FZ/P3VJuyzC2Optw0QDGMwsq8rCTgkZTCZERgi4C
 jAbN9XiHugW8g7OFNHQdBAehDIknv2fQXK8BWOLJxvN6xf4iepjZCuLGEjjkTvZpwW
 qNGdUZNi3SJbdlIH9zQYsxu3acEpMAv7JWKxjY46sTAdm/7oAohfJwt+KMnYL3VeUl
 UDD33MkmNRIs0v8/vk3cQzIF9xgDkd3JHxHrwcQMQZGZCounlxTKWfMNma82yfIzH3
 igtLP6ClXLeIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=n+gK/UPK
Subject: Re: [Buildroot] [PATCH v2] package/uclibc: fix missing m_tim issue
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Baruch,
Baruch Siach wrote,

> Hi Waldemar,
> 
> On Mon, Aug 05 2024, Waldemar Brodkorb wrote:
> > Patch from upstream to fix missing m_tim issue.
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/f07d6d6ae2331f9972974093c0503b9d3c6b914a/
> 
> The autobuilder started showing failures like:
> 
> In file included from /home/autobuild/autobuild/instance-12/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/sys/stat.h:106,
>                  from /home/autobuild/autobuild/instance-12/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/fcntl.h:37,
>                  from libslack/fio.c:72:
> /home/autobuild/autobuild/instance-12/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/bits/stat.h:201:9: error: expected ':', ',', ';', '}' or '__attribute__' before '.' token
>   201 |     int st_atime;
>       |         ^~~~~~~~
> 
> This is from
> http://autobuild.buildroot.net/results/f3b3942b6b645d9523ab08d179a3f8aca7d6641c/
> 
> Is this patch related to that issue?

Good catch. It is related, I removed the patch and then the compile
works. But I don't understand why it fails.
@J.: Do you see why it fails for mips64el (n32)?

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
