From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Aug 2016 15:03:14 +0200
Subject: [Buildroot] [PATCH 1/2] mtd: fix build failure with blackfin
 external toolchain
In-Reply-To: <1470847117-14956-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1470847117-14956-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160811150314.5d49b4ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Aug 2016 22:08:36 +0530, Rahul Bedarkar wrote:
> With blackfin uClibc toolchain, we see following build errors
> 
> integck.c: In function 'parse_mount_options':
> integck.c:2889: error: 'MS_DIRSYNC' undeclared (first use in this function)
> integck.c:2889: error: (Each undeclared identifier is reported only once
> integck.c:2889: error: for each function it appears in.)
> integck.c:2899: error: 'MS_RELATIME' undeclared (first use in this function)
> <builtin>: recipe for target 'integck' failed
> make[2]: *** [integck] Error 1
> 
> header <sys/mount.h> from this toolchain is missing definitions for
> MS_DIRSYNC and MS_RELATIME mount flags. But those are available from
> header <linux/fs.h>. Even tests/fs-tests/lib/tests.c uses these flags
> and includes both <sys/mount.h> and <linux/fs.h> headers.
> 
> This patch fixes above build error by including header <linux/fs.h>
> 
> Fixes:
> http://autobuild.buildroot.net/results/6a1/6a1bd73cc56cd257fa939702728802b63446473e/
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>

I have for now decided to not apply this patch. Indeed, the only reason
why it's needed is because the uClibc version used in the Blackfin
toolchain from ADI is very very old, and therefore does not have the
MS_DIRSYNC and MS_RELATIME definitions.

Since all other toolchains we use have recent enough C libraries, I
don't really see the point of carrying this patch, as the only
problematic case is made invisible by the BR2_USE_MMU dependency.

Your patch will always be around in the archives to apply in the future
if we see other situations where such a fix would be needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
