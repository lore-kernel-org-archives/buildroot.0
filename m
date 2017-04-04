From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 3 Apr 2017 21:09:25 -0500
Subject: [Buildroot] [PATCH 3/4] libselinux: allow compiling python
 wrapper module for target
In-Reply-To: <CANQCQpZhwL5T3=1BPNnibEyj_Vh+TXRg2mW1GkNNB=C0sjq8Ew@mail.gmail.com>
References: <20170202224505.22882-1-Adamduskett@outlook.com>
 <20170202224505.22882-3-Adamduskett@outlook.com>
 <CANQCQpb+u_oMbkXj9-M6S77CK-EMs6XuUDtw0LTg-swtn1d-gw@mail.gmail.com>
 <CANQCQpZhwL5T3=1BPNnibEyj_Vh+TXRg2mW1GkNNB=C0sjq8Ew@mail.gmail.com>
Message-ID: <CANQCQpYH5-3ii97OS0i-jFdBdEYjBh752eYo-03nFLUqVb=akw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,


On Mon, Mar 27, 2017 at 2:19 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Adam,
>
> On Mon, Mar 27, 2017 at 12:21 PM, Matthew Weber
> <matthew.weber@rockwellcollins.com> wrote:
> > Adam,
> >
> > On Thu, Feb 2, 2017 at 4:45 PM, Adam Duskett <aduskett@gmail.com> wrote:
> >> libselinux currently does not compile it's python wrapper module
> >> for the target.  This is needed for audit2allow to function properly.
> >>
> >> This patch allows for the python wrapper to be built.  The current
> >> makefile will try to install the python wrapper to the host directory
> >> unless the PYSITEDIR variable is set.  I wrapped the build of the
> >> python wrapper in a check for AUDIT2ALLOW because of the extra python
> >> dependency, as I am sure many users don't want to have to install
> >> python if they don't have to.
> >>
> >> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> >> ---
> >>  package/libselinux/libselinux.mk | 32 ++++++++++++++++++++++++++++++++
> >>  1 file changed, 32 insertions(+)
> >>
> >> diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
> >> index 44120c4..fba5d41 100644
> >> --- a/package/libselinux/libselinux.mk
> >> +++ b/package/libselinux/libselinux.mk
> >> @@ -30,6 +30,7 @@ endef
> >>  define LIBSELINUX_INSTALL_STAGING_CMDS
> >>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> >>                 $(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
> >> +
> >
> > <snip>
> >
> >>         if ! grep -q "selinuxfs" $(TARGET_DIR)/etc/fstab; then \
> >>                 echo "none /selinux selinuxfs noauto 0 0" >> $(TARGET_DIR)/etc/fstab ; fi
> >> +
> >
> > Any reason for the two newlines above?
> >
> >>  endef
> >>
> >> +ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_AUDIT2ALLOW),y)
> >> +LIBSELINUX_DEPENDENCIES += host-swig
> >> +
> >> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> >> +LIBSELINUX_DEPENDENCIES += python3
> >> +LIBSELINUX_PYTHONLIBDIR = -L$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
> >> +LIBSELINUX_PYINC = -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m
> >> +LIBSELINUX_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
> >> +else
> >> +LIBSELINUX_DEPENDENCIES += python
> >> +LIBSELINUX_PYTHONLIBDIR = -L$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)
> >> +LIBSELINUX_PYINC = -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
> >> +LIBSELINUX_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
> >> +endif
> >> +
> >> +LIBSELINUX_MAKE_OPTS += \
> >> +       PYINC="$(LIBSELINUX_PYINC)" \
> >> +       PYTHONLIBDIR="$(LIBSELINUX_PYTHONLIBDIR)" \

Please incorporate similar changes to the following I sent out
tonight.  You already had the PYSITEDIR added, but the PYLIBVER /
LIBSELINUX_PYTHONLIBDIR / PYTHONLIBDIR were removed when we bumped to
version 2.6
https://patchwork.ozlabs.org/patch/746684/

> >> +       PYLIBVER="$(LIBSELINUX_PYLIBVER)" \
> >> +       PYSITEDIR=$(TARGET_DIR)/usr/lib/$(LIBSELINUX_PYLIBVER)/site-packages \
> >> +       SWIG_LIB="$(HOST_DIR)/usr/share/swig/$(SWIG_VERSION)/"
> >> +
> >> +LIBSELINUX_BUILD_CMDS += $(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
> >> +       $(LIBSELINUX_MAKE_OPTS) DESTDIR=$(TARGET_DIR) swigify pywrap
> >> +
> >> +LIBSELINUX_INSTALL_TARGET_CMDS += $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> >> +       $(LIBSELINUX_MAKE_OPTS) install-pywrap
> >> +
> >> +endif
> >> +
> >
> > I need to build and test this.  This was in the original libselinux
> > patchset and I believe we had issues in swig.
> >
>
> I did a build test but didn't have hardware available to execute.  I
> did verify the libselinux installed correctly to staging and that the
> swig related (selinux.py) item built/installed correctly
> (target/usr/lib/python3.5/site-packages/selinux/).
>
> Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>




-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
