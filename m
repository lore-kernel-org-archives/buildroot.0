From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Aug 2014 21:40:47 +0200
Subject: [Buildroot] [PATCH v3] ejabberd: new package
In-Reply-To: <CAJtjsKaom+gGDgZuivy2Qgss2wSaALDHXFLtKtf0eL-h2syrsQ@mail.gmail.com>
References: <1405686837-1418-1-git-send-email-johan.oudinet@gmail.com>
 <20140720113334.717cb707@free-electrons.com>
 <CAJtjsKaom+gGDgZuivy2Qgss2wSaALDHXFLtKtf0eL-h2syrsQ@mail.gmail.com>
Message-ID: <20140806194047.GC1587@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan, All,

On 2014-08-06 12:30 +0200, Johan Oudinet spake thusly:
> On Sun, Jul 20, 2014 at 11:33 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > On Fri, 18 Jul 2014 14:33:57 +0200, Johan Oudinet wrote:
> >
> >> +
> >> +# Do AC_ERLANG_CHECK_LIB job without erlang.
> >> +define EJABBERD_SET_LIBS_DIR
> >> +     for lib in $(EJABBERD_ERLANG_LIBS); do                                  \
> >> +       export                                                                \
> >> +         erlang_lib_dir_$$lib="`package/ejabberd/check-erlang-lib $$lib`";   \
> >> +     done
> >> +endef
> >
> > Do we really need this script? What does it do exactly? Since we
> > control the erlang installation in Buildroot, can't we simply hardcode
> > the values here?
> 
> Unfortunately, we can't hardcode these values because ejabberd's
> makefile fetches its dependencies from master branches of git
> repositories. So, we don't know which versions have be fetched.
> In my opinion, this is a bad idea as it forces developers of such
> libraries to make sure their master branch is compatible with every
> ejabberd releases that depends on it.
> This is a known issue : https://github.com/processone/ejabberd/issues/233
> In the meantime, I think we need this script to know which version has
> been downloaded by ejabberd's Makefile.
> 
> >
> >> +
> >> +# Set cross-compilation options to the configure called by rebar.
> >> +define EJABBERD_FIX_REBAR_CONFIG_SCRIPT
> >> +     sed -e "s,./configure,./configure \\    \
> >> +     --target=$(GNU_TARGET_NAME) \\          \
> >> +     --host=$(GNU_TARGET_NAME) \\            \
> >> +     --build=$(GNU_HOST_NAME),"              \
> >> +       -i "$(@D)"/rebar.config.script
> >> +endef
> >
> > I don't really follow what's happening here. Since we're using the
> > autotools-package infrastructure, aren't we already calling
> > the ./configure script with the appropriate options?
> 
> The problem comes from ejabberd's makefile. It configures its
> dependencies while we run make, instead of doing it when we run
> ./configure.
> So, what happens is the following:
> - ./configure -> configure ejabberd (this one is called with the
> appropriate options thanks to buildroot)
> - make -> download ejabberd's dependencies in sub-folders,

Argh... :-(

We do not want that to happen. All download operations should be caried
on during the download phase, aka PKG-source. It should basically be
possible to run "make source" then disconnect from the network, and
then run "make" to build.

> run
> ./configure inside each of these sub-folders, then make.
> Thus, the configure script of each ejabberd's dependency is not called
> with the appropriate options. Again, the problem is due to ejabberd
> build system that mixes build and configure steps.

Grr... Stupid build system... :-(

I'll see what we can do for that.

> >> +define EJABBERD_PERMISSIONS
> >> +/etc/ejabberd d 750 0 128 - - - - -
> >> +/etc/ejabberd/ejabberd.yml-new f 640 0 128 - - - - -
> >> +/etc/ejabberd/ejabberd.yml f 640 0 128 - - - - -
> >> +/etc/ejabberd/ejabberdctl.cfg-new f 640 0 128 - - - - -
> >> +/etc/ejabberd/ejabberdctl.cfg f 640 0 128 - - - - -
> >> +/etc/ejabberd/inetrc f 644 0 128 - - - - -
> >> +/usr/sbin/ejabberdctl f 550 0 128 - - - - -
> >> +/usr/lib/ejabberd/priv/bin/captcha.sh f 750 119 0 - - - - -
> >> +/usr/var/lib/ejabberd d 750 119 0 - - - - -
> >> +/usr/var/lock/ejabberdctl d 750 119 0 - - - - -
> >> +/usr/var/log/ejabberd d 750 119 0 - - - - -
> >> +endef
> >
> > <pkg>_PERMISSIONS should only be used for files that need special
> > permissions, the other files should be left with their default
> > permissions, owned by root (which is done automatically by Buildroot).
> 
> ejabberd is run as the ejabberd user. Thus this user needs to own (or
> be in the group of) several files and directories.
> 
> >
> > Also, /usr/var/lib, /usr/val/lock and /usr/var/log look incorrect.
> 
> I've copied the permissions set by the install rule in ejabberd's
> makefile. Honestly, I don't know why ejabberd needs such permissions,
> but if I let root to be the owner of these files, it does not work.
> Do you know a better way of setting ownership? I don't like to have to
> set a specific UID and GID for the ejabberd user simply because the
> syntax of <pkg>_PERMISSIONS requires an ID instead of a name.

Agreed, I would not want ejabberd to run as root either. I'll see what
we can do for those premissions...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
