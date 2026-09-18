Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957F7C982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 20:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0535360EDB;
	Fri, 18 Sep 2026 20:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FV5kBIFPFilQ; Fri, 18 Sep 2026 20:02:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A7EB460C00
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789761747;
	b=KI/9whRPHDE9QdytCmSmHJt1FdsCvMffVaTdmiSHmyfdEQxQRt0yR/+KzEzB8Qa9G1ce
	 wjvOAW4GYl+sbmyeK4Le/ig9hinjKN+bKUyRxMKWgcT2FbYs7pgqJnowxq/sIiL5/ULR2
	 I9O+dqXyfbx5cclfGg5DrrI8CHJxtLvGJBUX4ER3vxWU1rLaK2BKfhUGdqD2QbyR18R7M
	 iAon8+2NnKKsNJsHfuC0ZA8S+YlgVFKda0wLrr6dSoNpXlZ9UCVXLm8GQsp5PSFi+lwU3
	 MpaCsYDbGHrhR6ifaCaBYaSWubbG2Zvtouoje+DZz4TWmgHmPnLe4/cKXW9n0ANyM0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789761747;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EQiQ9S32WalZTNHFSE6fK+CRbAOCH7XnbaIgQWooeVk=;
	b=TIDPrXZJ3/SYZb1tDd4W8NYMbF6QaU9zMoEZ8FwjEO/aZMrCbcSPwPR/7yc8oNsyOiVa
	 fhxGQpyw/kL/a/fQMeyViMgcbw/6bjO6TXJbPaETbqUXAGbpY/WbnQkKUDT+AYspRg3Ic
	 A2cMU3ytjLPaCZWbVTADdKmYWVtJbyMH9qAEnMlOUvhgBwR85MIaKv+e6SodPKwstkTcl
	 rm1qSmdGVhLNbtGFKRwsP6/A/550VGMJiEpRFCyYz06lkuyBd5KZLl9p6qhgMIrSBXzA2
	 DKdaKUP2AbOm4OcGIwdq7H/zs7rTuHo0UwpSJkLqkJycDsFtKlj4AfxJyZDIwO4CQYw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789761747;
	bh=EQiQ9S32WalZTNHFSE6fK+CRbAOCH7XnbaIgQWooeVk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=duHuNE4SBV6HV/4i3pezJbrLEnQT86E5LTjeAFP6soT8u9XPa7jRfB5eTB71C8NlD
	 EuOpLJVLui5DI99MvFC9fn567dHlB9xudRnjQfqPTFdNCC+D8BG1W8r7YgCJLlraI6
	 gDCj1gyLHd8fI5fEzKJ+/SVQmlE5mboCGvmF2kZHlrp9DupLrNWosIQqfIwfn6/l6M
	 bTgN8j6WJGoyWvd2AzcJes9SWTGUBCtGVr0bhj0OAAaFsu/7Eywagum3Z8ekBqviOk
	 F6Zndbyfr9U3yzJoE4qJWJfG+yA2Q8y41bj4fxFNjTjm/mg326gT5uQSq0xk1r7bGZ
	 N4cJikW2SIQjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7EB460C00;
	Fri, 18 Sep 2026 20:02:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8615D25B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 20:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83A2240ABD
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 20:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNQ61wuu0SMV for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 20:02:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E04A840A73
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789761745;
 b=oArfG0RlaEMRUm6N1huH7X6E+SQzfkoipWOrkigRgS4lFKMKMY6FKPQPrCbMkInSMWQ1
 jdxy+6cE9zNMOmdLBiNVz/XHd//DjwUeYo342Yo5aM5nN72XvqC45SV7h9DsQwLx3ZJCu
 VN5/TuCOmPIiU1dwziwao+vvwrluiSStPrsbwrokiRF0/Evixf4HqTts/EnUjD9Kx0A5M
 Eam10rT8NHQn3mLSOgQHyP98pTOrtVDGJ5DQUud2swBjskJVoq8l2Iqf27gork8k4Lkbi
 mvC3KWpt9bdQuWfwt2XqKDEM91TkniTdKcPVnmOTj7hYy66Jfe8ZYyA1IYIiHpeM2HQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789761745;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=bN3si1zPdsyVDzdmS4QW0rNwAoCoSvp0vOtfxFxYvoU=;
 b=ckip6XygPv/JlSeYZJ/nKUbZKKJCFmJS77T91k7PpFo41uMtYQ0CG+vDoWD4MXMNOS6g
 S0YfxlDF3omBH47J/qdvkH73Srxjp6IS09Jbpke01xES0rADjAK8TpnJm15j/gxhZshuv
 2qWZzBxEcrplU7VxLx9wpP4MJ/vxcZ177rorDneVn4o/N/Las6xwZsdx+JMQjrfTjAz1p
 iiDDwDgAqcA1wkNzKPgfPwNxY260VO65PGSt9/QQvXBcn+2vjXtqsRoEVzoKud8HHPJLY
 1ezR33inKBZFJb88sENBV2GNbNyhBs9wg4i2Qd2lxHSvMcgiiR9oLIoe7VKCm4rpXhA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=iWzHGQxC; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E04A840A73
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 20:02:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8FCDDC5846F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 20:03:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 807BE60649;
 Fri, 18 Sep 2026 20:02:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9EF8F10329075; 
 Fri, 18 Sep 2026 22:02:16 +0200 (CEST)
