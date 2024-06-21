Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBB8C27C4F
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 14:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A52C616B2;
	Fri, 21 Jun 2024 14:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id liUeEdk27BLU; Fri, 21 Jun 2024 14:40:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AA1A61690
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AA1A61690;
	Fri, 21 Jun 2024 14:40:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16B531BF36F
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 14:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03B5F61690
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 14:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kvuLYMgWyAgx for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 14:40:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 920EC6167B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 920EC6167B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 920EC6167B
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 14:40:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 836E22003C8;
 Fri, 21 Jun 2024 16:40:20 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35104])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 21 Jun 2024 14:40:20 +0000
MIME-Version: 1.0
Date: Fri, 21 Jun 2024 14:40:20 +0000
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <Zm3Y7Fd-Zpga_LAv@landeda>
References: <20240615091612.9579-1-ju.o@free.fr> <Zm3Y7Fd-Zpga_LAv@landeda>
User-Agent: Webmail Free/1.6.7
Message-ID: <bad5f692bff295e22fdebc46c043a661@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718980821;
 bh=3HGULoiC3bA0su57jY0SZ7HpSrf/6MGVHnv4KYYRlzc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=stpuSyY13lNfr1NFEo5R6ur94e9+0CcNfMGeI5NkVkd7r6jM5GZYKOm47KhIW8fix
 iUMoguOAmV5Ygmp1sTl1aDsMm1d1XmKPqZRZKCjXZTlWxWOq5zkxW/SqdFlKd/ddl5
 8RzB5dJEY08IovQ6zViEWknkRpiTuYheVq++6r0FgyLarGIDETMF0b9O4eKK+0Z8Wz
 UZThfy+/z2Mp39QQOOJ+S77q/UF8keZvk8jk7OXO1iMMTfBImJJR9Z/z+gwdV8XWfo
 BtPDRuDmTcOEpZOKf4jvfZvRPCFzqgaa//tE0EpnxQRvPHOyQzU2PnbuLBtyBr2jjL
 LCAtdwIUoPydw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=stpuSyY1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, All,

