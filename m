From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 18:49:17 +0200
Subject: [Buildroot] [PATCH v5 1/2] meson: add per package optional
 compiler/linker flags
In-Reply-To: <20190408204321.18620-1-ps.report@gmx.net>
References: <20190408204321.18620-1-ps.report@gmx.net>
Message-ID: <20190413184917.3b3a44eb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Mon,  8 Apr 2019 22:43:20 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Add LIBFOO_MESON_CFLAGS, LIBFOO_MESON_LDFLAGS and LIBFOO_MESON_CXXFLAGS
> variables to allow per package additional compiler/linker flags.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

I did a bit of research. Meson does accept -Dc_args and a bunch of
other options on the command line, but they are ignored when a
cross-file is used. http://mesonbuild.com/Builtin-options.html says it
clearly: "c_args, cpp_args, c_link_args, and cpp_link_args only affect
native builds, when cross compiling they will not be applied to
binaries or libraries targeting the host system, only those being run
on the build system."

There is some on-going discussion upstream about this. See
https://github.com/mesonbuild/meson/issues/4767.

A cross_pkg_config_path option was merged:

  https://github.com/mesonbuild/meson/commit/91b2475e30d7659dad24eb35b47e4d098c716792

Aparently, they are talking about possibly adding cross_c_args.

What do we do ? Wait until upstream solves the problem ? Use an
intermediate solution like yours, and later one move to another one if
upstream provides one ?

Could you at least raise the fact that the Buildroot project would also
be interested in being able to pass addition cflags/cxxflags/ldflags on
the command line, as well as passing the path of tools like
libgcrypt-config ? (See my reply to J?rg Krause's patch on this topic,
on which you are Cc'ed).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
