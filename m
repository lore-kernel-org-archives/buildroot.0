Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E5ACA5FE0
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAD6B8127F;
	Fri,  2 Oct 2026 10:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kgKBPBpe8wOz; Fri,  2 Oct 2026 10:34:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 297778122D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790937252;
	b=kEqjo3436zk7Yn/wEEs9wUNGYwAwwkXH7eCzWy13mrtipEkEDRtSw2ndZ8+bSR6wZVBA
	 cLak1UJTbpjTk8mVNgc663Jh5Hxg2cvmLQBvDC2UH20J6Mmly9YfEvuWmpefWGRc0PWga
	 EVrcJsP5VzSfrZLdoV1CU85+sQwV79v88+HZ3ckTKX5eNw68HhbzQPHh4n67MR6rOwdhD
	 hOS4ZMwTAtAQRa0rNx1EyZ9AfDoGg8LCexgd6sLFpDPf6rmJ8geKi64/Lb+PW2jKHkBD+
	 /dbOS2ORnWwT8uiCcB3eN8DTsM34dK704ikmVyJaeXW38nV/TApYJ6i9zhnuiNSqVfw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790937252;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OO7gKtiMKK20FMvi+161MMQk+7VCGWVZ2QDp9fHm/Lg=;
	b=XL/smvjv6lluO8PPd3IvQHhrII+lyzqORzBvlX+XdJTI6KLEPt78ywZdbwOduc50jj5r
	 HN1ZiIkoIaQALGjXjAx1qHY49eELf5B7qdjr8U1Jj/6FR0ASpRxOQ0PbXwagPikELTnJ7
	 GMCiZnOvVSOA4u0vBPhbF84ns73le8VU+Gx35MXMYRnu3ckaSkZIeJc7w3W+6vPxip5UP
	 L9X26yJDjvP3DMT2HxIirxW6Am70v093DIugh+7+mfOFtUc7zpg2PbqbbPK75G+PiDvUW
	 nhNCoMp6WQzEcTPur7cYClZoGPy+4rM3ctAmqLHbLghhiE3Fq0fsVt44XUWyFR0DBKg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790937252;
	bh=OO7gKtiMKK20FMvi+161MMQk+7VCGWVZ2QDp9fHm/Lg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cFnjkJKQURX1zv6b9DmqYBLxLyHU52Sn1MiC5cPgd+u60dZsI0p9ZJ5e6m2ovo/Ar
	 gxUTcJV5BcGds+QqWsp0ouf7zFU43xM9l/gIrtUVDxCIEZlK4/3Y6YIq6d2g2K/k11
	 BFXbdA722MNdB8+jGijspCjWLHR4OwwjBuWxLECqnho3bPNpInFSraZ6BibVerNnMl
	 /EewTE31mMExY4L+MZTwm9lifFTD2ChwVNfnVbAFGDbypIjIEgksz/j0QzzXTML1Nk
	 dcwXsxVAtyrIrCcV7i0NafQ85EJCpXEaUIutI7gxN6xXfaFUJhx/ooeRXmYzi5x9+b
	 5o6zhnealKfRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 297778122D;
	Fri,  2 Oct 2026 10:34:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 462C134D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C37E8122D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrWFq5qDF3eV for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:34:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5ABA181216
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790937249;
 b=Xn3NK0POxPCoOw3S7+sHVxVXM/Rc6k51w0MPuS0nPx8OtsRnmBoVfmexJZXK7RB/Cxnq
 zB3EB4xNHTu/RUgwl/bAfjaXX+stlWHL/us7zS31af3EdcXE2qnHWWm/mR/o9BJgbUITM
 V14ZSdhsgdnBNeh/0QvBTVY2qhJbPwHRanWjwL17oc4SdDt5Y+8Gq9NOqPweZ0UoLgFEa
 PfjQd7GzcbkdyZJmXfc8kn0V3s4bnsoA6RTe+z8SYeV5vwqic7eXsLcztht5uVP3Rqy99
 d3/jagYHKBA95O5y0sRWDgKiQ+5VyG9qre1s3xFokLlMWReS1ucX0AYm6DEbzuIan+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790937249;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=xEoI/dBwYiYUncpwnvt9J2y7UR5CgGn+iQsYz1pkzEQ=;
 b=AWQmwgcCW0sM0W32bVZw+Aodpf9bs4uXSIGGPK34Q5RWtuDOWm/hSrGqPXWIYarT4eKq
 Uy4eccW1K55kJjPndgEJ5cO6JpSA6nHszoh+I8HjgNfhgRQSkJqDrVVnVvi3GZw300l/t
 eJLu8UC5jKh9uaNMfendu+Kx0DROPBSWcxRCzKvj0GdNB9iI8o8NyTG87BIZ9rofyTxZn
 pMw357OburHMPhDXSpiBj/BdE/D5OWViVBrEC7DLinPagPFTQV0q1Cxle3Mv/LXef4Csw
 cwTny/LPg3Z/SO3++LFWiKu0R1qFuDNAQsuKw/Dz8+DKblw2IGS91OimtM8nSV8ZYrw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="X5K3ZZ/p"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5ABA181216
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:34:08 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-49e73611928so17838615e9.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 03:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790937247; x=1791542047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xEoI/dBwYiYUncpwnvt9J2y7UR5CgGn+iQsYz1pkzEQ=;
 b=hx3HmzotgSUzVPUTdNvY9bJV4eOW8o2n8KsbVrt6RtFJ7Y5hNR9aNFR87Jn1P/8OYn
 I5xIjTysXG60JNRaLg038gLRL8rk6OEhcRChDn1hbiphyheX0yuvCNZp/1Ipjln9MpBn
 fk+y3LkEa2P2kz6kgWXbjKmiEClNs/a7Q5d5z71qpEIsBEryC80Q6l4bS6Ck5hKo0d3u
 QHDO/5thPIA+pCBixVDE1/GE5voqe+LcbRVrGiN7ENghPTRJKA8O2SOw+uyoRVh5jKVm
 RpBI695+eHXlpHTAC9ZmM/Kg7OoCUx0BNdz+9q+B8IW1HvrIJ140WZIBnXlv2nJQyTdd
 m6fA==
