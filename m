From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 19 Oct 2014 22:27:11 +0200
Subject: [Buildroot] [PATCH 1/3] qemu-system: new package
In-Reply-To: <5441BEDE.1000102@zacarias.com.ar>
References: <1399148415-27648-1-git-send-email-gustavo@zacarias.com.ar>
 <20141012171752.29414e94@free-electrons.com>
 <543AD090.3000107@zacarias.com.ar> <543EA87A.2050204@mind.be>
 <543FCDD6.9070104@zacarias.com.ar> <54419C9C.7050705@mind.be>
 <5441BEDE.1000102@zacarias.com.ar>
Message-ID: <54441E9F.8080802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/10/14 03:14, Gustavo Zacarias wrote:
> On 10/17/2014 07:47 PM, Arnout Vandecappelle wrote:
> 
>>> potentially miss the opportunity for new arch and/or platform support.
>>> So even if target != host version is fixed/possible you'll still clash
>>> on host-qemu (user) vs. host-qemu (system) versions since you might want
>>> to do the perl module dance (original purpose of host-qemu) vs. platform
>>> emulation.
>>
>>  This one I don't understand. If you need version 2.0.2 for host-qemu-system,
>> then surely you also need this version for host-qemu-user? So what is the point
>> of treating them as separate packages? Isn't it much easier to build qemu-user
>> and qemu-system in one shot (like how it's done for the target qemu)?
> 
> The only shared code in qemu for user vs. system is just basically CPU
> emulation.
> For system you've got all of the hardware (audio/ hw/ net/ directories
> and so on) which isn't used by user at all.
> For user it deals with what we can call "ABI" (userland, linux-user/ dir
> in qemu) which isn't used by system at all, and has arch bits as well.
> When there are system emulations broken with the latest version of qemu
> it isn't necessarily a problem with the cpu emulation, the same can
> happen to user emulation without affecting system.
> So if you're like 100% sure user both will work right if system does for
> X version go ahead, i don't think it's a safe assumption.
> Just google around a bit:
> https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1284344
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=668658

 So what I hear you say is that there really is a case for specifying the
qemu-user and qemu-system version separately, and that that's what this whole
discussion really is about. And I guess you may want to build at the same time a
host-qemu-user of one version and a host-qemu-system of another version, correct?

 Still, the .mk file of qemu-user and qemu-system are 90% the same. It would be
nice to be able to factor that out somehow. However, it makes complete sense to
have them as separate packages first and merge them later.

 So the question is: is the need for separate host-qemu-system and
host-qemu-user versions more important than the additional complexity of
specifying a nearly-identical .mk file twice?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
