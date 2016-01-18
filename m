From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jan 2016 23:10:51 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAGduivyTp9AvHe09K1QOeKA3VU34T5nTnw-jqnJhvMzyfQDf3A@mail.gmail.com>
References: <20160116073021.A4B95101BCC@stock.ovh.net>
 <20160117001117.569d43f2@free-electrons.com>
 <CAGduivyTp9AvHe09K1QOeKA3VU34T5nTnw-jqnJhvMzyfQDf3A@mail.gmail.com>
Message-ID: <20160118231051.31adbabc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime,

I know you're using GMail, but please learn to strip long e-mails when
you're just replying to one specific of it :-)

On Sun, 17 Jan 2016 18:10:58 +0100, Maxime Hadjinlian wrote:

> > Not sure:
> >
> > cache.c: In function 'same_path':
> > cache.c:429:22: error: field 'fh' has incomplete type
> > cache.c:436:2: warning: implicit declaration of function 'name_to_handle_at' [-Wimplicit-function-declaration]
> > Makefile:613: recipe for target 'mountd-cache.o' failed
> >
> > Maxime, can you have a look ?
> I will look at it, the errors is a bit puzzling but I only glanced at
> it for now.

I had a look: nfs-utils does have some code to detect if
name_to_handle_at() is implemented. Unfortunately, as can be seen here,
using this function only triggers a warning (because its prototype is
not defined in any headers of the C library), but doesn't fail to link
(because for some reason the function is implemented). However the
"struct file_handle" type is not available.

So, I suggest to add:

AC_CHECK_TYPES([struct file_handle])

to configure.ac, and then change cache.c from

#if HAVE_NAME_TO_HANDLE_AT

to:

#if defined(HAVE_NAME_TO_HANDLE_AT) && defined(HAVE_STRUCT_FILE_HANDLE)

It works with the problematic PowerPC toolchains (i.e it properly
detects that struct file_handle is not available), but it remains to be
tested on another toolchain. Also, this fix should be submitted
upstream, obviously :-)

Care to do it ? :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
