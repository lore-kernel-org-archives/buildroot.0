From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Fri, 10 Jul 2015 14:16:21 -0500
Subject: [Buildroot] [PATCH v7 09/22] linux-pam: selinux support
In-Reply-To: <CANn-YGSGWsqVdwDPnpHrvRY2smCBd_4kL-SpuJ2OYiiuMxb44A@mail.gmail.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-10-git-send-email-clayton.shotwell@rockwellcollins.com>
 <CAHXCMM+R3_CDdSTZJX_HJ-9Tc7GFNkzE=t48o4x4gtsZLP4vhg@mail.gmail.com>
 <CANn-YGSGWsqVdwDPnpHrvRY2smCBd_4kL-SpuJ2OYiiuMxb44A@mail.gmail.com>
Message-ID: <CANn-YGSZeCfhSnGz=P3+X1LbpYE0UAqEVyw66H-3cON30aOh1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

Definitely sent the last email without adding a message. Sorry about that.

>> On Tue, Jun 2, 2015 at 3:28 PM, Clayton Shotwell
>> <clayton.shotwell@rockwellcollins.com> wrote:
>> [...]
>>> +# Use the host-pam pam_conv1 app to create the pam.d files
>>> +define LINUX_PAM_CONFIG_FILE_TARGET_INSTALL
>>> +       ( \
>>> +               if [ -d $(TARGET_DIR)/etc/pam.d/ ]; then \
>>> +                       mv $(TARGET_DIR)/etc/pam.d/ $(TARGET_DIR)/etc/pam.d.orig/; \
>>> +               fi; \
>>> +               cd $(TARGET_DIR)/etc/ && \
>>> +               cat $(@D)/conf/pam.conf | $(HOST_DIR)/usr/bin/pam_conv1; \
>>> +               if [ -d pam.d.orig ]; then \
>>> +                       cp -a pam.d/* pam.d.orig/; \
>>> +                       rm -rf pam.d/; \
>>> +                       mv pam.d.orig/ pam.d/; \
>>> +               fi; \
>>> +       )
>>> +       $(INSTALL) -D -m 0644 package/linux-pam/system-auth.pamd $(TARGET_DIR)/etc/pam.d/system-auth
>>> +endef
>> Funny, I think the sub-shell is not needed here.

Definitely agree. I'll get that removed.

>> Also, in the former if-block, paths are absolute (via
>> $(TARGET_DIR)/...), whereas in the latter, they are relative to where
>> the cd command goes...
>> It could be rewrite like this:
>>
>> define LINUX_PAM_CONFIG_FILE_TARGET_INSTALL
>>     if [ -d $(TARGET_DIR)/etc/pam.d/ ]; then \
>>         mv $(TARGET_DIR)/etc/pam.d/ $(TARGET_DIR)/etc/pam.d.orig/; \
>>     fi
>>     cd $(TARGET_DIR)/etc/ && \
>>         cat $(@D)/conf/pam.conf | $(HOST_DIR)/usr/bin/pam_conv1
>>     if [ -d $(TARGET_DIR)/etc/pam.d.orig ]; then \
>>         cp -a $(TARGET_DIR)/etc/pam.d/* $(TARGET_DIR)/etc/pam.d.orig/; \
>>         rm -rf $(TARGET_DIR)/etc/pam.d/; \
>>         mv $(TARGET_DIR)/etc/pam.d.orig/ $(TARGET_DIR)/etc/pam.d/; \
>>     fi
>>     $(INSTALL) -D -m 0644 package/linux-pam/system-auth.pamd
>> $(TARGET_DIR)/etc/pam.d/system-auth
>> endef

That looks a lot cleaner. I'll rework the patch to match.

>>> +
>>> +LINUX_PAM_POST_INSTALL_TARGET_HOOKS += LINUX_PAM_CONFIG_FILE_TARGET_INSTALL
>>>  LINUX_PAM_POST_INSTALL_TARGET_HOOKS += LINUX_PAM_INSTALL_CONFIG
>>>
>>> +HOST_LINUX_PAM_DEPENDENCIES = host-flex host-pkgconf
>>> +
>>> +HOST_LINUX_PAM_CONF_OPTS = --disable-rpath \
>>> +               --enable-read-both-confs \
>>> +               --disable-regenerate-docu \
>>> +               --disable-isadir \
>>> +               --disable-nis \
>>> +               --enable-securedir=/lib/security \
>>> +               --disable-prelude \
>>> +               --disable-cracklib \
>>> +               --disable-lckpwdf \
>>> +               --enable-db=no \
>> Why using --enable-db=no and not --disable-db, the target *_CONF_OPTS
>> uses --disable-db

No reason. I'll change to be consistent.

Thanks for the review.

Thanks,
Clayton

Clayton Shotwell
Senior Software Engineer, Rockwell Collins
clayton.shotwell at rockwellcollins.com
