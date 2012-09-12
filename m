From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Tue, 11 Sep 2012 23:22:18 -0400
Subject: [Buildroot] X11 issue
Message-ID: <CADiAo4Jv5+seNc=3xBCXOL+xfnzX6vzaJD5eEmh5h2y5Cmsvnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor,

You wrote to this list on Aug 30, 2012:

> For some time I reported about x11 problems with my am3517 based
> board. Is anyone using xorg and can reproduce my issue? I'd like to
> know if it is OMAP related ot not.

> This is the error: (EE) FBDEV(0): internal error: miCreateDefColormap
> failed in FBDevScreenInit()

I am getting the same error on plain x86 hardware (bare or in KVM).

In the file xserver_xorg-server-1.7.5/dix/colormap.c (relative to the
buildroot build area) the following code:

ca.  line 395, function CreateColormap

    /*
     * Security creation/labeling check
     */
    i = XaceHook(XACE_RESOURCE_ACCESS, clients[client], mid, RT_COLORMAP,
                 pmap, RT_NONE, NULL, DixCreateAccess);
    if (i != Success) {
      FreeResource(mid, RT_NONE);
      return i;
    }

the value returned from XaceHook is not Success, so CreateColormap
fails here. It returns to the function miCreateDefColormap located in
xserver_xorg-server-1.7.5/mi/micmap.c, ca. line 314, and then the
caller of miCreateDefColormap (in the fbdev driver) prints the message
you saw.

If I comment out the return after XaceHook, miCreateDefColormap seems
to proceed, but the X server crashes.

I'll try to build gdb for the target and see where this takes me. If
anybody else saw this error and got any more results please share
here.

Hope this helps.

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
