Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06363C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 18:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CD0560B15;
	Wed, 22 Feb 2023 18:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CD0560B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AklICjubsQG1; Wed, 22 Feb 2023 18:34:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06BBD60E51;
	Wed, 22 Feb 2023 18:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06BBD60E51
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20BCE1BF334
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 18:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07D7B40191
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 18:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07D7B40191
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kWLcCdUPV0FV for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 18:34:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2569C4016B
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2569C4016B
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 18:34:30 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id s12so8532191qtq.11
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 10:34:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0jWGKjpZ69tIg4qj8y4UohjaFImWXzMUYbzXlzOKvZU=;
 b=5dXV3Chk5V4P5Eq9ouXR8YB80DQn8eIqaQR4oA+tODblztt08XdbSojEM5A+aVC2fh
 gvS+4K55JCpTRElBtjBYCkZVkl0HrjbNPBdu+mKCU/LFyBi7FGifXTKz02KN0KxSybY1
 q3M2j5lvc5fcrF+o2bN+LEOFqy6reTE8phNBGj3wgt1xvq+VgDx7CyHBlGW9pn7Bn+Am
 pZVKJoYT7WABtS0wSmN4HndvKFtU/Xv7f6+RukPxU53fbWgBCRmClGXWhB4cYEBsO6LX
 lgECUKRcqDYPTMJDIVX0yNFo164FihrmbFqVDGnFMb81ly/M6Lurkl4Ui2AXbTfSwQTy
 pwEQ==
X-Gm-Message-State: AO0yUKWRYenqrbK6j++H5tA3XyFkZ4cKPSYrUKTWQMqzi4x5Y8c/Zy10
 dSeDUuJaD+4e2f5aa5Y/wqKlsM2vT07jaw==
X-Google-Smtp-Source: AK7set9QblPrrLgfXC2hRMoOps/1nqdg1EGKWWKZJzJhLOpt3J0057wwrPUC3g+sdsq+84KJsNiMTQ==
X-Received: by 2002:ac8:7fcd:0:b0:3b9:a441:37ed with SMTP id
 b13-20020ac87fcd000000b003b9a44137edmr16373446qtk.32.1677090868841; 
 Wed, 22 Feb 2023 10:34:28 -0800 (PST)
Received: from ?IPv6:2600:1700:65a0:14f0:d967:d00d:c9d6:428d?
 ([2600:1700:65a0:14f0:d967:d00d:c9d6:428d])
 by smtp.gmail.com with ESMTPSA id
 j64-20020a378743000000b00731fe65bef2sm2920255qkd.66.2023.02.22.10.34.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Feb 2023 10:34:27 -0800 (PST)
From: Charles Hardin <ckhardin@gmail.com>
Message-Id: <B8CBCE69-5BDE-423F-912F-0D7E2A34C56C@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Date: Wed, 22 Feb 2023 10:34:26 -0800
In-Reply-To: <1f6626fc-12c0-d1f0-2a8a-2fa2fd0431b6@mind.be>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20230209231518.9458-1-ckhardin@gmail.com>
 <1f6626fc-12c0-d1f0-2a8a-2fa2fd0431b6@mind.be>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=0jWGKjpZ69tIg4qj8y4UohjaFImWXzMUYbzXlzOKvZU=;
 b=gT/2IMFSRs7cQ3s+KwQc71/5ip+TvH9N9nQ2juEbCUyc/QuUiwZkwWdWZLqM77qFB1
 GU3+UFJaVB0w5cVSmkTobYO7G05fgPBC31LRIfuZFz197u7UgM1P27kSp5QbxJHMzeIJ
 bku9GN5icv8nm6+x0TMCgslhowiVnB0wERYxYTxS7Lkb/oOlzCb51WfYJwSfNH5+Hfgn
 BtaTzmMumWfP/Beos5O+YOOqfgmBZth4qgseujvFXQZJ4H7uLAucvK3SCLBFYjyLgM4i
 jihZSDV+/Q5K9oIgfcfh7QN9MbcSnntz1x0iqtAXDyAzYGOPHnzRtMIvgfgOsIvx18it
 ygkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gT/2IMFS
