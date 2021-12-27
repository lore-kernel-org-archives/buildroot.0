Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6F8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 07:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDE2140589;
	Mon, 27 Dec 2021 07:25:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RzOEtq-YoQl3; Mon, 27 Dec 2021 07:25:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF3824047D;
	Mon, 27 Dec 2021 07:25:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CDE711BF573
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 07:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCE94813DE
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 07:25:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DYb8tWb8EYYa for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 07:25:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9567C813C4
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 07:25:06 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id b13so58499155edd.8
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 23:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ic6weCGQnEe/mTpc5GE2KnqPhWcRFdptg0sC00xNYDA=;
 b=SWzxdH8Dya/1ww3G8kBlK8ePqH6Vbb/VA1rDAEgKmNJT0qtxw9YKZVKFMTDXzkfN7N
 NvVmT94BuM/FYgXOkWtQFjr5zm+ef1VIeuPb9InQouyrG93mCm174i7S83glukQzMuAo
 Nrc49eTSxI1KqIZrGH/nvPf8WSVUUP+/jtt6ZpMyY2lMRCITVa76KvIkHaLVnGUJUdk9
 n5u8o8mj3cAF/YytL45WcgnF6UOh/qtjel0pYZzqBi4s8KNB+Ok0x8UpukzKxBzi4syM
 x19hAwaEfN1gMVQ/1p4ct6ZOtVfeSZe2kH89IlRVAIWuRTVUpy6n7TyTch6JjkpYj4QV
 INug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ic6weCGQnEe/mTpc5GE2KnqPhWcRFdptg0sC00xNYDA=;
 b=Duhj/ThWaN/+1tyP3b5bUNrJsiFiYXJWEVR9CmLred7PQci5aV8Hoflsor7cWhZNZu
 ZuKWZ221/auPkWOUyY1EIArItUDLtUKP5nyEVXJMmD5DqsZhwpvZbuSteq+VJbm5BzOS
 +Qy7vu09/TUwowDe7va7dyYJLCXhX978bO3tJxAXijMEOiliW+HJaFk3K/2VhYT3XZFM
 5Vkbv6HLXDxgESbm90EtoFGp47gczDaQRmZJHcLF7Ffhh9EDUXPQm6ggvw3z5neHlg0r
 vKCxeDK4f4sI5R0T3APMV1OQAAX61kPpN/IEFuPSVPNJrJ3rjGgHE5nRIid069RDJAze
 Wemg==
X-Gm-Message-State: AOAM530NTgK/XJZXMs1RGOn4HIlJU1auw6kWfjPA2B4N0ncPZl/1Xn5l
 HueLsh1fj0tJWGkren2GaoCORDwsA8ssMqW9HC8lfodFTps=
X-Google-Smtp-Source: ABdhPJyLxHslFnf2Tw8/w4m7bZXQ1OJybzFNJI8Fc51dAvQvxEnbBOiqRYxXPwPHInYPAMYrR6ycWtEvue7YY8HQoQE=
X-Received: by 2002:a17:907:968a:: with SMTP id
 hd10mr12737947ejc.269.1640589904891; 
 Sun, 26 Dec 2021 23:25:04 -0800 (PST)
MIME-Version: 1.0
References: <CAMo8Bf+N5zOkAXgOGRYe4cJkBitactfuajB1SEoLLuwqZfCQ2g@mail.gmail.com>
 <20211226122351.425d0579@windsurf>
In-Reply-To: <20211226122351.425d0579@windsurf>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 26 Dec 2021 23:24:53 -0800
Message-ID: <CAMo8BfLjbpoWdTtoswpihCJJs3672bM5SBaLOA+5hjB_rXK0wA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] package/coreutils mkfifo -m exit status
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Sun, Dec 26, 2021 at 3:23 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> So, clearly dropping gl_cv_func_fstatat_zero_flag=no from Buildroot's
> coreutils.mk is the right thing to do.

Thanks for the confirmation, I've posted the patch.

> However, I have not been able to understand why
> gl_cv_func_fstatat_zero_flag=no makes fstatat() always return an error.
> The code in lib/fstatat.c is convoluted, and even looking at its Git
> history, I've not been able to spot what happened.

I had to look at the preprocessed source to understand it,
in the presence of gl_cv_func_fstatat_zero_flag=no it looks like this:

int rpl_fstatat(int fd, char const *file , struct stat *st, int flag)
{
 if (flag & ~0x100) {
(*__errno_location ())  =  22; return -1; };

i.e. return error with EINVAL code when flags have anything other
than AT_SYMLINK_NOFOLLOW, which is always the case for the
following call:
https://github.com/coreutils/gnulib/blob/9aca7b67333fd0a90bf56104325ce96199644451/lib/lchmod.c#L65

-- 
Thanks.
-- Max
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
