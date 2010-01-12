From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jan 2010 11:54:41 +0100
Subject: [Buildroot] Issue for the integration of Codesourcery external
 toolchains
In-Reply-To: <20100106065952.GA12127@jasper.tkos.co.il>
References: <20100104162422.5b7e7bf6@surf>
	<20100106065952.GA12127@jasper.tkos.co.il>
Message-ID: <20100112115441.0c21b140@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 6 Jan 2010 08:59:53 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> >  * Build a more normal sysroot in $(STAGING_DIR) by combining the
> >    contents of armv4t and the header files. But this would require
> >    telling gcc that the libraries aren't in armv4t anymore. This is
> >    probably possible using a custom spec file, but is quite
> >    complicated.
> 
> How about generating symlinks in the staging directory:
> 
> armv4t/usr/include -> ../../usr/include
> thumb2/usr/include -> ../../usr/include
> 
> and then using the output of -print-sysroot for each target?

Because everything in Buildroot assumes that the libraries and headers
must be installed in $(STAGING_DIR)/usr/include and
$(STAGING_DIR)/usr/lib, not in $(STAGING_DIR)/armv4/usr/include and
$(STAGING_DIR)/armv4/usr/lib.

See the following part of my original e-mail:

==============================================
When the armv5t architecture is selected, everything works as
expected: the includes are in $(STAGING_DIR)/usr/include, the
libraries in $(STAGING_DIR)/lib and $(STAGING_DIR)/usr/lib.

When armv4t is selected, the include files are in
$(STAGING_DIR)/usr/include, but the libraries are in
$(STAGING_DIR)/armv4t/lib and $(STAGING_DIR)/armv4t/usr/lib. And the
linker *only* looks in these directories for the libraries.

Unfortunately, all Buildroot packages install their libraries in
$(STAGING_DIR)/lib and $(STAGING_DIR)/usr/lib, so the linker doesn't
find them.

For example, compiling zlib works, but compiling libpng fails because
it cannot find zlib. This is because zlib has been installed in
$(STAGING_DIR)/usr/lib and not in $(STAGING_DIR)/armv4t/usr/lib.
==============================================

Thanks for the feedback!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
