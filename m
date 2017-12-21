From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 21 Dec 2017 08:17:06 +0200
Subject: [Buildroot] musl and linux-tool-gpio
In-Reply-To: <CACPK8Xc7=f_p8Ws4u4yYn3yx_63AXP8XaWELiy49M2K459AaeA@mail.gmail.com>
References: <CACPK8Xc7=f_p8Ws4u4yYn3yx_63AXP8XaWELiy49M2K459AaeA@mail.gmail.com>
Message-ID: <20171221061706.vpck4pcd764eezhx@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joel,

On Thu, Dec 21, 2017 at 11:31:26AM +1030, Joel Stanley wrote:
> I was trying to create an ARM image that used a musl libc and contains
> the Linux gpio tools. It fails to build as tools/gpio/gpio-event-mon.c
> requires but does not directly include sys/types.h for the u_int32_t
> types.
> 
> On a glibc system sys/types.h appears to be included through unistd.h.
> 
> I've sent a patch to the kernel:
> 
>  https://patchwork.kernel.org/patch/10126851/
> 
> How do I fix this for buildroot? We could disable the gpio tools for
> kernels that do not include this fix. Or we could disable the tools
> for musl builds.

Or a combination of both. That is, disable the gpio tool for older kernel when 
the libc is musl. That would be the best option, I think.

> Better would be to patch the kernel build in buildroot, but it appears
> that patches can't be added to linux-tools in the same way as other
> packages.

You can't easily do that because Buildroot is supposed to work with any kernel 
version. A patch that applies to your version might not apply to another 
kernel version.

> Which solution should we go with?

Another solution is to use sed to implant the missing header include at the 
beginning of the file. This is ugly, and IMO not worth it.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
