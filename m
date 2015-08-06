From: Scott Fan <fancp2007@gmail.com>
Date: Thu, 6 Aug 2015 08:54:42 +0800
Subject: [Buildroot] [PATCH] package/tz: fix incorrect timezone setting
 for uclibc
In-Reply-To: <20150802153830.GG3647@free.fr>
References: <1438323935-7809-1-git-send-email-fancp2007@gmail.com>
 <20150802153830.GG3647@free.fr>
Message-ID: <CAFkzVZYcRnRuH-jmMh0-7VKcTnKnDNyL1wqXWFAOdLEi5-Sd8w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Is this patch ok?

Thanks.

Regards,
Scott Fan

On Sun, Aug 2, 2015 at 11:38 PM, Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Scott, All,
>
> On 2015-07-31 14:25 +0800, Scott Fan spake thusly:
> > According to the doc file from <uclibc-src>/docs/
> > Glibc_vs_uClibc_Differences.txt, the uclibc library read the
> > TZ environment variable, or the /etc/TZ file; the /etc/TZ file
> > should be a single line, ending with a newline, containing the
> > TZ setting.  For example: echo CST6CDT > /etc/TZ
> >
> > Whereas the tzdump cmd would output two lines like this:
> >   # Asia/Shanghai
> >   CST-8
> >
> > This make the uclibc could not read the correct TZ setting, therefore
> > e.g. the 'busybox date' cmd always show the UTC timezone.
> >
> > This fix remove the redundant first line from the tzdump output.
> >
> > Signed-off-by: Scott Fan <fancp2007@gmail.com>
>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  package/tz/tz.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/tz/tz.mk b/package/tz/tz.mk
> > index 349d73f..7a756eb 100644
> > --- a/package/tz/tz.mk
> > +++ b/package/tz/tz.mk
> > @@ -14,7 +14,7 @@ define TZ_BUILD_CMDS
> >       (cd $(HOST_DIR)/usr/share/zoneinfo/posix/;                 \
> >               for i in $$(find . -type f); do                    \
> >                       mkdir -p $(@D)/output/$$(dirname $$i);         \
> > -                     $(TZDUMP) -p . -q $${i#./} > $(@D)/output/$$i; \
> > +                     $(TZDUMP) -p . -q $${i#./} | sed '1d' >
> $(@D)/output/$$i; \
> >               done                                               \
> >       )
> >  endef
> > --
> > 2.5.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150806/4bab6d37/attachment.html>
