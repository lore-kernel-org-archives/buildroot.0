From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Sat, 30 May 2020 20:16:18 +0200
Subject: [Buildroot] [PATCH 1/5] boot/optee-os: bump to version 3.9.0
In-Reply-To: <5f5cb13c-834c-e1bf-93a0-710b9204686c@gmail.com>
References: <20200529142742.9381-1-etienne.carriere@linaro.org>
 <5f5cb13c-834c-e1bf-93a0-710b9204686c@gmail.com>
Message-ID: <CAN5uoS8viTt=2QxiDeD4qWUQo4FKphi0p5-YX98J98FUfciPsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Sat, 30 May 2020 at 19:21, Romain Naour <romain.naour@gmail.com> wrote:
>
> Hi Etienne, All,
>
> Le 29/05/2020 ? 16:27, Etienne Carriere a ?crit :
> > Bump OP-TEE OS package version to OP-TEE release 3.9.0.
> >
> > Update patch on pydrypto/pycryptodome to match 3.9.0.
> > Add patch on CFG_OPTEE_REVISION_MINOR that was not updated in release
> > 3.9.0 and fixed only few commits above.
>
> I runtime tested this version using the qemu_arm_vexpress_tz_defconfig.
>
> I discovered an issue with optee-benchmark with gcc10 (not related with this
> series).
> See
> http://patchwork.ozlabs.org/project/buildroot/patch/20200530171428.562778-1-romain.naour at gmail.com/

Thanks for the report and the fix. I'll post them to the
optee_benchmark forum so the issue gets fixed in the package.

Best regards,
Etienne

