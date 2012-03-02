From: Roland <rolandu@gmail.com>
Date: Fri, 02 Mar 2012 18:46:54 +0200
Subject: [Buildroot] adding a new machine configuration
In-Reply-To: <20120301143934.073f50a0@skate>
References: <4F4F74A4.2060909@gmail.com> <20120301143934.073f50a0@skate>
Message-ID: <4F50F97E.3070203@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/01/2012 03:39 PM, Thomas Petazzoni wrote:
> Le Thu, 01 Mar 2012 15:07:48 +0200,
> Roland<rolandu@gmail.com>  a ?crit :
>
>> I have created a new machine configuration file.
>>
>> Target is Voipac iMX25 module ( http://voipac.com/#X25-DMM-254 ).
>>
>> I'm gonna also create one for iMX51.
>>
>> The problem is, the generated filesystem image won't work if don't
>> change the fs/ubinize.cfg file (problem with alignment). And
>> currently it's not possible to edit ubinize.cfg file in the buildroot
>> configuration file.
> I guess you're talking about the vol_alignment parameter, is this
> correct?
>
>> I'm interested in sharing the config and other files so, it can be
>> merged to buildroot's git.
>> But it's probably not possible until ubinize.cfg is configurable.
>>
>> Any comments by the people, who have commit access?
> You can simply add a new configuration option in the menuconfig to
> specify the alignment, with a default value equal to the one used in
> the current ubinize.cfg. Then, you change the ubinize.cfg to something
> like:
>
> vol_alignment=__BR_VOL_ALIGNMENT__
>
> And then when the filesystem image is built, you copy this ubinize.cfg
> somewhere, making the replacement of __BR_VOL_ALIGNMENT__ with the
> value from the configuration, and you run ubinize with it.
>
> Is this what you're looking for?
>
> Thomas

Thanks,
This was helpful

Managed to change the Config.in file, but I'm having some trouble with 
ubi.mk

Which is better version...   I'm specifically interested in the IF 
section where BR2_TARGET_ROOTFS_UBI_ALIGNMENT_DEFINED is used.

Or suggest the correct buildroot way of doing this.

Thanks.


Version 1

#############################################################
#
# Embed the ubifs image into an ubi one
#
#############################################################

UBI_UBINIZE_OPTS := -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)
UBI_UBINIZE_OPTS += -p $(BR2_TARGET_ROOTFS_UBI_PEBSIZE)
ifneq ($(BR2_TARGET_ROOTFS_UBI_SUBSIZE),0)
UBI_UBINIZE_OPTS += -s $(BR2_TARGET_ROOTFS_UBI_SUBSIZE)
endif

UBI_UBINIZE_ECHO_ALIGNMENT :=
ifeq ($(BR2_TARGET_ROOTFS_UBI_ALIGNMENT_DEFINED),y)
         UBI_UBINIZE_ECHO_ALIGNMENT := echo 
"vol_alignment=$(BR2_TARGET_ROOTFS_UBI_VOL_ALIGNMENT)" \
 >> $(BUILD_DIR)/_ubinize.cfg ;
endif

ROOTFS_UBI_DEPENDENCIES = rootfs-ubifs

define ROOTFS_UBI_CMD
     cp fs/ubifs/ubinize.cfg $(BUILD_DIR)/_ubinize.cfg ;\
         echo "vol_name=$(BR2_TARGET_ROOTFS_UBI_VOL_NAME)" \
 >> $(BUILD_DIR)/_ubinize.cfg ;\
         $(UBI_UBINIZE_ECHO_ALIGNMENT) \
     echo "image=$$@fs" \
 >> $(BUILD_DIR)/_ubinize.cfg ;\
     $(HOST_DIR)/usr/sbin/ubinize -o $$@ $(UBI_UBINIZE_OPTS) 
$(BUILD_DIR)/_ubinize.cfg ;\
         rm $(BUILD_DIR)/_ubinize.cfg
endef

$(eval $(call ROOTFS_TARGET,ubi))


#############################################################





Version 2


#############################################################
#
# Embed the ubifs image into an ubi one
#
#############################################################

UBI_UBINIZE_OPTS := -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)
UBI_UBINIZE_OPTS += -p $(BR2_TARGET_ROOTFS_UBI_PEBSIZE)
ifneq ($(BR2_TARGET_ROOTFS_UBI_SUBSIZE),0)
UBI_UBINIZE_OPTS += -s $(BR2_TARGET_ROOTFS_UBI_SUBSIZE)
endif

ROOTFS_UBI_DEPENDENCIES = rootfs-ubifs

define ROOTFS_UBI_CMD
     cp fs/ubifs/ubinize.cfg $(BUILD_DIR)/_ubinize.cfg ;\
         echo "vol_name=$(BR2_TARGET_ROOTFS_UBI_VOL_NAME)" \
 >> $(BUILD_DIR)/_ubinize.cfg ;\
         [ "_y" = "_$(BR2_TARGET_ROOTFS_UBI_ALIGNMENT_DEFINED)" ] && \
                 echo 
"vol_alignment=$(BR2_TARGET_ROOTFS_UBI_VOL_ALIGNMENT)" \
 >> $(BUILD_DIR)/_ubinize.cfg ;\
     echo "image=$$@fs" \
 >> $(BUILD_DIR)/_ubinize.cfg ;\
     $(HOST_DIR)/usr/sbin/ubinize -o $$@ $(UBI_UBINIZE_OPTS) 
$(BUILD_DIR)/_ubinize.cfg ;\
         rm $(BUILD_DIR)/_ubinize.cfg
endef

$(eval $(call ROOTFS_TARGET,ubi))

#############################################################
