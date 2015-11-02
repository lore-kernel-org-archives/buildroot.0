From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 21:51:48 +0100
Subject: [Buildroot] [PATCH v1] wireshark: fix inet_pton detection
In-Reply-To: <1446328474-11255-1-git-send-email-ps.report@gmx.net>
References: <1446328474-11255-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151102215148.1a596cb2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Sat, 31 Oct 2015 22:54:34 +0100, Peter Seiderer wrote:
> Patch configure.ac to not assume broken inet_pton in case of cross
> compiling (avoids double definition), similare patch is used
> for OpenEmbedded (see [1]).
> 
> Fixes [2]:
> 
>   host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(ntop.os): In function `inet_pton':
>   ntop.c:(.text+0x4b4): multiple definition of `inet_pton'
>   wsutil/.libs/libwsutil.a(inet_pton.o):inet_pton.c:(.text+0xe0): first defined here
>   collect2: error: ld returned 1 exit status
> 
> [1] http://cgit.openembedded.org/openembedded/tree/recipes/wireshark/files/fix-configure.patch
> [2] http://autobuild.buildroot.net/results/b35/b354ba668ca9476c143f5f7ef1b727b0b5672b04
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...o-not-assume-broken-inet_pton-in-case-of-.patch | 32 ++++++++++++++++++++++
>  package/wireshark/wireshark.mk                     |  3 ++
>  2 files changed, 35 insertions(+)
>  create mode 100644 package/wireshark/0001-configure-do-not-assume-broken-inet_pton-in-case-of-.patch

I've applied, but I'm not super happy with the proposed solution
because it's not upstreamable. Can you instead work on a different
patch that adds a autoconf cache variable that allows to override the
result of the "inet_pton is broken" test without patching the
configure.ac ?

See
http://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.69/html_node/Caching-Results.html
for more details.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
