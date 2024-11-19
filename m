Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A53D6C281
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 18:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9672B60B4F;
	Tue, 19 Nov 2024 18:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HMXdGBV_7HBa; Tue, 19 Nov 2024 18:32:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CE2660B96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CE2660B96;
	Tue, 19 Nov 2024 18:32:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0A48DB2
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 18:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D123B401DD
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 18:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ms3R9wnKYcDT for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 18:32:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1D2C3400EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D2C3400EA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D2C3400EA
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 18:32:07 +0000 (UTC)
Received: from [10.29.108.140] (unknown [78.243.36.190])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B1A725FFC0;
 Tue, 19 Nov 2024 19:32:02 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
CC: <buildroot@buildroot.org>
Date: Tue, 19 Nov 2024 19:32:02 +0100
Message-ID: <19345aec570.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
In-Reply-To: <87mshvdudr.fsf@tarshish>
References: <20241119014432.46926-1-vjardin@free.fr>
 <20241119015957.47737-1-vjardin@free.fr> <874j43g4o8.fsf@tarshish>
 <ndlcpty56hqzkhkhh2ohfdh2424cujwzd7xrm46uf6yweiejwi@72xjgnfara2r>
 <87mshvdudr.fsf@tarshish>
User-Agent: AquaMail/1.53.0 (build: 105300523)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732041124;
 bh=iMmGlTkuOhQEV+tY25ejWVDnkHvg9du/SMp1G8H0EMg=;
 h=From:To:CC:Date:In-Reply-To:References:Subject:From;
 b=tjKpOo2l+lpP3oyW/ouNbEBH6qQBx7hwJI/gbuJlOGb9iuwmQDBjooN6InJUtjyFH
 f0sa2/4BfUaFVzSi/PN7ZCOK4uwJyd8cAyyfFWvam58i8Hvc2bBn58rp8jZrp4EsI9
 G3oVkVSRRmFjJMPrSEXt1zuEzhhun0xXMSuSCngjnpSfl6p2Ae0JOkB2xiCs5P/enr
 UfQewyHN7t0EOvYMOY9dv/iQUh7fUDEW5pN0/Byciho0LoPrATCUnVWo6rLn5/gGmz
 VAcVYpgJh85qbg6skhzO8+RCsBAvbewLjKl7TA53jgeorLspqRDD+iQlGW1yKCkM1h
 x2SLHdHyVmOlg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tjKpOo2l
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss-ato: new package
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
Content-Type: multipart/mixed; boundary="===============2136802137180990487=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============2136802137180990487==
Content-Type: multipart/alternative; boundary="19345b2212a69632856f206601"

This is a multi-part message in MIME format.
--19345b2212a69632856f206601
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Baruch,

Le 19 novembre 2024 18:08:03 Baruch Siach <baruch@tkos.co.il> a écrit :

> Hi Vincent,
>
> On Tue, Nov 19 2024, Vincent Jardin wrote:
>> On Tue, Nov 19, 2024 at 07:42:47AM UTC, Baruch Siach wrote:
>>>
>>> I think this should depend on BR2_TOOLCHAIN_USES_GLIBC. Other C
>>> libraries do not provide NSS functionality. It looks like this won't
>>> even build without glibc headers.
>>
>> Thanks, done within the new update.
>> https://patchwork.ozlabs.org/project/buildroot/patch/20241119163025.54898-1-vjardin@free.fr/
>
> Thanks for the new iteration.
>
> I guess you missed my second comment on your original patch, regarding
> Makefile.

Sorry.

Too many patches were needed to fix it. So since we just need to compile a 
c file, I did prefer not to use it. I do not understand the benefit of 
patching if it is not needed.

Best regards,
   Vincent

