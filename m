Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5328FCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A022B6149A;
	Fri,  6 Mar 2026 19:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dtz22GNUDP0W; Fri,  6 Mar 2026 19:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A31E9614A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826810;
	bh=N9C/YB/6Gb9UyldkrropN0mviYz5pCorawxLGPgZ4eM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SHU2EnXEeANVpFcYTyoruKtJX5P+7fuV6V6NXAw6eA5t4Qf1p4vSXtVEBCpr6hxUQ
	 jMGIfcK9gPdjB6w7KKGmmUXeusxgGaQ+/98jGMVYGf+eZA8qZ3dQgIBfukOLnzqqbB
	 Ipo+7KBjDCwtyrxYljJbI/jOC5SZcPdsTMLU+DRqJpLm3NYHJH7wMmofUlDkyKPvKo
	 QTzE4nwfBqOkAZg/ZvbagYMYl1e+/d0l6oLcw1k95drEScIblVHAhPLawFVtQpgnr0
	 eV9nJKIK9XcyJkyvwSKPLCBDKyex+x+nxT/5cOHFsfkRHTr3VWGoVDA4JLRUbEVuyb
	 aXq17tsGr9jbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A31E9614A5;
	Fri,  6 Mar 2026 19:53:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 14FFA223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1297940455
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5SGWpNp4zrVp for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1165340343
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1165340343
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1165340343
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:20 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-439c944bb62so2540326f8f.3
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826799; x=1773431599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SsoQFMrLy1GMHBbghLWLsELFu0kyCcLC/BzUPiHqihQ=;
 b=PmchTOWFADld4R6UorQJz7HOc5oNvE2dhTRXesi8lZhKVM6psDDFf+j8/Pc+pu5hGz
 mJaly2M49EAQVJtsPudXaz7CNlkiIjEadSnkTDJ4wPKREi6oaVlusdl8ovroGai/zH4X
 pH9nNFTOggrqvxxmI+rGzWZkBcVDKGEPRVhb9Gj76RwoYwhQxCxq7gtx2GpxXTnYMvsS
 FTMPntG0MTAe/Bu5+dxa8c6Z10OBblh0VAxKEVLmQMcdCZri2TrlBy78nLsDcv91r0w9
 SFIE+NQsXFxvNpGrWntkkdWkPMgqQHuSFfdgSKtakJJ5yStBJ4ijKlRKhJnXf/IT/luA
 5iZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdfUR+x+/JHU/yWDs7IPMq4hUtWLRaHxdPlPWw8eTJi7xjaVZvkzvHInyACBEm2y+6z/YxKdwE76k=@buildroot.org
X-Gm-Message-State: AOJu0YyTKQi2xLC2n1+HqsMyI/Bg92gCRJpJhpyxBNtpEUkf7pkndcCm
 y/FLJuSgJXxpeI4wYs8dss37JeBrbQtylIbm4vgQhrclthiuREr0ycHbPO9KroTSKWpM+10kenz
 gawdQ
X-Gm-Gg: ATEYQzzkYbTq7ljylJ4oGEhZkBlq8WUJHXtNQcve7qJeL4NAzpTiMnT8yfvQp9wTCFr
 L+8i/6NkjBTYk5TNUw9bX93PU71tLeoyX99AvnRfUTkXNzO6PsvMS6u9Fuu37dpX8g6X5xP4jvZ
 fLsCU7oKAosO1/cejlYteNeC77c317g/otx1vytV/dEAV49G461t4XEgHJlDU8NkCQJ8gYRMnWO
 jzkUph2/uRkmwXvggqjPzaaAlwVX6JSAOLK3Hn9tHdcx6BlEN+jzWbiLM+0N1rg4Jjg6DAdBHl9
 S9zCdEXDdCYYyiUEwrK4HofbCOvMeqaNzbiPhSnTyLN9B9AAFvkFwJ3Es1uXFrd4OCdInCkR/0Q
 DFKvnSEysqBM8nnsqiI4bNjL+Y7n3vHPM2mpYiqni+yc0LhoboPmhqFHehAAMf9Kn9KcD6GrY6Q
 u16q3HEZVESH6YQ0vj4W38f83uVw==
