Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC1BCFC27C
	for <buildroot@archiver.kernel.org>; Fri, 21 Nov 2025 13:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7DFD84C17;
	Fri, 21 Nov 2025 13:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id baMCxFuK8Xbk; Fri, 21 Nov 2025 13:55:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 645B684C0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 645B684C0E;
	Fri, 21 Nov 2025 13:55:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85A6E158
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 13:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77A9D40447;
 Fri, 21 Nov 2025 13:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgNhubJ3jCkW; Fri, 21 Nov 2025 13:55:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8AD9240404
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AD9240404
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AD9240404
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 13:55:30 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-42b387483bbso1403575f8f.1
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 05:55:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763733328; x=1764338128;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Fn6F2nHj0n40o1ictBWwBjAjEaZVwCGUYfjyLTouYms=;
 b=kN0EqgeFZo5xfv29Zsc1bM3KUuVo9b4GisewyoP8r+pbhjS71HPiQkg2mJSMlRJYkn
 pEPuid+E9sgo3dmJLpF0Rb7i22xGHV7l7q1ikZzHVAvlQ+lWSb3UHMMbs2RadZ1bdNmO
 e5WSJqC8SSv9RChNLYU7QT6uA2fdamem45MiiTUB0Q9W0bVCCnrW4LMK9zwuK73F61V0
 RxSJs6bYbPyjCO2vPpsWswQ8wpSj5uCG91gvzJ8h6GFfKtK1hM/DOn4wAGecmQiaIp9p
 izt0YQ3YSeAeIIZ87lK+VArh5sQ10NLFUdW/8kPx9U+LjzXNlN3SBUbMkUf1io/WPc4O
 E6jw==
X-Gm-Message-State: AOJu0YwlhlXIqXsbIFJ7rOj0gom6/mPLS4UqpLn+0kOu1n/x5HDyd8eR
 CI3uAMQmlXGL85wzUIkDKCrVcKwoTP4FvyGXNt10e7JkbaoXsV+BYwHr
X-Gm-Gg: ASbGncsMajF3aj9byFzVdQjO0xSctirzpXwMnorJxwopMgJlfOiXR/+oS1lHLgslwtK
 ABW15RUi1sZRwT/QfGNso78eL5zn4QwclUjBXVsQ5g8X3oXqKHxO7NgSNvP1qQ4z2OXf+COsT8H
 v7/fO16a6pOZE97H97f2WqC7qFPRjhmEUMZltLf11G/JN4FXXcFHY1677W7KjyHFIEJQOj5nXN/
 PTnuP9LFlm6ZpiBnHh3g1PqrWGz2x0Z7F4qUKOxCScQG1GHG/sS8YPsudvIeIks4aoHWQtCAWeY
 oiXG7eh8lxQo8j4mIu38baqiGytX5HTErLZpfEuWMsw3clp3vH/RC4eEwuSkEpc/qAnjy4/HZsl
 3Hn3OLFw1SWHmBbSH53/7cw2JNUTJ0DFn3aK7HE0MZPxz5r/2oaJxy6BspmDm7sS9SelcjGElNU
 pZguIsqeiQ8CX6GPhpdPFlUyL65TdLoFXE
X-Google-Smtp-Source: AGHT+IHARBcSmux+cYUpojAC/an/ft+HE4vfUI+tX8/yh0t6Ajvc/WJdP24ElGcZqkkuoU3JlXZimg==
X-Received: by 2002:a05:6000:178a:b0:429:c4bb:fbc5 with SMTP id
 ffacd0b85a97d-42cc1cd8ed5mr2414432f8f.7.1763733328286; 
 Fri, 21 Nov 2025 05:55:28 -0800 (PST)
Received: from ymorin.is-a-geek.org ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f34ff3sm11744113f8f.16.2025.11.21.05.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 05:55:28 -0800 (PST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 21 Nov 2025 14:55:26 +0100
Date: Fri, 21 Nov 2025 14:55:26 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <aSBvTsI_eOEFsMyG@landeda>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
 <34f309044544536e35eb8632020e9ddff0a53553.1756717276.git.yann.morin.1998@free.fr>
 <20251120215246.0bed6b94@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251120215246.0bed6b94@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763733328; x=1764338128; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fn6F2nHj0n40o1ictBWwBjAjEaZVwCGUYfjyLTouYms=;
 b=JStg7fwCzjHaJ7wNF7DIQFMzNwxpDPIGtwQMDaPrCVWiLOl0RM5HIzUSUQ9dmzyjdp
 DeA20r3oVOx650ZKQvu0MFbwReLP7UmOSQ1+9NHv7fpWJjaOehu8z+kMZx/H1aOBLTQ4
 7J7ybPYyw29yUJbkQZP92f2J8Qv87XtM2bbwy02CHGE2WkRR6oT0mDJUtUlvjqrGZb8K
 mpIM1t1Abs/PRukP71cSxU+GpH89/qqlNdXpdnuRfR/ZJh9Cp0V/I+xa91mqGo7z7cKK
 H13DOs5/70CoXlBHyNMinNrdWF5w6A5Mw2WNpZWGYiA7fBqsUPkvcdvq/rqBTC6O/kAH
 Ps3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JStg7fwC
Subject: Re: [Buildroot] [PATCH 07/18 v3] support/scripts: move merged-usr
 errors message into check-merged-usr.sh
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2025-11-20 21:52 +0100, Thomas Petazzoni spake thusly:
> On Mon,  1 Sep 2025 11:01:16 +0200
> "Yann E. MORIN via buildroot" <buildroot@buildroot.org> wrote:
> > -# The directory to check for merged-usr
> > -root="${1}"
> > +opts="type:"
> > +ARGS="$(getopt -n check-merged -o "" -l "${opts}" -- "${@}")" || exit 1
> You're introducing the use of "getopt" here, which is part of
> util-linux, and not necessarily installed by default in distributions.

Damn, thanks for the report. I've sent a patch switching to using
getopts instead:
    https://lore.kernel.org/buildroot/20251121135334.470282-1-yann.morin.1998@free.fr/T/#u

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