>
>
> baruch
>
>>
>> Thanks for the suggestion. I think I found a way to check it using:
>> $ utils/test-pkg -a -p libnss-ato
>>                     arm-aarch64 [ 1/41]: OK
>>           bootlin-aarch64-glibc [ 2/41]: OK
>>       bootlin-arcle-hs38-uclibc [ 3/41]: SKIPPED
>>            bootlin-armv5-uclibc [ 4/41]: SKIPPED
>>             bootlin-armv7-glibc [ 5/41]: OK
>>           bootlin-armv7m-uclibc [ 6/41]: SKIPPED
>>              bootlin-armv7-musl [ 7/41]: SKIPPED
>>        bootlin-m68k-5208-uclibc [ 8/41]: SKIPPED
>>       bootlin-m68k-68040-uclibc [ 9/41]: SKIPPED
>>     bootlin-microblazeel-uclibc [10/41]: SKIPPED
>>        bootlin-mipsel32r6-glibc [11/41]: OK
>>           bootlin-mipsel-uclibc [12/41]: SKIPPED
>>             bootlin-nios2-glibc [13/41]: OK
>>         bootlin-openrisc-uclibc [14/41]: SKIPPED
>> bootlin-powerpc64le-power8-glibc [15/41]: OK
>>   bootlin-powerpc-e500mc-uclibc [16/41]: SKIPPED
>>           bootlin-riscv32-glibc [17/41]: OK
>>           bootlin-riscv64-glibc [18/41]: OK
>>            bootlin-riscv64-musl [19/41]: SKIPPED
>>         bootlin-s390x-z13-glibc [20/41]: OK
>>              bootlin-sh4-uclibc [21/41]: SKIPPED
>>           bootlin-sparc64-glibc [22/41]: OK
>>            bootlin-sparc-uclibc [23/41]: SKIPPED
>>            bootlin-x86-64-glibc [24/41]: OK
>>             bootlin-x86-64-musl [25/41]: SKIPPED
>>           bootlin-x86-64-uclibc [26/41]: SKIPPED
>>           bootlin-x86-i686-musl [27/41]: SKIPPED
>>           bootlin-xtensa-uclibc [28/41]: SKIPPED
>>                    br-arm-basic [29/41]: SKIPPED
>>            br-arm-full-nothread [30/41]: SKIPPED
>>              br-arm-full-static [31/41]: SKIPPED
>>           br-i386-pentium4-full [32/41]: SKIPPED
>>              br-mips64-n64-full [33/41]: SKIPPED
>>         br-mips64r6-el-hf-glibc [34/41]: OK
>>       br-powerpc-603e-basic-cpp [35/41]: SKIPPED
>>       br-powerpc64-power7-glibc [36/41]: OK
>>               linaro-aarch64-be [37/41]: OK
>>                  linaro-aarch64 [38/41]: OK
>>                      linaro-arm [39/41]: OK
>>                 sourcery-mips64 [40/41]: OK
>>                   sourcery-mips [41/41]: OK
>> 41 builds, 23 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
>>
>> best regards,
>> Vincent
>
> --
>                                                     ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -


--19345b2212a69632856f206601
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto">Hi Baruch,</div><div dir=3D"auto"><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<div dir=3D"auto">Le 19 novembre 2024 18:08:03 Baruch Siach &lt;baruch@tkos=
.co.il&gt; a =C3=A9crit :</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">Hi Vincent,</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">On Tue, Nov 19 2024, Vincent Jardin wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">On Tue, Nov 19, 2024 at 07:42:47AM UTC, Baruch Siach wrot=
e:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #9933CC; padding-left: 0.75ex;">
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I think this should depend on BR2_TOOLCHAIN_USES_GLIBC. O=
ther C</div>
<div dir=3D"auto">libraries do not provide NSS functionality. It looks like=
 this won't</div>
<div dir=3D"auto">even build without glibc headers.</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Thanks, done within the new update.</div>
<div dir=3D"auto">https://patchwork.ozlabs.org/project/buildroot/patch/2024=
1119163025.54898-1-vjardin@free.fr/</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Thanks for the new iteration.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I guess you missed my second comment on your original pat=
ch, regarding</div>
<div dir=3D"auto">Makefile.</div></blockquote></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Sorry.&nbsp;</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Too many patches were needed to fix it. So since we just need t=
o compile a c file, I did prefer not to use it. I do not understand the ben=
efit of patching if it is not needed.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Best regards,</div><div dir=3D"auto">&nbsp; &nbsp;Vincent&nbs=
p;</div><div dir=3D"auto"><br></div><div id=3D"aqm-original" style=3D"color=
: black;" dir=3D"auto"><blockquote type=3D"cite" class=3D"gmail_quote" styl=
e=3D"margin: 0 0 0 0.75ex; border-left: 1px solid #808080; padding-left: 0.=
75ex;"><div dir=3D"auto"></div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">baruch</div>
<div dir=3D"auto"><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Thanks for the suggestion. I think I found a way to check=
 it using:</div>
