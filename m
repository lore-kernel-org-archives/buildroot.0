From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 13 Jan 2021 22:01:03 +0100
Subject: [Buildroot] [PATCH] package/freescale-imx/firmware-imx: install
 the VPU firmware into a valid location
In-Reply-To: <CAOMZO5Bs5ieYti4i5L0TCEz6uV7Zt8UkXbh=_S7mC99MLKio-A@mail.gmail.com>
References: <20210113120822.327-1-festevam@gmail.com>
 <0a7f5a1d-e930-084a-3372-3ecc736a810a@smile.fr>
 <CAOMZO5BTpG8f=weBKxE9fXtEf3PjGnvs7c979sNBNyKm576ixQ@mail.gmail.com>
 <aeea51ae-483e-1cfc-0c5d-222aaf2d5400@gmail.com>
 <CAOMZO5Bs5ieYti4i5L0TCEz6uV7Zt8UkXbh=_S7mC99MLKio-A@mail.gmail.com>
Message-ID: <2b2ee27f-f5c4-f8eb-61ff-b64d3ed0d623@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 13/01/2021 ? 21:16, Fabio Estevam a ?crit?:
> On Wed, Jan 13, 2021 at 5:02 PM Romain Naour <romain.naour@gmail.com> wrote:
> 
>> What about a simlink ?
> 
> Yes, that would work.
> 
> Actually, I tried it here, but it ended up with a symlink to the host
> PC Buildroot path.
> 
> If you could give me a suggestion on how to properly implement the
> symlink in firmware-imx.mk, I would appreciate it.

Something like this ?

define FIRMWARE_IMX_INSTALL_TARGET_VPU_FW
	mkdir -p $(TARGET_DIR)/lib/firmware/vpu
	for i in $$(find $(@D)/firmware/vpu/vpu_fw_$(FIRMWARE_IMX_VPU_FW_NAME)*.bin); do \
		cp $$i $(TARGET_DIR)/lib/firmware/vpu/ ; \
		ln -sf vpu/$$(basename $$i) $(TARGET_DIR)/lib/firmware/$$(basename $$i) ; \
	done
endef

Best regards,
Romain


> 
> Thanks
> 
