From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 26 Jun 2016 16:20:27 -0300
Subject: [Buildroot] [PATCH v3 5/5] package/enlightenment: bump to 0.20.9
In-Reply-To: <dfd39299-57a5-2b62-1f71-5f9fa7326c53@gmail.com>
References: <1466630866-28779-1-git-send-email-romain.naour@gmail.com>
 <1466630866-28779-5-git-send-email-romain.naour@gmail.com>
 <dfd39299-57a5-2b62-1f71-5f9fa7326c53@gmail.com>
Message-ID: <57702AFB.6080001@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/06/16 15:39, Romain Naour wrote:

> Hi Gustavo,
>
> I tried to build enlightenment 0.20.9 with Wayland support only but there are
> several issues which should be fixed with the next version (0.21)
>
> First we need [1] since configure always check for ecore-x (X11).

Hi Romain.
Yes, that's a typical failure in some packages, particularly gtk3-using 
ones that assume X must be around and break wayland & broadway.

> Then, there is another issue with Wayland EGL cflags not forwarded correctly
> (MESA_EGL_NO_X11_HEADERS not set when EGL/eglplatform.h is included)...
>
> sysroot/usr/include/EGL/eglplatform.h:119:22: fatal error: X11/Xlib.h: No such
> file or directory

This is typically a problem with pkg-config files missing EGL cflags, 
such as in libepoxy:
https://git.busybox.net/buildroot/tree/package/libepoxy/0005-Forward-egl-cflags-into-epoxy.pc.patch
Hence for example mesa headers go crazy and that happens.

> So, I don't think Wayland support is ready for this version. Instead we should
> wait for E 0.21 (rc1 currently).
>
> Also, I have another series (needed for Wayland) adding OpenGL/OpenGLES support,
> libdrm for DRM, and DRM + GL support. To finish, I need to add systemd support
> in EFL and E.
> But this bump series must be commited before sending it ;)
>
> Did you already tested Wayland/Weston with systemd?
> Have you a working Buildroot configuration?

Not yet, i've paved the way to make that simpler in weston via 
automatically enabling systemd bindings and the helper, but i haven't 
runtime tested it since my samples aim for total simplicity hence start 
everything up as root automatically via initscript (no extra user 
accounts and so on) - and normally doing this on a systemd target isn't 
so simple.
Regards.
