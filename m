From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Mar 2014 17:23:28 +0100
Subject: [Buildroot] [PATCH] libtool: revert a commit which
 re-introduced an already fixed problem
In-Reply-To: <5329B2A4.9080802@imgtec.com>
References: <1395078022-37381-1-git-send-email-Vincent.Riera@imgtec.com>
 <87txaw4gwt.fsf@dell.be.48ers.dk> <5327F9E1.1020301@mind.be>
 <532823A9.9010603@imgtec.com> <53294D50.3040800@mind.be>
 <53296606.9070104@imgtec.com> <5329A0A3.9020805@mind.be>
 <5329ACA1.2030105@imgtec.com> <5329B175.80101@mind.be>
 <5329B2A4.9080802@imgtec.com>
Message-ID: <5329C480.5010702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/03/14 16:07, Vicente Olivert Riera wrote:
> On 03/19/2014 03:02 PM, Arnout Vandecappelle wrote:
>> On 19/03/14 15:41, Vicente Olivert Riera wrote:
>>> On 03/19/2014 01:50 PM, Arnout Vandecappelle wrote:
[snip]
>>>>    Okay, the issue is that that defconfig enables libtool for the
>>>> target,
>>>> and autoreconf adds $(STAGING_DIR)/usr/share/aclocal to the include
>>>> path.
>>>> So the unpatched libtool will take precedence.
>>>
>>> Hello Arnout,
>>>
>>> do you mean that enabling only BR2_PACKAGE_LIBTOOL and
>>> BR2_PACKAGE_LIBISCSI you can reproduce the failure?
>>
>>   I haven't tried that specifically, but I think yes.
> 
> I have tried it, and the failure is not reproduced with those options
> only. That's why I used the full config file from the autobuild report.

 Yeah, that's because libtool normally comes after iscsi, but in the
autobuild failure gst-plugins-good is built first and that depends on
pulseaudio and that depends on libtool.


> 
>>   But actually, I think the easier solution is to just bump libtool to
>> 2.4.2.444. I'm going to run some tests on that and see how far we get.
> 
> I see, you want to bump to a version with the upstream patch already
> included, so the autoconf won't be triggered because your are not
> patching the m4 file.

 Exactly.

 But unfortunately the .444 "release" is just a git snapshot, without
configure script, so that doesn't solve the problem.

 Possible approaches:

1. Apply the patch to the libtool.m4 in staging as well.

2. Revert to a normal patch, and avoid reconf by touching the generated
files.

3. Ask upstream to create a new release.


 I'll send a patch for (2) and do (3) as well.


 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