On 15/06/2024 18:09, Yann E. MORIN wrote:
> Julien, All,
> 
> On 2024-06-15 11:16 +0200, Julien Olivain spake thusly:
>> This is a helper class providing a template for testing audio codec
>> programs such as lame mp3 encoder, flac tools, ogg vorbis-tools, ...
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>> ---
> [--SNIP--]
>> diff --git a/support/testing/tests/package/test_audio_codec_base.py 
>> b/support/testing/tests/package/test_audio_codec_base.py
>> new file mode 100644
>> index 00000000000..59c7efcad3c
>> --- /dev/null
>> +++ b/support/testing/tests/package/test_audio_codec_base.py
>> @@ -0,0 +1,86 @@
>> +import math
>> +import os
>> +
>> +import infra.basetest
>> +
>> +
>> +class TestAudioCodecBase(infra.basetest.BRTest):
>> +    """Common class to test an audio codec package.
>> +
>> +    This base class builds a Buildroot system image containing the
>> +    package enabled in its config, start the emulator, login to it. 
>> It
>> +    prepares an input test WAV file containing a tone. This WAV file
>> +    is encoded into a new output file in the native encoder format. 
>> It
>> +    is then decoded to a new output WAV file. This final output WAV
>> +    file is checked to contain the expected tone generated in the
>> +    initial input WAV file. There is no specific check about file
>> +    size, nor audio quality. The acceptance criteria is the
>> +    recognition of the tone. Note: the tone generation is made with
>> +    the Sox package, and the tone recognition is made with the Aubio
>> +    package.
>> +
>> +    Each test case that inherits from this class must have:
>> +    __test__ = True  - to let nose2 know that it is a test case
> 
> If the class name does not stat with "Test", then nose2 will not
> consider it a test case, it would not be necxessary to set __test__ =
> False here, and rely on inheriters to set it.
> 
> I see that there are many such cases already in the tree, but I don;t
> think we should continue in that direction.
> 
> Maybe just name this base calss as such:
> 
>     class BaseAudioCodec(infra.basetest.BRTest):
> 
> But see below: I think we should consider it a test by itself: it
> validates that the sox-aubio combo does work as expected.

Renaming the "test_audio_codec_base.py" file to "audio_codec_base.py",
and the "TestAudioCodecBase" class to "AudioCodecBase" will not
prevent the test to be discovered by Nose2. This will prevent the file
and class to be selected at first. But if "__test__ = False" is not
present, it will still be indirectly loaded from the TestLame
import. This can be seen by adding "--log-level debug" in nose2
arguments.

While I do agree we could rename the file and class to better show the
intent this is an "abstract" class which does not include a test, I
think the "__test__ = False" needs to stay here to really prevent it
being loaded.

I'm not sure Nose2 was initially designed to support class hierarchy
like this. Nose2 has helpers to generate test case layers:
https://docs.nose2.io/en/latest/such_dsl.html
https://docs.nose2.io/en/latest/plugins/layers.html


> [--SNIP--]
>> +    def encode_test(self, input_filename):
>> +        msg = "method must be implemented in derived class"
>> +        raise NotImplementedError(msg)
> 
> I am not python expert, but I think that would be better handled by an
> "ABC", and Abstract Base Class 
> (https://docs.python.org/3/library/abc.html),
> which I think would look like:
> 
>     import abc
>     class BaseAudioCodec(abc.ABC):
>         @abc.abstractmethod
>         def encode_test(self, input_filename):
>             ...
> 
> Note that the ellipsis is really a real ellipsis, not a placeholder 
> (see
> https://docs.python.org/3/reference/datamodel.html#ellipsis).
> 
> But as I suggested above, we should just make this class a proper test,
> and have empty encode() and decode() functions.
> 
> It would validate that the tone generated by sox can be decoded by
> aubio.

Regarding the use of "abc", I initially though and tried to use
it. The base class need to inherit from both abc.ABC and
infra.basetest.BRTest. Doing so makes Nose2 fail in test discovery
(probably because it tries to instantiate it). For example, running:

     support/testing/run-tests -l ...

fails with output:

     TypeError: Can't instantiate abstract class AudioCodecBase without 
an implementation for abstract methods 'decode_test', 'encode_test'

The error happen even if files/classes are not beginning by "Test",
and the abstract class has "__test__ = False". Directly calling a
test works, though.

Disregarding the use of ABC or "raise NotImplementedError()", I still
think the class should remain "abstract". The purpose is to catch
forgotten implementations of encode_test()/decode_test() in new test
cases.

I agree the base class audio codec sequence, relying on sox and aubio
_could_ be tested in itself, with a "null" or "passthough" codec,
emulated with cp/mv commands. I think we can do that by adding a new
test inheriting from the base abstract class. We could argue that a
problem in this sox/aubio sequence could be detected in any test (if
not all) using this base class. The reason I did not included this is
because this test takes some time to compile and run, due to the
presence of the target Python. I also think child classes will cover
for most issues in this base class.

If you think this base class test is not needed, I believe the series
can be applied as is.

If you think the base class still need to be self-tested, I can send a
v2 with the following changes:
- rename the "TestAudioCodecBase" class to "AudioCodecBase",
- add a new "TestAudioCodecBase" class for testing "AudioCodecBase"
   using cp/mv as a "null codec", in test_audio_codec_base.py.

This means that such a v2 would:
- keep the file name as test_audio_codec_base.py,
- keep __test__ = False/True,
- keep the "raise NotImplementedError()" (i.e don't use abc.ABC)

In the long term, we could also:
- improve or propose changes in Nose2 to handle or exclude abstract
   classes,
- switch to another test framework, there was a proposal for pytest
   in:
https://patchwork.ozlabs.org/project/buildroot/patch/20221021091531.2989489-2-oguz.ozhan@mind.be/
- ...

What to you think?

> 
> Regards,
> Yann E. MORIN.
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' 
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___        
>        |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There 
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   
> conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
