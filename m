From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 28 Mar 2018 10:42:37 +0200
Subject: [Buildroot] [V3 1/2] dropbear: bump to version 2018.76
In-Reply-To: <20180328100149.1d0a05b8@windsurf>
References: <20180321160329.20768-1-francois.perrad@gadz.org>
 <20180326221829.656d3d2a@windsurf.home>
 <CAB0FRsstPgEOQCPJgCWn91y-PB3umhgpX9vn0qof5J-knPPkXQ@mail.gmail.com>
 <20180328100149.1d0a05b8@windsurf>
Message-ID: <CAB0FRssDJpLKZDV9iSXsfaiHJ6dHEssdYmMiu57SKrgWynqE4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-03-28 10:01 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello,
>
> On Wed, 28 Mar 2018 09:57:57 +0200, Fran?ois Perrad wrote:
>
> > > Could you have a look ?
> >
> > The presence of crypt() is detected by the configure script.
>
> So, if it's detected by the configure script, there should be no
> problem, no ?
>
> > in dropbear-2017-75/options.h, the logic was :
> >     /* This requires crypt() */
> >     #ifdef HAVE_CRYPT
> >     #define ENABLE_SVR_PASSWORD_AUTH
> >     #endif
> >
> > in dropbear-2018-76/sysoptions.h, the logic is now :
> >     #if DROPBEAR_SVR_PASSWORD_AUTH && !HAVE_CRYPT
> >         #error "DROPBEAR_SVR_PASSWORD_AUTH requires `crypt()'."
> >     #endif
> >
> > So, without something like BR2_TOOLCHAIN_HAS_CRYPT,
> > we must always disable the option DROPBEAR_SVR_PASSWORD_AUTH in
> > localoptions.h.
>
> I don't understand. On one hand, you say that the presence of crypt()
> is detected by the configure script, and on the other hand, you say
> that we must tell Dropbear explicitly whether crypt() is available or
> not.
>
> Could you clarify ?
>
>
I solve the issue by writing :
    #if !HAVE_CRYPT
    #define DROPBEAR_SVR_PASSWORD_AUTH 0
    #endif
in the localoptions.h file.

Fran?ois



> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180328/61266504/attachment.html>
