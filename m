From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Feb 2013 20:17:07 +0100
Subject: [Buildroot] [PATCH 4/7] package/libedit2: new package
In-Reply-To: <201302062000.10836.yann.morin.1998@free.fr>
References: <cover.1359993560.git.yann.morin.1998@free.fr>
 <5110390A.1040708@mind.be> <201302062000.10836.yann.morin.1998@free.fr>
Message-ID: <201302062017.07747.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Wednesday 06 February 2013 Yann E. MORIN wrote:
> On Monday 04 February 2013 Arnout Vandecappelle wrote:
> > On 04/02/13 17:01, Yann E. MORIN wrote:
[--SNIP--]
> > > +# $1: DESTDIR to install into
> > > +# Can't use pmake to install, it wants to be root. sigh... :-(
> > > +define LIBEDIT2_INSTALL_CMDS
> > > +	$(INSTALL) -D -m 0644 package/libedit2/libedit2.pc $(1)/usr/lib/pkgconfig/libedit2.pc
> > > +	ln -sf libedit2.pc $(1)/usr/lib/pkgconfig/libedit.pc
> > > +	$(INSTALL) -D -m 0644 $(@D)/libedit/libedit.a $(1)/usr/lib/libedit.a
> > > +	$(INSTALL) -D -m 0644 $(@D)/libedit/libedit_pic.a $(1)/usr/lib/libedit_pic.a
> > > +	$(INSTALL) -D -m 0644 $(@D)/libedit/libedit.so.2.11 $(1)/usr/lib/libedit.so.2.11
> > > +	$(INSTALL) -D -m 0644 $(@D)/libedit/histedit.h $(1)/usr/include/histedit.h
> > > +	ln -sf libedit.so.$(LIBEDIT2_VERSION) $(1)/usr/lib/libedit.so.$(LIBEDIT2_VERSION_MAJOR)
> >   This doesn't seem right: LIBEDIT2_VERSION is 2.11-20080614, but you 
> > just installed 2.11...
> 
> Hmmm... Lemme check...

OK, here's what in the build log:

/usr/bin/install -D -m 0644 [...]/build/libedit2-2.11-20080614/libedit/libedit.so.2.11 [...]/target/usr/lib/libedit.so.2.11
ln -sf libedit.so.2.11-20080614 [...]/target/usr/lib/libedit.so.2
ln -sf libedit.so.2 [...]/target/usr/lib/libedit.so

And now, here's what is in target/usr/lib:

$ ls -l target/usr/lib/libedit*                                                                                                                                                                 
lrwxrwxrwx 1 ymorin ymorin     12 Feb  6 20:09 target/usr/lib/libedit.so -> libedit.so.2
lrwxrwxrwx 1 ymorin ymorin     15 Feb  6 20:09 target/usr/lib/libedit.so.2 -> libedit.so.2.11
-rw-r--r-- 1 ymorin ymorin 135945 Feb  6 20:09 target/usr/lib/libedit.so.2.11

WTF?

OK, I'll fix this. But dinner first! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
