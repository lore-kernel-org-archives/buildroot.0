From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Dec 2015 18:17:14 +0100
Subject: [Buildroot] [PATCH 14/84 RFC] package/jquery: include external
 plugins from jquery's Config.in
In-Reply-To: <56846C8F.50308@mind.be>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <805bddfa16ccc143f1c0a871d7304af0f2b155c7.1451076704.git.yann.morin.1998@free.fr>
 <56846C8F.50308@mind.be>
Message-ID: <20151231171714.GB3495@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-12-31 00:45 +0100, Arnout Vandecappelle spake thusly:
> On 25-12-15 22:24, Yann E. MORIN wrote:
> > ... and make it a menuconfig instead of a 'config'+'menu'.
> 
>  I don't agree with this change, because these are really separate packages, not
> suboptions of the jquery package. Similar for python, where it is even more
> obvious because as indicated by the symlink hack for python3.

That they are separate packages is irrelevant, to the _user_.

It makes sense for us, packagers and BR developpers, but it should not
have an impact on the user experience.

What is relevant to the user, is that they are jquery stuff, and they
don't even make sense without jquery. Whether they are "built-in" or
"external" modules should not be of his concerns.

And, as you argue, if they should be treated like "nornmal" packages,
why do we have them in a submenu?

Note also that what I propose here is what we already do for a few other
packages:
  - Kodi
  - freescale-imx
  - matchbox
  - nvidia-tegra23
  - to a lesser extent, Qt5

Please have a look *as a user* to the menuconfig before and after this
series, and tell me you really prefer the previous layout. Yes, this new
one means we need to source packages "modules" (perl, php, python...)
from the package's own Config.in rather than from the /main/ Config.in,
but I do believe it is better in three ways:

  - those "modules" are only meaningful in combination with the
    corresponding package [0],

  - it removes the (relative) complexity of the dependency knowledge out
    of the main package/Config.in [1] and move it to the best location
    where it can be handled, i.e. the package itself,

  - the resulting menuconfig (UI) layout is more appealing to an end
    user (IMHO).

[0] this implies the python/python3 symlink trick, yes.
[1] I would also like to get rid of the if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
    from package/Config.in and move it to the packages themselves. Not
    that we are not even consistent with that one either, like for
    systemd or tovid.

So I will maintain this patch in the series, if at least to get more
feedback from others.

Thanks for your opinion! ;-)

(This reply is valid for all you other NAKs about this topic. ;-) )

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/Config.in        | 12 ------------
> >  package/jquery/Config.in | 17 ++++++++++++++++-
> >  2 files changed, 16 insertions(+), 13 deletions(-)
> > 
> > diff --git a/package/Config.in b/package/Config.in
> > index dd44743..73a3ac8 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -951,18 +951,6 @@ menu "Javascript"
> >  	source "package/explorercanvas/Config.in"
> >  	source "package/flot/Config.in"
> >  	source "package/jquery/Config.in"
> > -if BR2_PACKAGE_JQUERY
> > -menu "External jQuery plugins"
> > -	source "package/jquery-datetimepicker/Config.in"
> > -	source "package/jquery-keyboard/Config.in"
> > -	source "package/jquery-mobile/Config.in"
> > -	source "package/jquery-sidebar/Config.in"
> > -	source "package/jquery-sparkline/Config.in"
> > -	source "package/jquery-ui/Config.in"
> > -	source "package/jquery-ui-themes/Config.in"
> > -	source "package/jquery-validation/Config.in"
> > -endmenu
> > -endif
> >  	source "package/jsmin/Config.in"
> >  	source "package/json-javascript/Config.in"
> >  endmenu
> > diff --git a/package/jquery/Config.in b/package/jquery/Config.in
> > index 92f5604..3133702 100644
> > --- a/package/jquery/Config.in
> > +++ b/package/jquery/Config.in
> > @@ -1,4 +1,4 @@
> > -config BR2_PACKAGE_JQUERY
> > +menuconfig BR2_PACKAGE_JQUERY
> >  	bool "jQuery"
> >  	help
> >  	  jQuery is a fast and concise JavaScript Library that
> > @@ -6,3 +6,18 @@ config BR2_PACKAGE_JQUERY
> >  	  animating, and Ajax interactions for rapid web development.
> >  
> >  	  http://jquery.com
> > +
> > +if BR2_PACKAGE_JQUERY
> > +
> > +comment "External jQuery plugins"
> > +
> > +source "package/jquery-datetimepicker/Config.in"
> > +source "package/jquery-keyboard/Config.in"
> > +source "package/jquery-mobile/Config.in"
> > +source "package/jquery-sidebar/Config.in"
> > +source "package/jquery-sparkline/Config.in"
> > +source "package/jquery-ui/Config.in"
> > +source "package/jquery-ui-themes/Config.in"
> > +source "package/jquery-validation/Config.in"
> > +
> > +endif
> > 
> 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
