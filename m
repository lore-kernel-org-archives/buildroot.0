From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 13 Jan 2021 12:31:04 +0100
Subject: [Buildroot] [PATCH v2 1/8] package/freescale-imx/firmware-imx:
 bump version to 8.10
In-Reply-To: <CAOMZO5DR1AdSHah4Y1JAGoK+UfiZGGAuLjjC7a6OnshCFcGbbw@mail.gmail.com>
References: <20210105152420.26379-1-stephane.viau@oss.nxp.com>
 <20210105152420.26379-2-stephane.viau@oss.nxp.com>
 <636366db-0dd3-4a30-7097-d09423d91aa8@gmail.com>
 <CAOMZO5CQ8-rHcZyKPmmSGCo+MSSEKRcbMJMDiFHp5VQDahG+Ug@mail.gmail.com>
 <CAOMZO5AZXr8oY1Z6K30-Bq+a3dF8RAaRmBB1S_51Fh_9UDWgdw@mail.gmail.com>
 <d6faa5af-c22c-67b2-65a0-5721bf4aa2bf@gmail.com>
 <CAOMZO5DR1AdSHah4Y1JAGoK+UfiZGGAuLjjC7a6OnshCFcGbbw@mail.gmail.com>
Message-ID: <2022b3c0-fb7d-256f-fd3d-b641da017e86@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabio,

Le 13/01/2021 ? 12:16, Fabio Estevam a ?crit?:
> Hi Romain,
> 
> On Wed, Jan 13, 2021 at 5:10 AM Romain Naour <romain.naour@gmail.com> wrote:
> 
>> I'm not sure if we should install the vpu firmware directly in "/lib/firmware/"
>> or "/lib/firmware/vpu". Feel free to submit a patch to discuss about this change.
> 
> Mainline kernels search first inside /lib/firmware and then inside
> /lib/firmware/vpu
> 
> The NXP BSPs search the VPU firmware inside /lib/firmware/vpu, so I
> think we need to use this location, which can make vendor and mainline
> kernels happy.

Ok for me.

> 
> However, it is not working for me if I place it inside
> /lib/firmware/vpu with a 5.10 kernel.
> 
> I will investigate this when I have a chance.

I'm using a kernel 5.10.6 on imx6 (savrelite)

Before moving vpu directory:
# dmesg | grep coda
[   11.805864] coda 2040000.vpu: Direct firmware load for vpu_fw_imx6q.bin
failed with error -2
[   11.814654] coda 2040000.vpu: Falling back to sysfs fallback for:
vpu_fw_imx6q.bin
[   74.713145] coda 2040000.vpu: Direct firmware load for vpu/vpu_fw_imx6q.bin
failed with error -2
[   74.722182] coda 2040000.vpu: Falling back to sysfs fallback for:
vpu/vpu_fw_imx6q.bin
[  136.152801] coda 2040000.vpu: Direct firmware load for v4l-coda960-imx6q.bin
failed with error -2
[  136.161972] coda 2040000.vpu: Falling back to sysfs fallback for:
v4l-coda960-imx6q.bin
[  197.590983] coda 2040000.vpu: firmware request failed
# uname -a
Linux buildroot 5.10.6 #1 SMP Tue Jan 12 15:47:33 CET 2021 armv7l GNU/Linux

After moving vpu directory to /lib/firmware/vpu and reboot:
# dmesg | grep coda
[   12.206789] coda 2040000.vpu: Direct firmware load for vpu_fw_imx6q.bin
failed with error -2
[   12.215594] coda 2040000.vpu: Falling back to sysfs fallback for:
vpu_fw_imx6q.bin
[   74.749483] coda 2040000.vpu: Using fallback firmware vpu/vpu_fw_imx6q.bin
[   74.772346] coda 2040000.vpu: Firmware code revision: 46076
[   74.777985] coda 2040000.vpu: Initialized CODA960.
[   74.783247] coda 2040000.vpu: Firmware version: 3.1.1
[   74.790424] coda 2040000.vpu: encoder registered as video8
[   74.796587] coda 2040000.vpu: decoder registered as video9
[   74.809556] coda 2040000.vpu: encoder registered as video10
[   74.823956] coda 2040000.vpu: decoder registered as video11
# uname -a
Linux buildroot 5.10.6 #1 SMP Tue Jan 12 15:47:33 CET 2021 armv7l GNU/Linux

I don't know why it doesn't work for you.

Best regards,
Romain

> 
> Thanks
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
