Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D194C433FE
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:40:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88669611BF
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88669611BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50E1D400CB;
	Tue, 19 Oct 2021 17:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PxgzJ_OTTmxo; Tue, 19 Oct 2021 17:40:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49420401CB;
	Tue, 19 Oct 2021 17:40:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F8ED1BF4D8
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B427406B2
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:40:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1vK88Q85R1jQ for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 17:40:39 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECCEC4069C
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 17:40:38 +0000 (UTC)
Received: from smtpclient.apple ([151.46.26.97])
 by Aruba Outgoing Smtp  with ESMTPA
 id cszVmIZNCxC2ncszWmN4yp; Tue, 19 Oct 2021 19:33:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634664814; bh=jzoklapl5rH1sZ8DkM/d51a0Stw6K0ctXP56xJHhv94=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=MqD60HAO1oLB2IhnEXM37rC5nyqF0OwB3qNAnSuT+CA4YFgbJ6q7bPRPPMnAGTWp1
 UWCQr8f+7z0UXLqGOL6B6iDoqblqb1iRWaJ1mvxj2O+rFk5P42l25wPjuy7oRZVPIn
 EXQOL0Hg2qYqcyEnIpgN/bsxPix5eUvoXZBgWMsSbh7iuofezTrrOnw4lhDnl3Niio
 T/Huqr4kXtUJGQ6mcY/7C9oaFDLXNHDLGuS9J35iaDthCuxO7xslPmjD3Byd6Ddk2n
 0HicP4jR8qhXAMCF7UPVilHpJXnzLieDd4jPkhp3+iI3Z5RJgq9M5HqLG3nO+R2QeM
 EPd30dKFjkF2g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 19 Oct 2021 19:33:32 +0200
Message-Id: <A62E77A0-E4CC-409B-A64B-0B0AADAFB933@benettiengineering.com>
References: <441e75de-8abd-436d-e0f2-1ecdf5a2bab9@mind.be>
In-Reply-To: <441e75de-8abd-436d-e0f2-1ecdf5a2bab9@mind.be>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailer: iPhone Mail (18H17)
X-CMAE-Envelope: MS4wfDRYMDuUl1gjwy57McgQ5D+rDULs10EaPlRW3m5G+mZZJzYiQnrzmhPNSxd1eeZCiGa8gzoDeXaPE4jl9cqnCx9e10W03L6ib3EJP1uA0C7GKpcmb02u
 Pn/Z7S47LQnOt9vSBcCM2srmJom1TWb+LqwdO60KorAXGZjBHoLCq24X1AB+mspZv1HYxptGIdHTz2m8A4LCkO5jl/PkCLZIDwU/M2ZauDWtbH2bXWQATzCn
 MPO69MVxmkoyakcogyXwjg==
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
Content-Type: multipart/mixed; boundary="===============4583556741761582132=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4583556741761582132==
Content-Type: multipart/alternative; boundary=Apple-Mail-91343CDA-0CBE-4BCA-B3F7-AFB825695B23
Content-Transfer-Encoding: 7bit


--Apple-Mail-91343CDA-0CBE-4BCA-B3F7-AFB825695B23
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Arnout,

> Il giorno 6 ott 2021, alle ore 21:20, Arnout Vandecappelle <arnout@mind.be=
> ha scritto:
>=20
> =EF=BB=BF
>=20
>> On 22/09/2021 01:59, Giulio Benetti wrote:
>> As explained in the patch itself(pending here[1]), I couldn't reproduce
>> the failure but it seems to be right. Basically I'm making not parallel
>> every 'nsinstall -R' command that is where it fails.
>> [1]: https://bugzilla.mozilla.org/show_bug.cgi?id=3D1731911
>> Fixes:
>> http://autobuild.buildroot.net/results/a895ed7aa48edc5cd9ac8bbbd689433a98=
c9c057/
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>  ...31911-Fix-nsinstall-parallel-failure.patch | 34 +++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>  create mode 100644 package/libnss/0001-Bug-1731911-Fix-nsinstall-paralle=
l-failure.patch
>> diff --git a/package/libnss/0001-Bug-1731911-Fix-nsinstall-parallel-failu=
re.patch b/package/libnss/0001-Bug-1731911-Fix-nsinstall-parallel-failure.pa=
tch
>> new file mode 100644
>> index 0000000000..7ac340f1ca
>> --- /dev/null
>> +++ b/package/libnss/0001-Bug-1731911-Fix-nsinstall-parallel-failure.patc=
h
>> @@ -0,0 +1,34 @@
>> +=46rom 7ba4d627212507f876dc112e89c68e82e1c50188 Mon Sep 17 00:00:00 2001=

>> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +Date: Wed, 22 Sep 2021 01:40:31 +0200
>> +Subject: [PATCH] Bug 1731911 - Fix nsinstall parallel failure
>> +
>> +Fix nsinstall race condition when building using Makefile with parallel
>> +options on. I've end up making $(1) recipe in copy_varlist_into_dir_RULE=

>> +.NOTPARALLEL. I can't test it that much since it's very very rare, but
>> +it seems to be the correct way. This way every copy_varlist_into_dir_RUL=
E
>> +called should occur not parallel and I think that this is acceptable
>> +since it only create symlinks that takes very few. Further improving is
>> +possible of course.
>> +
>> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +---
>> + nss/coreconf/rules.mk | 2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/nss/coreconf/rules.mk b/nss/coreconf/rules.mk
>> +index dc72e9cef..a341b8385 100644
>> +--- a/nss/coreconf/rules.mk
>> ++++ b/nss/coreconf/rules.mk
>> +@@ -377,6 +377,8 @@ $(3)/%: %
>> +    $$(INSTALL) -m 444 $$^ $(3)
>> +
>> + $(1): $$(addprefix $(3)/,$$($(2))) | $(3)/d
>> ++
>> ++.NOTPARALLEL: $(1)
>=20
> This doesn't make a whole lot of sense: .NOTPARALLEL is something that app=
lies to the Makefile as a whole, not to one specific target. I haven't looke=
d in any depth in the libnss build system, but unless it builds recursively,=
 adding this is exactly equivalent to adding
>=20
> .NOTPARALLEL:

As I=E2=80=99ve tested it=E2=80=99s not like this.

I read this from [1]:
=E2=80=98=E2=80=99=E2=80=99
.NOTPARALLEL
If .NOTPARALLEL is mentioned as a target, then this invocation of make will b=
e run serially, even if the =E2=80=98-j=E2=80=99 option is given. Any recurs=
ively invoked make command will still run recipes in parallel (unless its ma=
kefile also contains this target). Any prerequisites on this target are igno=
red.

=E2=80=98=E2=80=99=E2=80=99

They talk about target and it is what I experience.
It=E2=80=99s a bit ambiguous honestly. In the past I=E2=80=99ve also
experienced it on a big Makefile where I had .bmp files to be converted with=
 xxd and that gave parallel problems. So I=E2=80=99ve tagged it like:

.NOTPARALLEL: %.bmp

and that solved the problem.

Also they have just upstreamed the patch [2], so
we can test if it works committing this patch or
by bumping next version.

Then it=E2=80=99s up to you :-)

Best regards
Giulio Benetti
Benetti Engineering sas

[1]: https://www.gnu.org/software/make/manual/html_node/Special-Targets.html=

[2]: https://bugzilla.mozilla.org/show_bug.cgi?id=3D1731911

>=20
> anywhere in the Makefiles. This is BTW what we do in Buildroot.
>=20
> And in the end, that's the same as calling $(MAKE1) from Buildroot, so pat=
ching is not really needed.
>=20
> If you want to be a little smarter, you will have to manually "unroll" the=
 dependency, like:
