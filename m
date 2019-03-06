From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 6 Mar 2019 20:34:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/qt5base: add
 BR2_PACKAGE_QT5BASE_OPENSSL
In-Reply-To: <87a7iaieoe.fsf@dell.be.48ers.dk>
References: <20190304172808.4672-1-fontaine.fabrice@gmail.com>
 <87a7iaieoe.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W834BsA0B8LksxUSh8Nfz5tVgLiEP_R_1fpGivzgXXZ3yA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,
Le lun. 4 mars 2019 ? 21:10, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > Commit c110e48cecde6f543da18388322907b05b25e7d2 disabled openssl support
>  > on QT 5.6, this has the side-effect of breaking the build of
>  > python-pyqt5 because support of openssl is enabled on python-pyqt5 if
>  > BR2_PACKAGE_OPENSSL is selected
>
>  > To fix this issue, add a new BR2_PACKAGE_QT5BASE_OPENSSL option in
>  > qt5base and use it in python-pyqt5
>
>  > Fixes:
>  >  - http://autobuild.buildroot.org/results/e92991308d47649cecc4084e41ab5711ec96831f
>
>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  > ---
>  >  package/python-pyqt5/python-pyqt5.mk | 2 +-
>  >  package/qt5/qt5base/Config.in        | 8 ++++++++
>  >  package/qt5/qt5base/qt5base.mk       | 9 ++-------
>  >  3 files changed, 11 insertions(+), 8 deletions(-)
>
>  > diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
>  > index cde026ef63..4955936ae3 100644
>  > --- a/package/python-pyqt5/python-pyqt5.mk
>  > +++ b/package/python-pyqt5/python-pyqt5.mk
>  > @@ -25,9 +25,9 @@ PYTHON_PYQT5_QTDETAIL_LICENSE = Open Source
>  >  PYTHON_PYQT5_QTDETAIL_TYPE = shared
>
>  >  # Turn off features that aren't available in current qt configuration
>  > -PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_OPENSSL),,PyQt_SSL)
>  >  PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_QT5BASE_OPENGL),,PyQt_OpenGL)
>  >  PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_QT5BASE_OPENGL_DESKTOP),,PyQt_Desktop_OpenGL)
>  > +PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_QT5BASE_OPENSSL),,PyQt_SSL)
>
>  >  define PYTHON_PYQT5_QTDETAIL
>  >      echo $(1) >> $(2)/qtdetail.out
>  > diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
>  > index 1340ea48f0..709fec8d3b 100644
>  > --- a/package/qt5/qt5base/Config.in
>  > +++ b/package/qt5/qt5base/Config.in
>  > @@ -286,6 +286,14 @@ comment "icu support needs a toolchain w/ gcc >= 4.8, host gcc >= 4.8"
>  >      depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
>  >              !BR2_HOST_GCC_AT_LEAST_4_8
>
>  > +config BR2_PACKAGE_QT5BASE_OPENSSL
>  > +    bool "OpenSSL support"
>  > +    # No OpenSSL 1.1.x support in Qt 5.6.x
>  > +    depends on !BR2_PACKAGE_QT5_VERSION_5_6
>  > +    select BR2_PACKAGE_OPENSSL
>  > +    help
>  > +      This option enables OpenSSL support.
>  > +
>
> I kept this as a blind option to not change behaviour and added the
> logic for the recently added libressl support for 5.6.x and committed,
> thanks.
Thanks for taking care of this however qt5enginio also fails to build
without SSL on QT5.6:
http://autobuild.buildroot.org/results/579dfa53451ad78563faaad514f47d80851c3234

We can't add a dependency or a select on the blind
BR2_PACKAGE_QT5BASE_OPENSSL option so what should we do?
>
> --
> Bye, Peter Korsgaard
Best Regards,

Fabrice
