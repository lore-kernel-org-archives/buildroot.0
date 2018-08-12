From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 14:32:03 +0200
Subject: [Buildroot] [PATCH 1/1] ncmpc: fix build with some old
 toolchains
In-Reply-To: <20180812074520.1467-1-fontaine.fabrice@gmail.com>
References: <20180812074520.1467-1-fontaine.fabrice@gmail.com>
Message-ID: <20180812143203.049f7619@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Aug 2018 09:45:20 +0200, Fabrice Fontaine wrote:
> With some "old" toolchains (glibc, uclibc in version 4.9.4, 5.3, 5.4,
> 5.5 ...), the following error is raised by the compiler:
> 
> ../src/screen.cxx:60:29:   required from here
> /usr/lfs/v0/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/ext/new_allocator.h:120:4:
> error: no matching function for call to 'std::pair<const screen_functions* const, std::unique_ptr<Page> >::pair(const screen_functions*, Page*)'
> 
> [...]
> 
> /usr/lfs/v0/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/bits/stl_pair.h:112:26:
> note: candidate: constexpr std::pair<_T1, _T2>::pair(const _T1&, const _T2&) [with _T1 = const screen_functions* const; _T2 = std::unique_ptr<Page>]
>        _GLIBCXX_CONSTEXPR pair(const _T1& __a, const _T2& __b)
>                           ^
> /usr/lfs/v0/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/bits/stl_pair.h:112:26:
> note:   no known conversion for argument 2 from 'Page*' to 'const std::unique_ptr<Page>&'
> 
> This is due to the fact that init function of screen_functions
> structure returns Page* but PageMap wants a std::unique_ptr<Page>
> 
> To fix this, cast raw pointer into a unique_ptr with an explicit cast
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/d8a7339d8bdd5cdc6bd1716585d4bcf15a2e8015
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...unique_ptr-error-with-some-old-toolchains.patch | 54 ++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 package/ncmpc/0001-Fix-unique_ptr-error-with-some-old-toolchains.patch

To be honest, I don't have enough C++ knowledge to figure out if this
is the right fix, but I've applied to master anyway. Please submit
upstream to get a proper review. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
