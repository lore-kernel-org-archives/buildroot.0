From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 May 2018 22:29:34 +0200
Subject: [Buildroot] [PATCH 1/5] package/lua-flu: fix to use system
 xattr header
In-Reply-To: <20180507212228.42f1f716@windsurf>
References: <20180507212228.42f1f716@windsurf>
Message-ID: <20180507202934.GF14524@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,All,

On 2018-05-07 21:22 +0200, Thomas Petazzoni spake thusly:
> On Mon,  7 May 2018 20:25:16 +0200, Yann E. MORIN wrote:
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
> > Cc: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  package/lua-flu/0001-use-system-xattr-h.patch | 161 ++++++++++++++++++++++++++
> >  1 file changed, 161 insertions(+)
> >  create mode 100644 package/lua-flu/0001-use-system-xattr-h.patch
> > 
> > diff --git a/package/lua-flu/0001-use-system-xattr-h.patch b/package/lua-flu/0001-use-system-xattr-h.patch
> > new file mode 100644
> > index 0000000000..fda03b60c6
> > --- /dev/null
> > +++ b/package/lua-flu/0001-use-system-xattr-h.patch
> > @@ -0,0 +1,161 @@
> > +Use system <sys/xattr.h>
> > +
> > +The one from attr is no longer installed with latest version.
> > +
> > +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> This could have been a Mercurial-formatted patch. I think you know how
> to use Mercurial :-)

Well, to be hionest,m I was indeed preparing the patch for submission
upstream (now done: https://bitbucket.org/doub/flu/pull-requests/1) and
I really struggled using hg... :-/

> > +diff -durN lua-flu-20150331-1.orig/doub-flu-a7daae986339/doc/doc.lua lua-flu-20150331-1/doub-flu-a7daae986339/doc/doc.lua
> > +--- lua-flu-20150331-1.orig/doub-flu-a7daae986339/doc/doc.lua	2015-03-31 18:54:19.000000000 +0200
> > ++++ lua-flu-20150331-1/doub-flu-a7daae986339/doc/doc.lua	2018-05-06 09:22:28.499324049 +0200
> > +@@ -327,7 +327,7 @@
> > + 				name = "fs.getxattr";
> > + 				parameters = {"path", "name"};
> > + 				results = {"value"};
> > +-				doc = [[Get an extended attribute. If the attribute doesn't exist `ENOATTR` should be thrown.]];
> > ++				doc = [[Get an extended attribute. If the attribute doesn't exist `ENODATA` should be thrown.]];
> 
> I do understand all the attr/xattr.h -> sys/xattr.h changes, but I
> don't understand the ENOATTR -> ENODATA changes. Has the ENOATTR error
> code disappeared ? What makes ENODATA a suitable replacement ?

Oh, right; I forgot to explain that one.

attr, in <attr/xattr.h>, was doing:

    #ifndef ENOATTR
    # define ENOATTR ENODATA
    #endif

Ergo, ENOATTR is just ENODATA.

Regards,
Yann E. MORIN.

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
