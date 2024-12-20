Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102B3E77188
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 21:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B54CF812E9;
	Fri, 20 Dec 2024 21:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ySEiBoPJ5C6q; Fri, 20 Dec 2024 21:49:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A46AD812F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A46AD812F3;
	Fri, 20 Dec 2024 21:49:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B022A730
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 21:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 908FD4109D
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 21:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1BqwUONSMJoS for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 21:49:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2117240B7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2117240B7F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2117240B7F
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 21:49:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E5FD313F854;
 Fri, 20 Dec 2024 22:49:14 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58718])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 20 Dec 2024 22:49:14 +0100
MIME-Version: 1.0
Date: Fri, 20 Dec 2024 22:49:14 +0100
From: Julien Olivain <ju.o@free.fr>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <64f9d09898aee7370ee86df702b207182e6d0cb5.1734701459.git.yann.morin@orange.com>
References: <cover.1734701459.git.yann.morin@orange.com>
 <64f9d09898aee7370ee86df702b207182e6d0cb5.1734701459.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <e6f74cda3c0226092172388da4f2438f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734731356;
 bh=IqijKWxKkAWToFSHEzQ6WHTag3obHSOePRQszEQ6S9A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OGqUT0d35+ELHOIPkvDLQulZkvQ6qRWToK6FAiw7y31CCCQ/RLJQ/ghSZU14J9TNc
 fHKDI6FiGk49h8Idg+nHs7v+8hOHFo58BOVbpy6yegciF8k1eCY0VF28yw+dugu4Ox
 h6cyUDj7yQKos/PB9d3VI2M6DtnV0enEHQ2crLNbc1dcJLnIH13AyBYh+cm4Peghkc
 4xRKZ4U4r0AKwoJ9/QH5xCzErI28u7qwsKyGsrctuLUZWUeeGPq1gimPDPbdO4n9Uu
 T2h6RHXwm+ko0zDZiW8WprUQeslsck/kSAvEPg8wGXLbt8zDDq+keGeBtXOMEacf7l
 j68nziTFANjXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OGqUT0d3
Subject: Re: [Buildroot] [PATCH 5/5] utils/get-developers: add option to
 report Cc: lines
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 20/12/2024 14:31, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> It is very common to use the output of get-developers to add cc: lines
> in the commit log (see below!).
> 
> Add an option so that get-developers reports Cc: lines ready to be
> pasted in a commit log.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> ---
>  utils/get-developers | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/get-developers b/utils/get-developers
> index 3253ce5d6b..f66477751a 100755
> --- a/utils/get-developers
> +++ b/utils/get-developers
> @@ -17,6 +17,8 @@ def __main__():
>                          help='find developers in charge of these 
> files')
>      parser.add_argument('-c', dest='check', action='store_const',
>                          const=True, help='list files not handled by 
> any developer')
> +    parser.add_argument('--cc', action="store_true",
> +                        help='report developpers as CC: lines ready to 
> be pasted in a commit log')

Here, this help line does not give a clue this option only works for the
"patch" action (and nothing happens if it's used on other actions).

Do you see valid use cases for other actions?  Such as:

     utils/get-developers --cc -p python3
     utils/get-developers --cc -f package/python3/python3.mk
     ...

If yes, this --cc should be handled in other actions too.
If no, the help line could mention it is limited only to patches.

What do you think?

Also, "developpers" in the help string should be fixed to "developers".

>      parser.add_argument('-e', dest='email', action='store_const',
>                          const=True, help='only list affected developer 
> email addresses')
>      parser.add_argument('-v', dest='validate', action='store_const',
> @@ -99,9 +101,9 @@ def __main__():
>                      matching_devs.add(dev.name)
> 
>          matching_devs = sorted(matching_devs)
> -        if args.email:
> +        if args.email or args.cc:
>              for dev in matching_devs:
> -                print(dev)
> +                print(f"{'Cc: ' if args.cc else ''}{dev}")
>          else:
>              result = "--to buildroot@buildroot.org"
>              for dev in matching_devs:
> --
> 2.34.1
> 
> ____________________________________________________________________________________________________________
> Ce message et ses pieces jointes peuvent contenir des informations 
> confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez 
> recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les 
> messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme 
> ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged 
> information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and 
> delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have 
> been modified, changed or falsified.
> Thank you.
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
