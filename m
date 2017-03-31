From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 31 Mar 2017 18:34:38 +0200
Subject: [Buildroot] [RFC 4/4] board/acmesystems/aria-g25: set
 BR2_GENIMAGE_CFG_FILES
In-Reply-To: <f2428cf7-660e-f22d-0e5e-4b22e1abf870@andin.de>
References: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
 <20170329145120.11863-5-etienne.phelip@savoirfairelinux.com>
 <ccc877c5-1ea5-e2d6-1739-c913f4d6d0a7@mind.be>
 <f2428cf7-660e-f22d-0e5e-4b22e1abf870@andin.de>
Message-ID: <4d773ae6-949d-800e-938b-f9780b25c2e9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31-03-17 09:46, Andreas Naumann wrote:
> Hi Phelip,
> 
> Am 31.03.2017 um 00:51 schrieb Arnout Vandecappelle:
>>
>>  I'm still not entirely sure if this new option is worthwhile. Without it, you
>> would instead need
>>
>> BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>> BR2_ROOTFS_POST_SCRIPT_ARGS="board/acmesystems/aria-g25/genimage.cfg"
>>
>> Not really complicated either... The only real advantage I see is that it
>> motivates people more to use genimage (which is otherwise a bit hidden). But for
>> that, a paragraph or two in docs/manual/customize-post-image.txt would also
>> work. By the way, even for this series an explanation of the option would be
>> required in that file.
>>
>>  What do the others think?
> 
> I have a slightly different use case than most genimage configs in buildroot
> right now. This is, I use genimage's ability to split my customized rootfs into
> multiple filesystems in order to give them them ro/writeable and other
> capabilities as appropriate.
> Thus to preserve ownership and such I need to run genimage under fakeroot.

 It would indeed make sense to run genimage under fakeroot, but then it'd need
to have some option to extract the tarball first. Actually, that's something
that could be added to the genimage.sh script at some point...

> Currently I do this explicitely in a post image script. An improvement I think
> about is switching to using the post fakeroot integration which buildroot
> provides since a while.
> 
> So unless this becomes some kind of option, your proposed change probably
> wouldnt work for me.

 It is certainly optional, you can always call genimage directly from you
post-image script. You can also call the genimage.sh script but I don't know if
that's useful in your case.

> What I was thinking about in the past would be a deeper integration of genimage
> in buildroots filesystem configuration, actually generating the genimage config.
> But so far it was not worth the effort for me.

 We have considered that in the past. The problem is that genimage doesn't
support some of the options that we do. Otherwise, however, it would be really
nice to remove all our messy filesystem handling code and just generate a
genimage.cfg file...

 OTOH we also considered that a full image typically needs more than just a
single filesystem, so generating a genimage.cfg for part of the image seems a
bit pointless.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
