From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 10:10:49 +0100
Subject: [Buildroot] [git commit] package/xen: security bump to version
 4.14.1
Message-ID: <20201223085641.4463F88674@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9d27610ab773d2e9711a8301c2c2956e3f7ccaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Includes security fixes up to XSA-359:

XSA-345: x86: Race condition in Xen mapping code
XSA-346: undue deferral of IOMMU TLB flushes
XSA-347: unsafe AMD IOMMU page table updates
XSA-348: undue recursion in x86 HVM context switch code (CVE-2020-29566)
XSA-351: Information leak via power sidechannel (CVE-2020-28368)
XSA-352: oxenstored: node ownership can be changed by unprivileged clients
         (CVE-2020-29486)
XSA-353: oxenstored: permissions not checked on root node (CVE-2020-29479)
XSA-355: stack corruption from XSA-346 change
XSA-356: infinite loop when cleaning up IRQ vectors (CVE-2020-29567)
XSA-358: FIFO event channels control block related ordering (CVE-2020-29570)
XSA-359: FIFO event channels control structure ordering (CVE-2020-29571)

And drop now upstreamed security patches.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.hash | 26 +-------------------------
 package/xen/xen.mk   | 39 +--------------------------------------
 2 files changed, 2 insertions(+), 63 deletions(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index eb5b18b416..95061c3fc8 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,27 +1,3 @@
 # Locally computed
-sha256  06839f68ea7620669dbe8b67861213223cc2a7d02ced61b56e5249c50e87f035  xen-4.14.0.tar.gz
+sha256  cf0d7316ad674491f49b7ef0518cb1d906a2e3bfad639deef0ef2343b119ac0c  xen-4.14.1.tar.gz
 sha256  ecca9538e9d3f7e3c2bff827502f4495e2ef9e22c451298696ea08886b176c2c  COPYING
-# https://xenbits.xenproject.org/xsa/advisory-333.html
-sha256  8edec914fbdf036fba8cb54a75d3a9b025fac936e0af35512954a2dc2b12a26f  xsa333.patch
-# https://xenbits.xenproject.org/xsa/advisory-334.html
-sha256  323cd9d24b2e95643833865a9943172c56edd25dfd170e4741034d28dfd0d4bd  xsa334.patch
-# https://xenbits.xenproject.org/xsa/advisory-336.html
-sha256  ecb59876fb92cfe0916ed5f3227a30efe038224c1f6ec36bc3706c4e2214552c  xsa336.patch
-# https://xenbits.xenproject.org/xsa/advisory-337.html
-sha256  98c48781dd46bf6ff6cc46246c6c9f2e2be6ec696c0e7918d4b82845588ce04e  xsa337-1.patch
-sha256  9e8ae24222371379f2ea62e14fcc7f7282e01c356dff230c22c9ab1d2fb941e2  xsa337-2.patch
-# https://xenbits.xenproject.org/xsa/advisory-338.html
-sha256  7345eac1cbad23b082523e9cbd0331f8a9f16c6e459fb2a686606253f5514c9b  xsa338.patch
-# https://xenbits.xenproject.org/xsa/advisory-339.html
-sha256  b6ffa7671d905aa12498ad64915be3b7cba74ce1c5bf6bce18b1f106ebf6d715  xsa339.patch
-# https://xenbits.xenproject.org/xsa/advisory-340.html
-sha256  2bb088fcc1f8f79bf5ddb7b4e101cb1db76a343d2fb1cdafb7cd54612e4009da  xsa340.patch
-# https://xenbits.xenproject.org/xsa/advisory-342.html
-sha256  060caee3fb5971fca0f2fbdef622c52d9bc6e0ed9efad33de5b6b504651c2112  xsa342.patch
-# https://xenbits.xenproject.org/xsa/advisory-343.html
-sha256  d714a542bae9d96b6a061c5a8f754549d699dcfb7bf2a766b721f6bbe33aefd2  xsa343-1.patch
-sha256  657c44c8ea13523d2e59776531237bbc20166c9b7c3960e0e9ad381fce927344  xsa343-2.patch
-sha256  2b275e3fa559167c1b59e6fd4a20bc4d1df9d9cb0cbd0050a3db9c3d0299b233  xsa343-3.patch
-# https://xenbits.xenproject.org/xsa/advisory-344.html
-sha256  5f9dbdc48bed502d614a76e5819afa41a72cec603c5a2c9491d73873a991a5ed  xsa344-1.patch
-sha256  381ca5c51bc120bfd5c742be3988f570abb870c4b75c8a48cf49ae4fa1046d73  xsa344-2.patch
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 0c3ecbb909..cb1ea23ba6 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,45 +4,8 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.14.0
+XEN_VERSION = 4.14.1
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
-XEN_PATCH = \
-	https://xenbits.xenproject.org/xsa/xsa333.patch \
-	https://xenbits.xenproject.org/xsa/xsa334.patch \
-	https://xenbits.xenproject.org/xsa/xsa336.patch \
-	https://xenbits.xenproject.org/xsa/xsa337/xsa337-1.patch \
-	https://xenbits.xenproject.org/xsa/xsa337/xsa337-2.patch \
-	https://xenbits.xenproject.org/xsa/xsa338.patch \
-	https://xenbits.xenproject.org/xsa/xsa339.patch \
-	https://xenbits.xenproject.org/xsa/xsa340.patch \
-	https://xenbits.xenproject.org/xsa/xsa342.patch \
-	https://xenbits.xenproject.org/xsa/xsa343/xsa343-1.patch \
-	https://xenbits.xenproject.org/xsa/xsa343/xsa343-2.patch \
-	https://xenbits.xenproject.org/xsa/xsa343/xsa343-3.patch \
-	https://xenbits.xenproject.org/xsa/xsa344/xsa344-1.patch \
-	https://xenbits.xenproject.org/xsa/xsa344/xsa344-2.patch
-
-# xsa333.patch
-XEN_IGNORE_CVES += CVE-2020-25602
-# xsa334.patch
-XEN_IGNORE_CVES += CVE-2020-25598
-# xsa336.patch
-XEN_IGNORE_CVES += CVE-2020-25604
-# xsa337-1.patch, xsa337-2.patch
-XEN_IGNORE_CVES += CVE-2020-25595
-# xsa338.patch
-XEN_IGNORE_CVES += CVE-2020-25597
-# xsa339.patch
-XEN_IGNORE_CVES += CVE-2020-25596
-# xsa340.patch
-XEN_IGNORE_CVES += CVE-2020-25603
-# xsa342.patch
-XEN_IGNORE_CVES += CVE-2020-25600
-# xsa343-1.patch, xsa-343-2.patch, xsa-343-3.patch
-XEN_IGNORE_CVES += CVE-2020-25599
-# xsa344-1.patch, xsa344-2.patch
-XEN_IGNORE_CVES += CVE-2020-25601
-
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
 XEN_DEPENDENCIES = host-acpica host-python3