>
> Otherwise:
> Tested-by: Romain Naour <romain.naour@gmail.com>
>
> Best regards,
> Romain
>
> >
> > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> > ---
> >  ...ub.py-use-Cryptodome-module-instead-.patch | 34 ++++++++++
> >  ...o_pub_c.py-sign.py-use-pycryptodomex.patch | 64 -------------------
> >  ...nfig.mk-fix-CFG_OPTEE_REVISION_MINOR.patch | 32 ++++++++++
> >  boot/optee-os/Config.in                       |  4 +-
> >  boot/optee-os/optee-os.hash                   |  4 +-
> >  5 files changed, 70 insertions(+), 68 deletions(-)
> >  create mode 100644 boot/optee-os/0001-scripts-pem_to_pub.py-use-Cryptodome-module-instead-.patch
> >  delete mode 100644 boot/optee-os/0001-scripts-pem_to_pub_c.py-sign.py-use-pycryptodomex.patch
> >  create mode 100644 boot/optee-os/0002-config.mk-fix-CFG_OPTEE_REVISION_MINOR.patch
> >
> > diff --git a/boot/optee-os/0001-scripts-pem_to_pub.py-use-Cryptodome-module-instead-.patch b/boot/optee-os/0001-scripts-pem_to_pub.py-use-Cryptodome-module-instead-.patch
> > new file mode 100644
> > index 0000000000..9c35c038a8
> > --- /dev/null
> > +++ b/boot/optee-os/0001-scripts-pem_to_pub.py-use-Cryptodome-module-instead-.patch
> > @@ -0,0 +1,34 @@
> > +From 04a8def18caccad27292ba97dc8ea8b3eb3a6afd Mon Sep 17 00:00:00 2001
> > +From: Etienne Carriere <etienne.carriere@linaro.org>
> > +Date: Tue, 26 May 2020 11:10:45 +0200
> > +Subject: [PATCH 2/2] scripts/pem_to_pub.py: use Cryptodome module instead of
> > + Crypto
> > +
> > +Upgrade scripts/pem_to_pub.py to use module Cryptodome instead of
> > +module Crypto for consistency with the other helper Python scripts
> > +of OP-TEE OS package.
> > +
> > +Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> > +Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
> > +---
> > + scripts/pem_to_pub_c.py | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/scripts/pem_to_pub_c.py b/scripts/pem_to_pub_c.py
> > +index 3a896a393..d3f0e5006 100755
> > +--- a/scripts/pem_to_pub_c.py
> > ++++ b/scripts/pem_to_pub_c.py
> > +@@ -21,8 +21,8 @@ def get_args():
> > +
> > + def main():
> > +     import array
> > +-    from Crypto.PublicKey import RSA
> > +-    from Crypto.Util.number import long_to_bytes
> > ++    from Cryptodome.PublicKey import RSA
> > ++    from Cryptodome.Util.number import long_to_bytes
> > +
> > +     args = get_args()
> > +
> > +--
> > +2.17.1
> > +
> > diff --git a/boot/optee-os/0001-scripts-pem_to_pub_c.py-sign.py-use-pycryptodomex.patch b/boot/optee-os/0001-scripts-pem_to_pub_c.py-sign.py-use-pycryptodomex.patch
> > deleted file mode 100644
> > index 1ce960e0e3..0000000000
> > --- a/boot/optee-os/0001-scripts-pem_to_pub_c.py-sign.py-use-pycryptodomex.patch
> > +++ /dev/null
> > @@ -1,64 +0,0 @@
> > -From 06e71feaeb08349abe56b50c3dfb08a8341cf55f Mon Sep 17 00:00:00 2001
> > -From: Romain Naour <romain.naour@gmail.com>
> > -Date: Sun, 26 Apr 2020 21:55:55 +0200
> > -Subject: [PATCH] scripts/pem_to_pub_c.py/sign.py: use pycryptodomex
> > -
> > -These scripts still use pycrypto.
> > -
> > -From [1]:
> > -"PyCryptodome is a fork of PyCrypto, which is not maintained any more
> > -(the last release dates back to 2013 [2]). It exposes almost the same
> > -API, but there are a few incompatibilities [3]."
> > -
> > -Don't use upstream commit since it also switches from the algorithm
> > -TEE_ALG_RSASSA_PKCS1_V1_5_SHA256 to TEE_ALG_RSASSA_PKCS1_PSS_MGF1_SHA256
> > -when replacing pycrypto to pycryptodomex [4].
> > -
> > -[1] https://github.com/OP-TEE/optee_os/commit/90ad2450436fdd9fc0d28a3f92f3fbcfd89a38f0
> > -[2] https://pypi.org/project/pycrypto/#history
> > -[3] https://pycryptodome.readthedocs.io/en/latest/src/vs_pycrypto.html
> > -[4] https://github.com/OP-TEE/optee_os/commit/ababd72d2fd76cb2ded8e202b49db28d6545f6eb
> > -
> > -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> > ----
> > - scripts/pem_to_pub_c.py | 4 ++--
> > - scripts/sign.py         | 8 ++++----
> > - 2 files changed, 6 insertions(+), 6 deletions(-)
> > -
> > -diff --git a/scripts/pem_to_pub_c.py b/scripts/pem_to_pub_c.py
> > -index 3a896a39..d3f0e500 100755
> > ---- a/scripts/pem_to_pub_c.py
> > -+++ b/scripts/pem_to_pub_c.py
> > -@@ -21,8 +21,8 @@ def get_args():
> > -
> > - def main():
> > -     import array
> > --    from Crypto.PublicKey import RSA
> > --    from Crypto.Util.number import long_to_bytes
> > -+    from Cryptodome.PublicKey import RSA
> > -+    from Cryptodome.Util.number import long_to_bytes
> > -
> > -     args = get_args()
> > -
> > -diff --git a/scripts/sign.py b/scripts/sign.py
> > -index 2939c591..80ce2e9f 100755
> > ---- a/scripts/sign.py
> > -+++ b/scripts/sign.py
> > -@@ -121,10 +121,10 @@ def get_args(logger):
> > -
> > -
> > - def main():
> > --    from Crypto.Signature import PKCS1_v1_5
> > --    from Crypto.Hash import SHA256
> > --    from Crypto.PublicKey import RSA
> > --    from Crypto.Util.number import ceil_div
> > -+    from Cryptodome.Signature import PKCS1_v1_5
> > -+    from Cryptodome.Hash import SHA256
> > -+    from Cryptodome.PublicKey import RSA
> > -+    from Cryptodome.Util.number import ceil_div
> > -     import base64
> > -     import logging
> > -     import os
> > ---
> > -2.25.3
> > -
> > diff --git a/boot/optee-os/0002-config.mk-fix-CFG_OPTEE_REVISION_MINOR.patch b/boot/optee-os/0002-config.mk-fix-CFG_OPTEE_REVISION_MINOR.patch
> > new file mode 100644
> > index 0000000000..26652d3bc4
> > --- /dev/null
> > +++ b/boot/optee-os/0002-config.mk-fix-CFG_OPTEE_REVISION_MINOR.patch
> > @@ -0,0 +1,32 @@
> > +From c5f5e6bf6644a536a0d53bfb9f5c5419150035dd Mon Sep 17 00:00:00 2001
> > +From: Jens Wiklander <jens.wiklander@linaro.org>
> > +Date: Mon, 25 May 2020 12:20:08 +0200
> > +Subject: [PATCH 1/2] config.mk: fix CFG_OPTEE_REVISION_MINOR
> > +
> > +The current release is 3.9.0, change the revision to match.
> > +
> > +Fixes: af141c61fe7a ("Update CHANGELOG for 3.9.0")
> > +Reviewed-by: Joakim Bech <joakim.bech@linaro.org>
> > +Reported-by: Etienne Carriere <etienne.carriere@linaro.org>
> > +Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > +Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> > +---
> > + mk/config.mk | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/mk/config.mk b/mk/config.mk
> > +index c00a14618..bc49f83d8 100644
> > +--- a/mk/config.mk
> > ++++ b/mk/config.mk
> > +@@ -116,7 +116,7 @@ endif
> > + # with limited depth not including any tag, so there is really no guarantee
> > + # that TEE_IMPL_VERSION contains the major and minor revision numbers.
> > + CFG_OPTEE_REVISION_MAJOR ?= 3
> > +-CFG_OPTEE_REVISION_MINOR ?= 8
> > ++CFG_OPTEE_REVISION_MINOR ?= 9
> > +
> > + # Trusted OS implementation manufacturer name
> > + CFG_TEE_MANUFACTURER ?= LINARO
> > +--
> > +2.17.1
> > +
> > diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
> > index 669bbda924..5a786833ef 100644
> > --- a/boot/optee-os/Config.in
> > +++ b/boot/optee-os/Config.in
> > @@ -18,7 +18,7 @@ choice
> >         Select the version of OP-TEE OS you want to use
> >
> >  config BR2_TARGET_OPTEE_OS_LATEST
> > -     bool "3.7.0"
> > +     bool "3.9.0"
> >       help
> >         Use the latest release tag from the OP-TEE OS official Git
> >         repository.
> > @@ -50,7 +50,7 @@ endif
> >
> >  config BR2_TARGET_OPTEE_OS_VERSION
> >       string
> > -     default "3.7.0"         if BR2_TARGET_OPTEE_OS_LATEST
> > +     default "3.9.0"         if BR2_TARGET_OPTEE_OS_LATEST
> >       default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
> >                               if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
> >
> > diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
> > index dc0fbecce7..f38ebc569f 100644
> > --- a/boot/optee-os/optee-os.hash
> > +++ b/boot/optee-os/optee-os.hash
> > @@ -1,4 +1,4 @@
> > -# From https://github.com/OP-TEE/optee_os/archive/3.7.0.tar.gz
> > -sha256 ff378f22b8e7dacf933a2d34eb5c1bdcafe74bdda692e4dbc2969301f6a81d43  optee-os-3.7.0.tar.gz
> > +# From https://github.com/OP-TEE/optee_os/archive/3.9.0.tar.gz
> > +sha256 ac6f145ebde715d4d7a1d5277f4e08a06b660e1c0237c926a274d86cd90ef4c5  optee-os-3.9.0.tar.gz
> >  # Locally computed
> >  sha256 1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE
> >
>
