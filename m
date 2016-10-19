From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Oct 2016 18:27:29 +0200
Subject: [Buildroot] [PATCH 1/1] avahi: link with libintl if libglib2 is
 enabled
In-Reply-To: <CAJtjsKbabwixT3bieo4uXFFyUhA=JXgFsoV5Td=yB+JfckRY1w@mail.gmail.com>
References: <1476802403-5879-1-git-send-email-johan.oudinet@gmail.com>
 <20161018172543.20a693fa@free-electrons.com>
 <CAJtjsKbAHTY4LwuS=oGpxhCf=hCupmk0Si7-kCTnA3YYtFbgfA@mail.gmail.com>
 <20161019145904.6a82c434@free-electrons.com>
 <CAJtjsKbabwixT3bieo4uXFFyUhA=JXgFsoV5Td=yB+JfckRY1w@mail.gmail.com>
Message-ID: <ea383c3d-9ace-bafe-5c32-0bc8fad656c3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-10-16 18:23, Johan Oudinet wrote:
> On Wed, Oct 19, 2016 at 2:59 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> > On Wed, 19 Oct 2016 14:42:45 +0200, Johan Oudinet wrote:
>> >
>>>>> >> >> -AVAHI_MAKE_OPTS += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
>>>>> >> >> +# If either locale or libglib2 is defined, avahi needs libintl.
>>>>> >> >> +AVAHI_MAKE_OPTS += \
>>>>> >> >> +     $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE)$(BR2_PACKAGE_LIBGLIB2),LIBS=-lintl)
>>>> >> >
>>>> >> > Hum, I wondering if it wouldn't be nicer to rely on the fact that the
>>>> >> > Config.in of those packages enable BR2_PACKAGE_GETTEXT when necessary.
>>>> >> > So maybe we should instead rely on BR2_PACKAGE_GETTEXT=y, with
>>>> >> > something like:
>>>> >> >
>>>> >> > ifeq ($(BR2_PACKAGE_GETTEXT),y)
>>>> >> > AVAHI_DEPENDENCIES += gettext
>>>> >> > AVAHI_MAKE_OPTS += LIBS=-lintl
>>>> >> > endif
>>>> >> >
>>>> >> > (and of course, remove the gettext dependency added conditionally on
>>>> >> > BR2_NEEDS_GETTEXT_IF_LOCALE).
>>>> >> >
>>>> >> > It would be necessary to also test this with musl and glibc
>>>> >> > configurations, with gettext enabled, to make sure it doesn't break.
>>>> >> >
>>>> >> > And if it works, then we should update the Buildroot manual, which has
>>>> >> > a section on the gettext integration.
>>> >>
>>> >> Good idea. I'm trying it and if it works, I'll send a patch serie. One
>>> >> to modify the documentation, and one to update every packet that
>>> >> integrates gettext.
>> >
>> > Could you please send the documentation patch alone first, so we can
>> > validate the approach (i.e not only me, but also other folks in
>> > Buildroot), before you spend time on reworking all the packages. This
>> > way, we can all agree on the new approach first.
>> >
> Sure. However, It does break if I activate gettext with glibc:

 That was exactly my concern with Thomas's proposal...

 I would say: don't touch this now, and schedule it for discussion at the next
BR developer meeting.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
