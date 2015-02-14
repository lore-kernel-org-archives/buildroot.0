From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 17:36:16 +0100
Subject: [Buildroot] [PATCH 08/10] linux: avoid unnecessary changes in
 defconfig for INITRAMFS_SOURCE
In-Reply-To: <d2981725a8a9bf2f5c557e769047ce6fa60cf5fe.1422972638.git.yann.morin.1998@free.fr>
References: <cover.1422972638.git.yann.morin.1998@free.fr>
 <d2981725a8a9bf2f5c557e769047ce6fa60cf5fe.1422972638.git.yann.morin.1998@free.fr>
Message-ID: <20150214173616.6ea77cd3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue,  3 Feb 2015 15:21:48 +0100, Yann E. MORIN wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> When Buildroot is configured to append the root filesystem to the Linux
> kernel as initramfs, Buildroot sets the path to the initramfs source
> dynamically in the Linux configuration file.
> 
> As this path is specified as an absolute path, typically being different
> for different users of the same project (e.g. containing a username),
> saving the configuration to a version control system (for example using
> 'make linux-update-defconfig') would result in a difference for this
> path at every invocation by a different user.
> Although this is technically not an issue, it is confusing that this
> generates a difference.
> 
> Address this issue by using a not-yet-expanded make variable to specify
> the path to the initramfs source. That variable will be expanded by the
> Linux build system, which uses it both as a Makefile variable and a
> shell variable; thus, it needs to be specified in LINUX_MAKE_ENV (so
> it is exported and available in sub-processes of make).  Any saved
> configuration file would simply contain the reference to the
> not-yet-expanded variable.
> 
> As in the Linux build system, the config variables are both read from
> make as from a shell script, we cannot use $() syntax as this would be
> interpreted as a command invocation by the shell. Instead, use ${}
> syntax which is interpreted as variable reference both by the shell as
> by make.

At first, I was a bit dubious, because it now means that if one wants
to re-use the Buildroot generated Linux kernel config file outside of
Buildroot, (s)he has to remember to define this BR_BINARIES_DIR
variable. But since this use-case is probably not that frequent, I got
convinced by Yann that this patch makes versioning the kernel config
file nicer.

There was an implementation bug though. See below.


> -LINUX_MAKE_ENV = $(TARGET_MAKE_ENV)
> +LINUX_MAKE_ENV = \
> +	$(TARGET_MAKE_ENV) \
> +	BR_BINARIES_DIR=$(BINARIES_DIR)

Defining $(LINUX_MAKE_ENV) is call, but you have to use it at some
point. The linux.mk makefile was using $(TARGET_MAKE_ENV) everywhere,
so I've used $(LINUX_MAKE_ENV) instead before applying. Without this,
an initramfs-enabled kernel was not building, since the BR_BINARIES_DIR
variable value was not passed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
