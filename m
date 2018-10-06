From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 6 Oct 2018 23:51:34 +0200
Subject: [Buildroot] [PATCH 1/1] xerces: enable threads if available
In-Reply-To: <CANQCQpYzCdj7JobpWto-RMJ_-pzvhv29YUnH-HwWr1bLj2yBzg@mail.gmail.com>
References: <20181006201308.20461-1-fontaine.fabrice@gmail.com>
 <CANQCQpYzCdj7JobpWto-RMJ_-pzvhv29YUnH-HwWr1bLj2yBzg@mail.gmail.com>
Message-ID: <CAPi7W83Eapns4XR8uArdDaek1AQ5Y8ue367krtvMbfqieje6+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew,

Le sam. 6 oct. 2018 ? 22:59, Matthew Weber <
matthew.weber@rockwellcollins.com> a ?crit :

> Fabrice,
>
> On Sat, Oct 6, 2018 at 3:13 PM Fabrice Fontaine
> <fontaine.fabrice@gmail.com> wrote:
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
>
> > ---
> >  package/xerces/xerces.mk | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
> > index a25641fb45..da088d8e1c 100644
> > --- a/package/xerces/xerces.mk
> > +++ b/package/xerces/xerces.mk
> > @@ -10,9 +10,7 @@ XERCES_SITE =
> http://archive.apache.org/dist/xerces/c/3/sources
> >  XERCES_LICENSE = Apache-2.0
> >  XERCES_LICENSE_FILES = LICENSE
> >  XERCES_INSTALL_STAGING = YES
> > -XERCES_CONF_OPTS = \
> > -       --disable-threads \
>
> I went back and checked the history on why threading was disabled by
> default.  It looks like there wasn't a specific reason.  Just a
> package bump and change of configuration style.
>
> https://git.busybox.net/buildroot/commit/package/xerces/xerces.mk?id=324f61f7982c64ebd4a457467b33a6984bd8a584
>
> > +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> > +XERCES_CONF_OPTS += --enable-threads
> > +else
> > +XERCES_CONF_OPTS += --disable-threads
> > +endif
> > +
>
> Does this yield a pretty good performance increase?  Wonder how they
> bound the thread number to use on target when it runs.
>
Thread is only used for posix mutex (see m4/xerces_mutexmgr_selection.m4),
not for creating threads.
If threads is available, then xerces will use
util/MutexManagers/PosixMutexMgr.hpp otherwise it will use
util/MutexManagers/NoThreadMutexMgr.cpp.
NoThreadMutexMgr is basically doing nothing. So, current behavior of always
disabling threads means that xerces is not thread safe.

> Matt
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181006/20cbc46e/attachment.html>
