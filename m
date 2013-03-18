From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Mar 2013 16:04:15 +0100
Subject: [Buildroot] [PATCH 000/120] x11: update to R7.7
In-Reply-To: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
References: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
Message-ID: <20130318160415.704c31a2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jesper Baekdahl,

On Mon, 18 Mar 2013 13:52:40 +0100, Jesper Baekdahl wrote:
> Following the work of Will Wagner: http://lists.busybox.net/pipermail/buildroot/2013-February/066605.html
> I have tried to update x11 components to R7.7, now based on the latest master. 
> I have not included patches that delete xapp_* packages even though they are not a part of R7.7 release since they are released individually.
> These patches can also be fetched as a branch here: https://bitbucket.org/baekdahl/buildroot/src/b8db03aa6921/?at=x11r77

I had a look at your patch set from your Git repository, I guess the
version of the patches you're posting now haven't changed much.

My major problem is that the patch series is not bisectable: they are
some packages that are removed even if they are still used by other
packages. Of course, those other packages are updated later in the
series and get rid of the dependency on the removed package, but in the
mean time, the build is broken.

Here are some notes I had written down while reviewing the patch set:

 * Removal of xlib_libXfontcache, but xapp_xset depends on it. A later
   patch updates xapp_xset to a version that does not depend on
   xlib_libXfontcache, it should probably be ealier in the patch
   series.

 * Removal of xlib_libXp, what about
   x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk,
   x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk,
   x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk.

   Ok, xlib_libXprintUtil and xlib_libXprintAppUtil are removed in
   later commits. Either they should be merged into the xlib_libXp
   removal commit, or better, the commits should be reordered: first
   remove xlib_libXprintAppUtil, then remove xlib_libXprintUtil, then
   xlib_libXp. In order to preserve bisectability, it is important
   that packages are being removed starting from the leaves of the
   dependency tree.

 * xcb-util removal? We have new packages that depend on it, so it
   looks strange... See xcb-util-wm

 * xproto_fontcacheproto removal: it is still being used as a
   dependency in xlib_libXfont.mk.

 * xutil_util_macros, the commit log says it bumps the revision to
   X11R7.7, but the commit only adds a patch (which also happens to
   lack a description).

 * xproto_xf86rushproto: same problem as other packages, it is removed
   while it is still being used by the X.org server (which gets
   changed only later in the patch series).

Generally speaking, I would suggest to put all the version bumps and
related dependency removals first, and then the package removals.

That said, achieving complete bisectability may be difficult: many of
the version bumps are related, and it may be hard to find the right
ordering. Maybe there should be one big patch that does all the version
bumps at once, and then patches to remove the packages that are no
longer useful.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
