Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38C7C636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D029D417B7;
	Wed, 15 Feb 2023 21:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D029D417B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lwRs5SJBlcdU; Wed, 15 Feb 2023 21:58:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87EB44034F;
	Wed, 15 Feb 2023 21:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87EB44034F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C39F41BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 974E64034F
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 974E64034F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3XvCaerxLVg7 for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:58:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AC81402C1
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AC81402C1
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:58:03 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id r28so17154557oiw.3
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 13:58:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3mhKZ321Oy5qJNM9nUwYHTU0jULo1cdbW/6A0bSAh6I=;
 b=5LGkgm4u0feXMZ7sISR6Gl6+LAJA0BERaYJ3GT/SCcJlFEfcesgzT25szyMnXvzXaf
 rE6KHpB8RmHxcVVeO8k79gUR5RZ2z9zyaqtytSSFkGcBUnICCiKm3SP7kobsQVsawmuU
 yHogCgor31UsPDYnRbrCaW9GcU9zMzEBjftnZcX+uS5IFzXCiAkCryJW1tE00YuaR20p
 xatZgC2trffyaE4/2ADxulsZyM7GoghOg2I57k7g+le5kRV2kulnyKWO6i59bS0NGR/X
 COhlh2aN/6e0KttsehbJmvn3nzxIwoB/kTW9K/E6RSZj/Zf/NrYV+Jw5NlmmOWmtmIhq
 Py8w==
X-Gm-Message-State: AO0yUKXkQIUB+UvG/VE/6gXr9gs2Up05Baq3NREW69C8mpSmrscyewR6
 nWs2Y+sB+e0XfnQbiYNCzfR9bo1rI/p013xkkd9nnBtMSZ8=
X-Google-Smtp-Source: AK7set9FkbPHFKcQRi2OL8Gdvj89s7/Un1OuRXbkuuKx0Yt/ll1Arpa8HF1oC0mZAgz95qTJch8vrxC8VRpNy5tRrF8=
X-Received: by 2002:a05:6808:1441:b0:37d:61fc:aa8a with SMTP id
 x1-20020a056808144100b0037d61fcaa8amr3857oiv.93.1676498282518; Wed, 15 Feb
 2023 13:58:02 -0800 (PST)
MIME-Version: 1.0
References: <20230215211531.331246-1-james.hilliard1@gmail.com>
 <e581867a-6166-3a05-1d6a-af4373610f39@mind.be>
 <CADvTj4ocjP2JLa8UC6-shMf0rGGxF+T2NkAGOsdjiXeVYXTFLw@mail.gmail.com>
 <5ee9bd2b-3a6e-7de3-9bc8-168e0639c5af@mind.be>
In-Reply-To: <5ee9bd2b-3a6e-7de3-9bc8-168e0639c5af@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 15 Feb 2023 14:57:50 -0700
Message-ID: <CADvTj4qtzU45p5_N8M159E-o0MO3PJZ0Xg5dBvaxMCGaw-3bvQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3mhKZ321Oy5qJNM9nUwYHTU0jULo1cdbW/6A0bSAh6I=;
 b=iCISqqEdX7fT+VIt3s36Min/Q5miv3wRHQB54ocVY1MB73eKqTUdvNCAzsyBBBpQXj
 AexIAHM8mzbGEWGslMW2DInUh9p0+ZwNZwheIMIjzTepPUh/Op720jeI3LZFgnYkGgEz
 VSHXo1HhqQWcz70gdG9cdxth5ozHuTr8HsnLKu8kb3aszHaW7Y5gCan4DlA4oF8wmATA
 Z75MdIFvvuVLYlJ6xIEJJX9Fp8QGEyeowjtomkYj1qLkBNskFVF+6Hd/HkOel0/OMYuw
 PqgkH2pJhbsiUAv+D5oj/CkZUKUxemaszDBnx79uxQ6Za1gFZFBqUHCPS69ZlHSl1P+6
 Md7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iCISqqEd
Subject: Re: [Buildroot] [PATCH v2 1/1] utils/genrandconfig: make default
 toolchain_csv path absolute
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

On Wed, Feb 15, 2023 at 2:46 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 15/02/2023 22:29, James Hilliard wrote:
> > On Wed, Feb 15, 2023 at 2:20 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> >>
> >>
> >>
> >> On 15/02/2023 22:15, James Hilliard wrote:
> >>> The default toolchain_csv path is a relative path to the buildroot
> >>> directory.
> >>>
> >>> If we run genrandconfig with a cwd that is not the buildroot directory
> >>> the default toolchain_csv path will be wrong.
> >>>
> >>> To fix this make the default toolchain_csv path absolute.
> >>>
> >>> Fixes:
> >>> FileNotFoundError: [Errno 2] No such file or directory: 'support/config-fragments/autobuild/toolchain-configs.csv'
> >>>
> >>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >>> ---
> >>> Changes v1 -> v2:
> >>>     - set default path as absolute
> >>> ---
> >>>    utils/genrandconfig | 4 +++-
> >>>    1 file changed, 3 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/utils/genrandconfig b/utils/genrandconfig
> >>> index b3576f8a51..3552b83694 100755
> >>> --- a/utils/genrandconfig
> >>> +++ b/utils/genrandconfig
> >>> @@ -801,7 +801,9 @@ if __name__ == '__main__':
> >>>                                    dest="toolchains_csv",
> >>>                                    help="Generate random toolchain configuration",
> >>>                                    action='store_false')
> >>> -    parser.set_defaults(toolchains_csv="support/config-fragments/autobuild/toolchain-configs.csv")
> >>> +    buildroot_abs = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
> >>> +    parser.set_defaults(toolchains_csv=os.path.join(buildroot_abs,
> >>> +                        "support/config-fragments/autobuild/toolchain-configs.csv"))
> >>
> >>    Sorry, that's not going to work either (if it was that easy I'd done it myself :-)
> >
> > Under what scenario would this break?
>
>   I have ~/src/buildroot/utils in my PATH, so I just run 'genrandconfig' from
> path. If I want to run it in a different worktree (e.g. ~/src/buildroot-next
> which tracks the next branch), I would go to that directory and run
> "genrandconfig", so it would use the one in ~/src/buildroot, not the one in
> ~/sr/buildroot-next. In that case, of course, I want to use the
> toolchain-configs.csv from the next branch, not the one from ~/src/buildroot.

Well you can still do that by passing the relative path via --toolchains-csv to
override the default abs path.

>
>
> >>    buildrootdir can be set to something else with the -b argument, and we want it
> >> relative to *that* one of course.
> >
> > Using buildrootdir is cwd dependent,
>
>   The default value is cwd dependent; the value you give with the -b option can
> be absolute or relative.

Yeah, but I think making it an abs path relative to the genrandconfig
file as the
default is less likely to cause unexpected issues. Having it relative
to cwd when
not passing an option is a bit unexpected IMO.

>
> > the approach I used is not as it uses the
> > absolute path of the genrandconfig file to compute the default toolchain_csv
> > abs path.
>
>   And my point is that it should be relative to the buildrootdir given with the
> commandline option, not relative to the place where genrandconfig happens to reside.

It's still relative to cwd when passing a relative path via
--toolchains-csv, just the
default is changed to be an abs path.

>
>   TBH, I think genrandonfig has too many options :-)
>
>   Regards,
>   Arnout
>
> >
> >>
> >>    Regards,
> >>    Arnout
> >>
> >>>
> >>>        args = parser.parse_args()
> >>>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
