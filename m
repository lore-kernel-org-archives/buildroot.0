From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 Oct 2013 08:00:36 +0100
Subject: [Buildroot] [PATCH] dhcpcd: add option to override dbdir
In-Reply-To: <5270C3DC.3060804@lucaceresoli.net>
References: <1380548426-26780-1-git-send-email-luca@lucaceresoli.net>
 <526CDF68.8050409@mind.be> <5270C3DC.3060804@lucaceresoli.net>
Message-ID: <52720014.5040602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Luca,

  [@Peter: there's a request for a judgement call below]

On 30/10/13 09:31, Luca Ceresoli wrote:
> Arnout, All,
>
> Arnout Vandecappelle wrote:
>> On 30/09/13 15:40, Luca Ceresoli wrote:
>>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>>> ---
>>>   package/dhcpcd/Config.in | 14 ++++++++++++++
>>>   package/dhcpcd/dhcpcd.mk |  1 +
>>>   2 files changed, 15 insertions(+)
>>>
>>> diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
>>> index a06a973..c144dd3 100644
>>> --- a/package/dhcpcd/Config.in
>>> +++ b/package/dhcpcd/Config.in
>>> @@ -6,5 +6,19 @@ config BR2_PACKAGE_DHCPCD
>>>
>>>         http://roy.marples.name/downloads/dhcpcd
>>>
>>> +if BR2_PACKAGE_DHCPCD
>>> +
>>> +config BR2_PACKAGE_DHCPCD_DBDIR
>>> +    string "database directory"
>>> +    default "/var/db"
>>> +    help
>>> +      By default dhcpcd stores obtained DHCP leases and other info in
>>> +      /var/db. Set this to any other directory you wish to use. This
>>> must
>>> +      be on a read-write filesystem, otherwise dhcpcd will not work.
>>> +      For example, you may want to change this directory if /var is on a
>>> +      read-only filesystem in your embedded system.
>>> +
>>> +endif
>>
>>   Hi Luca,
>>
>>   After discussion on the buildroot developer day, we decided that this
>> should not be configurable. Instead it should be hard-coded to some
>> fixed path in /run, e.g. /run/db or something else that makes sense.
>> (Note that /run is a symlink to /var/run which is a symlink to /tmp. We
>> should use /run, not /var/run, because that conforms to the FHS.)
>>
>>   Since you probably use this package, can you test this and send a patch?
>
> While this would likely fix the problem, this is not the correct way to
> do so, and would introduce another problem.
>
> According the FHS version 3.0-draft1 /run is a volatile storage, cleared
> upon reboot. It may then be a tmpfs as well.
>
> However, one of the purposes for dhcpcd to store an IP lease obtained
> from a DHCP server is to request the same address at the next reboot. So
> it is meant to be persistent, and /var is the correct place for the lease
> files, not /run. In fact dhcpcd by default uses /var/db, which is ok.

  OK, we didn't realize that.

>
> In other words, things are fine in current BR without any patch, provided
> that the rootfs is writable.
>
> If the rootfs is read-only (which is not uncommon on small embedded
> systems), dhcpcd fails trying to create the "db" dir under /var. This is
> because in the default Buildroot skeleton /var is a regular directory,
> not a tmpfs.
>
> In a system whose rootfs is read-only there is no directory in the
> default skeleton that is both persistent and writable.

  Of course not, because that may not be possible.

>
> In this case I devise two possible solutions:
>   * create /var/db in system/skeleton as yet another symlink to /tmp;
>   * let any user select the directory they wish (what my patch does).
>
> In the first case we don't need a new config option and dhcpcd will
> generally work. But leases won't be persistent and the cause may be not
> so obvious to the user.

  But we can add to the dhcpd help text that you need to replace the 
/var/db symlink to point to a persistent location if you want persistence.

  But then again, adding the configure option does have the same effect, 
just a little more obvious to the user.

  At the Buildroot developer meeting, we also asked Peter to play a bit 
more the role of the benevolent dictator and make rulings. So here goes:

  Peter, do you prefer a /var/db symlink that the user should override in 
the fs overlay, or do you prefer an explicit configure option?


  If we do go for the configure option, however, the default should be 
/tmp or /tmp/db, so that at least the default works with a read-only rootfs.


> In the second case anyone can point to some device-specific persistent
> storage, thus making dhcpcd work 100% as expected.
>
> It may be a small read-write partition for storing user-configurable
> data, as is already available on some embedded products. But there is no
> way for Buildroot to know where that is going to be mounted, so we let
> the user tell us via the config option.
>
> As a side-effect, the presence of a config knob makes the user aware of
> the problem with a suitable help text.
>
> Actually the former change may be applied anyway as it partially fixes
> dhcpcd and is minimally invasive. For the latter one I look forward to
> hear your comments.

  Yes, if it is not configurable, then buildroot should create the 
symlink. However, I wouldn't put it in the skeleton, but instead put it 
in the INSTALL_TARGET_CMDS.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
