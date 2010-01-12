From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Jan 2010 14:48:00 +0200
Subject: [Buildroot] Issue for the integration of Codesourcery external
 toolchains
In-Reply-To: <20100112115441.0c21b140@surf>
References: <20100104162422.5b7e7bf6@surf>
	<20100106065952.GA12127@jasper.tkos.co.il>
	<20100112115441.0c21b140@surf>
Message-ID: <20100112124800.GB8097@jasper.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jan 12, 2010 at 11:54:41AM +0100, Thomas Petazzoni wrote:
> On Wed, 6 Jan 2010 08:59:53 +0200
> Baruch Siach <baruch@tkos.co.il> wrote:
> 
> > >  * Build a more normal sysroot in $(STAGING_DIR) by combining the
> > >    contents of armv4t and the header files. But this would require
> > >    telling gcc that the libraries aren't in armv4t anymore. This is
> > >    probably possible using a custom spec file, but is quite
> > >    complicated.
> > 
> > How about generating symlinks in the staging directory:
> > 
> > armv4t/usr/include -> ../../usr/include
> > thumb2/usr/include -> ../../usr/include
> > 
> > and then using the output of -print-sysroot for each target?
> 
> Because everything in Buildroot assumes that the libraries and headers
> must be installed in $(STAGING_DIR)/usr/include and
> $(STAGING_DIR)/usr/lib, not in $(STAGING_DIR)/armv4/usr/include and
> $(STAGING_DIR)/armv4/usr/lib.

I'll clarify. I suggest the following steps:

1. Copy the entire CodeSourcery sysroot (as reported by -print-sysroot) into 
   $(STAGING_DIR).

2. Create the following symlinks:

    $(STAGING_DIR)/armv4t/usr/include -> ../../usr/include
    $(STAGING_DIR)/thumb2/usr/include -> ../../usr/include

3. Set as necessary:

    STAGING_DIR=$(STAGING_DIR)/armv4t

    or

    STAGING_DIR=$(STAGING_DIR)/thumb2

Buildroot then sees libraries and headers in $(STAGING_DIR)/usr/lib and 
$(STAGING_DIR)/usr/include respectively, as expected.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
