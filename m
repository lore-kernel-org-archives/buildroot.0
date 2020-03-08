From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Mar 2020 12:22:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/cups: change datarootdir
In-Reply-To: <20200304072102.827531-1-skif@skif-web.ru> (Alexey Lukyanchuk's
 message of "Wed, 4 Mar 2020 10:21:02 +0300")
References: <20200304072102.827531-1-skif@skif-web.ru>
Message-ID: <87wo7vt7jp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Lukyanchuk <skif@skif-web.ru> writes:

 > By default, buildroot clean '/usr/share/doc' at image-building, including cups datadir(usr/share/doc/cups), which stores cups web-interface.
 > It results in web-interface will be unavailable on target system.
 > This patch add --datarootdir=/usr/share/cups to config options. After that cups web-interface work fine.

 > Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
 > ---
 >  package/cups/cups.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/cups/cups.mk b/package/cups/cups.mk
 > index da6778f30a..455da03feb 100644
 > --- a/package/cups/cups.mk
 > +++ b/package/cups/cups.mk
 > @@ -18,6 +18,7 @@ endef
 >  CUPS_PRE_CONFIGURE_HOOKS += CUPS_RUN_AUTOCONF
 
 >  CUPS_CONF_OPTS = \
 > +	--datarootdir=/usr/share/cups \

Can you be more specific? Setting datarootdir to /usr/share/cups does
not really make sense, as cups appends /cups to this, so you end up with
/usr/share/cups/cups/.. Did you mean --datarootdir=/usr/share?
datarootdir defaults to <prefix>/share, so as we build with
--prefix=/usr this is already the default value.

The only thing that gets installed under /usr/share/doc/ is afaik the
things that use docdir:

docdir='${datarootdir}/doc/${PACKAGE_TARNAME}'

grep usr/share/doc build/cups-2.3.1/.files-list.txt | head
cups,./usr/share/doc/cups/de/index.html
cups,./usr/share/doc/cups/es/index.html
cups,./usr/share/doc/cups/ja/index.html
cups,./usr/share/doc/cups/pt_BR/index.html
cups,./usr/share/doc/cups/ru/index.html
cups,./usr/share/doc/cups/apple-touch-icon.png
cups,./usr/share/doc/cups/cups.css
cups,./usr/share/doc/cups/cups-printable.css
cups,./usr/share/doc/cups/index.html
cups,./usr/share/doc/cups/robots.txt

Debian "solves" this by putting these things under /usr/share/cups/doc-root:

dpkg -L cups-server-common | grep cups.css
/usr/share/cups/doc-root/cups.css

So I've changed your patch to use --with-docdir=/usr/share/cups/doc-root
and committed, thanks.

-- 
Bye, Peter Korsgaard