X-Gm-Message-State: AFuF++nrVwBtTqf/+ugznRP4YyRKSUp+5cb28g/eqsFPl2yZFrIsB0C9
 JH4U3GmGPp/6a7ZAjYU6jlASP+ftdHyzO1LWZScf/hofSim0MQIoBWULSfuttLLoVv/DpqQJcrK
 6RLoN3iU=
X-Gm-Gg: AYBFou2gFBXlvrqE5EGvSCutty0tuwWpR9QmMcDjRwKooa1BXES89EOf0VuvbnV7Tfu
 6tXy5AJNeWV5c6gIA8WF1VR+Q3u1dPsuDYdSrz4Sk80u5p06J6rlJqWIQ5q658Al6MbTpFYEQ30
 KguARMS+4FQeAABsPTOtzYkdpvWqrgRvep7UrV0Em5cYCOouY37hLpYf74NQ9YNPbRIVFZUTGIq
 X6QRRyC5+uXBSNGdO3bDYO7Xd94QyZbJhfpBt6oD3+vPVBZcbK7ciqhg8sC8VWOBlMsf5obZDBX
 1CeRgN668X1vINvCZnuonPMuR5kpMUdIZbToftekLb3y5k3NynxHWkTUU3Hbb+fA2tSFmNp3tJO
 aGmpc++uLvLOM/0HoIgFB1rNJQcQE+WAXiIhH9j/j+UyMHHUSSQkFXMeQwvbNsap9l0hGl9CKIs
 vq1aK5eDxvhw+BZEM05/oPvnVhBkWlyty02fVM3a4JLnZ9hwzmqNq2QyWxfws0brFz0620DdXbx
 Vfsl/gLI0OwxYythZ4/rMGy9viW3ZYEQBub3Xoj9w==
X-Received: by 2002:a05:600c:ad7:b0:49c:f13d:ffed with SMTP id
 5b1f17b1804b1-4a01eb4c01dmr84446005e9.17.1790937246985; 
 Fri, 02 Oct 2026 03:34:06 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b380faaeesm4554152f8f.18.2026.10.02.03.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 03:34:06 -0700 (PDT)
To: buildroot@buildroot.org,
	Koen Martens <gmc@sonologic.nl>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  2 Oct 2026 12:34:04 +0200
Message-ID: <20261002103405.77551-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ce3892224b3907d22a3bcdf96a8685ae39d55380.camel@sonologic.nl>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Koen Martens from
 capnproto and linuxconsoletools
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> I have left the field of software engineering and will no longer
> contribute.
> 
> Signed-off-by: Koen Martens <gmc@sonologic.nl>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  DEVELOPERS | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 62e3eb278d..5cce270296 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2131,10 +2131,6 @@ F:	package/rockchip-rkbin/
>  N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
>  F:	package/wqy-zenhei/
>  
> -N:	Koen Martens <gmc@sonologic.nl>
> -F:	package/capnproto/
> -F:	package/linuxconsoletools/
> -
>  N:	Kory Maincent <kory.maincent@bootlin.com>
>  F:	board/octavo/osd32mp1-brk/
>  F:	board/octavo/osd32mp1-red/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
