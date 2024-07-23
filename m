Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA2BC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 08:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3255D402BC;
	Tue, 23 Jul 2024 08:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0OYNm_C6pSRb; Tue, 23 Jul 2024 08:50:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2456403C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2456403C9;
	Tue, 23 Jul 2024 08:50:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C90BC1BF29D
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B699B80E17
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZbMDSbKHqy9 for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 08:49:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7CC6C80E15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CC6C80E15
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CC6C80E15
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 08:49:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D11E1BF204;
 Tue, 23 Jul 2024 08:49:53 +0000 (UTC)
Date: Tue, 23 Jul 2024 10:49:52 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240723104952.6340bad2@windsurf>
In-Reply-To: <20240722220922.590401-1-fontaine.fabrice@gmail.com>
References: <20240722220922.590401-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721724593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iOaRrw5PEwKlCDlgCjDIiyuaY/oUDY3UW6cdhifqkLU=;
 b=ILEtAq1uS2n207b+jTq/VJu8uIF15e2CJOOXN/6KVxrkkG7Db2thkqPOQZeqR+5LbBszVC
 VMi26CjmzeCvLRenMDCI2lBAhjHSW+V7iQyF6X1IQxv5Oi2ISRMxWhji1SGqZnvnn5G0Yo
 vP0gvMqxVtvDH6SVTAd+QH1qYx+fE1mvFlp2Svyh5Q8i0vvUbwIm7CC4wV0qyAxn6kMLwH
 Xn4jzV6wR5tkK7clAPPgvwZkjPX7eIp+cnNEAQdC8YHU/ZqQUBMPJLtsItBNtQ5wORYXS/
 7cwYiuDIdjyEg4TV0AvC0PFSxo/hndpkFYyj7izJCHeI41drOlPlSaSsounDKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ILEtAq1u
Subject: Re: [Buildroot] [PATCH 1/1] package/coreutils: fix glibc build with
 gcc >= 14
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 Jul 2024 00:09:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> ac_cv_func_strerror_r_char_p is hardcoded to no since commit
> 74b9bf9945921a7b0504b4b546a4bc26f2adcc45 back in 2005 however strerror_r
> only returns an int with musl. With glibc or uclibc, strerror_r returns
> a char* or an int depending on _GNU_SOURCE value resulting in the
> following build failure with gcc >= 14:
> 
> strerror_r.c: In function 'rpl_strerror_r':
> strerror_r.c:207:9: error: assignment to 'int' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
>   207 |     ret = strerror_r (errnum, buf, buflen);
>       |         ^
> 
> To fix this build failure, don't hardcode ac_cv_func_strerror_r_char_p
> to let coreutils pick the correct value
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8bc649ca5490b0c29c90383edfa2e693f154ebc4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/coreutils/coreutils.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks. But then it means that indeed your commit
6f34e68217264fb62c48ce28c48bf759b30fef0e fixing the same issue in
package/apr could be improved to avoid using an AC_TRY_RUN(), and
therefore not need an autoconf cache variable value passed by apr.mk.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
