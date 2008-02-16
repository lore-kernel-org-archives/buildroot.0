From: Hamish Moffatt <hamish@cloud.net.au>
Date: Sun, 17 Feb 2008 10:50:37 +1100
Subject: [Buildroot] [buildroot 0002164]: DirectFB Fails
	with	--enable-static option because of incorrect ld location
In-Reply-To: <d338add7d7956fb6821db0c1b916ccea@busybox.net>
References: <d338add7d7956fb6821db0c1b916ccea@busybox.net>
Message-ID: <20080216235037.GB30401@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 15, 2008 at 07:27:40PM -0800, bugs at busybox.net wrote:
> Today i was trying to make arm926ejs toolchain with buildroot 4th feb
> snapshot. I added --enable-static option in directfb.mk file. During build
> i noticed that directfb is using root ld (/usr/bin/ld) instead of
> arm-linux-ld build by buildroot toolchain. i renamed /usr/bin/ld to
> /usr/bin/ld_orig and it failed with below error. 
> 
> Is there any way to make directfb makefile to consider buildroot toolchain
> built ld instead of /usr/bin/ld 

> Making install in fbdev 
> make[3]: Entering directory
> `/home/project/original/bldrt/buildroot/build_arm/DirectFB-1.0.1/systems/fbdev'
[..]

It looks like some (re)linking is being done at install time. Modify
directfb.mk to pass the relevant compiler/linker flags during install as
well.

Where you see:

$(STAGING_DIR)/usr/lib/libdirectfb.so: $(DIRECTFB_DIR)/.compiled
	$(MAKE) DESTDIR=$(STAGING_DIR)/usr -C $(DIRECTFB_DIR) install

change this to

	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR)/usr -C $(DIRECTFB_DIR) install

Please report if this works for you so that it can be checked in.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
