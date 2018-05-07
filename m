From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 7 May 2018 10:05:46 -0300 (BRT)
Subject: [Buildroot] [PATCH v2 3/4] Makefile: check rootfs overlays with
 BR2_ROOTFS_MERGED_USR enabled
In-Reply-To: <20180507145443.6515b0a3@windsurf>
References: <20180507124640.7759-1-casantos@datacom.ind.br>
 <20180507124640.7759-4-casantos@datacom.ind.br>
 <20180507145443.6515b0a3@windsurf>
Message-ID: <34105483.57140.1525698346092.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "buildroot" <buildroot@buildroot.org>, "Yann Morin" <yann.morin.1998@free.fr>, "Thomas De Schampheleire"
> <thomas.de_schampheleire@nokia.com>
> Sent: Monday, May 7, 2018 9:54:43 AM
> Subject: Re: [Buildroot] [PATCH v2 3/4] Makefile: check rootfs overlays with BR2_ROOTFS_MERGED_USR enabled

> Hello,
> 
> On Mon,  7 May 2018 09:46:39 -0300, Carlos Santos wrote:
>> Since commit 0db34529f48 we use rsync with the --keep-dirlinks option to
>> prevent overlays from accidentally overwriding /{usr,bin,sbin,lib} links
>> when BR2_ROOTFS_MERGED_USR option is enabled. Unfortunately this also
>> prevents replacing a symlink by a directory on purpose (e.g. /var/log,
>> to persist system logs).
>> 
>> Steps to reproduce:
>> 
>> - enable BR2_ROOTFS_MERGED_USR and BR2_PACKAGE_SKELETON_INIT_SYSV
>> - mkdir some_path/rootfs-overlay/var/log
>> - enable BR2_ROOTFS_OVERLAY="some_path/rootfs-overlay"
>> - run 'make'
>> - 'target/var/log' is still a symlink to '../tmp', not a directory
>> 
>> Fix the problem by adding a step in target-finalize that checks each
>> overlay, using the same criteria used in skeleton-custom.mk.
>> 
>> Add a paragraph to the documentation clarifying that rootfs overlays
>> don't need to contain /bin, /lib or /sbin and must not contain them when
>> BR2_ROOTFS_MERGED_USR is enabled.
>> 
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
>> ---
>> Changes v1->v2:
>> 
>> - Rebase series to HEAD of master branch
>> - Rework commit message and documentation, as suggested by Thomas
>>   Petazzoni
>> ---
>>  Makefile                         | 20 +++++++++++++++++---
>>  docs/manual/customize-rootfs.txt |  8 ++++++++
>>  2 files changed, 25 insertions(+), 3 deletions(-)
>> 
>> diff --git a/Makefile b/Makefile
>> index c024c65f78..dc51269143 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -746,11 +746,25 @@ endif
>>  	@$(call MESSAGE,"Sanitizing RPATH in target tree")
>>  	$(TOPDIR)/support/scripts/fix-rpath target
>>  
>> +# For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
>> +# counterparts are appropriately setup as symlinks ones to the others.
>> +ifeq ($(BR2_ROOTFS_MERGED_USR),y)
>> +
>> +	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
>> +		$(call MESSAGE,"Sanity check in overlay $(d)"); \
>> +		not_merged_dirs="$$(support/scripts/check-merged-usr.sh $(d))"; \
>> +		test -n "$$not_merged_dirs" && { \
>> +			echo "ERROR: The overlay in $(d) is not" \
>> +				"using a merged /usr for the following directories:" \
>> +				$$not_merged_dirs; \
>> +			exit 1; \
>> +		} || true$(sep))
>> +
>> +endif # merged /usr
>> +
>>  	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
>>  		$(call MESSAGE,"Copying overlay $(d)"); \
>> -		rsync -a --ignore-times --keep-dirlinks $(RSYNC_VCS_EXCLUSIONS) \
>> -			--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
>> -			$(d)/ $(TARGET_DIR)$(sep))
>> +		$(call SYSTEM_RSYNC,$(d),$(TARGET_DIR))$(sep))
> 
> This specific chunk is not directly related to checking that overlays
> comply with the merged /usr rule, so shouldn't this be in a separate
> commit ?

It removes ?--keep-dirlinks?, so becomes identical to the SYSTEM_RSYNC
logic, as observed by Peter Korsgaard in a previous message.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
