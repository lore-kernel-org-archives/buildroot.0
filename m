From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 22:40:22 +0100
Subject: [Buildroot] [PATCH v1] package/qwt: needs qt5base gui support
In-Reply-To: <20190215215859.3ef24917@gmx.net>
References: <20190215202504.24205-1-ps.report@gmx.net>
 <20190215214343.68c0b057@windsurf.home>
 <20190215215859.3ef24917@gmx.net>
Message-ID: <20190215224022.7a1ccf4c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Feb 2019 21:58:59 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Because until  now qwt is the only package selecting widgets without gui
> (most packages directly, pulseview via qt5svg and qt5cinex via qt5base
> eglfs)...and from qt5base/Config.in:
> 
>   if BR2_PACKAGE_QT5BASE_GUI
> 
>   config BR2_PACKAGE_QT5BASE_WIDGETS
>           bool "widgets module"
>   [...]
>   endif

Ah, so there is already a "depends on" between widgets and gui in
qt5base, which is good.

So it's indeed qwt that is bogus: it should not select QT5BASE_WIDGETS
without selecting QT5BASE_GUI (or depending on it). So your patch is
good, I'll apply.

> > Indeed, to me, it seems like any other package that uses qt5 widgets
> > without selecting qt5 gui would fall into the same build failure.
> > 
> > Also, any idea why this is popping up only now ?  
> 
> No, did not search the autobuild database, but maybe since 'package/qwt: remove qt4 support'?

It's indeed a bug from that patch! Look carefully at the diff of
3e99c8418af904b14b01455d68c84d7b5afd261f:

 config BR2_PACKAGE_QWT
        bool "qwt"
-       depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
-       select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
-       select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
-       select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5 # printsupport
-       select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5
+       depends on BR2_PACKAGE_QT5
+       select BR2_PACKAGE_QT5BASE
+       select BR2_PACKAGE_QT5BASE_WIDGETS # printsupport
+       select BR2_PACKAGE_QT5BASE_CONCURRENT

See how the line:

-       select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5

gets removed ?

So I'll apply your patch after adjusting the commit log. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
