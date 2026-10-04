Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BA8CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 13:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FAA5406EA;
	Sun,  4 Oct 2026 13:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AFUbTpHAYRTy; Sun,  4 Oct 2026 13:51:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 061504071F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791121886;
	b=Nx3arIJGDbr3gLIonOfRxhB7bmKZGrRad7j93oS8Hp94jqRxdx+yZt+wuYUm319m/qrE
	 wPFgeCix9OiutosHyLQEQ6WGZh4XsF/FuP+OiWCMZI6nGtZnkeiG/9a1lmN3esT15SdVX
	 6svk7HVbzPLlr8XJmMO1+atl2CuEQz34xLAIwogRBHl03Gzt94ymbNR7nktqZl/K6Ziid
	 35g1LjpoPlF5zGUHG5CThZPN5JrFDdSkMfazHbFC2wvhZ+FjDaMIHepjwIQJnprs3UMNF
	 P+fMejlBYGI8xWT6VJeJrlkxep3Y1AcF4dKaqpa2ErqPH5YoSKmNtt2cpomvauAt0qA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791121886;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Date:To:Cc:Message-ID:In-Reply-To:
	 References:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=z16oihSA+tHfn5ENPoHADmWYvgAGaeL23cO5aZ69eVg=;
	b=IEDUl/9kCUorvelJWjn7CVvp0ckmRYRp57b0YDD5OmEXG05At1FsJK9CnYoQ9Ady2aHk
	 qHkkQtJuWaW/R173X5+wnnUY/WTfmXyb7H5Dtg1BLFv98mzLc1DBpSVcyCspoI22zdJpy
	 5El1IEbNsvSz8svZfCbJbqHQHQXI6R8OeQ+mJW9XyLcSAKehwFnTCWsW9v2C3xOVw0Z/y
	 9Cdans7zHCnwVJG3MSNm1iUIDRyA07fmmoXeQ5hSYSJvKWGdKznGoppdRnj56Hpw6xqvU
	 nUp4+fgjjOvo7NfZdln/+cR3qZRRrCnkzY2p6U3IUxctv7wGFNpFMzG5F30lY+bKHlQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791121886;
	bh=z16oihSA+tHfn5ENPoHADmWYvgAGaeL23cO5aZ69eVg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mklidpvHjG2/XKVkaXROni3C4NqjI6oaqH8KqqaDA2FYVSnqqTZavdV+8jHsYNGKm
	 Qz0SJQhBGYuCObbn3bWsCLmWClAngmIc5iVHTolsNOY3opd7fL3g1fJOdygzJQ3y2V
	 4Ni3q7AymNRIgeVLtbHsHcSgbkal1ZCqIzVHYe1Ke4vjEDo2C/rz05RkpCq/6p2MME
	 zZMOwku4rGkDOg0BdS/+qbv/rJZirC68VxToou5qHGTIOqLZVOdizMQLlx15eHlf4Z
	 zn35xt1DBGzBrhFMKaP8KOfFw9VKutu62pNhjutBC8ktWWJxIpyNMn21GES9iegxnW
	 XYsUECjpkA+8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 061504071F;
	Sun,  4 Oct 2026 13:51:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D0DD2E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 13:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6D846060E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 13:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swPUClo3BE1K for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 13:51:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B89C26060C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791121882;
 b=KuEqwwItyq5w2cye0KR+W8ITxh0PQjJ39BcwHYvOT8FqsC43YJ0eCsMHiiSCm2RpHUzI
 BQTrFSYd3RtNzlUMIj0al6xsx91+i87xpO4byUWCXe9N5rKQxsEcHl1Sqi9/T/3l9KGyB
 Q2HKrB+IYNkCu+qPs6nOEQkm2/a1HbdNV9rOZrE4WP6yQN77Iue8Tc226bC5u/IR/Jw9S
 NpeQRKNS7p9avl/2URJLcS3L6znP0fMNly747ckyR9FJUMxxNQXr3rksXPiJY52slU5tS
 oAGtfuXvHxYhBYfu73/ta2XCWzztZB8wE9TdTVUl90GCOsflczBsht6yZ31cDgxlJYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791121882;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Date:From:To:
 Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
 UI-OutboundReport;
 bh=Q+cSiup+sf87qFMYD0MuEzncCBcvG1KsjPTrros4hnk=;
 b=KYLE5/BBOYNGsO7t1OnGrEV2XQTzAnsWtOKP4Xb0hUbgsn86NEEkq8GvuEsL3UuPppaJ
 qw+EaS3qeBFoIsal+HMYbe2IyBI1GvKKIW0xItZ5Oz4z5hPlxFFeclSggFxVZ3ObciMyb
 UiwppmkHumY0hCbhV+UfG/FIiHp9/tWj19/peu9hm+kNkt8eAjem1QUb3Aq4SiDIr5smE
 /pODosaOQsuCna80WpH06zqdpE81MUbsP05vQ3xnxdWZKSJu+Yal3x4IMnLxA81A8eQnb
 0A2bKVV1Noft0wuMRVgpqVzfkRn1r1YraT5x5zJSGqxvBYSJD8ELekYa3PezqCHP9WQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.net; 
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=JqbCnGec; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B89C26060C
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 13:51:20 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8ykg-1xIIpX07GQ-00HaAz; Sun, 04
 Oct 2026 15:51:17 +0200
