From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 2 Jul 2017 21:01:27 +0200
Subject: [Buildroot] [PATCH v1] qt5multimedia: fix plugins videonode egl
 x11 header related compile failure
In-Reply-To: <20170702003332.771dd45c@windsurf>
References: <20170626211311.10890-1-ps.report@gmx.net>
 <20170702003332.771dd45c@windsurf>
Message-ID: <20170702210127.7090df5b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, 2 Jul 2017 00:33:32 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Mon, 26 Jun 2017 23:13:11 +0200, Peter Seiderer wrote:
> 
> > +diff --git a/src/plugins/videonode/egl/egl.pro b/src/plugins/videonode/egl/egl.pro
> > +index 7151123..08ec149 100644
> > +--- a/src/plugins/videonode/egl/egl.pro
> > ++++ b/src/plugins/videonode/egl/egl.pro
> > +@@ -3,6 +3,9 @@ TARGET = eglvideonode
> > + QT += multimedia-private qtmultimediaquicktools-private
> > + CONFIG += egl
> > + 
> > ++# Avoid X11 header collision, use generic EGL native types
> > ++DEFINES += MESA_EGL_NO_X11_HEADERS
> > ++
> 
> I am not really convinced by this patch. Indeed, I believe it should be
> the OpenGL providers that define this constant when needed. If you look
> at the config that generated the build failure you're trying to fix
> (http://autobuild.buildroot.net/results/364/364a76bbf90251f9cae2abd3ef2e382758eae538),
> you'll see that the OpenGL provider used is mali-t76x. However,
> package/mali-t76x/glesv2.pc contains:
> 
> Cflags: -I${includedir} -DMESA_EGL_NO_X11_HEADERS
> 
> So, I would expect that Qt5 should not need to redefine it again.
> Obviously, what worries me is that fixing Qt5 will fix just Qt5, and
> not any other package using the same OpenGL provider.
> 
> What do you think?

Same fixing pattern as for qt5base (and for qtbase accepted upstream, see e.g. [1]),
but in general your are right, honor the given provider provided flags would be
the better solution...maybe something as suggested on the yocto meta-freescale
mailing list will work, see [2], [3]: 'egl.prf: Fix build error when egl headers
need platform definition'?

Did not yet had time to try the suggested patch (the first references says
'Upstream-Status: Pending' but without reference)...

Regards,
Peter

[1] https://codereview.qt-project.org/#/c/188158/
[2] https://lists.yoctoproject.org/pipermail/meta-freescale/2017-June/020654.html
[3] https://lists.yoctoproject.org/pipermail/meta-freescale/2017-June/020653.html

> 
> Thomas
