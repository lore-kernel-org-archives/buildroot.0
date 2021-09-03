Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9D4C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 12:00:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4664F61051
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 12:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4664F61051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF9E6407EA;
	Fri,  3 Sep 2021 12:00:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YyRxoiDPJzlI; Fri,  3 Sep 2021 12:00:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E72DF407D1;
	Fri,  3 Sep 2021 12:00:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2628C1BF282
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 12:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1085F83027
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 12:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ufuo1oTheDFT for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 12:00:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B87A683E3D
 for <buildroot@busybox.net>; Fri,  3 Sep 2021 12:00:19 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id z19so7615313edi.9
 for <buildroot@busybox.net>; Fri, 03 Sep 2021 05:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=58wjV02lBbkokldEq8L3edaCyfi5txHTvNHi+ZvedH8=;
 b=EKDY6Zv2oMQOyAS++QW0ceSiU13UbLtreEaMtbWhR0tYSehzC0F8XEQNXk10ad41e8
 V87yWeb85MxHCGrP6lYJ8yb4koS20iYoknuxxIOFAAtilftlrPizHz/sk4tO1EMGUvMK
 lgZTeDVdjOEEPn8ooNKwe1XTcoePRHLPvsF0jqbmHMhZQsUp2hYQAZH4NME5ECHucr92
 5DS1rwzlLDU+0ayb+MNnt1N8NoL7nwUuL5dpzuZgqzhU6QZWFkn9Sm+lr8JfmExFlgFA
 uVZeUALTkSCtQB499LGoe5ufGAZdRKX51ycXFND2Okc+sGuYSyPnwwlplTv2RBwtlxS/
 BPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=58wjV02lBbkokldEq8L3edaCyfi5txHTvNHi+ZvedH8=;
 b=oEleguGBkMUVd868Ym9zAjvWA2ug+1gcEdywW13swEafAR6DKZAVg3Z/8FvaUIw2y3
 NR01QRtw//6uun8kj5eLyYfa663xQcAHu+LMUYYSeK5Qe+F1xGgRuW//HQdKUcJn+32w
 wt4L74GbIMXai/wadlQX/JSy6WTMsQutDe0YTTOflwmGBRS9C6FrnGEmistgRUGIvsi2
 +j2LwlIF4/NtaJznpb0e0O6PRQzpuMheUCB1CNmh9d4YIMKzhWOGgn/x+Ohai1TIkf9u
 0XUnXahph9xUgD36sHNp+V1MZ23iVfpEe75im6vIjvL/tn5LjL/9eq/tRYwA+k55yCzB
 NwKw==
X-Gm-Message-State: AOAM531tzwo2lt5McN3gFba7cJ4Rggy15f2G+ko8hMHqs9mh+AX2dTxx
 8fCrWl7QI8J5TJN5d5V/UlWevdo9Y8c=
X-Google-Smtp-Source: ABdhPJy5Jftr/orBvhdfAcFhWA6ICbo666+uRmvSYldVGLClrHvgWjixLOnB1n+oyYOT4HSM+3qabA==
X-Received: by 2002:a05:6402:d6b:: with SMTP id
 ec43mr3507842edb.107.1630670417948; 
 Fri, 03 Sep 2021 05:00:17 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 i11sm2762823edu.97.2021.09.03.05.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 05:00:17 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mM7rj-00053y-Pl; Fri, 03 Sep 2021 14:00:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <877dfyrwao.fsf@dell.be.48ers.dk>
 <30117DCC-D442-43F5-8388-384C8EE48769@benettiengineering.com>
Date: Fri, 03 Sep 2021 14:00:15 +0200
In-Reply-To: <30117DCC-D442-43F5-8388-384C8EE48769@benettiengineering.com>
 (Giulio Benetti's message of "Fri, 3 Sep 2021 12:21:47 +0200")
Message-ID: <8735qlswc0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] What's wrong with patchwork
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@busybox.net, Stephen Rothwell <sfr@canb.auug.org.au>,
 Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Pj4+Pj4gIkdpdWxpbyIgPT0gR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGll
bmdpbmVlcmluZy5jb20+IHdyaXRlczoKCkhpLAoKID4gVGhpcyBwYXRjaFsxXSBzdGlsbCBkb2Vz
buKAmXQgc2hvdyB1cC4KID4gRG8gSSByZXNlbmQgaXQ/CgpZZXMsIHBsZWFzZS4KCiA+IE1heWJl
IG90aGVyIHBhdGNoZXMgaGF2ZSBiZWVuIGxvc3Qgb24gcGF0Y2h3b3JrLiBJIGRvbuKAmXQga25v
dyBpZgogPiBwYXRjaHdvcmsgd29ya3MgaW4gcG9sbGluZyBvciB0cmlnZ2VyaW5nLgoKVGhlIHdh
eSBpdCB3b3JrcyBpcyB0aGF0IHBhdGNod29yayBpcyBzdWJzY3JpYmVkIHRvIHRoZSBsaXN0IGFu
ZCBsb29rcwpmb3IgcGF0Y2hlcyBpbiB0aGUgbWFpbHMuIElmIGl0IGRpZG4ndCByZWNlaXZlIHRo
ZSBtYWlsIHdpdGggdGhlIHBhdGNoCnRoZW4gaXQgd2lsbCBub3Qgc2hvdyB1cC4KClNvcnJ5IGZv
ciB0aGUgdHJvdWJsZS4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBsaXN0cy5idWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
