From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 23 Jan 2015 11:57:42 +0100
Subject: [Buildroot] [RFC 0/4] Try to clean up proprietary OpenGL drivers
In-Reply-To: <1421839408-15839-1-git-send-email-jezz@sysmic.org>
References: <1421839408-15839-1-git-send-email-jezz@sysmic.org>
Message-ID: <20150123105742.GB8089@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2015-01-21 12:23 +0100, J?r?me Pouiller spake thusly:
> Until now, xorg-xserver depends on mesa3d to compile with GLX/DRI support.
> However, there was problem with proprietary OpenGL drivers. These ones depends
> on GLX/DRI support (so, they depends on mesa3d) and overwrite files provided by
> mesa3d (so, they conflict with mesa3d).
> 
> Thanks to opengl-registry, it is possible to change proprietary OpenGL drivers
> in real LibGL provider and compile GLX/DRI support using proprietary drivers
> instead of mesa3d.
> 
> Notice this series aim to highlight the problem described above. It does not
> aim to be upstreamed. It apply on top of Yann series about nvidia driver and
> my series about imx6 gpu driver.
> 
> J?r?me Pouiller (4):
>   nvidia-driver: Add gl.pc
>   gpu-viv-bin-mx6q: is a libgl provider
>   opengl-registry: Also provide DRI interface
>   xorg-server: Depends on libgl to enable DRI/GLX

So, I have some comments about this series.

First, I have included your patch to add gl.pc to nvidia-driver. Thanks!
:-)

Second, the imx6 stuff does not apply since your series has not yet been
applied. I'll leave it to you to cary thos two patches. ;-)

Finally, I am not too fond of bundling the dri header, neither in the
OpenGL registry package, nor in any other package.

I know I bundled the gl.h header, but I did so on the assumption that
was the only header we'd have to carry. Turns out I was wrong, and we
need another header. That's unfortunate. :-(

I would really like to see a proper solution for that, but I have no
good idea... :-/

The only I can come up with is to change the mesa3d package to only
install those missing headers, and have the registry depend on it.
But I do not find this option very nice...

An alternative would be to provide a prompt-less, stripped mesa3d
package that woudl install only headers; package that we may call
something like mesa3d-headers and that the registry would select.
However, I do not find this to be much any more appealing that the
alternatives... :-(

I'm open for comments...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
