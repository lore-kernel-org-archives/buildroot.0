From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Mar 2017 15:42:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/mke2img: use mkfs to generate
 rootfs image
In-Reply-To: <20170318143054.GA3716@free.fr>
References: <1488445576-12857-1-git-send-email-sebastien.szymanski@armadeus.com>
 <20170318143054.GA3716@free.fr>
Message-ID: <fd3189d4-f955-ac9a-8d60-73c6080275f7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-03-17 15:30, Yann E. MORIN wrote:
> S?bastien, All,
> 
> On 2017-03-02 10:06 +0100, S?bastien Szymanski spake thusly:
>> mkfs is now capable of generating rootfs images. Use mkfs intead of
>> genext2fs.
>>
>> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> 
> So, to sumarize the discussion in this thread, and a discussion Thomas,
> Arnout and I just had on IRC:
> 
>  1. mke2fs can't auto-calculate the size;
> 
>  2. auto-calculation is inherently flawed, because it relies on the host
>     filesystem specifics;
> 
>  3. so we want the user to be responsible for specifying the exact size
>     he wants for his extfs;
> 
>  4. we don't care much about generating filesystems that are bckward
>     identical (i.e. we don;t care if the enerated filesystem does not
>     have the same feature set as was previously done);
> 
>  5. except we want to drop features that make it incompatible with older
>     U-Boot or other bootlaoders, or older kernels, but that should be
>     optional.
> 
>  6. can we kill most of mke2img, or can we even kill it altogether? ;-)

 So what we would like to see is something like the following patches:

1. Remove support for auto-calculation of BR2_TARGET_ROOTFS_EXT2_BLOCKS
   (move BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS to Config.in.legacy).
2. Switch to mkfs to generate the rootfs image (i.e. this patch).
3. Remove the mke2img package altogether, instead call mke2fs directly from
fs/ext2/ext2.mk
4. Switch BR2_TARGET_ROOTFS_EXT2_BLOCKS to a string so that you can specify
   120M instead of 120000000 - and also give it a reasonable default value.

 Do you feel up to it?

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