Date: Sun, 4 Oct 2026 15:51:14 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <20261004155114.12d777ef@pc-1>
In-Reply-To: <asJEBMQpD2FYJql2@waldemar-brodkorb.de>
References: <20261002135956.354969-1-ps.report@gmx.net>
 <asJEBMQpD2FYJql2@waldemar-brodkorb.de>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.53; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:BZl6ZH0EjK8UDiTm11h7hm+YfKrZfI2ZZwmWb6zILTeSuKkavgX
 phZqyh/pNGdgW0kRV7VAnllWOB89dQ9Lt0MKOlVxVswWBuv8XpWwm50An09OU34I09mZpXI
 Pb+ZJQsdOUKRwwqaf6Kr7AuecD2Bx0xYfuHFz71fF1YcioYk9yiRiL3H+wXVL866OzQVNx6
 oJmWdS4jMvk8vPAkgGGPw==
UI-OutboundReport: notjunk:1;M01:P0:CYw6+EPsp+4=;hshSNL05+xYyHIT6FKSFvGHkb4N
 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
 F/ykJn+zwFW69LO9A==
Subject: Re: [Buildroot] [PATCH v1] package/gzip: bump version to 1.15
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Waldemar,

On Sun, 4 Oct 2026 14:18:12 +0200, Waldemar Brodkorb <wbx@openadk.org> wrote:

> Hi Peter,
> 
> I am having issues compiling gzip after the update for
> qemu-system-aarch64 (defconfig, glibc):
> 
>   GEN      zmore
> In file included from gzip.c:61:
> gzip.h:120:21: error: expected ')' before '+' token
>   120 | #  define head (prev+WSIZE)  /* hash head (see deflate.c) */
>       |                     ^
> gzip.h:120:21: error: expected ')' before '+' token
>   120 | #  define head (prev+WSIZE)  /* hash head (see deflate.c) */
>       |                     ^
> ...
> 
> No autobuild failures, yet.
> 
> Any idea?

Sounds like upstream 'build: avoid failure to build on linux aarch64' ([3], [4])?

Will try to reproduce/fix (and send a follow up patch if appropriate)...

Regards,
Peter


[3] https://cgit.git.savannah.gnu.org/cgit/gzip.git/commit/?id=b4ed8e73401968bcad749afb0e636dd3ec205ca7
[4] https://bugs.gnu.org/81904

> 
> best regards
>  Waldemar
> 
> 
> Peter Seiderer via buildroot wrote,
> 
> > - bump version to 1.15 (for details see [1] and [2])
> > 
> > [1] https://cgit.git.savannah.gnu.org/cgit/gzip.git/tree/NEWS?id=e6263160768c73f6117f3c1de78291a60f2cb796
> > [2] https://lists.gnu.org/r/bug-gzip/2026-09/msg00030.html
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/gzip/gzip.hash | 4 ++--
> >  package/gzip/gzip.mk   | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/package/gzip/gzip.hash b/package/gzip/gzip.hash
> > index 90c9be4e6e..ddf5e38f0f 100644
> > --- a/package/gzip/gzip.hash
> > +++ b/package/gzip/gzip.hash
> > @@ -1,6 +1,6 @@
> >  # Locally calculated after checking pgp signature
> > -# https://ftp.gnu.org/gnu/gzip/gzip-1.14.tar.xz.sig
> > +# https://ftp.gnu.org/gnu/gzip/gzip-1.15.tar.xz.sig
> >  # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
> > -sha256  01a7b881bd220bfdf615f97b8718f80bdfd3f6add385b993dcf6efd14e8c0ac6  gzip-1.14.tar.xz
> > +sha256  9aa0cc780dec156b8282844833b342ab7cb08c25d2cd9a1869cdd0df31deff48  gzip-1.15.tar.xz
> >  # Locally calculated
> >  sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> > diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
> > index e79de4c99e..1c74089147 100644
> > --- a/package/gzip/gzip.mk
> > +++ b/package/gzip/gzip.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >  
> > -GZIP_VERSION = 1.14
> > +GZIP_VERSION = 1.15
> >  GZIP_SOURCE = gzip-$(GZIP_VERSION).tar.xz
> >  GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
> >  # Some other tools expect it to be in /bin
> > -- 
> > 2.55.0
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> >   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
