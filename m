Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625B2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:59:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 944506136A
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 944506136A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4028783323;
	Tue, 19 Oct 2021 17:59:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vi_KWLiF-3kd; Tue, 19 Oct 2021 17:59:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AFC9834BB;
	Tue, 19 Oct 2021 17:59:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 596C01BF27A
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C58F606EC
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7xTBC2gdsW7N for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 17:59:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48D506062E
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 17:59:34 +0000 (UTC)
Received: from smtpclient.apple ([151.46.26.97])
 by Aruba Outgoing Smtp  with ESMTPA
 id ctOemIwjoxC2nctOemNFDS; Tue, 19 Oct 2021 19:59:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634666372; bh=N1U6FUoCAxkvlXPRxOlHQgMGwrUGD/kBvz02x+1A30E=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=bKME4nRcj+510XB1iNvrIhQ88a2GsUrZ9F/8U9prX8RaRI/W0weQFFLQIdt74a//+
 kZmRdCxxZTXMRzakOUyJ1tWfKVD5CLPU9evTIQlSfhlO2Er42lq5d/+tqVKyBO69x0
 CJduhml+Uu3OquZX+yxa2T/DE6ybgkjrjqxBpVWqiMP/tJklRYA6PENn5gT1d4mGGM
 IV6Cfvjucvde8rInUZzsjIJhrh8doIxxv5zJW9AOEh7CAGSvgWRPP11on2mfdcbS31
 xGPh+rKIO/FB6AkWcLnmbx1zfZkVhe3GHpgQYYXasMDVLnKIxnfF2SVmGkHAtD/v4T
 0Xykkm08l9ndA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 19 Oct 2021 19:59:31 +0200
Message-Id: <3ABFFAEE-644C-4CB8-8B04-1F28AD3CBFC1@benettiengineering.com>
References: <A62E77A0-E4CC-409B-A64B-0B0AADAFB933@benettiengineering.com>
In-Reply-To: <A62E77A0-E4CC-409B-A64B-0B0AADAFB933@benettiengineering.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailer: iPhone Mail (18H17)
X-CMAE-Envelope: MS4wfApp2jetspJJgFQsNXzfRP+/zjz9ny3ER6ub7HlJs33u2g5+TVGNq4FEBf6IZwTGiI6+a2fluwy5wyREi8Ky0uP76Fxh/Y9lPFmUP3wFCQzbKF/klmHq
 rbts6AITP7CExbNDkh0sju7ZtxEbs89Kkw5vkBmk4d8ub5OApl9n997AVrWfwRj1KAgojsQ+KmRwlCvK5EzxJdiWIYb5yQQS6/TmDplYaNMbdUZrlRv5IbBq
 3YQHjjJL7rVKJLx7FC1p8w==
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss: fix parallel build
 failure
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8457142091995047504=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8457142091995047504==
Content-Type: multipart/alternative; boundary=Apple-Mail-EF1FCB04-00B7-433D-AA1B-5C868B3CDA3E
Content-Transfer-Encoding: 7bit


--Apple-Mail-EF1FCB04-00B7-433D-AA1B-5C868B3CDA3E
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Or=E2=80=A6

> Il giorno 19 ott 2021, alle ore 19:40, Giulio Benetti <giulio.benetti@bene=
ttiengineering.com> ha scritto:
>=20
> =EF=BB=BFHi Arnout,
>=20
>>> Il giorno 6 ott 2021, alle ore 21:20, Arnout Vandecappelle <arnout@mind.=
be> ha scritto:
>>>=20
>> =EF=BB=BF
>>=20
>>> On 22/09/2021 01:59, Giulio Benetti wrote:
>>> As explained in the patch itself(pending here[1]), I couldn't reproduce
>>> the failure but it seems to be right. Basically I'm making not parallel
>>> every 'nsinstall -R' command that is where it fails.
>>> [1]: https://bugzilla.mozilla.org/show_bug.cgi?id=3D1731911
>>> Fixes:
>>> http://autobuild.buildroot.net/results/a895ed7aa48edc5cd9ac8bbbd689433a9=
8c9c057/
>>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>> ---
>>>  ...31911-Fix-nsinstall-parallel-failure.patch | 34 +++++++++++++++++++
>>>  1 file changed, 34 insertions(+)
>>>  create mode 100644 package/libnss/0001-Bug-1731911-Fix-nsinstall-parall=
el-failure.patch
>>> diff --git a/package/libnss/0001-Bug-1731911-Fix-nsinstall-parallel-fail=
ure.patch b/package/libnss/0001-Bug-1731911-Fix-nsinstall-parallel-failure.p=
atch
>>> new file mode 100644
>>> index 0000000000..7ac340f1ca
>>> --- /dev/null
>>> +++ b/package/libnss/0001-Bug-1731911-Fix-nsinstall-parallel-failure.pat=
ch
>>> @@ -0,0 +1,34 @@
>>> +=46rom 7ba4d627212507f876dc112e89c68e82e1c50188 Mon Sep 17 00:00:00 200=
1
>>> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>> +Date: Wed, 22 Sep 2021 01:40:31 +0200
>>> +Subject: [PATCH] Bug 1731911 - Fix nsinstall parallel failure
>>> +
>>> +Fix nsinstall race condition when building using Makefile with parallel=

