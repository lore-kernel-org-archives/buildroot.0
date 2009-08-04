From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Aug 2009 16:36:56 +0200
Subject: [Buildroot] installing binaries
In-Reply-To: <20090729013305.GG7257@moomers.org>
References: <20090729013305.GG7257@moomers.org>
Message-ID: <20090804163656.2d24be34@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Igor,

Le Tue, 28 Jul 2009 20:33:05 -0500,
Igor Serebryany <igor47@moomers.org> a ?crit :

> 	I've been having a hard time figuring out how buildroot
> decides to install binaries. Using 2009.02 or 2009.05, I often find
> that the binaries for the packages I've selected do not make it into
> 	project_build_ARCH/myproject/root

Basically, the decision is package dependent. But we have roughly two
types of packages :

 * Packages based on the Makefile.autotools.in infrastructure. In that
   case, the installation to the target space
   (project_build_ARCH/PROJECT/root) is done if FOO_INSTALL_TARGET is
   YES (which is the default), and if the
   project_build_ARCH/PROJECT/autotools-stamps/PKG_NAME_target_installed
   stamp file does not exist. See package/Makefile.autotools.in for the
   details ;

 * Packages *not* based on the Makefile.autotools.in. In that case, the
   install is usually implement with a make target that is a file
   installed in the target directory. For example, for the flex
   package, it is $(TARGET_DIR)/$(FLEX_TARGET_BINARY). Therefore,
   removing this file from the target directory will trigger the
   re-execution of the make install of that particular package.

> 	Is there a way to tell buildroot to go through every selected
> 	package and copy the binaries to the image?

Theorically, removing the target directory completely + removing the
*_target_installed stamp files from
project_build_ARCH/PROJECT/autotools-stamps/ should make it. But I
don't guarantee that it will work for every package.

> 	I think I get all the packages if I make distclean and then
> make, but many packages fail to compile the first time (like
> util-linux which always requires a lot of hacking) and I hate to
> loose my modifications via make distclean

If they are issues in building util-linux, please don't hesitate to
report them so that we can fix them.

> 	Trying 'make clean' is futile, as most packages fail to clean
> and make clean always errors out half-way through.

Yes.

> 	I've been working on this for a few days now, so I appreciate
> any tips...

I gave you the tips that I have. Buildroot is definitely not good
(yet!) on cleaning up things and handling partial rebuilds. This is
definitely on my TODO-list, and I think that Peter is also very
concerned about these issues.

Hope this helps,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 197 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090804/473e5dc7/attachment.pgp>
