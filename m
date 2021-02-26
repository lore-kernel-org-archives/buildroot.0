From: Markus Mayer <mmayer@broadcom.com>
Date: Fri, 26 Feb 2021 14:19:18 -0800
Subject: [Buildroot] [PATCH] package/readline: disable bracketed paste
 by default
In-Reply-To: <20210226214333.GA2390841@scaer>
References: <20210226200821.2992417-1-mmayer@broadcom.com>
 <20210226214333.GA2390841@scaer>
Message-ID: <CAGt4E5vkQbrObjkNdKkWrvbSrL4B+TG6-HDMsh9escDYA+j0Cw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 26 Feb 2021 at 13:43, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Markus, All,
>
> > +
> > +config BR2_PACKAGE_READLINE_BRACKETED_PASTE
> > +     bool "Enable bracketed paste"
> > +     depends on BR2_PACKAGE_READLINE
> > +     help
> > +       Enable the "bracketed paste" feature in libreadline. Bracketed paste
> > +       is helpful for interactive sessions when one wants to prevent pasted
> > +       text from being interpreted as typed-in commands. However, it also
> > +       causes control characters to show up in the raw output of a (telnet)
> > +       session. This can cause issues and throw off pattern matching if the
> > +       session output is being captured for automated processing.
> > +       See
> > +           https://cirw.in/blog/bracketed-paste
> > +       for further information on this feature and whether you may want it.
>
>     $ make check-package
>     package/readline/Config.in:15: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
>     package/readline/Config.in:16: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
>     package/readline/Config.in:17: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
>     package/readline/Config.in:18: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
>     package/readline/Config.in:19: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
>     package/readline/Config.in:23: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
>
> This is too bad, because you had managed to have a very nicely justified
> block of help text that I foudn really good to look at... Alas, it does
> not match the coding rules... <Sob...>

I'll try to remember the 72 column limit for next time.

> > diff --git a/package/readline/readline.mk b/package/readline/readline.mk
> > index 326cffab1880..ce2a08b9375b 100644
> > --- a/package/readline/readline.mk
> > +++ b/package/readline/readline.mk
> > @@ -16,6 +16,10 @@ READLINE_LICENSE = GPL-3.0+
> >  READLINE_LICENSE_FILES = COPYING
> >  READLINE_CPE_ID_VENDOR = gnu
> >
> > +ifeq ($(BR2_PACKAGE_READLINE_BRACKETED_PASTE),)
> > +     READLINE_CONF_OPTS += --disable-bracketed-paste-default
> > +endif
>
> No indentation in conditional blocks in makefiles (yup, that' goes counter
> best practices, I'm not fan either, but that's what we do everywhere
> else (mostly), and consistency wins.)
>
> Also, we want explicit enable/disable, and we prefer positive logic:
>
>     ifeq ($(BR2_PACKAGE_READLINE_BRACKETED_PASTE),y)
>     READLINE_CONF_OPTS += --enable-bracketed-paste-default
>     else
>     READLINE_CONF_OPTS += --disable-bracketed-paste-default
>     endif
>
> Applied to master with the above fixed, thanks.

And I'll try to remember this, as well.

Thanks,
-Markus