Subject: Re: [Buildroot] [PATCH 1/4] linux: create a scmversion file based
 on the custom repo variables
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
Content-Type: multipart/mixed; boundary="===============2485609329874643222=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2485609329874643222==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_FF986E37-2CC5-4F09-800F-FF275A27DD9A"


--Apple-Mail=_FF986E37-2CC5-4F09-800F-FF275A27DD9A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Feb 14, 2023, at 1:46 PM, Arnout Vandecappelle <arnout@mind.be> =
wrote:
>=20
> Hi Charles,
>=20
> First of all, in patchwork [1] there are about twelve patches from you =
about this subject, but I think all except these four are superseded. Is =
that correct? Could you update patchwork and mark the old ones as =
superseded?
>=20

Yeah, sorry - had some mail server changes that kept saying an error but =
apparently the mail went thru.

>=20
> On 10/02/2023 00:15, ckhardin@gmail.com wrote:
>> From: Charles Hardin <ckhardin@gmail.com>
>> When using the custom repositories, the archive creation will
>> omit the source history to get reproducible hashes. This has
>> the side effect of making the setlocalversion scripts within the
>> builds to not create the tracking information as expected. So,
>> just generate a .scmversion so that kernels will be labelled
>> with where buildroot referenced them.
>=20
> This is less than ideal because it's completely different than the =
normal git describe output. In particular, if you first develop =
something in an OVERRIDE_SRCDIR (after applying patch 4) and then change =
the config to point to the exact same commit with =
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION, it will create a completely =
different UTS_RELEASE string...

Agreed -I would argue that the OVERRIDE_SRCDIR patch is functionally =
correct and what is desired particularly for local dev but the =
CUSTOM_REPO is a bit hackish and broken. Trying to figure out a way to =
do that.

>=20
> I think a better solution would be to extend the git download wrapper =
with a hook that gets called in the git tree itself. E.g.:
>=20
> LINUX_SCMVERSION_HOOK =3D ./scripts/setlocalversion --save-scmversion
>=20
> The same hook could then also be used for rsync. And it would be easy =
to add the same feature to barebox, tf-a, ...

That is a good idea - but, from what I can tell the git download script =
does a pull and extract all at once with no hooks being run

from support/download/git
```
#!/usr/bin/env bash

# NOTE: if the output of this backend has to change (e.g. we change what =
gets
# included in the archive (e.g. LFS), or we change the format of the =
archive
# (e.g. tar options, compression ratio or method)), we MUST update the =
format
# version in the variable BR_FMT_VERSION_git, in =
package/pkg-download.mk.

# We want to catch any unexpected failure, and exit immediately
set -E

=E2=80=A6 snip snip =E2=80=A6

Download from git repo in here

=E2=80=A6 snip snip =E2=80=A6

# Generate the archive.
# We do not want the .git dir; we keep other .git files, in case they =
are the
# only files in their directory.
# The .git dir would generate non reproducible tarballs as it depends on
# the state of the remote server. It also would generate large tarballs
# (gigabytes for some linux trees) when a full clone took place.
mk_tar_gz "${git_cache}" "${basename}" "${date}" "${output}" ".git/*=E2=80=
=9D
```

So from the above I don=E2=80=99t see where to put a HOOK in from the =
make scripts - is there an example for this because we cann=E2=80=99t =
run the hook from the tarball because there is no =E2=80=9C.git=E2=80=9D =
history in the tarball and the hook would need to be done at the =
creation? right?

