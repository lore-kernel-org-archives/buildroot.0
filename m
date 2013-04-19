From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 19 Apr 2013 23:20:27 +0200
Subject: [Buildroot] RFC: "make emu" build and start QEMU target
In-Reply-To: <CAEBucnDgqjO+3RpdXOgqJzkitSG6P-L=cbOEJws09WZXnnD5kQ@mail.gmail.com>
References: <CAEBucnDgqjO+3RpdXOgqJzkitSG6P-L=cbOEJws09WZXnnD5kQ@mail.gmail.com>
Message-ID: <5171B51B.2070805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/04/13 20:32, Spenser Gilliland wrote:
> Hi,
>
> I'm proposing a project where a "make emu" target would be added to
> Buildroot in order to start a virtualized version of the target.  This
> would provide developers with the ability to quickly test and validate
> their configuration.

  Great idea!

> To configure the emu target a new top-level menu, "Target Emulation,"
> would be added.  This menu would contain the following options.

  I think  a single 'QEMU emulation of target' menu is sufficient. Can 
you think of another emulator?

  And maybe it belongs in the host-tools menu, rather than top-level.

> Emulation Method -> QEMU
> QEMU Version -> Custom Git Tree | Custom tarball | Custom Version | X.Y.Z
> ... Source Configuration similar to Kernel ...
> Machine -> list of machines

  I think the number of machines is a bit too large to list them. Just 
specify a string, like a kernel defconfig or a u-boot config.

> Memory -> Memory in Megabytes
> Additional QEMU Options -> (additional options for command line)

  Probably more options (devices, graphics output, #CPUs) should be 
configurable, but that can be added in later steps.

> This will start the qemu-system-$(ARCH) version of QEMU with the
> appropriate configuration.

  I'm not a big fan of starting tools like qemu or a debugger or whatever 
from the buildroot 'make' command. I would prefer to generate a script 
that runs qemu with the correct arguments. You can easily start that 
script either with 'make && output/images/run_qemu.sh' or from a 
post-build script. But others may disagree with me.


  Would you generate the correct -drive option automatically from the 
selected rootfs, or select the rootfs automatically?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