>=20
> $(1): | $(3)/d
>    $$(foreach tgt,$(2),$(MAKE) $(3)/$$($(tgt)))
>=20
> (chances are I made some major mistake in this thing).
>=20
> Or if it does build recursively, you can probably conditionally add .NOTPA=
RALLEL in some smart way.
>=20
> Anyway, I've marked this patch as Changed Requested.
>=20
> Regards,
> Arnout
>=20
>=20
>> + endif
>> + else
>> + $(1):
>> +--
>> +2.25.1
>> +

--Apple-Mail-91343CDA-0CBE-4BCA-B3F7-AFB825695B23
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Arnout,<br><div dir=3D"ltr"><br><blockqu=
ote type=3D"cite">Il giorno 6 ott 2021, alle ore 21:20, Arnout Vandecappelle=
 &lt;arnout@mind.be&gt; ha scritto:<br><br></blockquote></div><blockquote ty=
pe=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span></span><br><span></span><br><spa=
n>On 22/09/2021 01:59, Giulio Benetti wrote:</span><br><blockquote type=3D"c=
ite"><span>As explained in the patch itself(pending here[1]), I couldn't rep=
roduce</span><br></blockquote><blockquote type=3D"cite"><span>the failure bu=
t it seems to be right. Basically I'm making not parallel</span><br></blockq=
uote><blockquote type=3D"cite"><span>every 'nsinstall -R' command that is wh=
ere it fails.</span><br></blockquote><blockquote type=3D"cite"><span>[1]: ht=
tps://bugzilla.mozilla.org/show_bug.cgi?id=3D1731911</span><br></blockquote>=
<blockquote type=3D"cite"><span>Fixes:</span><br></blockquote><blockquote ty=
pe=3D"cite"><span>http://autobuild.buildroot.net/results/a895ed7aa48edc5cd9a=
c8bbbd689433a98c9c057/</span><br></blockquote><blockquote type=3D"cite"><spa=
n>Signed-off-by: Giulio Benetti &lt;giulio.benetti@benettiengineering.com&gt=
;</span><br></blockquote><blockquote type=3D"cite"><span>---</span><br></blo=
ckquote><blockquote type=3D"cite"><span> &nbsp;...31911-Fix-nsinstall-parall=
el-failure.patch | 34 +++++++++++++++++++</span><br></blockquote><blockquote=
 type=3D"cite"><span> &nbsp;1 file changed, 34 insertions(+)</span><br></blo=
ckquote><blockquote type=3D"cite"><span> &nbsp;create mode 100644 package/li=
bnss/0001-Bug-1731911-Fix-nsinstall-parallel-failure.patch</span><br></block=
quote><blockquote type=3D"cite"><span>diff --git a/package/libnss/0001-Bug-1=
731911-Fix-nsinstall-parallel-failure.patch b/package/libnss/0001-Bug-173191=
1-Fix-nsinstall-parallel-failure.patch</span><br></blockquote><blockquote ty=
pe=3D"cite"><span>new file mode 100644</span><br></blockquote><blockquote ty=
pe=3D"cite"><span>index 0000000000..7ac340f1ca</span><br></blockquote><block=
quote type=3D"cite"><span>--- /dev/null</span><br></blockquote><blockquote t=
ype=3D"cite"><span>+++ b/package/libnss/0001-Bug-1731911-Fix-nsinstall-paral=
lel-failure.patch</span><br></blockquote><blockquote type=3D"cite"><span>@@ -=
0,0 +1,34 @@</span><br></blockquote><blockquote type=3D"cite"><span>+=46rom 7=
ba4d627212507f876dc112e89c68e82e1c50188 Mon Sep 17 00:00:00 2001</span><br><=
/blockquote><blockquote type=3D"cite"><span>+From: Giulio Benetti &lt;giulio=
.benetti@benettiengineering.com&gt;</span><br></blockquote><blockquote type=3D=
"cite"><span>+Date: Wed, 22 Sep 2021 01:40:31 +0200</span><br></blockquote><=
blockquote type=3D"cite"><span>+Subject: [PATCH] Bug 1731911 - Fix nsinstall=
 parallel failure</span><br></blockquote><blockquote type=3D"cite"><span>+</=
