From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 30 Oct 2013 09:31:24 +0100
Subject: [Buildroot] [PATCH] dhcpcd: add option to override dbdir
In-Reply-To: <526CDF68.8050409@mind.be>
References: <1380548426-26780-1-git-send-email-luca@lucaceresoli.net>
 <526CDF68.8050409@mind.be>
Message-ID: <5270C3DC.3060804@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

Arnout Vandecappelle wrote:
> On 30/09/13 15:40, Luca Ceresoli wrote:
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> ---
>>   package/dhcpcd/Config.in | 14 ++++++++++++++
>>   package/dhcpcd/dhcpcd.mk |  1 +
>>   2 files changed, 15 insertions(+)
>>
>> diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
>> index a06a973..c144dd3 100644
>> --- a/package/dhcpcd/Config.in
>> +++ b/package/dhcpcd/Config.in
>> @@ -6,5 +6,19 @@ config BR2_PACKAGE_DHCPCD
>>
>>         http://roy.marples.name/downloads/dhcpcd
>>
>> +if BR2_PACKAGE_DHCPCD
>> +
>> +config BR2_PACKAGE_DHCPCD_DBDIR
>> +    string "database directory"
>> +    default "/var/db"
>> +    help
>> +      By default dhcpcd stores obtained DHCP leases and other info in
>> +      /var/db. Set this to any other directory you wish to use. This
>> must
>> +      be on a read-write filesystem, otherwise dhcpcd will not work.
>> +      For example, you may want to change this directory if /var is on a
>> +      read-only filesystem in your embedded system.
>> +
>> +endif
>
>   Hi Luca,
>
>   After discussion on the buildroot developer day, we decided that this
> should not be configurable. Instead it should be hard-coded to some
> fixed path in /run, e.g. /run/db or something else that makes sense.
> (Note that /run is a symlink to /var/run which is a symlink to /tmp. We
> should use /run, not /var/run, because that conforms to the FHS.)
>
>   Since you probably use this package, can you test this and send a patch?

While this would likely fix the problem, this is not the correct way to 
do so, and would introduce another problem.

According the FHS version 3.0-draft1 /run is a volatile storage, cleared 
upon reboot. It may then be a tmpfs as well.

However, one of the purposes for dhcpcd to store an IP lease obtained 
from a DHCP server is to request the same address at the next reboot. So 
it is meant to be persistent, and /var is the correct place for the 
lease files, not /run. In fact dhcpcd by default uses /var/db, which is ok.

In other words, things are fine in current BR without any patch, 
provided that the rootfs is writable.

If the rootfs is read-only (which is not uncommon on small embedded 
systems), dhcpcd fails trying to create the "db" dir under /var. This is 
because in the default Buildroot skeleton /var is a regular directory, 
not a tmpfs.

In a system whose rootfs is read-only there is no directory in the 
default skeleton that is both persistent and writable.

In this case I devise two possible solutions:
  * create /var/db in system/skeleton as yet another symlink to /tmp;
  * let any user select the directory they wish (what my patch does).

In the first case we don't need a new config option and dhcpcd will 
generally work. But leases won't be persistent and the cause may be not 
so obvious to the user.

In the second case anyone can point to some device-specific persistent 
storage, thus making dhcpcd work 100% as expected.

It may be a small read-write partition for storing user-configurable 
data, as is already available on some embedded products. But there is no 
way for Buildroot to know where that is going to be mounted, so we let 
the user tell us via the config option.

As a side-effect, the presence of a config knob makes the user aware of 
the problem with a suitable help text.

Actually the former change may be applied anyway as it partially fixes 
dhcpcd and is minimally invasive. For the latter one I look forward to 
hear your comments.

-- 
Luca