>>> +options on. I've end up making $(1) recipe in copy_varlist_into_dir_RUL=
E
>>> +.NOTPARALLEL. I can't test it that much since it's very very rare, but
>>> +it seems to be the correct way. This way every copy_varlist_into_dir_RU=
LE
>>> +called should occur not parallel and I think that this is acceptable
>>> +since it only create symlinks that takes very few. Further improving is=

>>> +possible of course.
>>> +
>>> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>> +---
>>> + nss/coreconf/rules.mk | 2 ++
>>> + 1 file changed, 2 insertions(+)
>>> +
>>> +diff --git a/nss/coreconf/rules.mk b/nss/coreconf/rules.mk
>>> +index dc72e9cef..a341b8385 100644
>>> +--- a/nss/coreconf/rules.mk
>>> ++++ b/nss/coreconf/rules.mk
>>> +@@ -377,6 +377,8 @@ $(3)/%: %
>>> +    $$(INSTALL) -m 444 $$^ $(3)
>>> +
>>> + $(1): $$(addprefix $(3)/,$$($(2))) | $(3)/d
>>> ++
>>> ++.NOTPARALLEL: $(1)
>>=20
>> This doesn't make a whole lot of sense: .NOTPARALLEL is something that ap=
plies to the Makefile as a whole, not to one specific target. I haven't look=
ed in any depth in the libnss build system, but unless it builds recursively=
, adding this is exactly equivalent to adding
>>=20
>> .NOTPARALLEL:
>=20
> As I=E2=80=99ve tested it=E2=80=99s not like this.
>=20
> I read this from [1]:
> =E2=80=98=E2=80=99=E2=80=99
> .NOTPARALLEL
> If .NOTPARALLEL is mentioned as a target, then this invocation of make wil=
l be run serially, even if the =E2=80=98-j=E2=80=99 option is given. Any rec=
ursively invoked make command will still run recipes in parallel (unless its=
 makefile also contains this target). Any prerequisites on this target are i=
gnored.
>=20
> =E2=80=98=E2=80=99=E2=80=99
>=20
> They talk about target and it is what I experience.
> It=E2=80=99s a bit ambiguous honestly. In the past I=E2=80=99ve also
> experienced it on a big Makefile where I had .bmp files to be converted wi=
th xxd and that gave parallel problems. So I=E2=80=99ve tagged it like:
>=20
> .NOTPARALLEL: %.bmp
>=20
> and that solved the problem.

=E2=80=A6it is because in both cases they are called recursively.

Giulio

>=20
> Also they have just upstreamed the patch [2], so
> we can test if it works committing this patch or
> by bumping next version.
>=20
> Then it=E2=80=99s up to you :-)
>=20
> Best regards
> Giulio Benetti
> Benetti Engineering sas
>=20
> [1]: https://www.gnu.org/software/make/manual/html_node/Special-Targets.ht=
ml
> [2]: https://bugzilla.mozilla.org/show_bug.cgi?id=3D1731911
>=20
>>=20
>> anywhere in the Makefiles. This is BTW what we do in Buildroot.
>>=20
>> And in the end, that's the same as calling $(MAKE1) from Buildroot, so pa=
tching is not really needed.
>>=20
>> If you want to be a little smarter, you will have to manually "unroll" th=
e dependency, like:
>>=20
>> $(1): | $(3)/d
>>    $$(foreach tgt,$(2),$(MAKE) $(3)/$$($(tgt)))
>>=20
>> (chances are I made some major mistake in this thing).
>>=20
>> Or if it does build recursively, you can probably conditionally add .NOTP=
ARALLEL in some smart way.
>>=20
>> Anyway, I've marked this patch as Changed Requested.
>>=20
>> Regards,
>> Arnout
>>=20
>>=20
>>> + endif
>>> + else
>>> + $(1):
>>> +--
>>> +2.25.1
>>> +

