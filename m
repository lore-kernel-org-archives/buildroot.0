From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 23:06:06 +0200
Subject: [Buildroot] [PATCH 02/18] package/mplayer: add optional giflib
 support
In-Reply-To: <20150330225658.091b8e72@free-electrons.com>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
 <1427649094-1240-3-git-send-email-bernd.kuhls@t-online.de>
 <20150330225658.091b8e72@free-electrons.com>
Message-ID: <20150330230606.2702a000@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Mar 2015 22:56:58 +0200, Thomas Petazzoni wrote:

> > +ifeq ($(BR2_PACKAGE_GIFLIB),y)
> > +MPLAYER_DEPENDENCIES += giflib
> > +MPLAYER_EXTRA_LIBS += -lgif
> > +endif
> 
> Any reason not to use --enable-gif / --disable-gif here? Then you don't
> need to pass a --extra-libs value. I've applied the patch with this
> change, as it seems to build fine. Let me know if that causes a problem.

Hum, looking at the ncurses case, things seem to be a bit annoying:

echocheck "termcap"
if test "$_termcap" = auto ; then
  _termcap=no
  for ld_tmp in "-lncurses" "-ltinfo" "-ltermcap"; do
    statement_check term.h 'tgetent(0, 0)' $ld_tmp &&
      extra_ldflags="$extra_ldflags $ld_tmp" && _termcap=yes && break
  done
fi
if test "$_termcap" = yes ; then
  def_termcap='#define HAVE_TERMCAP 1'
  test $ld_tmp && res_comment="using $ld_tmp"
else
  def_termcap='#undef HAVE_TERMCAP'
fi
echores "$_termcap"

So, if you explicitly pass --enable-termcap, autodetection is not done,
and you have to pass -lncurses explicitly in --extra-libs. Otherwise,
if you don't use --enable-termcap and let the autodetection do its
work, it detects -lncurses automatically.

So I'm not sure which one to choose:

 *) Autodetection, which avoids the need for passing explicit -l<foo>
 values, but has the drawback of autodetection: we're not explicitly
 saying which features we want to enable, which may cause mis-use of
 certain libraries.

 *) No autodetection, which forces us to pass the proper -l<foo> value
 for each dependency.

Opinions?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
