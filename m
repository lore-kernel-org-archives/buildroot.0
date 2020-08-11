From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Aug 2020 23:33:28 +0200
Subject: [Buildroot] [PATCH v1] package/qt5webengine: examples need
 qt5svg
In-Reply-To: <20200811212852.387f7769@windsurf.home>
References: <20200810203841.26171-1-ps.report@gmx.net>
 <20200811203155.76632009@gmx.net>
 <20200811212852.387f7769@windsurf.home>
Message-ID: <20200811213328.GG13263@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Peter, All,

On 2020-08-11 21:28 +0200, Thomas Petazzoni spake thusly:
> On Tue, 11 Aug 2020 20:31:55 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
> > package/qt5/qt5base/Config.in:1:error: recursive dependency detected!
> > package/qt5/qt5base/Config.in:1:	symbol BR2_PACKAGE_QT5BASE is selected by BR2_PACKAGE_QT5SVG
> Right, this makes sense.
> 
> > package/qt5/qt5svg/Config.in:1:	symbol BR2_PACKAGE_QT5SVG is selected by BR2_PACKAGE_QT5BASE_EXAMPLES
> This doesn't make any sense to me:
[--SNIP--]
> Or perhaps it is the line added by your patch:
> 	select BR2_PACKAGE_QT5SVG if BR2_PACKAGE_QT5BASE_EXAMPLES
> which causes this statement ?

AFAICS, yes.

> > package/qt5/qt5base/Config.in:42:	symbol BR2_PACKAGE_QT5BASE_EXAMPLES depends on BR2_PACKAGE_QT5BASE
> This obviously makes sense.

The whole problem we have is that the qt5 symbol is dual;

  - BR2_PACKAGE_QT5 that enables the whole Qt5 stack

  - BR2_PACKAGE_QT5BASE that enables the core component

However, BR2_PACKAGE_QT5 selects BR2_PACKAGE_QT5BASE, and BR2_PACKAGE_QT5BASE
depends on BR2_PACKAGE_QT5.

So both are either enabled or disabled at the same time:

    N N: valid
    N Y: impossible
    Y N: impossible
    Y Y: valid

But kcnfig can't see that the recursive dependency is resolved by
construction of the two symbols, as shown in the validity matrix.

I think we should change all qt5 packages to switch their dependency
onto the package, not the stack, and drop explicit select or depends
since this is implied by the top-level:

    diff --git a/package/qt5/Config.in b/package/qt5/Config.in
    index 5c544ecec4..954e257879 100644
    --- a/package/qt5/Config.in
    +++ b/package/qt5/Config.in
    @@ -36,8 +36,9 @@ menuconfig BR2_PACKAGE_QT5
     	  http://qt.io
     
     if BR2_PACKAGE_QT5
    -source "package/qt5/qt53d/Config.in"
     source "package/qt5/qt5base/Config.in"
    +if BR2_PACKAGE_QT5BASE
    +source "package/qt5/qt53d/Config.in"
     source "package/qt5/qt5charts/Config.in"
     source "package/qt5/qt5connectivity/Config.in"
     source "package/qt5/qt5declarative/Config.in"
    @@ -66,4 +67,5 @@ source "package/qt5/qt5websockets/Config.in"
     source "package/qt5/qt5webview/Config.in"
     source "package/qt5/qt5x11extras/Config.in"
     source "package/qt5/qt5xmlpatterns/Config.in"
    -endif
    +endif # QT5BASE
    +endif # QT5
    diff --git a/package/qt5/qt5svg/Config.in b/package/qt5/qt5svg/Config.in
    index bc80b62674..1c4e90d1d9 100644
    --- a/package/qt5/qt5svg/Config.in
    +++ b/package/qt5/qt5svg/Config.in
    @@ -1,6 +1,6 @@
     config BR2_PACKAGE_QT5SVG
     	bool "qt5svg"
    -	select BR2_PACKAGE_QT5BASE
     	select BR2_PACKAGE_QT5BASE_GUI
     	help
     	  Qt is a cross-platform application and UI framework for

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
