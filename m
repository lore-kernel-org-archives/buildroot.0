From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Dec 2012 13:35:07 +0100
Subject: [Buildroot] Bug report in pkg-autotools.mk
In-Reply-To: <CAExA2HxbO1X8zt_+Q=BtUhqnWCCSeNGZ3ALR_FhJmhWnpGLBHA@mail.gmail.com>
References: <CAExA2HxbO1X8zt_+Q=BtUhqnWCCSeNGZ3ALR_FhJmhWnpGLBHA@mail.gmail.com>
Message-ID: <20121219133507.058bf1ea@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yvan Roch,

On Wed, 19 Dec 2012 12:32:43 +0100, Yvan Roch wrote:

> In the pkg-autotools.mk file, line 238 (BR2012.11) or
> Makefile.autotools.in line 250 (BR2012.02), there is the following
> command:
> 
> $$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
> 
> This command corrects the bad path for libraries installed in the
> staging directory in the libtool .la files.
> 
> But, if Buildroot resides in a directory that contains /usr (for
> example /usr/local/src/buildroot-2012.11), $(STAGING_DIR) contains
> /usr and this command is not idempotent.
> Each time an autotools package is built, the paths in .la files are
> longer and false.

Indeed. I have a patch fixing that:

-               $$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
+               $$(SED) "\:['= ]$(STAGING_DIR)/usr:!s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \

However, using a Buildroot in /usr is still broken after that, due to
libglib2 having .la files with incorrect paths (paths pointing to the
build directory). I haven't managed to fix those, so I didn't yet send
the patch to fix the more general .la files problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
