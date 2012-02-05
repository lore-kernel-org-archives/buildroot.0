From: D M <d_mo1234@yahoo.com>
Date: Sat, 4 Feb 2012 17:05:01 -0800 (PST)
Subject: [Buildroot] ccache problem with codesourcery toolchain
Message-ID: <1328403901.12122.YahooMailNeo@web160901.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am working on a project based on the 2011.08 release of buildroot. ?We found that the ccache savings was not as good as with our older version of buildroot (which used an older version of ccache). ?For example, starting from an empty cache directory, our compile takes about half an hour. ?With the newer version of ccache, we only save about 3 minutes; with the older version, we saved about 13 minutes. ?We traced the problem to a feature introduced in ccache 3.0, the?CCACHE_COMPILERCHECK option. ?Quoting from ccache manual:?

? ?"By default, ccache includes the modification time (?mtime?) and size of the compiler in the hash to ensure that results retrieved from the cache are accurate. The CACHE_COMPILERCHECK environment variable can be used to select another strategy." ?

The default is "mtime", but if we select "none", we get back all of our savings. ?Again quoting from the manual: ?

? ? "none - Don?t hash anything. This may be good for situations where you can safely use the cached results even though the compiler?s mtime or size has changed (e.g. if the compiler is built as part of your build system and the compiler?s source has not changed, or if the compiler only has changes that don?t affect code generation)."

Since we are using buildroot's capability to automatically download and extract the CodeSourcery ARM toolchain, the "mtime" used in the hash is different every time we do a full recompile. ?So a value of "none" seems appropriate when use buildroot this way.

Have others ran into this? ?Since buildroot has this kind of CodeSourcery toolchain support, I was wondering if there should be an option in menuconfig to specify CCACHE_COMPILERCHECK, to, for example, prepend a "CCACHE_COMPILERCHECK=none" to the beginning of the CCACHE variable that is used to make TARGET_CC, TARGET_CXX, HOSTCC, HOSTCXX.

Thanks,
Danomi -
