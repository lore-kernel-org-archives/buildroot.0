From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2010 17:12:56 +0100
Subject: [Buildroot] libglib2 copies unwanted things to target
In-Reply-To: <4B684D2F.5090404@carallon.com>
References: <4B684D2F.5090404@carallon.com>
Message-ID: <20100206171256.771ec5f2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi William,

On Tue, 02 Feb 2010 16:05:03 +0000
William Wagner <will_wagner@carallon.com> wrote:

> Have added the libglib2 package to my target and it seems to copy
> over a load of unwanted things into the target filesystem. In
> particular it copies a load of help files to target/usr/share/gtk-doc
> 
> The package uses the autotools framework which I'm not expert on so
> not sure the best way to tackle this. Should there just be a post
> target install step to go round and delete the unwanted files? I
> guess better would be to change the glib2 install target to one that
> does not copy over the help but I'm not familiar with the package so
> not sure if that is possible.
> 
> What does anyone suggest?

There are typically two approaches in Buildroot packages :

 * Either the .mk file does not use the "make install" target the
   package makefile to install the package to the target/ directory and
   manually installs only what's needed for runtime usage of the package
   software ;

 * Or the .mk file does use the "make install" target of the package
   makefile to install the package to the target/ directory and then
   cleans up the files that are not really needed for runtime usage of
   the package.

In the case of the libglib2 package, manually doing the package
installation to the target is maybe too complicated, so the second
solution is probably the easiest one. It would be something like:

define LIBGLIB2_REMOVE_DOCUMENTATION
 rm -rf $(TARGET_DIR)/usr/share/gtk-doc
endef

LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_DOCUMENTATION

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