--Apple-Mail-EF1FCB04-00B7-433D-AA1B-5C868B3CDA3E
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Or=E2=80=A6<br><div dir=3D"ltr"><br><blockq=
uote type=3D"cite">Il giorno 19 ott 2021, alle ore 19:40, Giulio Benetti &lt=
;giulio.benetti@benettiengineering.com&gt; ha scritto:<br><br></blockquote><=
/div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<meta http-equiv=3D=
"content-type" content=3D"text/html; charset=3Dutf-8">Hi Arnout,<br><div dir=
=3D"ltr"><br><blockquote type=3D"cite">Il giorno 6 ott 2021, alle ore 21:20,=
 Arnout Vandecappelle &lt;arnout@mind.be&gt; ha scritto:<br><br></blockquote=
></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span></span><br>=
<span></span><br><span>On 22/09/2021 01:59, Giulio Benetti wrote:</span><br>=
<blockquote type=3D"cite"><span>As explained in the patch itself(pending her=
e[1]), I couldn't reproduce</span><br></blockquote><blockquote type=3D"cite"=
><span>the failure but it seems to be right. Basically I'm making not parall=
el</span><br></blockquote><blockquote type=3D"cite"><span>every 'nsinstall -=
R' command that is where it fails.</span><br></blockquote><blockquote type=3D=
"cite"><span>[1]: https://bugzilla.mozilla.org/show_bug.cgi?id=3D1731911</sp=
an><br></blockquote><blockquote type=3D"cite"><span>Fixes:</span><br></block=
quote><blockquote type=3D"cite"><span>http://autobuild.buildroot.net/results=
/a895ed7aa48edc5cd9ac8bbbd689433a98c9c057/</span><br></blockquote><blockquot=
e type=3D"cite"><span>Signed-off-by: Giulio Benetti &lt;giulio.benetti@benet=
tiengineering.com&gt;</span><br></blockquote><blockquote type=3D"cite"><span=
>---</span><br></blockquote><blockquote type=3D"cite"><span> &nbsp;...31911-=
Fix-nsinstall-parallel-failure.patch | 34 +++++++++++++++++++</span><br></bl=
ockquote><blockquote type=3D"cite"><span> &nbsp;1 file changed, 34 insertion=
s(+)</span><br></blockquote><blockquote type=3D"cite"><span> &nbsp;create mo=
de 100644 package/libnss/0001-Bug-1731911-Fix-nsinstall-parallel-failure.pat=
ch</span><br></blockquote><blockquote type=3D"cite"><span>diff --git a/packa=
ge/libnss/0001-Bug-1731911-Fix-nsinstall-parallel-failure.patch b/package/li=
bnss/0001-Bug-1731911-Fix-nsinstall-parallel-failure.patch</span><br></block=
quote><blockquote type=3D"cite"><span>new file mode 100644</span><br></block=
quote><blockquote type=3D"cite"><span>index 0000000000..7ac340f1ca</span><br=
></blockquote><blockquote type=3D"cite"><span>--- /dev/null</span><br></bloc=
kquote><blockquote type=3D"cite"><span>+++ b/package/libnss/0001-Bug-1731911=
-Fix-nsinstall-parallel-failure.patch</span><br></blockquote><blockquote typ=
e=3D"cite"><span>@@ -0,0 +1,34 @@</span><br></blockquote><blockquote type=3D=
"cite"><span>+=46rom 7ba4d627212507f876dc112e89c68e82e1c50188 Mon Sep 17 00:=
00:00 2001</span><br></blockquote><blockquote type=3D"cite"><span>+From: Giu=
lio Benetti &lt;giulio.benetti@benettiengineering.com&gt;</span><br></blockq=
uote><blockquote type=3D"cite"><span>+Date: Wed, 22 Sep 2021 01:40:31 +0200<=
/span><br></blockquote><blockquote type=3D"cite"><span>+Subject: [PATCH] Bug=
 1731911 - Fix nsinstall parallel failure</span><br></blockquote><blockquote=
 type=3D"cite"><span>+</span><br></blockquote><blockquote type=3D"cite"><spa=