<div dir=3D"auto">$ utils/test-pkg -a -p libnss-ato</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;arm-aarch64 [ 1/41]: OK</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bootlin-aarch64-=
glibc [ 2/41]: OK</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp;bootlin-arcle-hs38-uclibc [ 3/=
41]: SKIPPED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bootlin-armv5-u=
clibc [ 4/41]: SKIPPED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bootlin-a=
rmv7-glibc [ 5/41]: OK</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bootlin-armv7m-u=
clibc [ 6/41]: SKIPPED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bootlin-=
armv7-musl [ 7/41]: SKIPPED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; bootlin-m68k-5208-uclibc [ 8/=
41]: SKIPPED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp;bootlin-m68k-68040-uclibc [ 9/=
41]: SKIPPED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp;bootlin-microblazeel-uclibc [10/41]: =
SKIPPED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; bootlin-mipsel32r6-glibc [11/=
41]: OK</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bootlin-mipsel-u=
clibc [12/41]: SKIPPED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bootlin-n=
ios2-glibc [13/41]: OK</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bootlin-openrisc-uclibc=
 [14/41]: SKIPPED</div>
<div dir=3D"auto">bootlin-powerpc64le-power8-glibc [15/41]: OK</div>
<div dir=3D"auto">&nbsp; &nbsp;bootlin-powerpc-e500mc-uclibc [16/41]: SKIPP=
ED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bootlin-riscv32-=
glibc [17/41]: OK</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bootlin-riscv64-=
glibc [18/41]: OK</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bootlin-riscv64=
-musl [19/41]: SKIPPED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bootlin-s390x-z13-glibc=
 [20/41]: OK</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bootlin-=
sh4-uclibc [21/41]: SKIPPED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bootlin-sparc64-=
glibc [22/41]: OK</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bootlin-sparc-u=
clibc [23/41]: SKIPPED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bootlin-x86-64-=
glibc [24/41]: OK</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bootlin-x=
86-64-musl [25/41]: SKIPPED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bootlin-x86-64-u=
clibc [26/41]: SKIPPED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bootlin-x86-i686=
-musl [27/41]: SKIPPED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bootlin-xtensa-u=
clibc [28/41]: SKIPPED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; br-arm-basic [29/41]: SKIPPED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; br-arm-full-not=
hread [30/41]: SKIPPED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; br-arm-f=
ull-static [31/41]: SKIPPED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;br-i386-pentium4=
-full [32/41]: SKIPPED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; br-mips6=
4-n64-full [33/41]: SKIPPED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;br-mips64r6-el-hf-glibc=
 [34/41]: OK</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp;br-powerpc-603e-basic-cpp [35/=
41]: SKIPPED</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp;br-powerpc64-power7-glibc [36/=
41]: OK</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;li=
naro-aarch64-be [37/41]: OK</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; linaro-aarch64 [38/41]: OK</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; linaro-arm [39/41]: OK</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;sourcery-mips64 [40/41]: OK</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;sourcery-mips [41/41]: OK</div>
<div dir=3D"auto">41 builds, 23 skipped, 0 build failed, 0 legal-info faile=
d, 0 show-info failed</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">best regards,</div>
<div dir=3D"auto">Vincent</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">--&nbsp;</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;~. .~ &nbsp; Tk Ope=
n Systems</div>
<div dir=3D"auto">=3D}------------------------------------------------ooO--=
U--Ooo------------{=3D</div>
<div dir=3D"auto">&nbsp; &nbsp;- baruch@tkos.co.il - tel: +972.52.368.4656,=
 http://www.tkos.co.il -</div>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--19345b2212a69632856f206601--


--===============2136802137180990487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2136802137180990487==--

