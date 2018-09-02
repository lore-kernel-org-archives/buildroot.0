From: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sun, 2 Sep 2018 16:21:46 -0400
Subject: [Buildroot] [PATCH 0/3] qt5webkit: fix build issue using system
 leveldb
In-Reply-To: <20180831231930.58f7ca3e@windsurf>
References: <20180831202204.28093-1-gael.portay@savoirfairelinux.com>
 <20180831231930.58f7ca3e@windsurf>
Message-ID: <20180902202144.jmhaz6nz2gtk3n52@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Aug 31, 2018 at 11:19:30PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> First of all: there are a *lot* of explanations in the cover letter,
> but your commit logs are almost empty. The cover letter is lost in the
> mailing list archives, while the commit logs are nicely preserved in
> the Git history. Therefore, we want more explanations in the commit
> logs!
>

I knew you would says something about that. I sent the patch serie as
soon as possible for a review. I think you may want it for the upcoming
release.

The thing is, I did not know how to properly arrange my commits :/ I did
not want to mention something about qt5webkit in patches related to
leveldb.

Maybe, I can add the content of the coverletter in the commit message of
the last patch and reword a bit.

> On Fri, 31 Aug 2018 16:22:01 -0400, Ga?l PORTAY wrote:
>
> (...)
>
> Is it libleveldb.so itself that uses this symbol, or a separate part of
> WebCore that directly uses some leveldb internals ?
> 

It is WebCore that use directly that symbol; libleveldb does not.

> > Note that the copy built by QtWebKit is an all-in-one library including both
> > libleveldb and libmemenv *AND* thus QtWebKit links against libleveldb only.
> > Also, note that the linker finds the buildroot's copy first; not its internal
> > copy. That explains why it is complaining about a missing symbol.
> > 
> > Fortunatly, QtWebKit provides a facility to link against the system leveldb
> > package. The qmake flag WEBKIT_CONFIG+=use_system_leveldb tells Qt5WebKit to
> > link against libleveldb *AND* libmemenv [5].
> > 
> > To fix that issue, this patchset builds the leveldb package and tells QtWebKit
> > to use it instead of building its own copy.
> > 
> > The first two patches concern the leveldb package.
> > 
> > The first one adds installation of headers and the missing static library in
> > the staging directory.
> 
> I am a bit uneasy about this one, it seems to install "internal" stuff
> of leveldb that are normally not meant to be installed. Do you/we
> understand what this internal stuff, beyond just "it fixes qt5webkit" ?
> 

This static library consists of this *VERY SINGLE* symbol which is like
an extra that is not shipped at installation.

Apparently WebKit see value in that function and has decided to use it
[1].

As QtWebKit bundled the leveldb third-party to build WebKit, it rewrote
the way how to build it (i.e. not using Makefile) in order to use qmake
build system.

As that "Makefile" has been rewritten, QtWebKit has included this symbol
directly to libleveldb.so to link against this library *ONLY* (which
looks an error to me).

Later, QtWebKit has provided a configure option to use the libleveldb.so
provided by the system (i.e. to disable the included third-party). This
option links Qt5WebKit.so with both libleveldb.so and libmemenv.a
libraries.

Is it more clear?

Note: Also, since leveldb has moved to cmake, this symbol is now a part
of libleveldb.so and there is not more libmemenv.a [2] :/

> (...) 
> 
> All in all, I'm just worried by the installation of what looks like
> some internal library/headers of leveldb. Could you comment on this ?
>

We can consider memenv as an option of leveldb which installs the memenv
development files (static library and header).

Then, QtWebKit will select that option because it requires memenv to be
installed to successfully build itself.

Which probably looks like:

	if BR2_PACKAGE_LEVELDB
	
	config BR2_PACKAGE_LEVELDB_MEMENV
		bool "memenv"	
		default n
		help
		  Installs memenv static library and header to create in-memory LevelDB
		  database.
	
	endif

> Thanks!
> 
> Thomas

[1]: https://github.com/qt/qtwebkit/blob/5.6/Source/WebCore/platform/leveldb/LevelDBDatabase.cpp#185
[2]: https://github.com/google/leveldb/blob/739c25100e46576cdcdfff2d6f43f9f7008103c7/CMakeLists.txt#L181-L186

Regards,
Ga?l