n>+Fix nsinstall race condition when building using Makefile with parallel</=
span><br></blockquote><blockquote type=3D"cite"><span>+options on. I've end u=
p making $(1) recipe in copy_varlist_into_dir_RULE</span><br></blockquote><b=
lockquote type=3D"cite"><span>+.NOTPARALLEL. I can't test it that much since=
 it's very very rare, but</span><br></blockquote><blockquote type=3D"cite"><=
span>+it seems to be the correct way. This way every copy_varlist_into_dir_R=
ULE</span><br></blockquote><blockquote type=3D"cite"><span>+called should oc=
cur not parallel and I think that this is acceptable</span><br></blockquote>=
<blockquote type=3D"cite"><span>+since it only create symlinks that takes ve=
ry few. Further improving is</span><br></blockquote><blockquote type=3D"cite=
"><span>+possible of course.</span><br></blockquote><blockquote type=3D"cite=
"><span>+</span><br></blockquote><blockquote type=3D"cite"><span>+Signed-off=
-by: Giulio Benetti &lt;giulio.benetti@benettiengineering.com&gt;</span><br>=
</blockquote><blockquote type=3D"cite"><span>+---</span><br></blockquote><bl=
ockquote type=3D"cite"><span>+ nss/coreconf/rules.mk | 2 ++</span><br></bloc=
kquote><blockquote type=3D"cite"><span>+ 1 file changed, 2 insertions(+)</sp=
an><br></blockquote><blockquote type=3D"cite"><span>+</span><br></blockquote=
><blockquote type=3D"cite"><span>+diff --git a/nss/coreconf/rules.mk b/nss/c=
oreconf/rules.mk</span><br></blockquote><blockquote type=3D"cite"><span>+ind=
ex dc72e9cef..a341b8385 100644</span><br></blockquote><blockquote type=3D"ci=
te"><span>+--- a/nss/coreconf/rules.mk</span><br></blockquote><blockquote ty=
pe=3D"cite"><span>++++ b/nss/coreconf/rules.mk</span><br></blockquote><block=
quote type=3D"cite"><span>+@@ -377,6 +377,8 @@ $(3)/%: %</span><br></blockqu=
ote><blockquote type=3D"cite"><span>+  &nbsp; &nbsp;$$(INSTALL) -m 444 $$^ $=
(3)</span><br></blockquote><blockquote type=3D"cite"><span>+</span><br></blo=
ckquote><blockquote type=3D"cite"><span>+ $(1): $$(addprefix $(3)/,$$($(2)))=
 | $(3)/d</span><br></blockquote><blockquote type=3D"cite"><span>++</span><b=
r></blockquote><blockquote type=3D"cite"><span>++.NOTPARALLEL: $(1)</span><b=
r></blockquote><span></span><br><span> This doesn't make a whole lot of sens=
e: .NOTPARALLEL is something that applies to the Makefile as a whole, not to=
 one specific target. I haven't looked in any depth in the libnss build syst=
em, but unless it builds recursively, adding this is exactly equivalent to a=
dding</span><br><span></span><br><span>.NOTPARALLEL:</span><br></div></block=
quote><div><br></div><div>As I=E2=80=99ve tested it=E2=80=99s not like this.=
</div><div><br></div><div>I read this from [1]:</div><div>=E2=80=98=E2=80=99=
=E2=80=99</div><div><dt style=3D"font-size: 16px; -webkit-text-size-adjust: a=
uto; margin: 0.5em 0px; padding: 0px; line-height: 1.5em; font-weight: bold;=
 color: rgb(34, 34, 34);"><code style=3D"margin: 0px; padding: 0px; font-sty=
le: inherit; font-weight: inherit; line-height: 1.5em;">.NOTPARALLEL</code><=
/dt><dd style=3D"font-size: 16px; -webkit-text-size-adjust: auto; margin: 0.=
5em 21.59375px 1em; padding: 0px; line-height: 1.5em; caret-color: rgb(0, 0,=
 0); color: rgb(0, 0, 0);"><span id=3D"index-parallel-execution_002c-overrid=