>=20
> Regards,
> Arnout
>=20
>=20
>> For example (line wrapped)
>>     #define UTS_RELEASE "5.4.70-repo-version-" \
>>                         "92c23d10d0031e0a13244a1a97e7530d3b53fc6e"
>> Signed-off-by: Charles Hardin <ckhardin@gmail.com>
>> ---
>>  linux/linux.mk | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>> diff --git a/linux/linux.mk b/linux/linux.mk
>> index 7645b5f507..0b27c8dee2 100644
>> --- a/linux/linux.mk
>> +++ b/linux/linux.mk
>> @@ -596,6 +596,20 @@ endif
>>  ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL)),)
>>  $(error No custom repo URL set. Check your =
BR2_LINUX_KERNEL_CUSTOM_REPO_URL setting)
>>  endif
>> +
>> +# Create a custom scm version file to reflect the source version =
since the
>> +# archive will omit source directories like .git to maintain =
reproducible
>> +# hashes for the archives
>> +LINUX_CUSTOM_REPO_SCMVERSION =3D \
>> +	"-repo-version-$(call =
qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION))"
>> +define LINUX_CUSTOM_REPO_SCMVERSION_HOOK
>> +	(cd $(@D); \
>> +		if [ ! -f .scmversion ]; then \
>> +			echo $(LINUX_CUSTOM_REPO_SCMVERSION) > =
.scmversion; \
>> +		fi)
>> +endef
>> +
>> +LINUX_POST_EXTRACT_HOOKS +=3D LINUX_CUSTOM_REPO_SCMVERSION_HOOK
>>  endif
>>    ifeq ($(BR_BUILDING),y)


--Apple-Mail=_FF986E37-2CC5-4F09-800F-FF275A27DD9A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Feb 14, 2023, at 1:46 PM, Arnout Vandecappelle &lt;<a =
href=3D"mailto:arnout@mind.be" class=3D"">arnout@mind.be</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D""> Hi Charles,<br class=3D""><br class=3D""> First of all, in =
patchwork [1] there are about twelve patches from you about this =
subject, but I think all except these four are superseded. Is that =
correct? Could you update patchwork and mark the old ones as =
superseded?<br class=3D""><br class=3D""></div></div></blockquote><div><br=
 class=3D""></div><div>Yeah, sorry - had some mail server changes that =
