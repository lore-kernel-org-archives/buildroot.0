From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 May 2020 13:45:41 +0200
Subject: [Buildroot] [PATCH v2] package/python-pyqt5: fix QtLocation
 module dependency
In-Reply-To: <20200516112608.8484-1-ps.report@gmx.net>
References: <20200516112608.8484-1-ps.report@gmx.net>
Message-ID: <20200516114541.GL12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-05-16 13:26 +0200, Peter Seiderer spake thusly:
> The QT module location from qt5location depends on
> QT quick from qt5declarative.
> 
> From qt5location-5.14.2/src/src.pro:
> 
>   qtHaveModule(quick) {
>       SUBDIRS += positioningquick location
>       ...
>   }
> 
> Adjust pyqt5 QtLocation module dependency accordingly.
> 
> Fixes:
> 
>   - http://autobuild.buildroot.net/results/122bb0a37d968cd79dc043b48f90f1ba4135491f
> 
>   Reading .../build/python-pyqt5-5.7/QtLocation/QtLocation.pro
>   Project ERROR: Unknown module(s) in QT: location
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - fix python-pyqt5 QTLocation vs. QtLocation spelling
> ---
>  package/python-pyqt5/python-pyqt5.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
> index 260a93af9c..9b5e9089fc 100644
> --- a/package/python-pyqt5/python-pyqt5.mk
> +++ b/package/python-pyqt5/python-pyqt5.mk
> @@ -65,7 +65,10 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_QT5LOCATION),y)
>  PYTHON_PYQT5_DEPENDENCIES += qt5location
> -PYTHON_PYQT5_MODULES += QtLocation QtPositioning
> +PYTHON_PYQT5_MODULES += QtPositioning
> +ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
> +PYTHON_PYQT5_MODULES += QtLocation
> +endif
>  endif
>  
>  ifeq ($(BR2_PACKAGE_QT5MULTIMEDIA),y)
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
