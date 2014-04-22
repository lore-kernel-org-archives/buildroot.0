From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 22 Apr 2014 18:58:39 +0200
Subject: [Buildroot] [PATCH 1/2] pkg-perl: fix for Perl XS packages
 configured by a Makefile.PL
In-Reply-To: <535605C4.2030109@mind.be>
References: <1398006356-5425-1-git-send-email-francois.perrad@gadz.org>
 <535605C4.2030109@mind.be>
Message-ID: <CAB0FRstJ565UB0LZy3AhqV-E32F6OjNThRTrQfrHY+tQCfy53w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-04-22 8:01 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>  Hi Francois,
>
> On 20/04/14 17:05, Francois Perrad wrote:
>> for native package, ExtUtils::MakeMaker detects all include filenames on system perl,
>> all these includes will be required by the generated Makefile but on STAGING_DIR.
>>
>> patchlevel-debian.h is not a part of the Perl distribution,
>> but it was added by some Linux distributions (Debian, Ubuntu, ...)
>> In this case, we create an empty file on STAGING_DIR.
>
>  Contrary to Thomas, I do understand the explanation, so here's a
> hopefully improved one:
>
> ExtUtils::MakeMaker adds all the header files used by the perl as
> dependencies to the generated Makefile. This means that the generated
> Makefile will depend on the system's header files.
>
> Usually this is not a problem, because when building the target package,
> these header files will indeed be found in $(STAGING_DIR). However, some
> distro's add an extra header file to the system's perl. This header is
> also included in the generated Makefile, which makes the build fail
> because it doesn't exist in $(STAGING_DIR).
>
> As a work-around, explicitly create this header file in $(STAGING_DIR).
> It doesn't hurt to create it even if the system perl doesn't need it.
>
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/pkg-perl.mk | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
>> index 447f364..876ffdb 100644
>> --- a/package/pkg-perl.mk
>> +++ b/package/pkg-perl.mk
>> @@ -88,6 +88,7 @@ define $(2)_CONFIGURE_CMDS
>>                       INSTALLVENDORMAN1DIR=/usr/share/man/man1 \
>>                       INSTALLVENDORMAN3DIR=/usr/share/man/man3 \
>>                       $$($(2)_CONF_OPT); \
>> +             touch $(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/patchlevel-debian.h; \
>
>  Wouldn't it be better to do this in a post-install-staging hook in perl
> itself? Now, this file will be touched over and over again for each perl
> package.
>

2 reasons :
1) currently, PERL_ARCHNAME is defined in pkg-perl.mk, but not in perl.mk
2) here, the hack is close to the command which requires it (ie. perl
Makefile.PL in _CONFIGURE_CMDS for target)

The CPU cost of each `touch` is insignificant, and I don't observe
problem with rebuild of package.
But the hack could be improved like this :

PATCHLEVEL_DEBIAN_H =
$(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/patchlevel-debian.h

       test -f $(PATCHLEVEL_DEBIAN_H) || touch $(PATCHLEVEL_DEBIAN_H)

Fran?ois

>
>  Also, you probably should repeat the commit log's explanation here.
>
>  Regards,
>  Arnout
>
>>       fi
>>  endef
>>  else
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