span><br></blockquote><blockquote type=3D"cite"><span>+Fix nsinstall race co=
ndition when building using Makefile with parallel</span><br></blockquote><b=
lockquote type=3D"cite"><span>+options on. I've end up making $(1) recipe in=
 copy_varlist_into_dir_RULE</span><br></blockquote><blockquote type=3D"cite"=
><span>+.NOTPARALLEL. I can't test it that much since it's very very rare, b=
ut</span><br></blockquote><blockquote type=3D"cite"><span>+it seems to be th=
e correct way. This way every copy_varlist_into_dir_RULE</span><br></blockqu=
ote><blockquote type=3D"cite"><span>+called should occur not parallel and I t=
hink that this is acceptable</span><br></blockquote><blockquote type=3D"cite=
"><span>+since it only create symlinks that takes very few. Further improvin=
g is</span><br></blockquote><blockquote type=3D"cite"><span>+possible of cou=
rse.</span><br></blockquote><blockquote type=3D"cite"><span>+</span><br></bl=
ockquote><blockquote type=3D"cite"><span>+Signed-off-by: Giulio Benetti &lt;=
giulio.benetti@benettiengineering.com&gt;</span><br></blockquote><blockquote=
 type=3D"cite"><span>+---</span><br></blockquote><blockquote type=3D"cite"><=
span>+ nss/coreconf/rules.mk | 2 ++</span><br></blockquote><blockquote type=3D=
"cite"><span>+ 1 file changed, 2 insertions(+)</span><br></blockquote><block=
quote type=3D"cite"><span>+</span><br></blockquote><blockquote type=3D"cite"=
><span>+diff --git a/nss/coreconf/rules.mk b/nss/coreconf/rules.mk</span><br=
></blockquote><blockquote type=3D"cite"><span>+index dc72e9cef..a341b8385 10=
0644</span><br></blockquote><blockquote type=3D"cite"><span>+--- a/nss/corec=
onf/rules.mk</span><br></blockquote><blockquote type=3D"cite"><span>++++ b/n=
ss/coreconf/rules.mk</span><br></blockquote><blockquote type=3D"cite"><span>=
+@@ -377,6 +377,8 @@ $(3)/%: %</span><br></blockquote><blockquote type=3D"ci=
te"><span>+  &nbsp; &nbsp;$$(INSTALL) -m 444 $$^ $(3)</span><br></blockquote=
><blockquote type=3D"cite"><span>+</span><br></blockquote><blockquote type=3D=
"cite"><span>+ $(1): $$(addprefix $(3)/,$$($(2))) | $(3)/d</span><br></block=
quote><blockquote type=3D"cite"><span>++</span><br></blockquote><blockquote t=
ype=3D"cite"><span>++.NOTPARALLEL: $(1)</span><br></blockquote><span></span>=
<br><span> This doesn't make a whole lot of sense: .NOTPARALLEL is something=
 that applies to the Makefile as a whole, not to one specific target. I have=
n't looked in any depth in the libnss build system, but unless it builds rec=
ursively, adding this is exactly equivalent to adding</span><br><span></span=
><br><span>.NOTPARALLEL:</span><br></div></blockquote><div><br></div><div>As=
 I=E2=80=99ve tested it=E2=80=99s not like this.</div><div><br></div><div>I r=
