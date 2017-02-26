From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 14:16:20 +0100
Subject: [Buildroot] [PATCH] synergy: Fix build with gcc 6
In-Reply-To: <20170225211701.6357-1-peter@korsgaard.com>
References: <20170225211701.6357-1-peter@korsgaard.com>
Message-ID: <20170226141620.3449f4c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Feb 2017 22:17:01 +0100, Peter Korsgaard wrote:
> Fixes:
> http://autobuild.buildroot.net/results/05b/05bbc22dd6cd5564462226e612ab1e95778fe935/
> http://autobuild.buildroot.net/results/edf/edfe58749d1b7a1bb2e0184a6824a74b9d38ddb9/
> http://autobuild.buildroot.net/results/139/1395eca13ca537bde928ddd68a5bc6e130e82ba3/
> http://autobuild.buildroot.net/results/94a/94ad6e8bbbeb926ea834d9d6e3ba87d0398acb86/
> 
> Gcc 6.x defaults to C++14, and the iostream operator bool behaviour changed
> in C++11.  In previous versions, a somewhat odd operator void* was used to
> return the status of the stream as a pointer.  Since C++11 a more sensible
> operator bool is used to return the stream staus.
> 
> For details, see:
> 
> http://en.cppreference.com/w/cpp/io/basic_ios/operator_bool
> 
> The code in CConfigReadContext assumes the pre-C++11 behaviour and provides
> its own operator void overload to return the status of the embedded
> iostream.  With C++11, iostream no longer provides this overload, breaking
> the build:
> 
> CConfig.cpp: In member function 'CConfigReadContext::operator void*() const':
> CConfig.cpp:1851:9: error: cannot convert 'std::istream {aka std::basic_istream<char>}' to 'void*' in return
>   return m_stream;
> 
> To fix it, backport part of upstream commit 3d963bfbe7897d0a33ad (possible
> fix for mavericks) which changes the code to simply provide a getStream()
> method which returns a reference to the embedded stream and the calling code
> is changed to use operator bool on the returned stream, making the code
> compatible with both old and new compilers.
> 
> This upstream commit is part of the 1.6.0 release, so can be dropped when
> the version is bumped.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/synergy/0003-Fix-build-with-gcc-6.patch | 86 +++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 package/synergy/0003-Fix-build-with-gcc-6.patch

Applied to master, thanks. However, did you notice that the hash we
have in Buildroot for synergy-1.3.1.tar.gz does not patch the tarball
available from Sourceforge, and therefore we always fallback to
downloading from sources.b.n ?

See:

Location: https://sourceforge.net/publish/ [following]
--2017-02-26 14:15:18--  https://sourceforge.net/publish/
Connecting to sourceforge.net (sourceforge.net)|216.34.181.60|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 43482 (42K) [text/html]
Saving to: ?/home/thomas/projets/buildroot/output/build/.synergy-1.3.1.tar.gz.LebFB4/output?

/home/thomas/projets/buildroot/output/build/.synergy 100%[===================================================================================================================>]  42,46K   172KB/s    in 0,2s    

2017-02-26 14:15:19 (172 KB/s) - ?/home/thomas/projets/buildroot/output/build/.synergy-1.3.1.tar.gz.LebFB4/output? saved [43482/43482]

ERROR: synergy-1.3.1.tar.gz has wrong sha256 hash:
ERROR: expected: 4a15e26456498dda5f3aa7d688a4892e0c50394a2f01685136fbc954bacc9691
ERROR: got     : 062a0b0841486719a474df96c42381910dbc75447ce41e4a2059bef36829b259
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
--2017-02-26 14:15:19--  http://sources.buildroot.net/synergy-1.3.1.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
Connecting to sources.buildroot.net (sources.buildroot.net)|176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 793172 (775K) [application/x-gzip]
Saving to: ?/home/thomas/projets/buildroot/output/build/.synergy-1.3.1.tar.gz.sA8PnB/output?

/home/thomas/projets/buildroot/output/build/.synergy 100%[===================================================================================================================>] 774,58K  1,60MB/s    in 0,5s    

2017-02-26 14:15:20 (1,60 MB/s) - ?/home/thomas/projets/buildroot/output/build/.synergy-1.3.1.tar.gz.sA8PnB/output? saved [793172/793172]

synergy-1.3.1.tar.gz: OK (sha256: 4a15e26456498dda5f3aa7d688a4892e0c50394a2f01685136fbc954bacc9691)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
