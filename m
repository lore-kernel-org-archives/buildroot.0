From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Jan 2013 09:51:19 +0100
Subject: [Buildroot] Error when adding media-ctl as package
In-Reply-To: <50ED2E18.8070502@yahoo.fr>
References: <50EC1EBF.80807@yahoo.fr> <50EC7F16.3090008@mind.be>
 <50ED24FE.3070703@yahoo.fr> <20130109092722.7cb8409b@skate>
 <50ED2E18.8070502@yahoo.fr>
Message-ID: <20130109095119.39ad1ee9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Patrick,

On Wed, 09 Jan 2013 09:45:12 +0100, Patrick wrote:

> checking linux/media.h usability... no
> checking linux/media.h presence... no
> checking for linux/media.h... no
> ERROR: Kernel header file not found or not usable!
> 
> I think that a "make headers_install" is missing when compiling the 
> kernel. I use a buildroot external toolchain. How could I say to 
> buildboot to add the "make headers_install" step ?

Normally, the kernel headers are part of the toolchain, so they should
already be in $(STAGING_DIR)/usr/include without having to do anything
special.

However, if your toolchain is too old, it may not contain sufficiently
up-to-date kernel headers. The simplest option is to try to update your
toolchain to a slightly more recent one, so that media.h is provided
directly with your toolchain, and we have nothing to do.

If it doesn't work, then it's annoying, because we don't really have a
good way to install the kernel headers of the kernel being built by
Buildroot... It's doable, but it would probably mean that the media-ctl
package would depend on BR2_LINUX_KERNEL, which would make it unusable
for people who build their kernel outside of Buildroot. Maybe an
acceptable compromise.

Another solution is to carry a patch in the media-ctl package that adds
a local copy of the media.h header (and other needed kernel headers).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
