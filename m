Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F5FECAAD5
	for <buildroot@archiver.kernel.org>; Fri,  2 Sep 2022 15:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9EE460D75;
	Fri,  2 Sep 2022 15:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9EE460D75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MtWBgL_GBsCG; Fri,  2 Sep 2022 15:32:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3F3160C18;
	Fri,  2 Sep 2022 15:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3F3160C18
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A7801BF41A
 for <buildroot@lists.busybox.net>; Fri,  2 Sep 2022 15:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 358F940650
 for <buildroot@lists.busybox.net>; Fri,  2 Sep 2022 15:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 358F940650
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I5sA9OvrarnT for <buildroot@lists.busybox.net>;
 Fri,  2 Sep 2022 15:32:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 303F140609
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 303F140609
 for <buildroot@buildroot.org>; Fri,  2 Sep 2022 15:32:24 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id ay12so1456658wmb.1
 for <buildroot@buildroot.org>; Fri, 02 Sep 2022 08:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=/zpS+kuiG5NSHNIS7mHGH//a6Tto86tZE4A5fedTyLM=;
 b=LA2SUfCgdV24hPoUiYkCzIyvqTDpT3cscWA0ZIvyXSvFRc+LaCqOkLiBxCcLFRqsBb
 EiJitT2qsSSfsVN1M8JBysrbQyAfrLNF7BVU3BGVSMUml15u3ZTR3TEeeoZE16JsQJ2u
 gnGZBL+qG64sM8rb7ogFVn1HZpcOEsJqqR01XmL4nchgFm/EoURN1ghq59UyS5ELoYBZ
 1OI4Ur3fXSYZ68+4yPPZkzXZjmjM1XmF0cBY0CARDPbzIgZVGGwKKh2RAzdMXCQogFJt
 rh52YGaPz+CHHu1zMNunp+i70sB43p+H4IINI04jgFEMMR4xpkyxVM0G+41YMApncb5H
 +ySg==
X-Gm-Message-State: ACgBeo1/iqtLx2XC+PHtg9Wmp0r2+yapDDaEmY90zxpXUGpruCio9+Ob
 j0iYrTXIxNUPXzgm1K0eJH7OuHwQsHg=
X-Google-Smtp-Source: AA6agR7Ap1JloK1uhMhuJAk29R5syJIdWEODFmb0AsuRfgp71hBP8MtjrGuMPjhoiBxdQqGmhPbcAg==
X-Received: by 2002:a05:600c:3d11:b0:3a5:cd9b:eb08 with SMTP id
 bh17-20020a05600c3d1100b003a5cd9beb08mr3324087wmb.82.1662132742211; 
 Fri, 02 Sep 2022 08:32:22 -0700 (PDT)
Received: from localhost ([2a03:b0c0:1:d0::dee:c001])
 by smtp.gmail.com with ESMTPSA id
 x6-20020adfec06000000b002258678fa80sm1762903wrn.77.2022.09.02.08.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 08:32:21 -0700 (PDT)
Date: Fri, 2 Sep 2022 15:32:21 +0000
From: Stafford Horne <shorne@gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <YxIiBS/gUC6pLboY@oscomms1>
References: <20220830210429.99DB7881AE@busybox.osuosl.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220830210429.99DB7881AE@busybox.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=/zpS+kuiG5NSHNIS7mHGH//a6Tto86tZE4A5fedTyLM=;
 b=PLw33b/hXqWT777xrxy6V5HQxgF0bGLOn5kXKzpmmMmaOojH96L221a2r44zJ584lL
 hvaPsM31AuKndYj7LxjwdbMWnzy/RL/6clzo97S84BKGbQaA2CbqRIdCgrk8tDVN5v/O
 jHYbsz06kxDvtpUI+IPXZM/O5bq4YEVULy/Hngay8PdA9Rv91ZFzt2vE7p07hMRHOSCL
 gzS0C5TCdL97Bazbtbx+3gpWCgvXsGw8lfsX6fF37vhAZum11yp5m/Jq8ptNzmNuNZND
 2RX2/Ywn2+han1ZJH/g6nWP3BcAFXdueifupeAuF7UOm9UcfYFFOF3BZtSxuoGzrvQgF
 Gg8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PLw33b/h
Subject: Re: [Buildroot] [git commit] package/gdb: prevent gdbserver being
 selected for or1k builds
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Aug 30, 2022 at 10:58:01PM +0200, Arnout Vandecappelle wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=d16db6d8a405c8410f4e892a3993686a3269bdc2
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> There is currently no version of gdbserver for or1k. Until this
> is implemented we will prevent both the direct and indirect
> selection of gdbserver for or1k builds. In practice this means
> that 'cross gdb for the host' cannot be selected and that
> 'full debugger' must be automatically selected for the gdb target
> package.
> 
> This partially reverts commit 991b7b990ad8cd4a37564cd91d5bb0ee7e1e9f11
> which claimed that gdbserver for or1k was already supported before
> version 8.3. That is not true - the commit that adds gdbserver support
> for or1k [1] was only merged for version 12.1, which hasn't been
> integrated in Buildroot yet.

Thanks, sorry for that.  The gdbserver support is a bit newer (last year?)
compared to gdb which was added several years ago.

-Stafford
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
