From: Sebastian Frias <sf84@laposte.net>
Date: Mon, 25 Apr 2016 14:44:56 +0200
Subject: [Buildroot] [PATCH] linux: use $(LINUX_INSTALL_IMAGE_CMDS)
 instead of plain 'cp'
In-Reply-To: <20160425142345.454fc66a@free-electrons.com>
References: <571E0683.4080306@laposte.net>	<20160425140615.11e86412@free-electrons.com>	<571E0AEE.3010002@laposte.net>
 <20160425142345.454fc66a@free-electrons.com>
Message-ID: <571E1148.2070306@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 04/25/2016 02:23 PM, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 25 Apr 2016 14:17:50 +0200, Sebastian Frias wrote:
> 
>>>>  	# Build the kernel.
>>>>  	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D)
>>>> $(LINUX_TARGET_NAME)
>>
>> This line is also present on LINUX_BUILD_CMDS, any reason not to reuse it?
>> LINUX_BUILD_CMDS does a couple of more things than what is done here,
>> like like running LINUX_BUILD_DTB or 'make modules', and maybe that is
>> not wanted?
> 
> We don't want to do "make modules" again, as this will change the root
> filesystem (surely by reinstalling the same thing, but still), while we
> are exactly in the process of adding the filesystem to the kernel image.

Ok, thanks for the explanation.

> 
>>> I think I would prefer to have:
>>>
>>> 	$(call LINUX_INSTALL_IMAGE,$(BINARIES_DIR))
>>
>> Ok, just wondering, why? I mean, IIUC, LINUX_INSTALL_IMAGES_CMDS also
>> handles the DTB copy when APPENDED_DTB is not set, right?
> 
> It also copies the DTB to $(BINARIES_DIR), which is useless here. And in
> general, I don't like too much seeing the _CMDS variables called from
> other variables.

Ok, just one last question because I seem to be missing something here.

In your commit 055e6162bba7 ("linux: don't build appended DTB image in
place and support multiple images") you indicated:

-----
<snip>
    Some of the tested configuration:

     - Normal uImage with several DTBs

       BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7"
       BR2_LINUX_KERNEL_UIMAGE=y
       BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x200000"
       BR2_LINUX_KERNEL_DTS_SUPPORT=y
       BR2_LINUX_KERNEL_INTREE_DTS_NAME="armada-xp-matrix armada-xp-gp
armada-370-mirabox"

       Contents of output/images/:

       armada-370-mirabox.dtb  armada-xp-gp.dtb  armada-xp-matrix.dtb
uImage
<snip>
-----

Hence, the DTB images are intended to be copied to output/images/ under
some circumstances, right?
How would that work? I mean, there's no call to LINUX_INSTALL_DTB on
"$(LINUX_DIR)/.stamp_initramfs_rebuilt".
Or does that happens through LINUX_INSTALL_TARGET_CMDS and
package/pkg-generic.mk's "$(BUILD_DIR)/%/.stamp_target_installed" target?
In that case I think I don't understand why we enter in
"$(LINUX_DIR)/.stamp_initramfs_rebuilt" target, given there's a target
$(BUILD_DIR)/%/.stamp_images_installed that calls LINUX_INSTALL_IMAGES_CMDS.

Best regards,

Sebastian