ing"></span><p style=3D"margin: 0.5em 0px; padding: 0px; line-height: 1.5em;=
">If&nbsp;<code style=3D"margin: 0px; padding: 0px; font-style: inherit; lin=
e-height: 1.5em;">.NOTPARALLEL</code>&nbsp;is mentioned as a target, then th=
is invocation of&nbsp;<code style=3D"margin: 0px; padding: 0px; font-style: i=
nherit; line-height: 1.5em;">make</code>&nbsp;will be run serially, even if t=
he =E2=80=98<samp>-j</samp>=E2=80=99 option is given. Any recursively invoke=
d&nbsp;<code style=3D"margin: 0px; padding: 0px; font-style: inherit; line-h=
eight: 1.5em;">make</code>&nbsp;command will still run recipes in parallel (=
unless its makefile also contains this target). Any prerequisites on this ta=
rget are ignored.</p></dd></div><div>=E2=80=98=E2=80=99=E2=80=99</div><div><=
br></div><div>They talk about target and it is what I experience.</div><div>=
It=E2=80=99s a bit ambiguous honestly. In the past I=E2=80=99ve also</div><d=
iv>experienced it on a big Makefile where I had .bmp files to be converted w=
ith xxd and that gave parallel problems. So I=E2=80=99ve tagged it like:</di=
v><div><br></div><div>.NOTPARALLEL: %.bmp</div><div><br></div><div>and that s=
olved the problem.</div></div></blockquote><div><br></div><div>=E2=80=A6it i=
s because in both cases they are called recursively.</div><div><br></div><di=
v>Giulio</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><div><br></div>=
<div>Also they have just upstreamed the patch [2], so</div><div>we can test i=
f it works committing this patch or</div><div>by bumping next version.</div>=
<div><br></div><div>Then it=E2=80=99s up to you :-)</div><div><br></div><div=
>Best regards</div><div>Giulio Benetti</div><div>Benetti Engineering sas</di=
v><div><br></div><div>[1]:&nbsp;<a href=3D"https://www.gnu.org/software/make=
/manual/html_node/Special-Targets.html">https://www.gnu.org/software/make/ma=
nual/html_node/Special-Targets.html</a></div><div>[2]:&nbsp;<a href=3D"https=
://bugzilla.mozilla.org/show_bug.cgi?id=3D1731911">https://bugzilla.mozilla.=
org/show_bug.cgi?id=3D1731911</a></div><br><blockquote type=3D"cite"><div di=
r=3D"ltr"><span></span><br><span>anywhere in the Makefiles. This is BTW what=
 we do in Buildroot.</span><br><span></span><br><span> And in the end, that'=
s the same as calling $(MAKE1) from Buildroot, so patching is not really nee=
ded.</span><br><span></span><br><span> If you want to be a little smarter, y=
ou will have to manually "unroll" the dependency, like:</span><br><span></sp=
an><br><span>$(1): | $(3)/d</span><br><span> &nbsp; &nbsp;$$(foreach tgt,$(2=
),$(MAKE) $(3)/$$($(tgt)))</span><br><span></span><br><span>(chances are I m=
ade some major mistake in this thing).</span><br><span></span><br><span> Or i=
f it does build recursively, you can probably conditionally add .NOTPARALLEL=
 in some smart way.</span><br><span></span><br><span> Anyway, I've marked th=
is patch as Changed Requested.</span><br><span></span><br><span> Regards,</s=
pan><br><span> Arnout</span><br><span></span><br><span></span><br><blockquot=
e type=3D"cite"><span>+ endif</span><br></blockquote><blockquote type=3D"cit=
e"><span>+ else</span><br></blockquote><blockquote type=3D"cite"><span>+ $(1=
):</span><br></blockquote><blockquote type=3D"cite"><span>+--</span><br></bl=
ockquote><blockquote type=3D"cite"><span>+2.25.1</span><br></blockquote><blo=
ckquote type=3D"cite"><span>+</span><br></blockquote></div></blockquote></di=
v></blockquote></body></html>=

--Apple-Mail-EF1FCB04-00B7-433D-AA1B-5C868B3CDA3E--

--===============8457142091995047504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8457142091995047504==--
