From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Tue, 23 Jun 2020 11:07:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnids: new package
In-Reply-To: <CAJe0E3dU52qyQ_=eVN+1xtD8b1Kiwe=RZ7zvjpYfhZ8CDJinfQ@mail.gmail.com>
References: <20200622105359.31340-1-guillaume.bressaix@gmail.com>
 <20200622222743.4643d71d@windsurf.home>
 <CAJe0E3dU52qyQ_=eVN+1xtD8b1Kiwe=RZ7zvjpYfhZ8CDJinfQ@mail.gmail.com>
Message-ID: <CAJe0E3dTThdh+xniL4P4pF9iRaJqN0YA7-OWKPmOWscqRkbmYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

correction:

Let's say I introduce a "BR2_PACKAGE_LIBNIDS_WITH_LIBNET" option,
>

 I will rather check in the .mk script if BR2_PACKAGE_LIBNET is in use and
adapt dependencies & configure flags,
rather than introducing a BR2_PACKAGE_LIBNIDS_ sub option.

question about the patch still applies though

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le mar. 23 juin 2020 ? 11:01, Guillaume Bres <guillaume.bressaix@gmail.com>
a ?crit :

> Hello Thomas,
>
> thank you for your input
>
> glibc is not required: it builds fine with uclibc.
>> > +     select BR2_PACKAGE_LIBGLIB2
>
> This dependency is not mandatory, so I dropped it. It should be easy to
>> re-add it with a follow-up patch.
>
>
> Ok, I did not see the configure script had options to disable them, it's
> better to have a default package compatible with everyone
>
> (2) Passing the appropriate install_prefix value at install time,
>
>  since the hand-written Makefile.in use install_prefix and not DESTDIR
>
>
> it's cleaner to override at the given step (I'll keep that!)
>
> if you need the libglib and libnet optional dependencies, don't
>> hesitate to send follow-up patches to add support for them.
>
>
> I need to check whether I need libglib because it's not obvious. But I
> certainly need libnet.
>
> Let's say I introduce a "BR2_PACKAGE_LIBNIDS_WITH_LIBNET" option,
> if I add a 0002-patch to also have libnet checked with pkg-config,
> Is it fine with you having a patch always applied, even though we are in
> the --disable-libnet context?
>
> Guillaume W. Bres
> Software engineer
> <guillaume.bressaix@gmail.com>
>
>
> Le lun. 22 juin 2020 ? 22:27, Thomas Petazzoni <
> thomas.petazzoni at bootlin.com> a ?crit :
>
>> Hello Guillaume,
>>
>> On Mon, 22 Jun 2020 12:53:59 +0200
>> "Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:
>>
>> > Libnids is a C based networking library,
>> > part of networking intrusion detection tools.
>> > It can watch network traffic & provide informations.
>> >
>> > Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
>>
>> I have applied your patch, with a number of changes. See below for
>> comments, and see the final commit at:
>>
>>
>> https://git.buildroot.org/buildroot/commit/?id=b6ce06cd64b0d85c9065c60fad933c8585730320
>>
>>
>> > +config BR2_PACKAGE_LIBNIDS
>> > +     bool "libnids"
>> > +     depends on BR2_TOOLCHAIN_USES_GLIBC
>>
>> glibc is not required: it builds fine with uclibc.
>>
>> > +     select BR2_PACKAGE_LIBGLIB2
>>
>> This dependency is not mandatory, so I dropped it. It should be easy to
>> re-add it with a follow-up patch.
>>
>> > +     select BR2_PACKAGE_LIBNET
>>
>> This dependency is not mandatory, so I dropped it. Re-adding it is
>> possible, but will need some tweaks in the configure.in script.
>>
>> > +     select BR2_PACKAGE_LIBPCAP
>>
>> This dependency is indeed mandatory.
>>
>>
>> > +LIBNIDS_VERSION = 1.24
>> > +LIBNIDS_SITE =
>> https://sourceforge.net/projects/libnids/files/libnids/$(LIBNIDS_VERSION)
>> > +LIBNIDS_LICENSE = GPL-2.0
>> > +LIBNIDS_LICENSE_FILES = COPYING
>> > +LIBNIDS_INSTALL_STAGING = YES
>>
>> You forgot the _DEPENDENCIES variable, so nothing ensured that your
>> dependencies are built before this package.
>>
>> > +LIBNIDS_CONF_OPTS += \
>> > +     prefix="$(STAGING_DIR)/usr" \
>> > +     exec_prefix="$(STAGING_DIR)/usr"
>>
>> So, I instead fixed this by:
>>
>>  (1) Adding a patch for the configure.in script that changes the
>>  detection of libpcap to use pkg-config
>>
>>  (2) Passing the appropriate install_prefix value at install time,
>>  since the hand-written Makefile.in use install_prefix and not DESTDIR
>>
>> If you need the libglib and libnet optional dependencies, don't
>> hesitate to send follow-up patches to add support for them.
>>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200623/6b1dddc0/attachment.html>
