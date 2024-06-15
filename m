Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2FBC27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 18:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D90976079D;
	Sat, 15 Jun 2024 18:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PUupAImXud8V; Sat, 15 Jun 2024 18:09:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA8AF60753
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA8AF60753;
	Sat, 15 Jun 2024 18:09:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C6DC1BF2FD
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 18:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A36B8210B
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 18:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvLLrDka6TNE for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 18:09:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 920AC820C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 920AC820C9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 920AC820C9
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 18:09:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 30F7813F861;
 Sat, 15 Jun 2024 20:09:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jun 2024 20:09:48 +0200
Date: Sat, 15 Jun 2024 20:09:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <Zm3Y7Fd-Zpga_LAv@landeda>
References: <20240615091612.9579-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240615091612.9579-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718474991;
 bh=BBZ04iXG5116C+HsEEUDxne5GSi9cR+RPKvpsyo7Rqc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DO2w4Q8ELkjLIpOnkoH0dvquSRBXjamwB3uXToIDoS5q8d54+PxPisl62najBk85w
 bM7TfOE9ij21UsZqvLFT2LnbNlh1B1mW45ZFo9wwifWl0IyOtAN847nkuhVDGK93h+
 6owbnWV9h3ZuW37DNR0btxBM6Lx7U0YlIauDiFW8R12+Fz3cSBjzwPdsHI0cHOo/Ac
 JqKA6md8lbk32TLdK/QLAm+PkUdkX2j+fVIVlwVuwPV5ha95f2Zynky4Quk3Ya8xpk
 cFRCCxXm2MfBHIl2vdbYZlc33usKTKkdPzPr8qj7wFL+RcTaUQHHyjg9tSvdpgRb7Q
 A14sKvWdgBGnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DO2w4Q8E
Subject: Re: [Buildroot] [PATCH 1/2] support/testing:
 test_audio_codec_base.py: new helper class
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

Julien, All,

On 2024-06-15 11:16 +0200, Julien Olivain spake thusly:
> This is a helper class providing a template for testing audio codec
> programs such as lame mp3 encoder, flac tools, ogg vorbis-tools, ...
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
[--SNIP--]
> diff --git a/support/testing/tests/package/test_audio_codec_base.py b/support/testing/tests/package/test_audio_codec_base.py
> new file mode 100644
> index 00000000000..59c7efcad3c
> --- /dev/null
> +++ b/support/testing/tests/package/test_audio_codec_base.py
> @@ -0,0 +1,86 @@
> +import math
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestAudioCodecBase(infra.basetest.BRTest):
> +    """Common class to test an audio codec package.
> +
> +    This base class builds a Buildroot system image containing the
> +    package enabled in its config, start the emulator, login to it. It
> +    prepares an input test WAV file containing a tone. This WAV file
> +    is encoded into a new output file in the native encoder format. It
> +    is then decoded to a new output WAV file. This final output WAV
> +    file is checked to contain the expected tone generated in the
> +    initial input WAV file. There is no specific check about file
> +    size, nor audio quality. The acceptance criteria is the
> +    recognition of the tone. Note: the tone generation is made with
> +    the Sox package, and the tone recognition is made with the Aubio
> +    package.
> +
> +    Each test case that inherits from this class must have:
> +    __test__ = True  - to let nose2 know that it is a test case

If the class name does not stat with "Test", then nose2 will not
consider it a test case, it would not be necxessary to set __test__ =
False here, and rely on inheriters to set it.

I see that there are many such cases already in the tree, but I don;t
think we should continue in that direction.

Maybe just name this base calss as such:

    class BaseAudioCodec(infra.basetest.BRTest):

But see below: I think we should consider it a test by itself: it
validates that the sox-aubio combo does work as expected.

[--SNIP--]
> +    def encode_test(self, input_filename):
> +        msg = "method must be implemented in derived class"
> +        raise NotImplementedError(msg)

I am not python expert, but I think that would be better handled by an
"ABC", and Abstract Base Class (https://docs.python.org/3/library/abc.html),
which I think would look like:

    import abc
    class BaseAudioCodec(abc.ABC):
        @abc.abstractmethod
        def encode_test(self, input_filename):
            ...

Note that the ellipsis is really a real ellipsis, not a placeholder (see
https://docs.python.org/3/reference/datamodel.html#ellipsis).

But as I suggested above, we should just make this class a proper test,
and have empty encode() and decode() functions.

It would validate that the tone generated by sox can be decoded by
aubio.

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
