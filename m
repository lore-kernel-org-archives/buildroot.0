From: MOHAMMAD RASIM <mohammad.rasim96@gmail.com>
Date: Thu, 12 Jul 2018 00:45:50 +0300
Subject: [Buildroot] At what stage the init script is created and can be
 used within the post build script?
In-Reply-To: <89a3cb0b-1fda-0031-ba57-c511ea5d542f@mind.be>
References: <93b3645f-29f9-6864-5177-ec8ca41474fb@gmail.com>
 <89a3cb0b-1fda-0031-ba57-c511ea5d542f@mind.be>
Message-ID: <40826fa3-1ab1-65a0-cc1d-8354696185fe@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yeah I was trying to avoid using overlay, I guess I don't have a choice now.
Thanks
On 07/11/2018 11:58 PM, Arnout Vandecappelle wrote:

>
> On 11-07-18 13:55, MOHAMMAD RASIM wrote:
>> Hi,
>> I'm building buildroot as a cpio initramfs (BR2_TARGET_ROOTFS_CPIO=y) and I have
>> a post build script that edits the /init script like so:
>> sed -i "s/something/anotherthing/" ${TARGET_DIR}/init
>> The script worked fine when I used buildroot-2018.02.3 but now I want to build
>> using the latest buildroot from git repo(master branch, latest commit is
>> 0ce56fbdf6469cf9bbda168ffe75480ae811acaa as of writing this messege) and the
>> script can't find the /init script and errors out:
>>
>> |sed: can't read /home/mohammad/buildroot/output/target/init: No such file or
>> directory
>>
>> |so clearly the init script is not created until the cpio archive is created.
>   Indeed, the filesystem generation steps no longer modify $(TARGET_DIR).
> Instead, they get their own private directory to work in. So the /init script
> will only appear in the cpio archive, not in the target directory or in the tarball.
>
>> So how can I access the /init script from the post-build script ?
>   The easiest is: instead of using sed to update the init script, add a complete
> init script in the rootfs overlay (BR2_ROOTFS_OVERLAY). That's what I usually do.
>
>   Alternatively, but IMO ugly, you could add the following in an external.mk:
>
> define ROOTFS_CPIO_UPDATE_INIT
> 	sed -i "s/something/anotherthing/" ${TARGET_DIR}/init
> endef
>
> ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_UPDATE_INIT
>
>
>   Regards,
>   Arnout
>
>
>> Thanks
>> ||
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
