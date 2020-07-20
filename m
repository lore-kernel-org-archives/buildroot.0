From: Kamel Bouhara <kamel.bouhara@bootlin.com>
Date: Mon, 20 Jul 2020 14:38:36 +0200
Subject: [Buildroot] [PATCH] package/dbus-cpp: new patch to fix dbus c++
 threading issue
In-Reply-To: <20200712111247.118e8aae@windsurf.home>
References: <20200706153355.429941-1-kamel.bouhara@bootlin.com>
 <20200712111247.118e8aae@windsurf.home>
Message-ID: <20200720123836.GB3477@kb-xps>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 12, 2020 at 11:12:47AM +0200, Thomas Petazzoni wrote:
> Hello Kamel,
>

Hello Thomas,

> On Mon,  6 Jul 2020 17:33:55 +0200
> Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:
>
> > From: https://sourceforge.net/p/dbus-cplusplus/patches/18/
> >
> > dispatcher.h has invalid template code. When DBUS_HAS_RECURSIVE_MUTEX is
> > MutexFreeFn and MutexLockFn become of type void and the code is valid.
> > See lines 232-235.
> > However, when a user #includes dispatcher.h directly or indirectly the
> > macro DBUS_HAS_RECURSIVE_MUTEX is undefined. This makes the above
> > function pointers defined of type bool and but then _init_threading
> > function call in line 259 becomes invalid, as it passes function
> > pointers to mutex_free and mutex_lock which or of type void.
> >
> > Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> > ---
> >  .../dbus-cpp/0004-dbus-c++-threading.patch    | 45 +++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >  create mode 100644 package/dbus-cpp/0004-dbus-c++-threading.patch
> >
> > diff --git a/package/dbus-cpp/0004-dbus-c++-threading.patch b/package/dbus-cpp/0004-dbus-c++-threading.patch
> > new file mode 100644
> > index 0000000000..502320ad09
> > --- /dev/null
> > +++ b/package/dbus-cpp/0004-dbus-c++-threading.patch
> > @@ -0,0 +1,45 @@
>
> Thanks for your patch, but the patch itself needs a proper commit
> title, commit description and Signed-off-by. See
> https://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.
>

Ok.

> Also, under what conditions does this build failure occurs ? We don't
> have any build failures for the dbus-cpp package in our autobuilders.
>

Actually, I have an application that depends on dbus-c++ and fails with
the following errors:

...
In file included from .../buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/dbus-c++-1/dbus-c++/server.h:34,
                 from .../buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/dbus-c++-1/dbus-c++/dbus.h:33,
                 from src/DbusComm/DBusGlobal.h:3,
                 from src/DbusComm/DBusGlobal.cpp:1:
 .../buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/dbus-c++-1/dbus-c++/dispatcher.h: In static member function ?static void DBus::Threading<Mx, Cv>::init()?:
 .../buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/dbus-c++-1/dbus-c++/dispatcher.h:262:5: error: no matching function for call to ?_init_threading(DBus::Mutex* (&)(), void (&)(DBus::Mutex*), void (&)(DBus::Mutex*), void (&)(DBus::Mutex*), DBus::CondVar* (&)(), void (&)(DBus::CondVar*), void (&)(DBus::CondVar*, DBus::Mutex*), bool (&)(DBus::CondVar*, DBus::Mutex*, int), void (&)(DBus::CondVar*), void (&)(DBus::CondVar*))?
     );
     ^
 .../buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/dbus-c++-1/dbus-c++/dispatcher.h:247:13: note: candidate: ?void DBus::_init_threading()?
 void DXXAPI _init_threading();
             ^~~~~~~~~~~~~~~
...

Which after some googling points me to the following thread:

https://sourceforge.net/p/dbus-cplusplus/patches/18/

The proposed patch applies to libdbus-c++ which is part of the dbus-cpp
package here. Applying this patch also fixed my application build issue.

> Finally, it looks like Ubuntu or Debian have a 5.0.x version of
> dbus-cpp, and we're at 0.9.0. It's really unclear what site really is
> the official upstream for this project.
>
> The SourceForge project points to a Gitorious Git repository, but
> Gitorious has been shut down a few years ago. Then there is
> https://github.com/lib-cpp/dbus-cpp, but is that the same project ?
>

Im completely agree but the sf project seems the more relevant.

> Hm according to
> https://www.freedesktop.org/wiki/Software/DBusBindings/, dbus-c++
> (which we call dbus-cpp in Buildroot) is different from dbus-cpp. They
> also say that dbus-c++ has been inactive since 2011, and shouldn't be
> used.
>
> Perhaps we should instead remove this package entirely ? Do you have
> the possibility of moving to a properly maintained D-Bus C++ binding ?
>

I have several modules of my application dependending on it yet.

Thanks.

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
