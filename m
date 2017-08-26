From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 26 Aug 2017 18:08:28 -0300
Subject: [Buildroot] [RFC-next 1/2] fs/genimage: add logic to generate
 an image using genimage
References: <4bcea048-9283-4139-80c7-4c65b8675a31@mind.be>
Message-ID: <59a1e34c4998a_9071138fac6086@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Aug 24, 2017 at 08:33 PM, Arnout Vandecappelle wrote:

> On 23-08-17 22:45, Thomas Petazzoni wrote:
[snip]
>> +	   test "$(BR2_TARGET_ROOTFS_GENIMAGE_USES_VFAT)" != "y" ; then \
>> +		echo "ERROR: genimage configuration generates a VFAT filesystem" ; \
>> +		echo "       please enable BR2_TARGET_ROOTFS_GENIMAGE_USES_VFAT" ; \
>> +	fi
>> +	$(RM) -rf $(GENIMAGE_TMP)
>> +	$(HOST_DIR)/usr/bin/genimage --rootpath $(TARGET_DIR) \

I think you need to pass $(EXTRA_ENV) or a subset of it here, otherwise it will
not use mkdosfs from the host/ directory and will fail if it not pre-installed,
see:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/30257871
sh: 1: mkdosfs: not found

>> +		--tmppath $(GENIMAGE_TMP) \
>> +		--inputpath $(BINARIES_DIR) \
>> +		--outputpath $(BINARIES_DIR) \
>> +		--config $(GENIMAGE_CFG_FILE)
> 
>  So the idea is to drop the genimage.sh script entirely? Hm, in the light of the
> longer-term vision, I think things will become more and more complicated so
> delegating it to a script sounds like the right thing to do...

Even if the script is called I guess $(EXTRA_ENV) will be needed, just like
target-post-image already does for custom scripts.

Regards,
Ricardo
