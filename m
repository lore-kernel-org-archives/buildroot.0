From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 13 Sep 2013 23:50:46 +0200
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot
	customization
In-Reply-To: <20130912221256.GE3362@free.fr>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF0AEEFBDE.5291EB54-ON86257BE3.0005DA76-86257BE3.00087A88@rockwellcollins.com>
 <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
 <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate> <52323A54.7020808@mind.be>
 <20130912221256.GE3362@free.fr>
Message-ID: <523388B6.7090305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/09/13 00:12, Yann E. MORIN wrote:
> On 2013-09-13 00:04 +0200, Arnout Vandecappelle spake thusly:
[snip]
>> but the GPL is pretty
>> clear on this:
>>
>> "If identifiable sections of that work are not derived from the Program,
>> and can be reasonably considered independent and separate works in
>> themselves, then this License, and its terms, do not apply to those
>> sections when you distribute them as separate works."
>>
>>   i.e. you can distribute the source of buildroot itself separately from your
>> external directory.
>
> Yes, but I believe BR2_EXTERNAL *is* a derived work of Buildroot, so as
> such should be licensed under a license compatible with Buildroot's.
>
>>   As long as your external stuff merely aggregates with the GPL'd stuff under
>> buildroot, there shouldn't be an issue.
>
> But that's not aggregation in my opinion, since it does leverage all or
> parts of the Buildroot infrastrucutre, and was clearly written with this
> intent, and as such can not be considered mere aggregation.
>
> Of course, all this only applies _if and when_ BR2_EXTERNAL gets
> distributed to a third party.

  The more I think about it, the more confused I get :-) Although your 
other reply to Andy sums things up pretty clearly.

  Let me try out a few scenarios (I'm making things up as I go here).

  I have made some changes to buildroot, and I have also made an external 
tree.


1. I want to distribute the modified buildroot tree to someone. Do I also 
have to make the external one available?

  => No, because the buildroot tree in fact doesn't refer to the external 
tree. You run "BR2_EXTERNAL=... make".


2. I distribute a rootfs which contains a GPL program (bash). Do I have 
to make the buildroot tree available?

  => Yes, because I have to make the build scripts for bash available, 
and buildroot is the build script that I've used.


3. I use buildroot to build lua. I copy the lua executable out of the 
target/ tree and distribute it. Do I have to make the buildroot tree 
available?

  => No, because lua is MIT licensed.


4. I distribute a rootfs which contains a GPL program (bash). It also 
contains a proprietary program (foo). I have added a foo.mk file to the 
buildroot tree to build my proprietary program. Do I have to make the 
modified buildroot tree available?

  => Probably not. I have to make the build script for bash available, 
but the original buildroot tree already does the job.

  I believe that this reasoning holds regardless of whether the foo.mk is 
added directly in the buildroot tree or through BR2_EXTERNAL (or through 
override.mk).


5. I add a proprietary binary to the default skeleton and distribute the 
rootfs built by buildroot. Do I have to make the modified buildroot with 
the proprietary binary available?

  => I don't think so, because the proprietary binary is merely 
aggregated with the rest of the buildroot-generated stuff.


6. Can I give the buildroot tree + the external tree to someone else?

  => Yes, but only under the GPL - the GPL applies to the external tree 
as well.



  After thinking about it this much, it looks like the buildroot license 
is a lot more lenient than I first thought. But of course, I don't really 
now.


  Maybe we should organize a discussion about this in the legal track at 
FOSDEM.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
