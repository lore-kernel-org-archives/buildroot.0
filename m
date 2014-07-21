From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 21 Jul 2014 15:20:23 +0200
Subject: [Buildroot] [PATCH 6/6] systemd: install timesync service if
 selected
In-Reply-To: <20140717124629.GB20114@rmm-p1267483>
References: <1404406659-31109-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1404406659-31109-7-git-send-email-eric.le.bihan.dev@free.fr>
 <53BACED4.3000706@mind.be> <20140717124629.GB20114@rmm-p1267483>
Message-ID: <53CD1397.1020202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/07/14 14:46, Eric Le Bihan wrote:
> On Mon, Jul 07, 2014 at 06:46:12PM +0200, Arnout Vandecappelle wrote:
>> On 03/07/14 18:57, Eric Le Bihan wrote:
>>> If support for systemd-timesyncd is selected, install the associated
>>> service.
>>>
>>> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>>
>> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>>
>>> ---
>>>  package/systemd/systemd.mk |    6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
>>> index 2da65e6..3454e43 100644
>>> --- a/package/systemd/systemd.mk
>>> +++ b/package/systemd/systemd.mk
>>> @@ -112,6 +112,11 @@ endif
>>>
>>>  ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
>>>  SYSTEMD_CONF_OPT += --enable-timesyncd
>>> +define SYSTEMD_INSTALL_SERVICE_TIMESYNC
>>> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
>>> +	ln -sf ../../../../lib/systemd/system/systemd-timesyncd.service \
>>> +		$(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service
>>> +endef
>>
>>  Not for this patch, but perhaps a cleaner way to do this would be to add
>>
>> SYSTEMD_INSTALL_INIT_SYSTEMD += $(SYSTEMD_INSTALL_SERVICE_TIMESYNC)
>>
>> instead having the list explicit below? Or wouldn't that work because there is
>> no separator between networkd and timesync?
> 
> Exactly! I tried the proposed solution and it does not work because of the
> missing separator.
> 
> In order to have such a way of installing systemd unit files, we should do the
> same as for the pre/post installation hooks.
> 
> The following change should be done in package/pkg-generic.mk:
> 
>    	$(if $(BR2_INIT_SYSTEMD),\
>   -		$($(PKG)_INSTALL_INIT_SYSTEMD))
>   +		$(foreach hook,$($(PKG)_INIT_SYSTEMD_HOOKS),$(call $(hook))$(sep)))
> 
> Then, we could use:
> 
>   SYSTEMD_INIT_SYSTEMD_HOOKS += SYSTEMD_INSTALL_SERVICE_TIMESYNC
> 
> This would require updating all the Makefiles of the packages installing
> systemd unit files (and maybe do the same for SysV/Busybox to be coherent).

 No, it's not worth it. There won't be more than one or two packages that need
to do more than one thing for the INSTALL_INIT things, so complicating all
packages in order for this to work is a bit too much.

 So your original patch (which you reposted) is fine.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
