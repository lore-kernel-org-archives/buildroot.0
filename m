From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Oct 2016 21:45:51 +0200
Subject: [Buildroot] cached downloads for scm branches
In-Reply-To: <f006d88783fb1d99aaef2d6cab1dfc88@walle.cc>
References: <f006d88783fb1d99aaef2d6cab1dfc88@walle.cc>
Message-ID: <20161020194551.GA3372@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, All,

On 2016-10-20 19:27 +0200, Michael Walle spake thusly:
> Hi,
> 
> If I have a package which downloads it's source from a SCM branch, the
> download will be cached in DL_DIR/<pkgname>-<branchname>.tar.gz. This makes
> sense if the version is a tag or a (git) hash. But if used with branches,
> the package will never be downloaded again until I remove it from the
> DL_DIR. This may be the intended behaviour, but as far as I can tell, I have
> no chance to change it.

Yes, this is the intended behaviour: you should not use a branch names
or other unstable references Using a branch name makes the build
non-reproducible, and that is not good.

Only use stable references, like a tag or a sha1 or ...

If however you are actively working on the package, then you should use
the source-override mechanism instead:

  - create a local.mk file (in the directory where you ran 'make
    menuconfig')

  - in that file, add this line

        MY_PACKAGE_OVERRIDE_SRCDIR = /path/to/my-package

Then you can manage that location "by hand" (like pulling new changes...)
and have it automatically used by Buildroot:

    make my-package-rebuild

(and other such commands, see "make help" and the manual for the
complete set.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
