From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Jun 2013 18:56:42 +0200
Subject: [Buildroot] [git commit] package: add libwebsockets
In-Reply-To: <51B71D78.2040903@nanotronic.ch>
References: <20130414193550.D82F69B078@busybox.osuosl.org>
 <51B71D78.2040903@nanotronic.ch>
Message-ID: <20130611165642.GA3570@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas, All,

On 2013-06-11 14:52 +0200, Andreas Wetzel spake thusly:
> Just for my understandings:
> 
> > [Peter: add missing zlib select to Config.in]
> 
> This means, we kind of track dependencies twice?
> 
> 1) in Config.in we tell the config system to also select the packages we
> depend on (here "zlib").
> 2) On the other hand I have to specify the dependencies in the build-recipe
> too ("LIBWEBSOCKETS_DEPENENCIES = zlib").
> 
> What is the reason we do this twice?

The 'select' or 'depends on' in Config.in is a feature-wise dependency.
The FOO_DEPENDENCIES is a build dependency.

Let's take a trivial example:
  - libfoo provides a library
  - bar provides an executable that links against libfoo

  -> bar's Config.in needs to 'select' libfoo
  -> bar.mk needs BAR_DEPENDENCIES += libfoo

  This ensures that:
    - package libfoo is selected (Config.in)
    - libfoo is built _before_ bar (bar.mk)
  If you were to only 'select' (or 'depends on') in Config.in, then bar
  would be built before libfoo (because of the alphabetical order).

Now, let's look at a different case:
  - foo provides an executable
  - bar provides another executable, but needs foo at runtime

  -> bar's Config.in needs to 'select' (or 'depends on') bar

  Since there is not build-time dependency, there's no need for bar.mk
  to add foo ro BAR_DEPENDENCIES.

> My thought to not add "select BR2_PACKAGE_ZLIB" was:
> When I select libwebsockets, it automatically includes zlib in the build
> process. When I later de-select libwebsockets, the next build would not
> include zlib.

Buildroot does not guarantee that a change in the packages selection
(especially package removal) will give a 'clean' build. For example, if
you were to de-select libwebsockets, then the zlib library would still
be present in your staging and target directories anyway.

Changing the configuration should be done carefully, and only a clean
restart would guarantee you a clean target directory.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
