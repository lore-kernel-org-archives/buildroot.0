Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB985C636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38FB44175F;
	Wed, 15 Feb 2023 21:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38FB44175F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DnHJC2Bo-EYE; Wed, 15 Feb 2023 21:29:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22A61402BC;
	Wed, 15 Feb 2023 21:29:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22A61402BC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A22D1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70BCC60AB1
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70BCC60AB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZBXMc0NAuhMT for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:29:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACD49605D6
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ACD49605D6
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:29:20 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 g15-20020a9d6b0f000000b0068db1940216so55659otp.5
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 13:29:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l1H+o7WdEtyCclZBjfziX2SR3+21OhT7HChIxyP8uEU=;
 b=CdwglG/+luc90vkIS21ds9GS5XYROIDTUIDamjQLjlBL+jW7b+67TkWaWXVJRDSDuK
 l0FkqKbG+HYgvtBE8/T8prGwK/gLSAh5lUJHkdxWKGL7u6V3f4cW20t5gyPDMtag8HOs
 0euK62UyQzifujzDEQTgWvU6nCH+hAunn8/26JkKaJOWjsDQwsLkQ4PFnLufArtSOJXt
 EFxnwdJhss6qSIwfvw95qUCIPU4a/G3a12gbJwJhS0FJHWftoCi2UZLrdExmoAjOejun
 FxqHXQ+a/a0djreTq6rlqBjoxEJQNTZyaRh1jCzxQUe3lJ37hBxGoTds+GmjfVWMu8Uf
 kVdA==
X-Gm-Message-State: AO0yUKXqJ3g3SaD+Pgg5xATpxILYifOTINtZyD1FQr6dA/fhxkAeo/ky
 HePhLbxM7LznX0IoUDWu/RCWNlmPpOKKQ043crvCd041
X-Google-Smtp-Source: AK7set8OerdJVLLGr2nJjk48JXBxLRQXfflhoUc7wV09u7RvO/rhy4/ZDOr4ZpROjZJjSznm8jry2FEAakJbnjrO3ns=
X-Received: by 2002:a9d:3e6:0:b0:690:c706:17a6 with SMTP id
 f93-20020a9d03e6000000b00690c70617a6mr209804otf.6.1676496559777; Wed, 15 Feb
 2023 13:29:19 -0800 (PST)
MIME-Version: 1.0
References: <20230215211531.331246-1-james.hilliard1@gmail.com>
 <e581867a-6166-3a05-1d6a-af4373610f39@mind.be>
In-Reply-To: <e581867a-6166-3a05-1d6a-af4373610f39@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 15 Feb 2023 14:29:08 -0700
Message-ID: <CADvTj4ocjP2JLa8UC6-shMf0rGGxF+T2NkAGOsdjiXeVYXTFLw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l1H+o7WdEtyCclZBjfziX2SR3+21OhT7HChIxyP8uEU=;
 b=JxXI1jxt3Wk2AuSjlUrzGAhzqL2Kd72yi4aid5z5UXrWoOxgvSi5kI2x/rykP7Kze2
 vF03r7BqXJYOkVbRfYfJRhJAQ6uOBBwOfowIsRM4c/L33XQEZ3HkLhJsPxQmcu3eZQN4
 PuQ0M8KyMjdiE/Sw6i8C1lCxo+86seEcfTz/roEebozIcrkIeX0MwVN5cR1objpaH1SH
 /5JklN3HFaPKZt3gfkdKl0CNBdUBnxCYFqw44dYXZErgk4L2pa6b5g29iochhr2f13Rz
 L/W6aUbDfKWV3FN97wE0bDiwqHTESKIMAJfspzXNU5fjlEmxyuJP7/TI2/AqVcRW3fx8
 1VOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JxXI1jxt
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

On Wed, Feb 15, 2023 at 2:20 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 15/02/2023 22:15, James Hilliard wrote:
> > The default toolchain_csv path is a relative path to the buildroot
> > directory.
> >
> > If we run genrandconfig with a cwd that is not the buildroot directory
> > the default toolchain_csv path will be wrong.
> >
> > To fix this make the default toolchain_csv path absolute.
> >
> > Fixes:
> > FileNotFoundError: [Errno 2] No such file or directory: 'support/config-fragments/autobuild/toolchain-configs.csv'
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes v1 -> v2:
> >    - set default path as absolute
> > ---
> >   utils/genrandconfig | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/utils/genrandconfig b/utils/genrandconfig
> > index b3576f8a51..3552b83694 100755
> > --- a/utils/genrandconfig
> > +++ b/utils/genrandconfig
> > @@ -801,7 +801,9 @@ if __name__ == '__main__':
> >                                   dest="toolchains_csv",
> >                                   help="Generate random toolchain configuration",
> >                                   action='store_false')
> > -    parser.set_defaults(toolchains_csv="support/config-fragments/autobuild/toolchain-configs.csv")
> > +    buildroot_abs = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
> > +    parser.set_defaults(toolchains_csv=os.path.join(buildroot_abs,
> > +                        "support/config-fragments/autobuild/toolchain-configs.csv"))
>
>   Sorry, that's not going to work either (if it was that easy I'd done it myself :-)

Under what scenario would this break?

>
>   buildrootdir can be set to something else with the -b argument, and we want it
> relative to *that* one of course.

Using buildrootdir is cwd dependent, the approach I used is not as it uses the
absolute path of the genrandconfig file to compute the default toolchain_csv
abs path.

>
>   Regards,
>   Arnout
>
> >
> >       args = parser.parse_args()
> >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
