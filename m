From: Mirza Krak <mirza.krak@northern.tech>
Date: Wed, 15 Aug 2018 14:42:51 +0200
Subject: [Buildroot] [PATCH 2/8] package/mender: update install of
 config files
In-Reply-To: <20180815143144.587c2045@windsurf>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
 <20180814231337.19114-3-mirza.krak@northern.tech>
 <20180815143144.587c2045@windsurf>
Message-ID: <CADHdJwCjktMrL2YQpKbzm45n0UoqpXRLHGjy1PyQJv_SRwH-Ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 15, 2018 at 2:31 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Wed, 15 Aug 2018 01:13:31 +0200, Mirza Krak wrote:
>> Summary of changes:
>>
>> - identity and inventory scripts are part of Mender source repo,
>>   hence remove the local files and install from source directory.
>>
>> - tenant.conf is not used by Mender, remove it
>>
>> These are required to run Mender in managed mode (daemon).
>>
>> - Create /data and /uboot directories.
>> - Symlink /var/lib/mender to /data
>> - Added /etc/mender/script/version file
>>
>> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
>
> There are too many changes in one commit here, please do these changes
> one step at a time.

Sure.

>
> Do you know why tenant.conf was added in the current Mender packaging ?
> Was it an old configuration file from previous Mender versions ?

This was something that we did deploy in our Yocto recipes (which
might have been source of inspiration for the package in Buildroot),
but it was never actually used for anything. There is an option in
mender.conf for this, TenantToken.

>>  define MENDER_INSTALL_CONFIG_FILES
>> +     $(INSTALL) -d -m 755 $(TARGET_DIR)/data/mender
>> +     $(INSTALL) -d -m 755 $(TARGET_DIR)/data/uboot
>> +     $(INSTALL) -d -m 755 $(TARGET_DIR)/uboot
>> +     $(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/mender/inventory
>
> Could you give a bit of background about these ?

Will do.

>
>> +     $(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender/scripts
>> +     echo -n "2" > $(TARGET_DIR)/etc/mender/scripts/version
>> +
>>       $(INSTALL) -D -m 0644 package/mender/mender.conf \
>>               $(TARGET_DIR)/etc/mender/mender.conf
>> -     $(INSTALL) -D -m 0644 package/mender/tenant.conf \
>> -             $(TARGET_DIR)/etc/mender/tenant.conf
>>       $(INSTALL) -D -m 0644 package/mender/server.crt \
>>               $(TARGET_DIR)/etc/mender/server.crt
>> -     $(INSTALL) -D -m 0755 package/mender/mender-device-identity \
>> -             $(TARGET_DIR)/var/share/mender/identity/mender-device-identity
>> -     $(INSTALL) -D -m 0755 package/mender/mender-inventory-network \
>> -             $(TARGET_DIR)/var/share/mender/inventory/mender-inventory-network
>> -     $(INSTALL) -D -m 0755 package/mender/mender-inventory-hostinfo \
>> -             $(TARGET_DIR)/var/share/mender/inventory/mender-inventory-hostinfo
>> +     $(INSTALL) -D -m 0755 $(@D)/support/mender-device-identity \
>> +             $(TARGET_DIR)/usr/share/mender/identity/mender-device-identity
>
> The installation path has changed from /var/share, to /usr/share. Why ?

/var/share was incorrect, it has always been /usr/share.

>
>> +     $(INSTALL) -D -m 0755 $(@D)/support/mender-inventory-* \
>> +             $(TARGET_DIR)/usr/share/mender/inventory
>
> A $(INSTALL) -D invocation should have a full destination path, so:
>
>         $(foreach f,hostinfo network, \
>                 $(INSTALL) -D -m 0755 $(@D)/support/mender-inventory-$(f) \
>                         $(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-$(f)
>         )
>
> Thanks!

Ok, thanks.

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