X-Received: by 2002:a05:6000:1865:b0:439:c62a:6dc2 with SMTP id
 ffacd0b85a97d-439da88ffe8mr5564761f8f.41.1772826798905; 
 Fri, 06 Mar 2026 11:53:18 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad8dbb3sm5238677f8f.4.2026.03.06.11.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:18 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Fri,  6 Mar 2026 20:53:18 +0100
Message-ID: <20260306195318.8131-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260301134538.3030668-1-peter@korsgaard.com>
References: <20260301134538.3030668-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826799; x=1773431599; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SsoQFMrLy1GMHBbghLWLsELFu0kyCcLC/BzUPiHqihQ=;
 b=BTetnfOZm/z6hF7XqFNhf+zNKskx/bIWarji/jutfbQ1PvHJV+ij7tnCBxQ1rcfKpq
 B8iCSGOt18dDkxJ7Co/in6MhAYmF1BMMAp8MUpLbrviFR9IMcjBHktc24EM7dVVLHIDK
 lqNUGUmPekhE9SWAWODJieHBmT5b4MQ+C+TefWifxYO/ZhjFAHJcIrebd/V3opjjcSJa
 yBi5Kz0nPb7YOji7LB3QsDOGGqSEatxfRyjSWJGjqj5Z137DjggYkeDKy++CUCUFMxfD
 aCc55rGgM2yEvFKSixlUROoSxrS6mBhjByYJGqxQi4vRH4WYInn1BuP6gGvvj687MHy9
 0c0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BTetnfOZ
Subject: Re: [Buildroot] [PATCH] support/testing/run-tests: unbreak on
 Debian testing/unstable
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Commit 3d2141bcee("support/testing/run-tests: specify multiprocessing
> method") added a call to multiprocessing.set_start_method('fork') as a
> workaround for python 3.14, which changed the default start method to
> forkserver - Which is incompatible with the nose2 setup.
> 
> multiprocessing.set_start_method() is only supposed to be called a maximum
> of 1 time per process and throws a RuntimeError if called more than that
> (even with the same arguments):
> 
> >>> import multiprocessing
> >>> multiprocessing.set_start_method('fork')
> >>> multiprocessing.set_start_method('fork')
> Traceback (most recent call last):
>   File "<python-input-2>", line 1, in <module>
>     multiprocessing.set_start_method('fork')
>     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^
>   File "/usr/lib/python3.13/multiprocessing/context.py", line 247, in set_start_method
>     raise RuntimeError('context has already been set')
> 
> Debian included a similar patch in python3-nose2 0.51.1-2 (currently in
> testing/unstable) which adds its own call to set_start_method():
> 
> https://salsa.debian.org/python-team/packages/nose2/-/blob/debian/0.15.1-2/debian/patches/0004-plugins-mp-set-context-to-fork-for-Python-3.14-mp-AP.patch?ref_type=tags
> 
> Which comes from:
> https://github.com/nose-devs/nose2/pull/644
> 
> As discussed in the upstream PR, this is not a correct fix is wrong and
> breaks various use cases.  An issue has been opened to get this fixed in the
> Debian packaging at:
> 
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1129350
> 
> But until that is done, rework the patch to:
> 
> - Only override set_start_method() if needed to limit impact
> - Monkey patch set_start_method() so additional calls are ignored
> 
> To unbreak run-test on affected Debian systems and add some documentation to
> make it clear why this is done.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  support/testing/run-tests | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/support/testing/run-tests b/support/testing/run-tests
> index 1c4d2b4a85..2bbe7b140f 100755
> --- a/support/testing/run-tests
> +++ b/support/testing/run-tests
> @@ -142,5 +142,15 @@ def main():
>  
>  
>  if __name__ == "__main__":
> -    multiprocessing.set_start_method("fork")
> +    # python 3.14 changed default start method from fork to
> +    # fork-server, which is not compatible with the nose2 setup
> +    if multiprocessing.get_start_method() != 'fork':
> +        multiprocessing.set_start_method("fork")
> +        # set_start_method throws a RuntimeError if called more than
> +        # once.
> +        # Debian python3-nose2 0.15.1-2 includes a patch adding
> +        # another set_start_method() call, so monkey patch it out to
> +        # get rid of this
> +        multiprocessing.set_start_method = lambda *args: None
> +
>      sys.exit(main())
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
