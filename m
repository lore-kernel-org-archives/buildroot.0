From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Fri, 27 Nov 2015 19:31:49 -0200
Subject: [Buildroot] [PATCH] rpi-userland: fix musl compile
In-Reply-To: <5658C232.9030600@mind.be>
References: <1448645857-14999-1-git-send-email-sergio.prado@e-labworks.com>
 <5658C232.9030600@mind.be>
Message-ID: <CANu7NGsak-hW9nd752TEvy=0yZZEzWS-bQ6NJx=i08OxeO4rpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

2015-11-27 18:50 GMT-02:00 Arnout Vandecappelle <arnout@mind.be>:

>  Hi Sergio,
>
> On 27-11-15 18:37, Sergio Prado wrote:
> > When building with musl, the build fails with a conflicting type
> > qualifier error.
> >
> > This is because musl defines stdout and stderr as const pointers
> > and RaspiVidYUV.c adds an extern declaration as normal pointers.
> >
> > Since this declaration already comes in on the header (stdio.h),
> > there is no need to add an extern declaration, so removes it.
> >
> > Fixes:
> >
> >
> http://autobuild.buildroot.net/results/27bd6f32cecdb4e7c95247c1feaf2732c1d8e3fa
> > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> > ---
> >  ...ting-type-qualifiers-errors-when-building.patch | 23
> ++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >  create mode 100644
> package/rpi-userland/0006-Fix-conflicting-type-qualifiers-errors-when-building.patch
> >
> > diff --git
> a/package/rpi-userland/0006-Fix-conflicting-type-qualifiers-errors-when-building.patch
> b/package/rpi-userland/0006-Fix-conflicting-type-qualifiers-errors-when-building.patch
> > new file mode 100644
> > index 000000000000..4db60142c6ad
> > --- /dev/null
> > +++
> b/package/rpi-userland/0006-Fix-conflicting-type-qualifiers-errors-when-building.patch
> > @@ -0,0 +1,23 @@
> > +Fix conflicting type qualifiers errors when building with musl.
> > +
> > +Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
>
>  Did you send this patch upstream?
>

I've just did: https://github.com/raspberrypi/userland/pull/272


>  Regards,
>  Arnout
>

Thanks!


>
> > +---
> > + host_applications/linux/apps/raspicam/RaspiVidYUV.c | 2 --
> > + 1 file changed, 2 deletions(-)
> > +
> > +diff --git a/host_applications/linux/apps/raspicam/RaspiVidYUV.c
> b/host_applications/linux/apps/raspicam/RaspiVidYUV.c
> > +index b340d63c913f..13e6a6ccf5bf 100644
> > +--- a/host_applications/linux/apps/raspicam/RaspiVidYUV.c
> > ++++ b/host_applications/linux/apps/raspicam/RaspiVidYUV.c
> > +@@ -106,8 +106,6 @@ const int ABORT_INTERVAL = 100; // ms
> > + /// Run/record forever
> > + #define WAIT_METHOD_FOREVER        4
> > +
> > +-extern FILE *stderr, *stdout;
> > +-
> > + int mmal_status_to_int(MMAL_STATUS_T status);
> > + static void signal_handler(int signal_number);
> > +
> > +--
> > +1.9.1
> > +
> >
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151127/84aab774/attachment.html>
