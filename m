Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD83EC624CF
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 11:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CAFB80BAA;
	Tue,  1 Sep 2026 11:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4AoTuCJXocr; Tue,  1 Sep 2026 11:39:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788262744;
	bh=NyHrSt18O9/x3E+nAga7KvVI0WOX5Zi0fdnNVk6Gogk=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rwHAF2732fCrokD6IpVJsW78VGT0ZtN7/SnrfCDR8q5jOwFmVjU/SCEVNLM+y3QcZ
	 luIFaUQPgUma3pN2w2HZzJ9I/kgsyV9gD4rc75w1SVXtrhxd6Jr2nrc1vjc+UUjXa6
	 +jQtKdly8FHWDqUI26PZPoG+U+Foh7xttzB/8skBFMIne12P26giLofykiFpFF2MhI
	 5rNlVktYgJEW0dRgqV3mFNx9db/CheQDLaUn7L+7zfvQ1DMk5kd10ZHg2cbdxTZtL+
	 0uzy04tmyghsYBlbLpjA5cZYyRGyJSl1WnQbUVVbc++RJjaJKEWDhamoqX4qRdAlKv
	 00/bseRua9vTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE87A80B89;
	Tue,  1 Sep 2026 11:39:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C2091DE
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 11:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58A9160737
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 11:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5QEgEGObBaz for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 11:39:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=rTR+mvFX
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71411606BE
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 11:39:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=rTR+mvFXIdpeGVnMefM3S7fq1mLU/wsDfACpfcbjrN9KDc8YZ5LL8hxStp8ujHT98Yze7RIcpK7PeU5KpqGx6BflHpplaIdzMsmrc2McaKCzICCLsbs8FbXdc3GJZ1kQsnb8gZdOOnyNumDTQo95XYVP0Fj9dqNV0zGC5cBo9FroFAFit+4IXwT759RWKd3GIICVpAz5vpnlMYDYDLWx3Ja/FcLATYeVtMByC3KOoOalQpHUZmRFjcduQaHtP+NTtKCQ0TU/J50RXsoY3RA0kE07s9cNLOFgMNYy2Qx66CdPFNHepZgDHUrJ7mZp6vhcSueKOpfte+piD91BD3Iiqg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=gTGFdYriZgoG44yS2pRkOWCbMcNIYnwgLlEKE3fLwyU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1449319341; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Sep 2026 11:38:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x1MpL-00000003LQ0-2zAm;
 Tue, 01 Sep 2026 13:38:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Fiona Klute via buildroot <buildroot@buildroot.org>
In-Reply-To: <ac74c754-7c42-421e-a16c-c019b902652e@gmx.de> (Fiona Klute's
 message of "Tue, 1 Sep 2026 12:26:19 +0200")
References: <20260831125103.841338-1-fiona.klute@gmx.de>
 <87mru2je25.fsf@dell.be.48ers.dk>
 <76f38e09-f5c4-4b0c-8397-01061d7fbced@gmx.de>
 <878q5lh3su.fsf@dell.be.48ers.dk>
 <ac74c754-7c42-421e-a16c-c019b902652e@gmx.de>
Date: Tue, 01 Sep 2026 13:38:55 +0200
Message-ID: <875x0p8als.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH next 1/3] fs/common.mk: add optional hook to
 build a verity hash tree
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fiona" == Fiona Klute <fiona.klute@gmx.de> writes:

Hi,

 >> Possibly, but should that then be per-fs or global? I wonder if it
 >> is
 >> worth the complexity to add this logic versus how fairly simple it is to
 >> just do it with whatever options you want in a post-image script.

 > I'd say per-fs. The logic could be shared like the general veritysetup
 > call, just the option would need to be added for each fs (in
 > Config.in). I don't think Kconfig has a kind of templating for that?

 > I agree running veritysetup in a post-image script isn't very
 > complicated. Where I'm actually trying to do is to have the roothash
 > of my rootfs before building an initramfs (using
 > BR2_TARGET_ROOTFS_CPIO_DRACUT), so it can be included (and signed
 > along with the initramfs, in my case in a FIT image). Of course these
 > patches don't achieve that, they'd just provide the roothash as a
 > start.

 > If you have a better idea how to do that I'm all ears.

The way I have solved it in the past is to use "late" binding between
the kernel and rootfs, E.G. only when I build the FIT image by sticking
the root hash into a u-boot boot script that I generate in my post-image
script and embed in the FIT.

U-Boot can afaik source a boot script from a FIT image nowadays, but I
wanted it more integrated into the bootm flow, so I simply added the
bootscript as a type = "script" data file and referred to it from the
configuration with:

 kernel = "kernel-1";
 fdt = ..
 loadables = "script-1";

And then some trivial logic in my board code to handle such loadable:

/* support "script" loadables in FIT images */
static void board_script_handler(ulong addr, size_t size)
{
        run_command_list((char *)addr, size, 0);
}

U_BOOT_FIT_LOADABLE_HANDLER(IH_TYPE_SCRIPT, board_script_handler);


 > script can't do it (rootfs image isn't ready), post-image doesn't have
 > the fakeroot environment for running Dracut (and other setup [1]).
 > Maybe we should move building initramfs to a separate stage, after
 > rootfs (I'd definitely need to order cpio after other fs types), and
 > add a pre-initramfs script? Is there another non-messy way to use the
 > fakeroot environment and variables from Buildroot config that I've
 > missed so far (other than rules in external.mk)?

Initramfs is indeed annoying because of the circular dependencies. It
has been quite a while since I last used one. Out of interest, what do
you need the initramfs for?


 >> I would be OK with that. These fixups are a bit icky though as we do
 >> not
 >> know what kernel version will be used and the dependencies may change
 >> over time - So maintenance and testing is not so trivial.

 > Yeah, and for something that you'll usually set up once and update
 > only rarely, which is why I'm not sure it's worth it. And many
 > filesystems have extra kernel options we can't guess anyway.

Exactly!


 >> > The one reason I can imagine wanting to set uuid/salt is if someone
 >> > wants a byte-identical verity partition. fs/erofs sets all-zero UUID,
 >> > which we could do for verity too, but I'm not sure what the security
 >> > implications of a fixed (or pseudorandom?) salt would be.
 >> Yes, it is also only in the context of reproducible builds that I
 >> have
 >> ever used a fixed uuid/salt.
 >> Security wise, as this is about hashing rather than encryption I
 >> *THINK*
 >> it is fine as long as the hashing algorithm is strong enough (E.G. you
 >> would need find same-size collisions).

 > I don't *see* any huge problem either, but making a fixed salt the
 > default seems risky. If someone sets that via an _EXTRA_ARGS option
 > that's their responsibility. ;-)

;)

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
