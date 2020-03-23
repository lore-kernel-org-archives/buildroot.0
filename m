From: Ramon Fried <rfried.dev@gmail.com>
Date: Mon, 23 Mar 2020 08:46:47 +0200
Subject: [Buildroot] [PATCH] package/gdb: Add support for host-gdb with
 python3
In-Reply-To: <8ef86970-9418-537e-b2dd-4239d62b0baf@gmail.com>
References: <20200319125037.12274-1-rfried.dev@gmail.com>
 <8ef86970-9418-537e-b2dd-4239d62b0baf@gmail.com>
Message-ID: <CAGi-RU+eOfxnG_mksQA_-5boQiAYiE9pUSdZAe-iPTgs_KCe6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 22, 2020 at 7:34 PM Romain Naour <romain.naour@gmail.com> wrote:
>
> Hi Ramon,
>
> Le 19/03/2020 ? 13:50, Ramon Fried a ?crit :
> > host-gdb was limited to link only with Python 2 although
> > it's possible to build Python 3 for host.
> > Add the ability to link with Python 3.
> >
> > Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> > ---
> >  package/gdb/Config.in.host | 9 +++++++--
> >  package/gdb/gdb.mk         | 3 +++
> >  2 files changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> > index 5315f10493..fe9aff4df7 100644
> > --- a/package/gdb/Config.in.host
> > +++ b/package/gdb/Config.in.host
> > @@ -33,9 +33,14 @@ config BR2_PACKAGE_HOST_GDB_TUI
> >         This option enables terminal user interface (TUI) for gdb
> >
> >  config BR2_PACKAGE_HOST_GDB_PYTHON
> > -     bool "Python support"
> > +     bool "Python 2 support"
> >       help
> > -       This option enables the Python support in the cross gdb.
> > +       This option enables the Python 2 support in the cross gdb.
> > +
> > +config BR2_PACKAGE_HOST_GDB_PYTHON3
> > +     bool "Python 3 support"
> > +     help
> > +       This option enables the Python 3 support in the cross gdb.
>
> Theses option must be exclusive. If you're selecting both only
> BR2_PACKAGE_HOST_GDB_PYTHON will be taken into account.
>
> Best regards,
> Romain
Thanks, sent v2.
>
> >
> >  config BR2_PACKAGE_HOST_GDB_SIM
> >       bool "Simulator support"
> > diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> > index 01f7e14460..8c74a0e2f6 100644
> > --- a/package/gdb/gdb.mk
> > +++ b/package/gdb/gdb.mk
> > @@ -238,6 +238,9 @@ endif
> >  ifeq ($(BR2_PACKAGE_HOST_GDB_PYTHON),y)
> >  HOST_GDB_CONF_OPTS += --with-python=$(HOST_DIR)/bin/python2
> >  HOST_GDB_DEPENDENCIES += host-python
> > +else ifeq ($(BR2_PACKAGE_HOST_GDB_PYTHON3),y)
> > +HOST_GDB_CONF_OPTS += --with-python=$(HOST_DIR)/bin/python3
> > +HOST_GDB_DEPENDENCIES += host-python3
> >  else
> >  HOST_GDB_CONF_OPTS += --without-python
> >  endif
> >
>
