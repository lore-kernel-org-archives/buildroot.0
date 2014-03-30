From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Mar 2014 11:13:50 +0200
Subject: [Buildroot] [PATCH 00/91] Update mesa3d & xorg
In-Reply-To: <20140329231259.GO3227@free.fr>
References: <BLU0-SMTP39628D1C21A39FA8BD40475D9610@phx.gbl>
 <20140329235039.4bf4983e@skate> <20140329231259.GO3227@free.fr>
Message-ID: <20140330111350.4782647c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 30 Mar 2014 00:12:59 +0100, Yann E. MORIN wrote:

> The problem seems related to libevas, where the dependency on openGL is
> poorly handled.
> 
> I'm working on it, but you are free to investigate too. ;-)
> 
> So far, I managed to get rid of the circular hell, with this:
> 
>     diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
>     index 2afa888..8eea23d 100644
>     --- a/package/efl/libevas/Config.in
>     +++ b/package/efl/libevas/Config.in
>     @@ -148,7 +148,7 @@ choice
>      config BR2_PACKAGE_LIBEVAS_GL
>             bool "generic OpenGL"
>     -       select BR2_PACKAGE_MESA3D
>     +       depends on BR2_PACKAGE_MESA3D
>             select BR2_PACKAGE_LIBEET

But shouldn't BR2_PACKAGE_LIBEVAS_GL instead depend on a new virtual
package for full OpenGL? We can imagine having in the future other
implementations that Mesa3D for the full OpenGL, no? Like if you
install the NVidia proprietary drivers, I believe they come with their
own implementation of OpenGL, completely independent from Mesa3D, no?

In this case, since we can "select" a virtual package because that
doesn't make sense, the dependency would have to be a "depends on", and
we're good, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
