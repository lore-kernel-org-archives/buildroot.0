Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27AE3C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 19:25:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA53D61108
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 19:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA53D61108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5371B83A8C;
	Fri, 22 Oct 2021 19:25:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X9MpJA3dkpe1; Fri, 22 Oct 2021 19:25:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4F2B83A8F;
	Fri, 22 Oct 2021 19:25:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B90FF1BF40D
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 19:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7731401C1
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 19:25:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X6qsnEQO0DwG for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 19:25:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 004AB400DB
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 19:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634930743;
 bh=HGvvcXY35ef9H+dZpriv/MrQ5LCzLwzLIcwYK/scbW4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=TyqUxyL9V2q6e1HrlKgctJF4cZ6EJruOO3z5/5FQ6j3fThdQOXzvoPySV3Dd/wdn0
 sxdOb/HnUs6n/Zr3QA1Z/F6Hlg6XT86GuAW7ql9YKZQhudSQVrTYBCBE6MDffzF/iw
 8vqhQa08eRR58jGdaBs7L7AFTj4wZ1uabPd5BEj4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.153]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZCfJ-1m912k0yAL-00VAwX; Fri, 22
 Oct 2021 21:25:43 +0200
Date: Fri, 22 Oct 2021 21:25:42 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20211022212542.157f12ce@gmx.net>
In-Reply-To: <87a6j06h4e.fsf@dell.be.48ers.dk>
References: <20211014220011.17230-1-ps.report@gmx.net>
 <20211014220011.17230-3-ps.report@gmx.net>
 <87a6j06h4e.fsf@dell.be.48ers.dk>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:BhvetOO5Nv3o9zLNTRVcoLK5aF1KvcXjYvXodh6G7v/S5hw2AC/
 jprI27tGdQiWal+RcT9dDZFtbpy20Azb3j2F7eB6T2uFba2b6BbXl7aB4cB1BT46com7fH5
 UBX7O6Slfza7NIU1Wg+NWwE0G3vh+0/9llOnkt+wqkDwMfz03ATyWf6mbx/fkE9xT09n6vx
 GMUZc+GnSJ/97r9bZ/Yfg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YxsLuJimUOs=:qNKeoL13oEPqLa7j7Axy/q
 9YWT7fy8HWRcowKfdINOBWmM7AWS+nM8bUhcmvaJNkwjk4Wa1nxJCN6CWAkF9iccfS0bX/9JI
 H/BRGBdcSaA9MH0dZqtWdCCAaBLlHdshkxVqdUxac8rFRcE+UaECTIlyeCNMWeIm6FX8kW4ci
 qkR4Z67hIVTjiVLwR3jSJYUNBJjI4rRaOE6Ckyxx3zqli+clj8wroEHljvq/qEoRtjfZZDwQM
 dd9mJy851fT+7EQ0+DUE5lCmZjUaKfGa6sZUxPf9n0/xFFyp3Uc7WTZHGqsPykDAuupmkw7Op
 i2dONJxpiPzF13s+ZNUbPKYNC4vde1RnjdcDLMBeFmGju9bT5eEZflCLT587juzuNT8y+CWs8
 LEVlbIpgdV3lQsm6q0H+tXls8XI8X4XVS9x2GI0R58Ptw2oktbCmDMMjUU++zMz9f/S8G7nf8
 9IijZUYXpUM1mr1siCT58ez5dlYeD2eQeZ7TxF+nPlviEKoPR9hvKYQSdgqmZrE0oR59Faw8H
 A2rYCU0j/zaHKfej8Qt/MOUpgiwGj3dRLJ4LI+Dh/Ko8mbb2/huT9NkOv7KFgSm1jSu34LkKZ
 lh3928M2jwZGugl9KT0DMDCEd2i2F2ljCBV+eiJg9C8vlKZCPlx0DavXeLat2uDVC2gcDBz0z
 +j2EQEIcqXR+SDoSvmzbaYjJwYTSXECkTd2QSCLiPFAYuxuNtRUz7DGNbqh5lT9nBLg9a4f6f
 gsQLjUOfQmiQ9Tx2bXs0o5Q5VJOWLEFW/3e4njsP3VXIqlIVpiS1oBnPjOvusW7pRH7/dgGY/
 x9zdgMQZjmx3B5Xr2e1OgVQsFKroyDHbkiZ3aSud8oVMYtXPZF5epzo1MvS0lvP9vjvtlTa9d
 +J/kSHc41Sz5SucWDsEdPpY+oD09w3SLdSEcRehIzvwSFMV9D5LNbZY1YdkJdLBa0S9jfurgX
 5yzsNbMTzIQaH+9uMGxYGptVjfMsTrIL/jacMaRC4HhQz5eN2mT2rHdQdBNoz9TCyLsrg32e+
 P1nwPCWXyatmtI26cUGuIERC3PLjH3k2921fg+gPByzZNKepJKCWqsdntYbvYdx7nyxCTL19J
 FJwyP5PyL4YyoU=
Subject: Re: [Buildroot] [PATCH v1 3/3] package/nftables: disable debug build
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

Hello Peter,

On Fri, 22 Oct 2021 20:37:05 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
>
>  > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>  > ---
>  >  package/nftables/nftables.mk | 2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)
>
>  > diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
>  > index 6a27975a53..2409eb0571 100644
>  > --- a/package/nftables/nftables.mk
>  > +++ b/package/nftables/nftables.mk
>  > @@ -10,7 +10,7 @@ NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
>  >  NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
>  >  NFTABLES_LICENSE = GPL-2.0
>  >  NFTABLES_LICENSE_FILES = COPYING
>  > -NFTABLES_CONF_OPTS = --disable-man-doc --disable-pdf-doc
>  > +NFTABLES_CONF_OPTS = --disable-debug --disable-man-doc --disable-pdf-doc
>
> Is this only for v1.0.0 or something that should be backported to the
> stable branches? You have put this after the bump of nftables in
> the series, but have not explicitly stated anything about it.
>

Sorry for being short in the commit log..., the '-disable-debug' option
just disables the compiler debug option ('-g -DDEBUG') and exits already
in version nftables-0.9.3 (the earliest one in my download directory)...

No urgent need for backport ;-)

Regards,
Peter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
