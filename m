From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 13:25:31 +0100
Subject: [Buildroot] [PATCH v2] libvips: fix compile error for sparc64
In-Reply-To: <20151123214222.GA8423@waldemar-brodkorb.de>
References: <20151123214222.GA8423@waldemar-brodkorb.de>
Message-ID: <20151224132531.6254350f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Mon, 23 Nov 2015 22:42:22 +0100, Waldemar Brodkorb wrote:
> Fixes following build error:
> http://autobuild.buildroot.net/results/1515f070c0fd410c681fc8306700244c34eb1635/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>  - fixes suggested by Thomas Pettazoni
>  - better testing done. Compiles for sparc64 and arm.
>  - same issue happens with gcc 5.x
> ---
>  package/libvips/libvips.mk |   11 +++++++++++
>  1 file changed, 11 insertions(+)

I've applied after simplifying the logic, and reporting the bug
upstream to the gcc developers (I was able to reproduce with gcc
5.3.0). The logic could be simplified a lot by simply doing:

# Sparc64 compile fails, for all optimization levels except -O0. To
# fix the problem, use -O0 with no optimization instead. Bug reported
# upstream at https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69038.
ifeq ($(BR2_sparc64),y)
LIBVIPS_CXXFLAGS += -O0
endif

LIBVIPS_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) $(LIBVIPS_CXXFLAGS)"

Indeed, if you put -O0 *after* a previous -O<something> option, it
takes precedence. So there's no need to do a filter. In addition, this
is more correct since the compiler bug also occurs with -O2 or -O3, not
only -Os.

See
https://git.busybox.net/buildroot/commit/?id=c4486e8c947e728b663eb2ac1c0286077129445f
for the final commit.

Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
