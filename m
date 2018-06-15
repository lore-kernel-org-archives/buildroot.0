From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Jun 2018 21:13:30 +0200
Subject: [Buildroot] Using a bootlin toolchain with buildroot
In-Reply-To: <CAF_dkJAH5u3g_rQYaUVzCnUMyeMTMZrRbo0KDnOt6pVQtwvb-g@mail.gmail.com>
References: <CAF_dkJBJAouapTOfS-MEo-cLNHb1birJ74dvChGPgfVG=i6guw@mail.gmail.com>
 <20180406210215.6c276c4f@windsurf.home>
 <CAF_dkJBUm=iYA_WPm3eJ1KGN6aKJKVS+PoYdJnnWax-xivKJWw@mail.gmail.com>
 <20180407084321.1e68cc90@windsurf.home>
 <CAF_dkJDwfTvVHmSVgi4mo=2u=-Yj-__3e7rqsOyUXppLPeysEQ@mail.gmail.com>
 <CAF_dkJAH5u3g_rQYaUVzCnUMyeMTMZrRbo0KDnOt6pVQtwvb-g@mail.gmail.com>
Message-ID: <20180615211330.479e44c5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Patrick,

On Mon, 11 Jun 2018 15:12:16 -0400, Patrick Doyle wrote:

> Remember this thread from last April?
> 
> Suppose I wanted to generate and host my own prebuilt toolchain.
> Suppose I really liked the existing
> armv7-eabihf--musl--stable-2018.02-2 toolchain, but I really wanted to
> use 4.9 kernel headers instead of 4.1.  How would I generate and
> archive the toolchain for my own use?

Here is the summary:

 1/ Generate a Buildroot configuration that just defines the
    architecture, architecture variant and toolchain options.

    Also use the following for this configuration to disable any
    user-space package:

BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set

    I also typically pass something like
    BR2_HOST_DIR=/opt/armv7-eabihf--musl--stable-2018.02-2 in the
    configuration.

 2/ Do the Buildroot build as usual

 3/ Run "make sdk"

 4/ Create a tarball of /opt/armv7-eabihf--musl--stable-2018.02-2 and
    you're done :-)

> And, as long as I have your attention, what is the difference between
> the 2018.02-1 and 2018.02-2 toolchains anyway?  They seem to have the
> same set of GCC, GDB, Linux headers, library, and binutils versions.

The minor versions are typically just updates to the toolchain build
process or additional patches on the gcc/binutils/gdb versions. I
should have a better tracking of what I change between versions, but
that's not something I'm doing yet :-/

Hope this helps!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
