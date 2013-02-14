From: Dimitrios Siganos <dimitris@siganos.org>
Date: Thu, 14 Feb 2013 00:09:11 +0000
Subject: [Buildroot] uboot-tools and uboot being separate
In-Reply-To: <20130213212002.25c976ca@skate>
References: <511BCBEE.5040704@siganos.org> <20130213212002.25c976ca@skate>
Message-ID: <511C2B27.10102@siganos.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/02/13 20:20, Thomas Petazzoni wrote:
> Dear Dimitrios Siganos,
> 
> On Wed, 13 Feb 2013 17:22:54 +0000, Dimitrios Siganos wrote:
> 
>> I have a query regarding uboot and uboot-tools. Currently they are
>> separate packages.
>>
>> However, if I am building both the uboot bootloader and the uboot tools
>> would it not be reasonable to expect to use the same sources for
>> compiling both? At the moment, I am in a situation where I am building
>> uboot with one set of files and uboot-tools (e.g. fw_printenv) with another.
>>
>> Is the recommended solution to point both uboot and uboot-tools to the
>> same package version and apply the same patches to both? And have two
>> parallel builds (uboot, uboot-tools) that should be identical?
> 
> No. You don't have to have identical uboot-tools and uboot. Basically
> uboot-tools provide one tool to create U-Boot images (mkimage) and
> tools to manipulate the U-Boot environment from Linux (fw_printenv,
> fw_setenv). Those tools are backward compatible, and so you can
> perfectly use the tools from U-Boot 2010.x with a running U-Boot 2012.x
> or 2013.x.
> 
> There is really no need to have the same source code base for both
> uboot and uboot-tools.
> 
>> I have also being thinking along these lines:
>>
>> 1) Edit the uboot-tools makefile to not use its own build directory but
>> use uboot's build instead (silly idea idea I admit, but you never know...).
>>
>> 2) Edit the uboot package to optionally compile and install the
>> uboot-tools as well (this seems to me to be the most logical way).
>>
>> Can I have your feedback?
> 
> Basically, no, there's a good reason why we wanted two separate
> packages: we wanted to be able to build the U-Boot tools sometimes for
> the host (mkimage), sometimes for the target (fw_printenv, fw_setenv).
> The host-uboot-tools package is also used as a dependency of the Linux
> kernel package, and it is much simpler to depend on host-uboot-tools
> that to depend on the uboot package itself.
> 
> So really, the current way things are done for uboot vs. uboot-tools
> has proven to work really well, and for now I don't see a compelling
> reason to change that.

Hi Thomas,

In this case, the issue is as much political as it is technical. I have
recently moved the build system of a company to buildroot but an
engineer, who had designed the old system, is convinced that the uboot
in the new system is less reliable and he attributes that to the
different sources used to build uboot and uboot-tools. I have not
noticed an increase in unreliability but really it is impossible for us
to measure such things since we have no automated testing. The reality
is that we just don't know. However, the engineer is adamant that there
is a problem and that building from the same sources is the solution or
at least the beginning of the solution and it is hard to argue against it.

However, I appreciate that this is more of a political problem rather
than a technical one and that it is a tricky situation all around.

Regards,
Dimitris
