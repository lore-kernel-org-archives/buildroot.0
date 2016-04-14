From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Apr 2016 10:33:35 +0200
Subject: [Buildroot] [PATCH 01/15] fs: add genimage infra
In-Reply-To: <20160413234135.6bf26795@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 13 Apr 2016 23:41:35 +0200")
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460577820-32164-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <570EBAE6.1080000@mind.be>
 <20160413234135.6bf26795@free-electrons.com>
Message-ID: <87a8kwio80.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

>> # Make sure the genimage dependencies appear in graph-depends
 >> show-targets:
 >> @echo $(ROOTFS_GENIMAGE_DEPENDENCIES)

 > But then is it really something that belongs to fs/ ? It really isn't a
 > filesystem.

No, it is closer to the post-image script. Where do you suggest to move
it? system/?


 >> However, I'm afraid that we're moving a bit too fast after all. There are 
 >> several open issues still:
 >> 
 >> - Do post-image scripts come before or after genimage?
 >> - What with the dosfstools/mtools dependency?
 >> - Should we support genimage.cfg files that are generated from a post-image script?
 >> - Should we support several genimage.cfg files, producing several images (e.g. a 
 >> NAND and a SD image)?
 >> 
 >> So, the current approach works well for the bundled defconfigs, but for real 
 >> use cases I think it's a bit too limited to be practical after all.

 > Do we need to support all real use cases? I think we should support the
 > common use cases, and the more complicated use cases can be handled via
 > a special post-image script. That's really the general philosophy of
 > Buildroot IMO: handle the most common cases nicely, and leave enough
 > extension scripts/hooks to allow people to plug their scripts to handle
 > the more complicated/specific cases.

Agreed, but it is good to think about the questions Arnout listed to
think about what is really the common use case.

The definition of the post-image script was to run something at the very
end, so I think we should do genimage before post-image (even though I
could imagine use cases for the opposite as well).

For the dosfstools/mtools dependencies I think a simple sub option
pulling them in is most sensible.

Supporting multiple genimage.cfg files (like we do for device_tables /
post-build / post-image, ..) IMHO makes sense and looks simple to do.

-- 
Venlig hilsen,
Peter Korsgaard 
