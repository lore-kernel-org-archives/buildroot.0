From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Nov 2018 16:48:59 +0100
Subject: [Buildroot] Making the Meson integration compatible with
 per-package folders
Message-ID: <20181116164859.4c0f4781@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, Peter,

I don't know if you have followed the discussion, but I recently sent a
new iteration of the per-package folder series [1], which allows to
support top-level parallel build.

Currently the Meson integration in Buildroot doesn't work with this
per-package folder stuff.

The initial issue is that:

   --cross-file=$(HOST_DIR)/etc/meson/cross-compilation.conf

should be:

   --cross-file=$$(HOST_DIR)/etc/meson/cross-compilation.conf

But of course, behind that, there's a bigger issue: this
cross-compilation.conf hardcodes the compiler path, library path, etc.
However, with per-package folders, we really need to use the compiler
and libraries from the per-package folder of the current package.

To achieve this, we will need to generate a per-package
cross-compilation.conf, which is something Peter was already proposing
in http://patchwork.ozlabs.org/patch/946599/. However, compared to this
patch, we would need:

 (1) Replacing not only the CFLAGS, but also the compiler/library paths.

 (2) Producing a final cross-compilation.conf, which can be used by
     people using the toolchain outside of Buildroot.

I am sending this e-mail to see if you are willing/available to help on
this, or if you would like me to take over this work and propose a
patch series.

Thanks a lot!

Thomas

[1] http://patchwork.ozlabs.org/project/buildroot/list/?series=75909
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
