From: Robert Heywood <robert.heywood@codethink.co.uk>
Date: Wed, 22 Aug 2018 14:10:48 +0100
Subject: [Buildroot] [PATCH 2/2] Adding btrfs rootfs option.
In-Reply-To: <20180821202707.GP15347@scaer>
References: <20180821160412.28757-1-robert.heywood@codethink.co.uk>
 <20180821160412.28757-2-robert.heywood@codethink.co.uk>
 <20180821202707.GP15347@scaer>
Message-ID: <d8c27acc-81be-e5f2-08d1-c80a3f9d9a96@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,
thanks for the through review :)
Comments inline.

On 21/08/18 21:27, Yann E. MORIN wrote:
> Robert, All,
> 
> On 2018-08-21 17:04 +0100, Robert J. Heywood spake thusly:
>> This patch makes it possible to format the rootfs using btrfs.
>> Introduces the option; BR2_TARGET_ROOTFS_BTRFS
>>
>> When selected, the user is able to specify the filesystem size,
>> label, options, and node and sector sizes.
>> The new files are based on fs/ext2/{Config.in,ext2.mk}
> 
> Nice addition! :-)
> 
>> Signed-off-by: Robert J. Heywood <robert.heywood@codethink.co.uk>
> [--SNIP--]
>> +config BR2_TARGET_ROOTFS_BTRFS_SIZE_NODE
>> +	string "btree node size"
>> +	help
>> +	  The tree block size in which btrfs stores metadata. The default
>> +	  value is 16KiB (16384) or the page size, whichever is bigger.
> 
> How is the page size detected? I'd like to be sure this is detecting the
> page size of the target, not that of the build machine.
> 
> Also, is it possible to indicate the size with a 'k' like for the fs
> size, or must it be only bytes?
> 

Good question.
I guess because the makefile creates a sparse file with fallocate which 
mkfs.btrfs then formats, it won't be able to detect any page size (host or 
otherwise) and so will always be set to a default value of 16384.
I'll set that in the Config file explicitly.

It's possible to specify the size in kilobytes, ie 4k for 4096.
I can change the help text to reflect this.

>> +	  Must be a multiple of the sectorsize, but not larger than 64KiB
>> +	  (65536).
>> +
>> +config BR2_TARGET_ROOTFS_BTRFS_SIZE_SECTOR
>> +	string "sector size"
>> +	help
>> +	  The default value is the page size and is autodetected. If the
>> +	  sectorsize differs from the page size, the created filesystem
>> +	  may not be mountable by the kernel. Therefore it is not
>> +	  recommended to use this option unless you are going to mount it
>> +	  on a system with the appropriate page size.
> 
> Given that the filsystem is specifically made for the target that will
> mount it, does it make sense to ffer that option at all? I.e. if the
> target uses a 4KiB page size, does it make sense to generatea rootfs
> that has a different secotr size, and thus not mountable on the target
> at all?
> 
> My suggestion: don't add that option.
> 

On my system (building for a raspi0) it autodetects the sector size to be 4k, 
and the resulting image is bootable. However I'm worried the host won't be able 
to detect the correct value for the target. In such a case I can see why it 
would be useful to set the sector size explicitly.

Is there another place where the sector size is specified? If so, it might be 
better to use the existing value instead.

>> +config BR2_TARGET_ROOTFS_BTRFS_FEATURES
>> +	string "Filesystem Features"
>> +	help
>> +	  A comma separated string of features that can be enabled
>> +	  during creation time.
>> +	  For a list of available options, use; `mkfs.btrfs -O list-all`
> 
> Nice. I guess that has to be done using the host-btrfs we built, as its
> feature list may be different than the one from the build machine.
> 

I can change the help text to include the full path to the binary.

