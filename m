From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 26 Nov 2019 17:49:47 +0100
Subject: [Buildroot] Zynqmp ZCU-102 Xilinx
In-Reply-To: <CADDW7LPbh8ep74a5kcu1CZQuaFxuUGyCUxuJT6uo6Y=m9ftmOA@mail.gmail.com>
References: <CADDW7LPbh8ep74a5kcu1CZQuaFxuUGyCUxuJT6uo6Y=m9ftmOA@mail.gmail.com>
Message-ID: <d46c58a9-4b07-878f-b638-1a4d1554e9b1@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adrian,

On 20/11/19 09:21, Adrian martinez munera wrote:
> Hi,
> I'm not sure if I have to write you by this mail.?
> 
> I'm using buildroot to create a Linux image to my ZCU-102, adding EPICS.
> 
> My first attempt are been build? a simple Linux image, without EPICS,
> but it doesn't work.
> 
> ?Could you help me? ?Could you give me all of necessary files to build
> the image?

Thomas already replied with some objections, and I agree you should
explain better your problem.

However, as setting up booting is more complex on ZynqMP platforms than
in other ones, here are a few notes to address booting. They could be
useful for other people as well.

Buildroot has a defconfig for the ZCU106 board, you can take that as a
starting point. However some things have changed since that was added,
so I recommend a better approach now.

I assume you already have a Vivado project implementing your FPGA
design. Even a project with a completely empty FPGA is OK, what matters
is that you configure the "ZynqMP block" appropriately for the board
(the Vivado wizard helps you in starting from a default configuration
with proper DDR timings, among others).

With the Vivado project you can start the Xilinx XSDK to produce a bsp
(don't forget to enable the xilpm library in the wizard). The xilpm
library in the generated bsp has a file called pm_cfg_obj.c. It's the
"configuration object" that tells the PMU FW how to configure peripherals.

Now you could go for the "old" approach, the one used for the zcu106
defconfig currently in Buildroot: using zynqmp-pmufw-builder [0] you can
generate a pmufw.bin that contains your configuration object hard-coded.
This is how the pmufw binaries in zynqmp-pmufw-binaries [1], and used in
Buildroot for ZCU106, have been generated.

But I rather suggest to use the "new" approach. U-Boot SPL since
v2019.10 can load the PMUFW configuration object at runtime (just like
Xilinx FSBL does). In this case you can avoid hard-coding the config
object into the pmufw binary, and use a "standard" PMUFW that works for
any ZynqMP board. The v2018.3 PMUFW in [1] has been built in this way.

For additional explanations on the "new" approach see [2]. I wrote some
suggestions on how to implement such a workflow for yocto on the
meta-xilinx mailing list [3], the underlying idea should apply to
Buildroot as well.

I hope this is useful for you. As pointed out by Thomas, your question
is not very precise, so please add more details on exactly what you want
to achieve, what you tried and how it failed. Somebody will probably be
able to help you better.

[0] https://github.com/lucaceresoli/zynqmp-pmufw-builder
[1] https://github.com/lucaceresoli/zynqmp-pmufw-binaries
[2] https://lucaceresoli.net/zynqmp-uboot-spl-pmufw-cfg-load/
[3] https://lists.yoctoproject.org/g/meta-xilinx/message/4570

-- 
Luca
