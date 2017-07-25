From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 21:34:24 +0200
Subject: [Buildroot] [PATCH v1] package/libv4l: disable libraries build
 if no fork() support
In-Reply-To: <1500989370-5353-2-git-send-email-hugues.fruchet@st.com>
References: <1500989370-5353-1-git-send-email-hugues.fruchet@st.com>
 <1500989370-5353-2-git-send-email-hugues.fruchet@st.com>
Message-ID: <20170725213424.7688452c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Jul 2017 15:29:30 +0200, Hugues Fruchet wrote:
> Some no-MMU platforms have shared libraries support
> but no fork() support, which is required by libv4lconvert.
> Fix this by disabling libv4l libraries build in case of
> no fork() support.
> This fix the build issue reported here:
> http://lists.buildroot.org/pipermail/buildroot/2017-July/197571.html
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>

I'm sorry, but I'm not sure this is the right solution. Indeed, this
entirely disables the build of all libv4l libraries.

Therefore, if you for example re-enable the v4l2grab package by
dropping its BR2_USE_MMU dependency, it fails to build with:

v4l2grab.c:59:21: fatal error: libv4l2.h: No such file or directory
 #include <libv4l2.h>

So things work today because the libv4l package used to have a
BR2_USE_MMU dependency, which was propagated to its reverse
dependencies. But as you can see, it doesn't really work properly.

I believe the attached patch for libv4l is better. It keeps building
all libraries, and only disables the one specific libv4lconvert feature
that needs fork(): using external helpers for decompressing frames.
This is only needed for the OV511 and OV518 formats, so only for very
specific webcams if I understood correctly.

If you're happy with this patch, could you submit it upstream, and
submit it to Buildroot as well ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Build-libv4lconvert-helper-support-only-when-fork-is.patch
Type: text/x-patch
Size: 3795 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170725/d6c540bf/attachment.bin>