>> +endif # BR2_TARGET_ROOTFS_BTRFS
>> diff --git a/fs/btrfs/btrfs.mk b/fs/btrfs/btrfs.mk
>> new file mode 100644
>> index 0000000000..9f474edac3
>> --- /dev/null
>> +++ b/fs/btrfs/btrfs.mk
>> @@ -0,0 +1,45 @@
>> +################################################################################
>> +#
>> +# Build the btrfs root filesystem image
>> +#
>> +################################################################################
>> +
>> +BTRFS_SIZE = $(call qstrip,$(BR2_TARGET_ROOTFS_BTRFS_SIZE))
>> +ifeq ($(BR2_TARGET_ROOTFS_BTRFS)-$(BTRFS_SIZE),y-)
>> +$(error BR2_TARGET_ROOTFS_BTRFS_SIZE cannot be empty)
>> +endif
>> +
>> +BTRFS_SIZE_NODE = $(call qstrip,$(BR2_TARGET_ROOTFS_BTRFS_SIZE_NODE))
>> +BTRFS_SIZE_NODE_FLAG = $(if $(BTRFS_SIZE_NODE),--nodesize "$(BTRFS_SIZE_NODE)",)
>>
>> +BTRFS_SIZE_SECTOR = $(call qstrip,$(BR2_TARGET_ROOTFS_BTRFS_SIZE_SECTOR))
>> +BTRFS_SIZE_SECTOR_FLAG = $(if $(BTRFS_SIZE_SECTOR),--sectorsize "$(BTRFS_SIZE_SECTOR)",)
>> +
>> +BTRFS_FEATURES = $(call qstrip,$(BR2_TARGET_ROOTFS_BTRFS_FEATURES))
>> +BTRFS_FEATURES_FLAG = $(if $(BTRFS_FEATURES),--features "$(BTRFS_FEATURES)",)
>> +
>> +# qstrip results in stripping consecutive spaces into a single one. So the
>> +# variable is not qstrip-ed to preserve the integrity of the string value.
>> +BTRFS_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_BTRFS_LABEL))
>> +## ")
> 
> Why double comment here?
> 

There is no reason for that. It was added when I first copied the ext2.mk file 
and commented out everything.
I'll remove one of them.

>> +BTRFS_OPTS = \
>> +	-r $(TARGET_DIR) \
>> +	-L "$(BTRFS_LABEL)" \
>> +	$(BTRFS_SIZE_NODE_FLAG) \
>> +	$(BTRFS_SIZE_SECTOR_FLAG) \
>> +	$(BTRFS_FEATURES_FLAG)
> 
> It is a bit annoying that you have to qstrip the variables, just to
> re-add double quotes right after. However, I prefer the way you do it,
> because then it is obvious the strings are quotted when passed to the
> shell.
> 
> Furhtermore, I would quote with single quotes, to avoid shell expansion.

Sure thing.

> 
> Also, no need for the trailing comma when there is no 'else' clause.

I didn't know that! :)

> 
> No need for intermediate variables for each option; just directly set
> the BTRFS_OPTS variable.
> 
> Finally, the label case is a bit annyoing, but here is no better
> solution, and is exactly what we do in ext2.mk.
> 
>      BTRFS_SIZE_NODE = $(call qstrip,$(BR2_TARGET_ROOTFS_BTRFS_SIZE_NODE))
>      BTRFS_SIZE_SECTOR = $(call qstrip,$(BR2_TARGET_ROOTFS_BTRFS_SIZE_SECTOR))
>      BTRFS_FEATURES = $(call qstrip,$(BR2_TARGET_ROOTFS_BTRFS_FEATURES))
>      # qstrip results in stripping consecutive spaces into a single one. So the
>      # variable is not qstrip-ed to preserve the integrity of the string value.
>      BTRFS_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_BTRFS_LABEL))
>      # ")
> 
>      BTRFS_OPTS = \
>          -r '$(TARGET_DIR)' \
>          -L '$(BTRFS_LABEL)' \
>          $(if $(BTRFS_SIZE_NODE),--nodesize '$(BTRFS_SIZE_NODE)') \
>          $(if $(BTRFS_SIZE_SECTOR),--sectorsize '$(BTRFS_SIZE_SECTOR)') \
>          $(if $(BTRFS_FEATURES),--features '$(BTRFS_FEATURES)')
> 

Good suggestions.

>> +
>> +ROOTFS_BTRFS_DEPENDENCIES = host-btrfs-progs
>> +
>> +define ROOTFS_BTRFS_CMD
>> +	rm -f $@
>> +	fallocate -l $(BTRFS_SIZE) $@
> 
> Is fallocate really necessary here? If the host's filesystem is too
> small to accomodate the image, then the mkfs.btrfs below fill fail; we
> don't need fallocate to fail.
> 
> Besides, is fallocate readilly available on all distros?
> 
> Usually, we use truncate(1) to that effect; see for example:
>      support/testing/tests/fs/test_ubi.py at 29
> 

fallocate is used here because (unlike other mkfs programs) you can't specify a 
size and have mkfs.btrfs create an image file for you. It needs a sparse file to 
work with.

I'll be happy to change this to truncate, as per your example.

> Regards,
> Yann E. MORIN.
> 
>> +	$(HOST_DIR)/bin/mkfs.btrfs $(BTRFS_OPTS) $@ \
>> +	|| { ret=$$?; \
>> +	     echo "*** Maybe you need to increase the filesystem size (BR2_TARGET_ROOTFS_BTRFS_SIZE)" 1>&2; \
>> +	     exit $$ret; \
>> +	}
>> +endef
>> +
>> +$(eval $(rootfs))
>> -- 
>> 2.11.0
>>

regards, rob
