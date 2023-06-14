Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F74EEB64D8
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 02:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4C24403C9;
	Wed, 14 Jun 2023 02:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4C24403C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sRRPWxqCku9B; Wed, 14 Jun 2023 02:05:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A278940C5C;
	Wed, 14 Jun 2023 02:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A278940C5C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B058E1BF30A
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 02:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97C6E40C5C
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 02:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97C6E40C5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lROd6hYYkzn8 for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 02:05:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19EA5403C9
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19EA5403C9
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 02:05:19 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-977c89c47bdso35065966b.2
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 19:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686708317; x=1689300317;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m2v70WnjJLNbVPMo1wyCZcSBYjwnsZ413fGeVCtz/po=;
 b=lDn3i/B3R9K39W4pbuId/Qu/I0m4q+Row4uDSnudTxGE58W6EfOxww1DibN7G4Nkw/
 masOwEiYOSu5gqFir/HHi0iaqx4CJVR7Y367eSXoFwuZEOYMOE73bA2WXJ4hYNMqjD0/
 GVBKBLAGuANYB3LSftQ7r4+szaL9dSwxTttAOG/rfWITawd4eRb+lvUJXd8PV/exYPcQ
 g/GfCiwzLgQRSQA/mbree4b5l1hDwZYLb5hocKCje+djVz25IOAE7jbpin1GnUDJowe1
 JUOl1sssiUvaRg8FnwWu+ZAmfoJ6Po/lLIV54kBQVRrNPUzAuLERVQr+Ea7iD4/LriVA
 C2gw==
X-Gm-Message-State: AC+VfDygyRG9HxUM1jD1Y9tysSUR8n941+x4mMA/MKF7q2DTpaxyYiGf
 n1MrrFtSNwvj5EYKUCGczZGk707nw+dQaOXMOgs=
X-Google-Smtp-Source: ACHHUZ5F/q0Qyd79RgWyTDy13ScSYzIvi9+1DIOmS/tT7koQXngBdbb27W87ycgj2TpBVjURzpAD/Y7TQFsj1wSluII=
X-Received: by 2002:a17:907:368d:b0:961:78c2:1d27 with SMTP id
 bi13-20020a170907368d00b0096178c21d27mr15381315ejc.19.1686708317145; Tue, 13
 Jun 2023 19:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230613105015.739870-1-laurent@vivier.eu>
 <20230613105015.739870-5-laurent@vivier.eu>
In-Reply-To: <20230613105015.739870-5-laurent@vivier.eu>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 14 Jun 2023 02:05:05 +0000
Message-ID: <CACPK8XfZL3j9AP-hkz3mNLW=6Ryy5TMo+o95DJNZ_vWBJxE2DQ@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1686708317; x=1689300317;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m2v70WnjJLNbVPMo1wyCZcSBYjwnsZ413fGeVCtz/po=;
 b=Y3ZZ6UP5MVWyyNO0qQTNn1msdkfdRL5cdfF8z4hJ1onLoxVPdrdVNPQVz/Yg6Ytk9e
 d5trgXeCiqwG0D6vbb+U1yaVM60lSzdwWUlSegqvscRmWZYYW7mdKbsRRg3ah0kHu2Ur
 63Eu6DJUUB/QjAe1GuO7j1jn90EgpLwFYqrQ4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au
 header.a=rsa-sha256 header.s=google header.b=Y3ZZ6UP5
Subject: Re: [Buildroot] [PATCH v14 4/4] support/scripts/boot-qemu-image.py:
 manage petitboot interface
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
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 13 Jun 2023 at 10:51, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Petitboot doesn't start a shell but a GUI.
> Manage the menu to switch to the shell.
>
> Enable the test for qemu_m68K_virt.
>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  support/scripts/boot-qemu-image.py | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/support/scripts/boot-qemu-image.py b/support/scripts/boot-qemu-image.py
> index ba50ea69ee9a..c94b7a5c969d 100755
> --- a/support/scripts/boot-qemu-image.py
> +++ b/support/scripts/boot-qemu-image.py
> @@ -36,7 +36,7 @@ def main():
>      time.sleep(1)
>
>      try:
> -        child.expect(["buildroot login:"], timeout=600)
> +        idx = child.expect(["buildroot login:", "Exit to shell"], timeout=600)

What's idx going to contain in the petitboot vs getty cases?

>      except pexpect.EOF as e:
>          # Some emulations require a fork of qemu-system, which may be
>          # missing on the system, and is not provided by Buildroot.
> @@ -55,7 +55,11 @@ def main():
>          print("System did not boot in time, exiting.")
>          sys.exit(1)
>
> -    child.sendline("root\r")
> +    if idx == 0:
> +        child.sendline("root\r")
> +    elif idx == 1:
> +        time.sleep(1)
> +        child.sendline("\r")
>
>      try:
>          child.expect(["# "], timeout=600)
> --
> 2.40.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
