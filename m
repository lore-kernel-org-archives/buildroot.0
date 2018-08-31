From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Aug 2018 23:19:30 +0200
Subject: [Buildroot] [PATCH 0/3] qt5webkit: fix build issue using system
 leveldb
In-Reply-To: <20180831202204.28093-1-gael.portay@savoirfairelinux.com>
References: <20180831202204.28093-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180831231930.58f7ca3e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

First of all: there are a *lot* of explanations in the cover letter,
but your commit logs are almost empty. The cover letter is lost in the
mailing list archives, while the commit logs are nicely preserved in
the Git history. Therefore, we want more explanations in the commit
logs!

On Fri, 31 Aug 2018 16:22:01 -0400, Ga?l PORTAY wrote:

> QtWebKit builds its own copy of leveldb [1] if it is not provided by the system
> (i.e. buildroot).

And indeed, using the leveldb library built by the leveldb Buildroot
package is better.

> It builds it differently and this is the origin of that
> issue. Instead of using the Makefile provided by leveldb [2], QtWebKit uses
> qmake to build that library [3].
> 
>         /home/naourr/work/instance-2/output/build/qt5webkit-5.9.1/Source/WebCore//.obj/platform/leveldb/LevelDBDatabase.o: In function `WebCore::LevelDBDatabase::openInMemory(WebCore::LevelDBComparator const*)':
> LevelDBDatabase.cpp.text._ZN7WebCore15LevelDBDatabase12openInMemoryEPKNS_17LevelDBComparatorE+0x34): undefined reference to `leveldb::NewMemEnv(leveldb::Env*)'
>         collect2: error: ld returned 1 exit status
>         make[3]: *** [Makefile.api:97: ../lib/libQt5WebKit.so.5.9.1] Error 1
> 
> The missing symbol issue happens because the symbol leveldb::NewMemEnv is
> shipped in a static library named libmemenv.a (aside libleveldb.so) and that
> static library is *NOT* installed in the staging directory. Unfortunatly, that
> symbol is required latter by WebCore [4].

latter -> later.

Is it libleveldb.so itself that uses this symbol, or a separate part of
WebCore that directly uses some leveldb internals ?

> Note that the copy built by QtWebKit is an all-in-one library including both
> libleveldb and libmemenv *AND* thus QtWebKit links against libleveldb only.
> Also, note that the linker finds the buildroot's copy first; not its internal
> copy. That explains why it is complaining about a missing symbol.
> 
> Fortunatly, QtWebKit provides a facility to link against the system leveldb
> package. The qmake flag WEBKIT_CONFIG+=use_system_leveldb tells Qt5WebKit to
> link against libleveldb *AND* libmemenv [5].
> 
> To fix that issue, this patchset builds the leveldb package and tells QtWebKit
> to use it instead of building its own copy.
> 
> The first two patches concern the leveldb package.
> 
> The first one adds installation of headers and the missing static library in
> the staging directory.

I am a bit uneasy about this one, it seems to install "internal" stuff
of leveldb that are normally not meant to be installed. Do you/we
understand what this internal stuff, beyond just "it fixes qt5webkit" ?

> The second one patches leveldb to generate position independant code for the
> static library libmemenv.a; in order let it linkable by the Qt5WebKit module.

OK, I guess this is reasonable. We don't really build twice the object
files so that the .a object files are non-PIC and the .so object files
are PIC.

All in all, I'm just worried by the installation of what looks like
some internal library/headers of leveldb. Could you comment on this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
