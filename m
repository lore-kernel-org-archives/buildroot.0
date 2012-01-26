From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jan 2012 10:55:18 -0300
Subject: [Buildroot] [PATCH v3] New package: linux-firmware
In-Reply-To: <4F2158AA.1060508@visionsystems.de>
References: <1327577414-11374-1-git-send-email-yegorslists@googlemail.com>
 <ad47d31d76e74e891bacdf8b9470a643@zacarias.com.ar>
 <8762fy4otk.fsf@macbook.be.48ers.dk>
 <7bd9330dcb162b6faa6e36e3e73f6b1e@zacarias.com.ar>
 <4F2158AA.1060508@visionsystems.de>
Message-ID: <22c5d41b369800fbf0664afdc9da0f6f@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-01-26 10:44, Yegor Yefremov wrote:
> Am 26.01.2012 13:47, schrieb Gustavo Zacarias:
>> On 2012-01-26 09:43, Peter Korsgaard wrote:
>>
>>> Agreed, except you should use a loop and install -D, so subdirs are
>>> supported.
>>>
>>> E.G.
>>>
>>>         for i in $(LINUX_FIRMWARE_FILES); do \
>>>           $i(INSTALL) -m 0644 -D $(@D)/$$i 
>>> $(TARGET_DIR)/lib/firmware/$$i; \
>>>         done
>>
>> Also LINUX_FIRMWARE_FILES_$(CONFIG_FIRMWARE_XXXX) += file1 file2 
>> could be used with $(LINUX_FIRMWARE_FILES_y) to make it even shorter.
> How can I use it exactly? Can provide an example?
>
> Yegor

Something like...

LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X) += 
ti-connectivity/TIInit_7.2.31.bts
LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X) += 
ti-connectivity/TIInit_7.2.31.bts

define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
   for i in $(LINUX_FIRMWARE_FILES_y); do \
     $(INSTALL) -m 0644 -D $(@D)/$$i $(TARGET_DIR)/lib/firmware/$$i; \
   done
endef

Since LINUX_FIRMWARE_FILES_$(CONFIG_OPTION) evals to 
LINUX_FIRMWARE_FILES_y if it's set and just LINUX_FIRMWARE_FILES_ if not 
so it get filled up pretty nicely. Look at the lm-sensors package for an 
example.
Regards.
