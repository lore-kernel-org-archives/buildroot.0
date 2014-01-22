From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jan 2014 19:17:20 +0100
Subject: [Buildroot] [PATCH v3, 3/3] add support for building the server
In-Reply-To: <CA+kK6Wt1SajT+u7pyXqCGe6enKb7XEwC-VvCbimWzp1CXxBq3A@mail.gmail.com>
References: <1390313407-3495-2-git-send-email-kuyurix@gmail.com>
 <1390313407-3495-3-git-send-email-kuyurix@gmail.com>
 <20140121222717.GE3455@free.fr>
 <CA+kK6Wt1SajT+u7pyXqCGe6enKb7XEwC-VvCbimWzp1CXxBq3A@mail.gmail.com>
Message-ID: <20140122181720.GA3592@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcelo, All,

On 2014-01-21 21:46 -0200, Marcelo Gutierrez spake thusly:
> +define HOST_MYSQL_BUILD_CMDS
> > +        $(MAKE) -C $(@D)/include my_config.h
> > +        $(MAKE) -C $(@D)/mysys libmysys.a
> > +        $(MAKE) -C $(@D)/strings libmystrings.a
> > +        $(MAKE) -C $(@D)/vio libvio.a
> > +        $(MAKE) -C $(@D)/dbug libdbug.a
> > +        $(MAKE) -C $(@D)/regex libregex.a
> > +        $(MAKE) -C $(@D)/sql gen_lex_hash
> >
> 
> 
> Hmmm... When I suggested we only build the required stuff, I did not
> > expect this would amount to so many single-line calls.
> >
> > I wonder if it is worth keeping this. So, is it much faster to only
> > build the above, compared to building everything? If so, we just keep
> > the above lines, otherwise, we should just keep the default host build
> > commands.
> 
> I can confirm you that compiles faster, since, we just need generate
> gen_lex_hash binary file, but if you want to keep the default host build
> commands, just let me know.

So we'll keep your multi-line commands, since they are faster than a
complete build. Thanks!

> I noticed that you enable the server with: --with-embedded-server
> > but you disable it with: --without-server
> 
> http://dev.mysql.com/doc/refman/5.1/en/source-configuration-options.html
> 
> I based on source configuration options:
> 
> To compile just the MySQL client libraries and client programs and not the
> > server, use the --without-server option
> >
> 
> To build the embedded MySQL library (libmysqld.a), use the
> > --with-embedded-server option

OK, that's good then. That's not the standard behaviour ofan autotools
package, though, but since that's the way they dociument it, let's use
that.

> endef
> >
> > else
> > +MYSQL_CONF_OPT += \
> > +     --without-server
> > +endif
> >
> 
> I think, I should add --without-embedded-server like this:
> 
> MYSQL_CONF_OPT += \
> +     --without-server
> +     --without-embedded-server
> 
> What about ...?

No. Since you use the documented behaviour, just use that. Your patch id
fine in this respect.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
