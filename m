From: D M <d_mo1234@yahoo.com>
Date: Wed, 8 Feb 2012 18:39:16 -0800 (PST)
Subject: [Buildroot] ccache problem with codesourcery toolchain
In-Reply-To: <20120205084546.2db4fec8@skate>
References: <1328403901.12122.YahooMailNeo@web160901.mail.bf1.yahoo.com>
 <20120205084546.2db4fec8@skate>
Message-ID: <1328755156.43027.YahooMailNeo@web160905.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I like Arnout's "touch -r" idea. ?Please find a patch attached to
this email. ?It did the trick for me.

Dan -




----- Original Message -----
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: D M <d_mo1234@yahoo.com>
Cc: "buildroot at busybox.net" <buildroot@busybox.net>
Sent: Sunday, February 5, 2012 2:45 AM
Subject: Re: [Buildroot] ccache problem with codesourcery toolchain

Hello Danomi,

Le Sat, 4 Feb 2012 17:05:01 -0800 (PST),
D M <d_mo1234@yahoo.com> a ?crit :

> I am working on a project based on the 2011.08 release of buildroot.
> ?We found that the ccache savings was not as good as with our older
> version of buildroot (which used an older version of ccache). ?For
> example, starting from an empty cache directory, our compile takes
> about half an hour. ?With the newer version of ccache, we only save
> about 3 minutes; with the older version, we saved about 13 minutes.
> ?We traced the problem to a feature introduced in ccache 3.0,
> the?CCACHE_COMPILERCHECK option. ?Quoting from ccache manual:?
> 
> ? ?"By default, ccache includes the modification time (?mtime?) and
> size of the compiler in the hash to ensure that results retrieved
> from the cache are accurate. The CACHE_COMPILERCHECK environment
> variable can be used to select another strategy." ?
> 
> The default is "mtime", but if we select "none", we get back all of
> our savings. ?Again quoting from the manual: ?
> 
> ? ? "none - Don?t hash anything. This may be good for situations
> where you can safely use the cached results even though the
> compiler?s mtime or size has changed (e.g. if the compiler is built
> as part of your build system and the compiler?s source has not
> changed, or if the compiler only has changes that don?t affect code
> generation)."
> 
> Since we are using buildroot's capability to automatically download
> and extract the CodeSourcery ARM toolchain, the "mtime" used in the
> hash is different every time we do a full recompile. ?So a value of
> "none" seems appropriate when use buildroot this way.
> 
> Have others ran into this? ?Since buildroot has this kind of
> CodeSourcery toolchain support, I was wondering if there should be an
> option in menuconfig to specify CCACHE_COMPILERCHECK, to, for
> example, prepend a "CCACHE_COMPILERCHECK=none" to the beginning of
> the CCACHE variable that is used to make TARGET_CC, TARGET_CXX,
> HOSTCC, HOSTCXX.

Good research! Obviously, using the default value of
CCACHE_COMPILERCHECK=mtime will completely defeat the compiler cache in
the context of Buildroot, because the compiler gets re-created pretty
much at every build, so definitely we should arrange for
CCACHE_COMPILERCHECK=none to be set in the ccache environment, or even
directly modify the ccache code to make it the default.

The thing I am curious about is where do the 3 minutes time reduction
come from even when CCACHE_COMPILERCHECK=mtime? Maybe it's the time
reduction gained on compiling host packages, since those always use the
same host compiler.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ext-toolchain-set-wrapper-date-for-ccache-mtime.patch
Type: application/octet-stream
Size: 1253 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120208/42e9d2cb/attachment-0001.obj>
