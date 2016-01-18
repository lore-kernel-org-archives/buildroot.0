From: Julien Floret <julien.floret@6wind.com>
Date: Mon, 18 Jan 2016 18:23:35 +0100
Subject: [Buildroot] [PATCH] lldpd: new package
In-Reply-To: <20160118160450.0645b1db@free-electrons.com>
References: <1453112084-16105-1-git-send-email-julien.floret@6wind.com>
 <20160118160450.0645b1db@free-electrons.com>
Message-ID: <CAHfJR7jVn99vE=6i+Z7D5w6wMPHYyOrYm+1aM-HTvMWq2PeG6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-01-18 16:04 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Julien Floret,
>

Dear Thomas Petazzoni,

Thanks for the quick response!

> On Mon, 18 Jan 2016 11:14:44 +0100, Julien Floret wrote:
>> lldpd is a 802.1ab implementation (LLDP) to help you locate neighbors
>> of all your equipments.
>>
>> LLDP is an industry standard protocol designed to supplant
>> proprietary Link-Layer protocols such as EDP or CDP. The goal of LLDP
>> is to provide an inter-vendor compatible mechanism to deliver
>> Link-Layer notifications to adjacent network devices.
>>
>> https://vincentbernat.github.io/lldpd/
>>
>> Signed-off-by: Julien Floret <julien.floret@6wind.com>
>
> Thanks for this patch! Overall it looks good, I just have a few
> comments here and there, see below.
>
>> diff --git a/package/lldpd/Config.in b/package/lldpd/Config.in
>> new file mode 100644
>> index 000000000000..c152c559a9de
>> --- /dev/null
>> +++ b/package/lldpd/Config.in
>> @@ -0,0 +1,91 @@
>> +config BR2_PACKAGE_LLDPD
>> +     bool "lldpd"
>> +     select BR2_PACKAGE_LIBEVENT
>
> BR2_PACKAGE_LIBEVENT has a "depends on !BR2_bfin" so you need to
> duplicate this dependency in lldpd's Config.in file.
>

I don't see such dependency for libevent...
Maybe you got mixed up with libev?

>> +config BR2_PACKAGE_LLDPD_PRIVSEP
>> +     bool "Privilege separation"
>> +     default y
>> +     help
>> +       Enable Privilege separation
>> +
>> +config BR2_PACKAGE_LLDPD_PRIVSEP_USER
>> +     string "Privilege separation user"
>> +     depends on BR2_PACKAGE_LLDPD_PRIVSEP
>> +     default "_lldpd"
>> +     help
>> +       Which user to use for privilege separation
>> +
>> +config BR2_PACKAGE_LLDPD_PRIVSEP_GROUP
>> +     string "Privilege separation group"
>> +     depends on BR2_PACKAGE_LLDPD_PRIVSEP
>> +     default "_lldpd"
>> +     help
>> +       Which group to use for privilege separation
>
> Do we really need to allow the configuration of the user and group? We
> generally don't do this for most package. Also, are _lldpd a good
> choice? Why the leading underscore?
>
> If we're really talking about Unix user/group, then I would suggest to
> just have an option to enable/disable privilege separation. And when
> enabled, use lldpd as the user and group names.
>
> Also, shouldn't these user and group names be created by Buildroot in
> the target root filesystem?
>

_lldpd (with the leading underscore) is the default value of the user and
group in lldpd, when privsep is enabled but user/group are not specified.
But I agree this is not really needed.

In fact, for a first simple patch, I suggest to disable explicitely the
privilege separation feature. We can then handle it properly in a later patch,
with user and group names created in the target root filesystem.
