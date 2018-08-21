From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 21 Aug 2018 11:09:59 +0200
Subject: [Buildroot] [PATCH v5 3/3] uboot: zynqmp: allow to use custom
 psu_init files
In-Reply-To: <20180728193952.7094d45b@windsurf>
References: <20180725143538.25268-1-luca@lucaceresoli.net>
 <20180725143538.25268-4-luca@lucaceresoli.net>
 <20180728193952.7094d45b@windsurf>
Message-ID: <27b5ca04-bf4a-302a-a96f-114d464b6b07@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 28/07/2018 19:39, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 25 Jul 2018 16:35:38 +0200, Luca Ceresoli wrote:
> 
>> +config BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE
>> +	string "Custom psu_init_gpl file"
>> +	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
>> +	help
>> +	  On ZynqMP the booloader is responsible for some basic
>> +	  initializations, such as enabling peripherals and
>> +	  configuring pinmuxes. The psu_init_gpl.c file (and,
>> +	  optionally, psu_init_gpl.h) contains the code for such
>> +	  initializations.
>> +
>> +	  Although U-Boot contains psu_init_gpl.c files for some
>> +	  boards, each of them describes only one specific
>> +	  configuration. Users of a different board, or needing a
>> +	  different configuration, can generate custom files using the
>> +	  Xilinx development tools.
>> +
>> +	  Set this variable to the path to your psu_init_gpl.c file
>> +	  (e.g. "board/myboard/psu_init_gpl.c"). psu_init_gpl.h, if
>> +	  needed, should be in the same directory. U-Boot will build
>> +	  and link the user-provided file instead of the built-in one.
>> +
>> +	  Leave empty to use the files provided by U-Boot.
> 
> I've also added a comment here that explains which U-Boot upstream
> commit is necessary for this feature to work.
> 
>> +UBOOT_ZYNQMP_PSU_INIT = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE))
>> +
>> +ifneq ($(UBOOT_ZYNQMP_PSU_INIT),)
>> +define UBOOT_ZYNQMP_KCONFIG_PSU_INIT
>> +	$(call KCONFIG_SET_OPT,CONFIG_XILINX_PS_INIT_FILE,"$(shell readlink -f $(UBOOT_ZYNQMP_PSU_INIT))", \
>> +           $(@D)/.config)
>> +endef
>> +endif
> 
> To be "consistent" with what I did for the PMU firmware, I introduced
> an intermediate UBOOT_ZYNQMP_PSU_INIT_PATH variable.
> 
> Applied with those changes. Please don't hesitate to verify the
> resulting commits to make sure I didn't screw up anything.

Just build- and run-time tested, it works fine.

Thank you for the cleanups!

Bye,
-- 
Luca
