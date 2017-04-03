From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Apr 2017 15:54:46 +0200
Subject: [Buildroot] [RFC 4/4] board/acmesystems/aria-g25: set
 BR2_GENIMAGE_CFG_FILES
In-Reply-To: <6948dd58-dd05-8b72-6249-7c230035c62c@andin.de>
References: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
 <20170329145120.11863-5-etienne.phelip@savoirfairelinux.com>
 <ccc877c5-1ea5-e2d6-1739-c913f4d6d0a7@mind.be>
 <f2428cf7-660e-f22d-0e5e-4b22e1abf870@andin.de>
 <4d773ae6-949d-800e-938b-f9780b25c2e9@mind.be>
 <6948dd58-dd05-8b72-6249-7c230035c62c@andin.de>
Message-ID: <b10839b0-389e-f445-ab41-269480c387e3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-04-17 15:01, Andreas Naumann wrote:
>>> What I was thinking about in the past would be a deeper integration of genimage
>>> in buildroots filesystem configuration, actually generating the genimage config.
>>> But so far it was not worth the effort for me.
>>
>>  We have considered that in the past. The problem is that genimage doesn't
>> support some of the options that we do. Otherwise, however, it would be really
> 
> Are you refering to filesystem-specific options or missing ones like axfs,
> cloop, cramfs?

 I'm refering to filesystem-specific options. E.g. AFAIK genimage doesn't allow
configuration of ext2 #inodes or reserved blocks, or UBIFS max LEB count or
compression.


>> nice to remove all our messy filesystem handling code and just generate a
>> genimage.cfg file...

 And my point here is: we could just extend genimage with all those options.
Then we can use genimage instead of our rootfs handling. For the most part, the
rootfs infra could be reduced to a single genimage.cfg file.

 But as usual: all that would be nice in a way, but doesn't give us any direct
advantage over what we have now, and what we have now works.


>>
>>  OTOH we also considered that a full image typically needs more than just a
>> single filesystem, so generating a genimage.cfg for part of the image seems a
>> bit pointless.
> 
> I dont quite understand. Do you mean combining e.g. a standard and a rescue system?

 In practice, you rarely use the .ext2 or .ubifs image produced by Buildroot
directly; instead, you'll embed it into a larger image that is a lot more
complicated than e.g. the .ubi image offered by Buildroot (because you'd want a
writeable data volume in addition to the ubifs rootfs).

 So if we would use genimage for generating the .ext2 rootfs itself, then in
practice you'll often end up running genimage twice: once for the .ext2 rootfs,
and a second time to integrate it in a larger image.


 Coming back to the BR2_GENIMAGE_CFG_FILES option: actually it would make a
whole lot more sense if the genimage were executed under fakeroot, because then
we no longer need to generate the .ext2 subimage.

 Still, there is hardly any advantage over having this as an explicit option
rather than configuring

BR2_ROOTFS_POST_FAKEROOT_SCRIPT="support/scripts/genimage.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="-c path/to/my/genimage.cfg"

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
