From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 5 Jun 2018 22:10:25 +0200
Subject: [Buildroot] [PATCH v3] package/mender: new package
In-Reply-To: <20180605215013.476d22ca@windsurf>
References: <1525425719-28459-1-git-send-email-angelo@amarulasolutions.com>
 <20180605215013.476d22ca@windsurf>
Message-ID: <CA+_SqVbRJxfc8bz9R5RYMyPOq288OYSMJx1_VDNU8-33bu2ivw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 5, 2018 at 9:50 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Fri,  4 May 2018 11:21:59 +0200, Angelo Compagnucci wrote:
>> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>>
>> This patch add mender, an open source over-the-air (OTA) software
>> updater for embedded Linux devices.
>>
>> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
>
> I went ahead and applied this to master, but after doing some changes.
> I was a bit surprised by one of the changes I had to do though, because
> it clearly outlined that the package was not properly tested. See below
> for details.
>
>>  package/Config.in                        |  1 +
>>  package/mender/Config.in                 | 13 ++++++++
>>  package/mender/mender-device-identity    | 52 ++++++++++++++++++++++++++++++++
>>  package/mender/mender-inventory-hostinfo | 21 +++++++++++++
>>  package/mender/mender-inventory-network  | 47 +++++++++++++++++++++++++++++
>>  package/mender/mender.conf               | 14 +++++++++
>>  package/mender/mender.hash               |  2 ++
>>  package/mender/mender.mk                 | 34 +++++++++++++++++++++
>>  package/mender/mender.service            | 15 +++++++++
>>  package/mender/server.crt                | 22 ++++++++++++++
>>  package/mender/tenant.conf               |  0
>>  11 files changed, 221 insertions(+)
>
> An entry in the DEVELOPERS file was missing, so I've added it.
>
>> diff --git a/package/mender/Config.in b/package/mender/Config.in
>> new file mode 100644
>> index 0000000..183930d
>> --- /dev/null
>> +++ b/package/mender/Config.in
>> @@ -0,0 +1,13 @@
>> +config BR2_PACKAGE_MENDER
>> +     bool "mender"
>> +     depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
>> +     depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
>> +     depends on BR2_TOOLCHAIN_HAS_THREADS
>
> This dependency was lacking the corresponding Config.in comment, so
> I've added it.
>
>> +     depends on BR2_INIT_SYSTEMD
>
> Since systemd is not a build dependency nor even a runtime dependency,
> I've dropped this dependency.
>
>> diff --git a/package/mender/mender.mk b/package/mender/mender.mk
>> new file mode 100644
>> index 0000000..6a4c995
>> --- /dev/null
>> +++ b/package/mender/mender.mk
>> @@ -0,0 +1,34 @@
>> +################################################################################
>> +#
>> +# mender
>> +#
>> +################################################################################
>> +
>> +MENDER_VERSION = 1.4.0
>> +MENDER_SOURCE = mender-$(MENDER_VERSION).tar.gz
>> +MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
>> +
>> +define MENDER_INSTALL_TARGET_CMDS
>> +     $(INSTALL) -D -m 0644 package/mender/mender.conf \
>> +             $(TARGET_DIR)/etc/mender/mender.conf
>> +     $(INSTALL) -D -m 0644 package/mender/tenant.conf \
>> +             $(TARGET_DIR)/etc/mender/tenant.conf
>> +     $(INSTALL) -D -m 0644 package/mender/server.crt \
>> +             $(TARGET_DIR)/etc/mender/server.crt
>> +     $(INSTALL) -D -m 0755 package/mender/mender-device-identity \
>> +             $(TARGET_DIR)/var/share/mender/identity/mender-device-identity
>> +     $(INSTALL) -D -m 0755 package/mender/mender-inventory-network \
>> +             $(TARGET_DIR)/var/share/mender/inventory/mender-inventory-network
>> +     $(INSTALL) -D -m 0755 package/mender/mender-inventory-hostinfo \
>> +             $(TARGET_DIR)/var/share/mender/inventory/mender-inventory-hostinfo
>> +endef
>
> Because you override the install target commands here, the mender
> binary is not installed at all to the target! I'm not sure how you
> tested this, as it obviously doesn't work: usr/bin/mender is not
> installed to the target.

Sorry Thomas but this patch predates the final golang infrastructure
and probably something went missing somewhere. Moreover I didn't a
proper on the field test cause we went for swupdate for a job.

> I've fixed this by using a post install hook instead, so that the
> default target installation logic of golang-package is preserved.

Thanks for the fixing!

>
> Thanks for this contribution! I'm looking forward to seeing the
> additional patches from Dan to integrate Mender in a non-systemd
> configuration.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
