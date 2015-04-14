From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Apr 2015 21:08:51 +0200
Subject: [Buildroot] [git commit] fs: add rootfs dependencies to PACKAGES
In-Reply-To: <20150414135424.3b1ab04a@free-electrons.com>
References: <20150414081954.EF1607F9E1@busybox.osuosl.org>	<552CF0E1.5090205@mind.be>
 <20150414135424.3b1ab04a@free-electrons.com>
Message-ID: <552D65C3.6010106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/04/15 13:54, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Tue, 14 Apr 2015 12:50:09 +0200, Arnout Vandecappelle wrote:
> 
>>> diff --git a/fs/common.mk b/fs/common.mk
>>> index cac127f..41ee86d 100644
>>> --- a/fs/common.mk
>>> +++ b/fs/common.mk
>>> @@ -106,6 +106,7 @@ rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1) $$(ROOTFS_$(2)_POST_TARGETS)
>>>  
>>>  ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
>>>  TARGETS_ROOTFS += rootfs-$(1)
>>> +PACKAGES += $$(ROOTFS_$(2)_DEPENDENCIES)
>>
>>  This will break the rest of your series for filesystems like ubi and initramfs
>> that depend on another filesystem, because filesystems are not really packages
>> so they shouldn't be in PACKAGES.
> 
> Aaah, indeed. Thanks a lot for catching this!
> 
> But I believe the package dependencies should be in PACKAGES, so that
> "make external-deps", "make legal-info", "make source" and so on
> properly take into account the packages needed as a dependency of
> building a rootfs image.

 Yes of course.

> 
> I can see several solutions here:
> 
>  1) In the fs infrastructure, separate package dependencies from
>     filesystem dependencies, like ROOTFS_UBI_FS_DEPENDENCIES =
>     rootfs-ubifs, and ROOTFS_UBIFS_PACKAGE_DEPENDENCIES = host-mtd.
>     This is probably the easiest solution, maybe not the prettiest one.

 I'm not fond of this since it looks pretty complicated.

> 
>  2) Simply filter out from $$(ROOTFS_$(2)_DEPENDENCIES) the targets
>     that start with 'rootfs-' when adding them to the PACKAGES variable.
>     Maybe not that pretty either, but very simple to do.

 Sounds acceptable, though not ideal.

> 
>  3) Adjust the fs infrastructure so that the rootfs-<foo> targets will
>     also have rootfs-<foo>-legal-info, rootfs-<foo>-source,
>     rootfs-<foo>-source-check and so on, a bit like we already
>     implement rootfs-<foo>-show-depends.

 Then you can just as well go for 4). And anyway that's not enough because I
think you have a circular dependency due to target-finalize.

> 
>  4) Make the filesystem image stuff real packages. After all, they
>     install something to $(BINARIES_DIR) and some other packages do it.
>     Of course, the big difference is that they should have a special
>     type so that they get built only after all other packages have been
>     built/installed, the post-build scripts, overlay and so on have
>     been handled.

 This sounds more attractive to me, but as you say it's a lot of work.

 I think to make this possible we first have to converge to the solution where
every package has a selected kconfig symbol, so PACKAGES can just be the list of
selected target packages instead of relying on the contents of _DEPENDENCIES.


 So for now, I'd go for option 2. I've checked and it looks like rootfs-* are
the only non-package dependencies that appear anywhere (I can't be 100% sure
though).


 Regards,
 Arnout


> (1), (2) and (3) are pretty easy, (4) is a lot more work, and I don't
> know if the result will be very useful, but I don't know.
> 
> Thoughts?
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
