From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 4 May 2018 11:09:52 +0200
Subject: [Buildroot] [PATCH v2] package/mender: new package
In-Reply-To: <20180504092346.6b5835db@windsurf>
References: <1525384358-26211-1-git-send-email-angelo@amarulasolutions.com>
 <20180504092346.6b5835db@windsurf>
Message-ID: <CA+_SqVYNqhb6pAc6wzaf4v79D+Jn9YruJjWhaNJL9NJ-jmc05A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On Fri, May 4, 2018 at 9:23 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello Angelo,
>
> Thanks for pushing this further. We definitely want to have Mender.io
> support in Buildroot, so it's great to see this make progress.
>
> On Thu,  3 May 2018 23:52:38 +0200, Angelo Compagnucci wrote:
>
>>  package/mender/server.crt                | 22 ++++++++++++++
>
> Not a complete review by far, but I'm wondering if it makes sense to
> include server certificates in Buildroot. I would assume that one would
> want to generate his own certificate instead, no ?

It's a test certificate just to starting up. The same file is included
in the official yocto package so I thought it could useful to have
here.

>
>> diff --git a/package/mender/Config.in b/package/mender/Config.in
>> new file mode 100644
>> index 0000000..b80ad4a
>> --- /dev/null
>> +++ b/package/mender/Config.in
>> @@ -0,0 +1,14 @@
>> +config BR2_PACKAGE_MENDER
>> +     bool "mender"
>> +     depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
>> +     depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
>> +     depends on BR2_TOOLCHAIN_HAS_THREADS
>> +     depends on BR2_INIT_SYSTEMD
>
> Is there anything that makes mender tied to systemd, other than the
> fact that you provide only a systemd mender.service, and no init
> script ?

Mender depends on systemd stating to the requirements here
https://docs.mender.io/1.4/devices/system-requirements

>
>> +
>
> Unneeded empty new line.
>
>
>> +define MENDER_INSTALL_TARGET_CMDS
>> +     $(INSTALL) -dm 0755 $(TARGET_DIR)/etc/mender/
>> +     $(INSTALL) -dm 0755 $(TARGET_DIR)/var/share/mender/identity/
>> +     $(INSTALL) -dm 0755 $(TARGET_DIR)/var/share/mender/inventory/
>
> These commands are not needed: the $(INSTALL) -D below, with full
> destination paths, will create the intermediate directories if they
> don't already exist.
>
>> +     $(INSTALL) -D -m 0644 package/mender/mender.conf \
>> +             $(TARGET_DIR)/etc/mender/mender.conf
>> +     $(INSTALL) -D -m 0644 package/mender/tenant.conf \
>> +             $(TARGET_DIR)/etc/mender/mender.conf
>
> Are you sure that installing tenant.conf as mender.conf is what you
> want to do here ?

Ouch.

>
>> +     $(INSTALL) -D -m 0644 package/mender/server.crt \
>> +             $(TARGET_DIR)/etc/mender/server.crt
>> +     $(INSTALL) -D -m 0755 package/mender/mender-device-identity \
>> +             $(TARGET_DIR)/var/share/mender/identity/mender-device-identity
>> +     $(INSTALL) -D -m 0755 package/mender/mender-inventory-network \
>> +             $(TARGET_DIR)/var/share/mender/inventory/mender-inventory-network
>> +     $(INSTALL) -D -m 0755 package/mender/mender-inventory-hostinfo \
>> +             $(TARGET_DIR)/var/share/mender/inventory/mender-inventory-hostinfo
>> +     $(INSTALL) -D -m 0644 package/mender/mender.service \
>> +             $(TARGET_DIR)/usr/lib/systemd/system/mender.service
>
> Is this enough to enable the systemd service ? In most packages, we do
> a dance like this:
>
> define OLSR_INSTALL_INIT_SYSTEMD
>         $(INSTALL) -D -m 644 package/olsr/olsr.service \
>                 $(TARGET_DIR)/usr/lib/systemd/system/olsr.service
>         mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>         ln -sf ../../../../usr/lib/systemd/system/olsr.service \
>                 $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/olsr.service
> endef
>
> Best regards,
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
