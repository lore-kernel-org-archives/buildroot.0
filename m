From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Feb 2013 23:57:03 +0100
Subject: [Buildroot] uboot-tools and uboot being separate
In-Reply-To: <20130213212002.25c976ca@skate>
References: <511BCBEE.5040704@siganos.org> <20130213212002.25c976ca@skate>
Message-ID: <511C1A3F.2080804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/02/13 21:20, Thomas Petazzoni wrote:
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

  I've had the same issue once: a patch to add some functionality to 
mkimage that I needed both on the host and on the target.

>
> No. You don't have to have identical uboot-tools and uboot. Basically
> uboot-tools provide one tool to create U-Boot images (mkimage) and
> tools to manipulate the U-Boot environment from Linux (fw_printenv,
> fw_setenv). Those tools are backward compatible, and so you can
> perfectly use the tools from U-Boot 2010.x with a running U-Boot 2012.x
> or 2013.x.

  Unless some feature has been added or removed.

>
> There is really no need to have the same source code base for both
> uboot and uboot-tools.
>
>> I have also being thinking along these lines:
>>
>> 1) Edit the uboot-tools makefile to not use its own build directory but
>> use uboot's build instead (silly idea idea I admit, but you never know...).

  This will be the way to go - and much easier as soon as the out-of-tree 
build is there. But it still requires more infrastructural change, since 
currently there is no way to specify that a package doesn't have a source 
itself, but the source comes from another package.

  There are actually a few other packages out there that have or could 
have the same "shared source, separate build" issue: kernel-headers, 
udev, perf.


  Regards,
  Arnout

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
>
> Best regards,
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