Date: Fri, 18 Sep 2026 22:02:15 +0200
To: Nathan Bloch <nblochn@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aq2X-SH89lcaFnsm@windsurf>
References: <20260820123500.362698-1-nblochn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260820123500.362698-1-nblochn@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/tftpd: bump to version 5.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks for the patch.

On Thu, Aug 20, 2026 at 03:35:00PM +0300, Nathan Bloch wrote:
> Switch from a post-5.3 git snapshot back to the release tarball, now
> that 5.4 is out.
> 
> This also fixes a regression in the snapshot we pin: the autoconf
> modernization in fefaa2cc5c2a renamed the msg_control define to
> HAVE_STRUCT_MSGHDR_MSG_CONTROL, but tftpd/recvfrom.c kept testing for
> HAVE_MSGHDR_MSG_CONTROL, so the recvmsg() code path is compiled out and
> the fallback is used instead. That fallback reads the address family
> from the 'from' address before recvfrom() has filled it in, so the
> first request after each start creates the transfer socket with
> AF_UNSPEC, gets EAFNOSUPPORT and exits without answering or logging the
> request. Fixed upstream in 5.4 by e701714f7a8c ("autoconf: correct the
> new #define names after modernization") and 82223bbf9391 ("tftpd/
> recvfrom.c: don't derive local address family before recvfrom()").
> 
> Drop TFTPD_AUTORECONF and its m4 include directory: the release tarball
> ships a configure script.
> 
> Update the license information: 5.4 replaced the per-file license
> preambles with SPDX tags and a LICENSES/ directory, so tftpd/tftpd.c no
> longer contains any license text. Both binaries are built from a mix of
> BSD-4-Clause-UC and BSD-3-Clause files.
> 
> Add a patch for the only build failure in 5.4: tftpd/path.h uses bool
> without including <stdbool.h>, which requires a C23 compiler.
> 
> Fixes: d4a84e61615553ff678d3c3b52ed33f898e9fcc9

When you say it fixes this commit, is it because of the regression
you're mentioning in the commit log?

Minor: when providing a fixes tag referring to a commit, also put the
commit title:

Fixes: <hash> ("<title>")

because here I was wondering whether
d4a84e61615553ff678d3c3b52ed33f898e9fcc9 was a Buildroot commit
reference or an autobuilder failure reference.

> diff --git a/package/tftpd/0001-tftpd-path.h-add-missing-stdbool.h-include.patch b/package/tftpd/0001-tftpd-path.h-add-missing-stdbool.h-include.patch
> new file mode 100644
> index 0000000000..5995ecd937
> --- /dev/null
> +++ b/package/tftpd/0001-tftpd-path.h-add-missing-stdbool.h-include.patch
> @@ -0,0 +1,39 @@
> +From: Nathan Bloch <nblochn@gmail.com>
> +Date: Wed, 20 Aug 2026 12:00:00 +0300
> +Subject: [PATCH] tftpd/path.h: add missing <stdbool.h> include
> +
> +path.h declares parse_path() with a bool parameter, and both of its
> +users, path.c and tftpd.c, use bool without including <stdbool.h>
> +themselves. That only compiles where bool is a keyword, i.e. C23, so
> +the build fails with any compiler defaulting to C17 or older:
> +
> +  path.h:7:43: error: unknown type name 'bool'
> +  path.c:55:33: error: 'true' undeclared (first use in this function)
> +  tftpd.c:391:5: error: unknown type name 'bool'
> +
> +gcc defaults to gnu17 up to and including 14.x, so 5.4 does not build
> +with any of them.
> +
> +Include <stdbool.h> from path.h, the header declaring the bool-taking
> +prototype, which both users already include.
> +
> +Upstream: not submitted yet, upstream master is affected as well.

Patches should be submitted upstream first. Turns out that I guess
this issue was fixed upstream by commit
8694c57ac439db5e776ecac6ca92333dd0bf3285, which took a different
approach than your patch.

Also, not your fault but since your patch, upstream has released 6.0
and 6.1 (but that's not why I didn't apply your patch, it's really
because the patch had not been submitted upstream).

Could you spin a v2?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
