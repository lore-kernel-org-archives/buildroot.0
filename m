From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 23:26:37 +0200
Subject: [Buildroot] [PATCH 1/1] iputils: set the permissions with
 IPUTILS_PERMISSIONS
In-Reply-To: <20190610200645.GA10261@x230>
References: <20190609230702.7068-1-petr.vorel@gmail.com>
 <4bdc9d15-b7c2-3b46-bdda-306147fa8d94@mind.be> <20190610200645.GA10261@x230>
Message-ID: <7191f609-e5d8-7bd6-77ca-83296f96d0f1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/06/2019 22:06, Petr Vorel wrote:
> Hi Arnout,
> 
>>  Applied to master, thanks. I updated the commit message a little.
> Thanks! You've been faster, I might try to think about setcap (xattr) use if
> USE_CAP=true, and setuid if USE_CAP=false.

 Great!

> Is there an easy way to detect
> iso9660 usage?

 BR2_TARGET_ROOTFS_ISO9660 of course. Well, that one is special actually because
in case of BR2_TARGET_ROOTFS_INITRAMFS or BR2_TARGET_ROOTFS_ISO9660_INITRD, the
rootfs is not actually stored in the iso9660.

 But I don't know which other filesystems lack support for xattrs.

 So maybe just assume the filesystem supports xattrs, we can fix things later if
needed.

> (+ setcap being available on host).

 setcap can't be used, since setting xattrs can only be done by root and we're
not root while building. It could be used when running in a fakeroot
environment, but I believe fakeroot is a bit flakey when it comes to
capabilities. So the appropriate xattrs should instead be set with
IPUTILS_PERMISSIONS.

 Regards,
 Arnout


> I'm not aware any other xattr limitations thatn iso9660.
> 
>>> it'd be great also create symlink ping -> ping6, but don't know how.
> 
>>  This can be done with a post-install hook.
> Thanks, I'll do it in separate patch sometimes this week.
> 
>>  Also, the bump to s20190515 should not have removed the traceroute6 program.
>> Could you make a second patch that adds it back?
> Sure, I'll try to do it this week.
> 
>>  Regards,
>>  Arnout
> 
> Kind regards,
> Petr
> 
