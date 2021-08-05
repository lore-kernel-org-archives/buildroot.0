Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88BEC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:07:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C50560EE4
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C50560EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC0254056C;
	Thu,  5 Aug 2021 20:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hFB9JSmNE5-i; Thu,  5 Aug 2021 20:07:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43A8E4041F;
	Thu,  5 Aug 2021 20:07:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D2801BF3FD
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C4C2837D2
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:07:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id edsC0UlwMO-N for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:07:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 281E8832D0
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:07:36 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id b13so8112041wrs.3
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 13:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=SHFqh7wDR6ytGfAc/8zZyRuIgohkFJr7mDsp0W2vRt4=;
 b=FhOaLH36wO1xOP7adHiMyWrIQEmbeicGOcZuHKd3JgJG3aI8MAhIDa9jlYMWh5wk+W
 cuX1ifChomGbnv4uwme9209DBgB/Y8cBe0puHhTx0cJP4XLYvquWZT/Da3Ebx0Gxsyq3
 xWf4Jm4zkbzOYKbaKH0c4TxmrNjFC9v4iChNGDUWyPMfZ507PGlX/QHr4MQ8NDHajbHn
 dFNQT/HtqQP1SiMP1KklwujlQ2JuxKEbtCHYiZi0W1Pyky7BZ01hZQ3O4W9OOpU4nzoX
 CPzz2fNDxU206pxIvTu3fHqWBfJ9MW3E0Si5cudDn+zphG8gShetfpOG95b/nnNHDT8P
 3F4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=SHFqh7wDR6ytGfAc/8zZyRuIgohkFJr7mDsp0W2vRt4=;
 b=rCvZted9iQBmul49lpI+rwYEbgufSxzLwMRfBqXFmAMnANZ8YF4S4K1uSek831WIgT
 dtFOihZCXFLhtPTY6oQd/QqRyAv6rHHjk3UBmfaMjfm2q2EkvR0Xey33GXXOq7JnzAjW
 +OXegtnnIp//aCSAeSIutC8u+2FuO18ymwFxyajsxfwzFz66AwuMv+rXLkVKSzO3zexU
 EnZEibEujxhDdyGfWC2zJ0YvhKs6YBRZK1TpUQQmvBFCdEXTl2aKMYknmjgMlmopATkC
 1EaRBv7dHi1IFMol1G1Yhf2p1eDL4Im59cwR/etV/ymnkABEqGRFRsnmX6bpA0e9gUPL
 Zztw==
X-Gm-Message-State: AOAM530HnPecABwm6XZSy2IpdhB4DK8bVOk5wzI2DzmrnnEw+MCQJxhd
 xvTzLPzTeSAP8K7m5e/fngU=
X-Google-Smtp-Source: ABdhPJwuvoDrjxBCWK8LCcAMUvREKIz+OU6oK4jV8ZTvRu+zsB9eiddsgJkBW4S7W6em471l+Ks3CQ==
X-Received: by 2002:adf:fb8f:: with SMTP id a15mr7175543wrr.92.1628194054257; 
 Thu, 05 Aug 2021 13:07:34 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id n5sm6332332wme.47.2021.08.05.13.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 13:07:33 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBjeO-0007AJ-02; Thu, 05 Aug 2021 22:07:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>
References: <20210308134542.22324-1-patrickdepinguin@gmail.com>
Date: Thu, 05 Aug 2021 22:07:31 +0200
In-Reply-To: <20210308134542.22324-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Mon, 8 Mar 2021 14:45:39 +0100")
Message-ID: <87bl6bk64c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] utils/scanpypi: add setup.py script
 directory as sys.path[0]
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Even though the directory containing a package's setup.py was added to
 > sys.path, some setup.py implementations rely on the fact that it is placed
 > in sys.path[0].

 > An example package is 'cram' which failed to be added with scanpypi:

 >     Traceback (most recent call last):
 >       File "utils/scanpypi", line 756, in <module>
 >         main()
 >       File "utils/scanpypi", line 703, in main
 >         package.load_setup()
 >       File "utils/scanpypi", line 303, in load_setup
 >         setup = imp.load_module('setup', s_file, s_path, s_desc)
 >       File "/usr/lib/python3.8/imp.py", line 234, in load_module
 >         return load_source(name, filename, file)
 >       File "/usr/lib/python3.8/imp.py", line 171, in load_source
 >         module = _load(spec)
 >       File "<frozen importlib._bootstrap>", line 702, in _load
 >       File "<frozen importlib._bootstrap>", line 671, in _load_unlocked
 >       File "<frozen importlib._bootstrap_external>", line 783, in exec_module
 >       File "<frozen importlib._bootstrap>", line 219, in _call_with_frames_removed
 >       File "/tmp/scanpypi-2pzc5wb_/python-cram/cram-0.7/setup.py", line 44, in <module>
 >         long_description=long_description(),
 >       File "/tmp/scanpypi-2pzc5wb_/python-cram/cram-0.7/setup.py", line 20, in long_description
 >         return open(os.path.join(sys.path[0], 'README.rst')).read()
 >     FileNotFoundError: [Errno 2] No such file or directory: '.../buildroot/utils/README.rst'

 > The corresponding code from cram's setup.py is:

 >     def long_description():
 >         """Get the long description from the README"""
 >         return open(os.path.join(sys.path[0], 'README.rst')).read()

 > Indeed, the Python documentation says:

 > https://docs.python.org/3.8/library/sys.html#sys.path
 >     "...
 >     As initialized upon program startup, the first item of this list,
 >     path[0], is the directory containing the script that was used to invoke
 >     the Python interpreter.
 >     ..."

 > Fix this by inserting explicitly at index 0 instead of appending to
 > sys.path.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
