From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Dec 2012 08:18:51 +0100
Subject: [Buildroot] [PATCH] [RFC] new target: live filesystem
In-Reply-To: <70774b99-43cc-46e9-a3ad-f9f9addb06da@zimbra2.corp.accelance.fr>
References: <70774b99-43cc-46e9-a3ad-f9f9addb06da@zimbra2.corp.accelance.fr>
Message-ID: <50BEF55B.2010403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/12/12 14:42, Jeremy Rosen wrote:
>
>>> +
>>> +define ROOTFS_LIVE_CMD
>>> + sudo rsync -a --no-o --no-g --delete-during $(TARGET_DIR)/
>>> $(BR2_TARGET_ROOTFS_LIVE_DEST)/
>>> +endef
>>
>> Do we really want to include sudo commands in Buildroot? I'm not sure
>> we want.

  I don't see a fundamental problem with using sudo within buildroot,
as long as it's not for things that can be fakerooted.

[snip]
>>
>> What about instead a post-image script hook, that users can use to
>> extract automatically the tarball image somewhere?
>>
>
> yes, that would work too, I can do that locally to solve my particular problem, but I don't think you would accept it upstream either. If you consider that deploying the live filesystem is not buildroot's job, fine I'll probably do it with post-build scripts instead, but I personally believe that NFS is the most common target and that doing it in buildroot-core is more convinient and makes more sense
>
> pos-install scripts needs to be rewritten by each user, and doing it manually is a bit error prone (especially if you have lots of devs sharing a buildroot project through git, you can have weird side effects with people not cleaning before deplying the new FS)

  +1 to that.

  For me, buildroot should make it *easy* to:

- get an initial system up and running (quickly);

- develop for the target board;

- offer a reproducible and shareable build system.

  We already do very well on all three counts, but we can
always improve.


  In addition, the NFS stuff is a FAQ.  And FAQs are bugs,
really.


  Regards,
  Arnout


> again, I personally think this use-case makes sense, especially in big teams where some members don't want to learn what NFS is (yeah, sounds stupid, but it does happen) and I don't think there are any major drawback (we test sudo properly, we only call it for a specific use-case where it is really needed) except the philosophical question of "should a build tool use a tool giving root-priv like sudo" which in the case of NFS doesn't change much since the user will have to use it himself (either directly or trough post-image script).
>
> I'd really think it makes sense in a "type make, reboot the target, test your change" philosophy which matches really well the idea behind NFS based developement, but it's your call as with any core change...
>
> Regards
> J?r?my

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