kept saying an error but apparently the mail went thru.</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
class=3D""><br class=3D"">On 10/02/2023 00:15, <a =
href=3D"mailto:ckhardin@gmail.com" class=3D"">ckhardin@gmail.com</a> =
wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">From: Charles =
Hardin &lt;<a href=3D"mailto:ckhardin@gmail.com" =
class=3D"">ckhardin@gmail.com</a>&gt;<br class=3D"">When using the =
custom repositories, the archive creation will<br class=3D"">omit the =
source history to get reproducible hashes. This has<br class=3D"">the =
side effect of making the setlocalversion scripts within the<br =
class=3D"">builds to not create the tracking information as expected. =
So,<br class=3D"">just generate a .scmversion so that kernels will be =
labelled<br class=3D"">with where buildroot referenced them.<br =
class=3D""></blockquote><br class=3D""> This is less than ideal because =
it's completely different than the normal git describe output. In =
particular, if you first develop something in an OVERRIDE_SRCDIR (after =
applying patch 4) and then change the config to point to the exact same =
commit with BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION, it will create a =
completely different UTS_RELEASE string...<br =
class=3D""></div></div></blockquote><div><br class=3D""></div><div>Agreed =
-I would argue that the OVERRIDE_SRCDIR patch is functionally correct =
and what is desired particularly for local dev but the CUSTOM_REPO is a =
bit hackish and broken. Trying to figure out a way to do that.</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
class=3D""><br class=3D""> I think a better solution would be to extend =
the git download wrapper with a hook that gets called in the git tree =
itself. E.g.:<br class=3D""><br class=3D"">LINUX_SCMVERSION_HOOK =3D =
./scripts/setlocalversion --save-scmversion<br class=3D""><br class=3D""> =
The same hook could then also be used for rsync. And it would be easy to =
add the same feature to barebox, tf-a, ...<br =
class=3D""></div></div></blockquote><div><br class=3D""></div><div>That =
is a good idea - but, from what I can tell the git download script does =
a pull and extract all at once with no hooks being run</div><div><br =
class=3D""></div><div>from =
support/download/git</div><div>```</div><div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo; min-height: 13px;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""></span><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">#!/usr/bin/env bash</span></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; =
min-height: 13px;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""></span><br class=3D""></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""># NOTE: if the output of this backend has to change (e.g. we =
change what gets</span></div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""># =
included in the archive (e.g. LFS), or we change the format of the =
archive</span></div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""># (e.g. tar options, compression ratio =
or method)), we MUST update the format</span></div><div style=3D"margin: =
0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""># =
version in the variable BR_FMT_VERSION_git, in =
package/pkg-download.mk.</span></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; min-height: 13px;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""></span><br class=3D""></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""># We =
want to catch any unexpected failure, and exit =
immediately</span></div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">set -E</span></div><div class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><br =
class=3D""></span></div><div class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">=E2=80=A6=
 snip snip =E2=80=A6</span></div><div class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><br =
class=3D""></span></div><div class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">Download =
from git repo in here</span></div><div class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><br =
class=3D""></span></div><div class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">=E2=80=A6=
 snip snip =E2=80=A6</span></div><div class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><br =
class=3D""></span></div></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""># Generate the archive.</span></div><div style=3D"margin: =
0px; font-stretch: normal; font-size: 11px; line-height: normal; =
font-family: Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""># We do not want the .git dir; we keep =
other .git files, in case they are the</span></div><div style=3D"margin: =
0px; font-stretch: normal; font-size: 11px; line-height: normal; =
font-family: Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""># only files in their =
directory.</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""># The .git dir would generate non reproducible tarballs as it =
depends on</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""># the state of the remote server. It also would generate =
large tarballs</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""># (gigabytes for some linux trees) when a full clone took =
place.</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">mk_tar_gz "${git_cache}" "${basename}" "${date}" "${output}" =
".git/*=E2=80=9D</span></div><div style=3D"margin: 0px; font-stretch: =
normal; font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">```</span></div></div><div><br class=3D""></div><div>So from =
the above I don=E2=80=99t see where to put a HOOK in from the make =
scripts - is there an example for this because we cann=E2=80=99t run the =
hook from the tarball because there is no =E2=80=9C.git=E2=80=9D history =
in the tarball and the hook would need to be done at the creation? =
right?</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div class=3D""><br class=3D""> Regards,<br class=3D""> =
Arnout<br class=3D""><br class=3D""><br class=3D""><blockquote =
type=3D"cite" class=3D"">For example (line wrapped)<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;#define UTS_RELEASE "5.4.70-repo-version-" \<br =
class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"92c=
23d10d0031e0a13244a1a97e7530d3b53fc6e"<br class=3D"">Signed-off-by: =
Charles Hardin &lt;<a href=3D"mailto:ckhardin@gmail.com" =
class=3D"">ckhardin@gmail.com</a>&gt;<br class=3D"">---<br class=3D""> =
&nbsp;linux/linux.mk | 14 ++++++++++++++<br class=3D""> &nbsp;1 file =
changed, 14 insertions(+)<br class=3D"">diff --git a/linux/linux.mk =
b/linux/linux.mk<br class=3D"">index 7645b5f507..0b27c8dee2 100644<br =
class=3D"">--- a/linux/linux.mk<br class=3D"">+++ b/linux/linux.mk<br =
class=3D"">@@ -596,6 +596,20 @@ endif<br class=3D""> &nbsp;ifeq ($(call =
qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL)),)<br class=3D""> =
&nbsp;$(error No custom repo URL set. Check your =
BR2_LINUX_KERNEL_CUSTOM_REPO_URL setting)<br class=3D""> &nbsp;endif<br =
class=3D"">+<br class=3D"">+# Create a custom scm version file to =
reflect the source version since the<br class=3D"">+# archive will omit =
source directories like .git to maintain reproducible<br class=3D"">+# =
hashes for the archives<br class=3D"">+LINUX_CUSTOM_REPO_SCMVERSION =3D =
\<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>"-repo-version-$(call =
qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION))"<br class=3D"">+define =
LINUX_CUSTOM_REPO_SCMVERSION_HOOK<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>(cd =
$(@D); \<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if [ ! -f .scmversion ]; then =
\<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>echo $(LINUX_CUSTOM_REPO_SCMVERSION) &gt; .scmversion; \<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>fi)<br class=3D"">+endef<br class=3D"">+<br =
class=3D"">+LINUX_POST_EXTRACT_HOOKS +=3D =
LINUX_CUSTOM_REPO_SCMVERSION_HOOK<br class=3D""> &nbsp;endif<br =
class=3D""> &nbsp;&nbsp;&nbsp;ifeq ($(BR_BUILDING),y)<br =
class=3D""></blockquote></div></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_FF986E37-2CC5-4F09-800F-FF275A27DD9A--

--===============2485609329874643222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2485609329874643222==--