ead this from [1]:</div><div>=E2=80=98=E2=80=99=E2=80=99</div><div><dt style=
=3D"font-size: 16px; -webkit-text-size-adjust: auto; margin: 0.5em 0px; padd=
ing: 0px; line-height: 1.5em; font-weight: bold; color: rgb(34, 34, 34);"><c=
ode style=3D"margin: 0px; padding: 0px; font-style: inherit; font-weight: in=
herit; line-height: 1.5em;">.NOTPARALLEL</code></dt><dd style=3D"font-size: 1=
6px; -webkit-text-size-adjust: auto; margin: 0.5em 21.59375px 1em; padding: 0=
px; line-height: 1.5em; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><sp=
an id=3D"index-parallel-execution_002c-overriding"></span><p style=3D"margin=
: 0.5em 0px; padding: 0px; line-height: 1.5em;">If&nbsp;<code style=3D"margi=
n: 0px; padding: 0px; font-style: inherit; line-height: 1.5em;">.NOTPARALLEL=
</code>&nbsp;is mentioned as a target, then this invocation of&nbsp;<code st=
yle=3D"margin: 0px; padding: 0px; font-style: inherit; line-height: 1.5em;">=
make</code>&nbsp;will be run serially, even if the =E2=80=98<samp>-j</samp>=E2=
=80=99 option is given. Any recursively invoked&nbsp;<code style=3D"margin: 0=
px; padding: 0px; font-style: inherit; line-height: 1.5em;">make</code>&nbsp=
;command will still run recipes in parallel (unless its makefile also contai=
ns this target). Any prerequisites on this target are ignored.</p></dd></div=
><div>=E2=80=98=E2=80=99=E2=80=99</div><div><br></div><div>They talk about t=
arget and it is what I experience.</div><div>It=E2=80=99s a bit ambiguous ho=
nestly. In the past I=E2=80=99ve also</div><div>experienced it on a big Make=
file where I had .bmp files to be converted with xxd and that gave parallel p=
roblems. So I=E2=80=99ve tagged it like:</div><div><br></div><div>.NOTPARALL=
EL: %.bmp</div><div><br></div><div>and that solved the problem.</div><div><b=
r></div><div>Also they have just upstreamed the patch [2], so</div><div>we c=
an test if it works committing this patch or</div><div>by bumping next versi=
on.</div><div><br></div><div>Then it=E2=80=99s up to you :-)</div><div><br><=
/div><div>Best regards</div><div>Giulio Benetti</div><div>Benetti Engineerin=
g sas</div><div><br></div><div>[1]:&nbsp;<a href=3D"https://www.gnu.org/soft=
ware/make/manual/html_node/Special-Targets.html">https://www.gnu.org/softwar=
e/make/manual/html_node/Special-Targets.html</a></div><div>[2]:&nbsp;<a href=
=3D"https://bugzilla.mozilla.org/show_bug.cgi?id=3D1731911">https://bugzilla=
.mozilla.org/show_bug.cgi?id=3D1731911</a></div><br><blockquote type=3D"cite=
"><div dir=3D"ltr"><span></span><br><span>anywhere in the Makefiles. This is=
 BTW what we do in Buildroot.</span><br><span></span><br><span> And in the e=
nd, that's the same as calling $(MAKE1) from Buildroot, so patching is not r=
eally needed.</span><br><span></span><br><span> If you want to be a little s=
marter, you will have to manually "unroll" the dependency, like:</span><br><=
span></span><br><span>$(1): | $(3)/d</span><br><span> &nbsp; &nbsp;$$(foreac=
h tgt,$(2),$(MAKE) $(3)/$$($(tgt)))</span><br><span></span><br><span>(chance=
s are I made some major mistake in this thing).</span><br><span></span><br><=
span> Or if it does build recursively, you can probably conditionally add .N=
OTPARALLEL in some smart way.</span><br><span></span><br><span> Anyway, I've=
 marked this patch as Changed Requested.</span><br><span></span><br><span> R=
egards,</span><br><span> Arnout</span><br><span></span><br><span></span><br>=
<blockquote type=3D"cite"><span>+ endif</span><br></blockquote><blockquote t=
ype=3D"cite"><span>+ else</span><br></blockquote><blockquote type=3D"cite"><=
span>+ $(1):</span><br></blockquote><blockquote type=3D"cite"><span>+--</spa=
n><br></blockquote><blockquote type=3D"cite"><span>+2.25.1</span><br></block=
quote><blockquote type=3D"cite"><span>+</span><br></blockquote></div></block=
quote></body></html>=

--Apple-Mail-91343CDA-0CBE-4BCA-B3F7-AFB825695B23--

--===============4583556741761582132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4583556741761582132==--
