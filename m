From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 31 Mar 2015 20:38:57 +0200
Subject: [Buildroot] [PATCH 02/18] package/mplayer: add optional giflib
 support
In-Reply-To: <20150330230606.2702a000@free-electrons.com>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
 <1427649094-1240-3-git-send-email-bernd.kuhls@t-online.de>
 <20150330225658.091b8e72@free-electrons.com>
 <20150330230606.2702a000@free-electrons.com>
Message-ID: <551AE9C1.70701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/03/15 23:06, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 30 Mar 2015 22:56:58 +0200, Thomas Petazzoni wrote:
> 
>>> +ifeq ($(BR2_PACKAGE_GIFLIB),y)
>>> +MPLAYER_DEPENDENCIES += giflib
>>> +MPLAYER_EXTRA_LIBS += -lgif
>>> +endif
>>
>> Any reason not to use --enable-gif / --disable-gif here? Then you don't
>> need to pass a --extra-libs value. I've applied the patch with this
>> change, as it seems to build fine. Let me know if that causes a problem.
> 
> Hum, looking at the ncurses case, things seem to be a bit annoying:
> 
> echocheck "termcap"
> if test "$_termcap" = auto ; then
>   _termcap=no
>   for ld_tmp in "-lncurses" "-ltinfo" "-ltermcap"; do
>     statement_check term.h 'tgetent(0, 0)' $ld_tmp &&
>       extra_ldflags="$extra_ldflags $ld_tmp" && _termcap=yes && break
>   done
> fi
> if test "$_termcap" = yes ; then
>   def_termcap='#define HAVE_TERMCAP 1'
>   test $ld_tmp && res_comment="using $ld_tmp"
> else
>   def_termcap='#undef HAVE_TERMCAP'
> fi
> echores "$_termcap"
> 
> So, if you explicitly pass --enable-termcap, autodetection is not done,
> and you have to pass -lncurses explicitly in --extra-libs. Otherwise,
> if you don't use --enable-termcap and let the autodetection do its
> work, it detects -lncurses automatically.
> 
> So I'm not sure which one to choose:
> 
>  *) Autodetection, which avoids the need for passing explicit -l<foo>
>  values, but has the drawback of autodetection: we're not explicitly
>  saying which features we want to enable, which may cause mis-use of
>  certain libraries.
> 
>  *) No autodetection, which forces us to pass the proper -l<foo> value
>  for each dependency.
> 
> Opinions?

 For the positive case (--enable-termcap), autodetection should be fine. What we
want to catch is that termcap happens to have been built before, so we want an
explicit --disable-termcap.

 Of course, there should be a comment why we don't put the --enable-termcap.

 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
