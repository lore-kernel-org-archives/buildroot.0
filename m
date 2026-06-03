Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D60ECD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D350260E7A;
	Wed,  3 Jun 2026 18:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGwMQi5TG0sC; Wed,  3 Jun 2026 18:53:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 104D66076C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512797;
	bh=lfqlpQzZmRbf/dixcjQJXx+sKCVHFPBhAWURtUz8gwU=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YQ1R8VG6+8vebm3bmx7Yg0F+MYI0uu52TilirF7gFr6L1YaNClSCtbeGOG71oFhan
	 CxKW1wkeoBzUVk4DTFPAkuKGzjkrJz1WchzhZnokWlUExq5+uB7mWhxbDL9f5Dh1MK
	 ggcuxqqivUL+ztkZrFnXOhtwWA7W0VtoqfhlYGGXj9xDFK09ebUKC8eP4krlB2rghE
	 v+dngRIz9Vkr3R8AXNXjdXvlmBYg6y2V7O3XtwkktamDAvYHeOzS6CyOLpVUopAZu2
	 nPhb3Wg+BCZL3ofnJRBCSL4mQZOUGiaQ2aiBpKS6uZ8scyn7qp/LeqATwKKK6z747r
	 AMs53THUCiiqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 104D66076C;
	Wed,  3 Jun 2026 18:53:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 158842F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF4584283B
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hSKk9xeHs1am for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:53:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D395E42818
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D395E42818
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D395E42818
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:53:13 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1073903486; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 18:53:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUqiD-0000000CgXj-0WKu;
 Wed, 03 Jun 2026 20:53:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Julien Olivain <ju.o@free.fr>
In-Reply-To: <20260602185917.2034980-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 2 Jun 2026 20:59:16 +0200")
References: <20260602185917.2034980-1-bernd@kuhls.net>
Date: Wed, 03 Jun 2026 20:53:09 +0200
Message-ID: <87pl27mp62.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=WSDPdqrgg6HQESWaT8sMMgoKM8UHb4jBoItJ7+3hnt3p/hQonlBHGnyZX4LrcufFazl3Xmu4lGHKj+Lon9AOcuwz5FwUisqGNz0FcBw268eFAY2hSz5Okj9gBcDbwNYiy2yidSLvAuuu18678A0U+Qt3hzXTqCAGADX/G6p68e6sYYv6JjJEsspcoAKuaE2kXqNRP/4enUjbRTq4hUIafXykTi3xOUMk1S3Cw+2K8zIrxxypVG+I2Lzgx0SMYT74FzqzqYfr8NMfpOyV+m1vVnmrAws/OtmmL3yaA/i0g+RlXVuQxHpbdDx0VF6nGX5ucfQF+Uk6nFJep8RCDKsrEg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=cik4khdOjOlZYWPI33nqM9o1SK4jsjLmsQLZxHcdshg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=WSDPdqrg
Subject: Re: [Buildroot] [PATCH/next 1/1] package/tinycompress: bump to
 version 1.2.16
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

 > https://www.alsa-project.org/wiki/Changes_v1.2.15.3_v1.2.16#tinycompress
 > Sent patch 0001 upstream and added Upstream: tag.

 > Added patch 0002 to fix musl build error introduced by this version
 > bump:
 > https://github.com/alsa-project/tinycompress/commit/cb3340621f73bb2d0b939461d8e22835d8c4b845

 > Added dependency to host-pkgconf, the build fails without it due to this
 > version bump:

 > 1.2.13:
 > checking pkg-config is at least version 0.9.0... ./configure: line 16805:
 >  /home/bernd/buildroot/output/host/bin/pkg-config: No such file or directory
 > no
 > checking that generated files are newer than configure... done

 > 1.2.16:
 > checking pkg-config is at least version 0.9.0... ./configure: line 18346:
 >  /home/bernd/buildroot/output/host/bin/pkg-config: No such file or directory
 > no
 > configure: error: pkg-config not found

 > This behaviour is caused by the usage of newer autotools to create the
 > configure script:

 >   # Generated by GNU Autoconf 2.69 for tinycompress 1.2.13.

 >   # Generated by GNU Autoconf 2.72 for tinycompress 1.2.16.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipelines passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/c39ca1ca00b9d11047144e1b44b642a1c1ed5fc7

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
