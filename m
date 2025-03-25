Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CDAC36008
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 22:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0178F617B8;
	Tue, 25 Mar 2025 22:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIS2PqnoqSIJ; Tue, 25 Mar 2025 22:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3293661AB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3293661AB0;
	Tue, 25 Mar 2025 22:01:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47C4DE4
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 22:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E9644172D
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 22:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SGCOp347LEQ0 for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 22:01:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 34991416EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34991416EC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34991416EC
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 22:01:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 822E6780389;
 Tue, 25 Mar 2025 23:01:05 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:57452])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 25 Mar 2025 23:01:05 +0100
MIME-Version: 1.0
Date: Tue, 25 Mar 2025 23:01:05 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <8734ftnbcm.fsf@dell.be.48ers.dk>
References: <20250303144047.268530-1-yegorslists@googlemail.com>
 <8734ftnbcm.fsf@dell.be.48ers.dk>
User-Agent: Webmail Free/1.6.10
Message-ID: <94733e7fe0d1237a36b4d3308190318b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742940067;
 bh=2uADpXL3/HbNW9PIEuxDpIOuBfEZ49kWszY7GUENfNI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c+btWo0TYEdU0FOsbU1bpQkn0MMh1nJE4DcV/Wli0W8rGEzZN6YapZMCuWKbTz8H1
 j6MdOBa5ASiL9vk7Ey5nMKdI8TdX8Zus4lu4xVqhrp1GgAtrbGiUgCHbM9uOlN9Oqd
 aAQnTC/3cn7NX4/KUGlH00hsVoSVX4C+x/Myyi1keBDzm+d07wtuYC4UuM/OG8cN45
 vwGfMW7T1vJnAexwAhTK7K3HqUB/4uSrGmEY3qXG1w8yH+GDMc7F29UuGtDxkwFxfb
 zKvCn/oIYmJef6zFCWLO7ahHxd/Urcg/+ZjbHLKLw+Yd4rzNB9LAvreUw/FrPvWORc
 s9sQPC3NkQdsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=c+btWo0T
Subject: Re: [Buildroot] [PATCH] package/ncftp: fix
 incompatible-pointer-types error
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter, Yegor,

On 03/03/2025 20:49, Peter Korsgaard wrote:
>>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:
> 
>  > From: Yegor Yefremov <yegorslists@googlemail.com>
>  > Use only stat, fstat, and lstat structures for the correspondent 
> calls
>  > and let the C library macros to pick the right structure and call
>  > depending on the supported file size.
> 
> Do we have any autobuilder errors from this?
> 
>  > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>  > ---
>  >  package/ncftp/0003-fix-stat.patch | 27 +++++++++++++++++++++++++++
>  >  1 file changed, 27 insertions(+)
>  >  create mode 100644 package/ncftp/0003-fix-stat.patch
> 
>  > diff --git a/package/ncftp/0003-fix-stat.patch 
> b/package/ncftp/0003-fix-stat.patch
>  > new file mode 100644
>  > index 0000000000..8581cf546b
>  > --- /dev/null
>  > +++ b/package/ncftp/0003-fix-stat.patch
>  > @@ -0,0 +1,27 @@
>  > +Use stat, fstat, and lstat structures and let the C library handle 
> the
>  > +related structures and system calls.
>  > +
>  > +Upstream: N/A, unresponsive contact email address.
> 
> If upstream is dead, perhaps we should instead drop the ncftp package
> given how little FTP is used nowadays?

It seems there was a new upstream release, after all. See:
https://www.ncftp.com/ncftp/doc/changelog.html

Yegor, could you have a look if this new release fixes
the same issue. And if so, could you send a new patch
that just bump to this new version, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
