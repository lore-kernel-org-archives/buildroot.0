From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 11 Feb 2019 08:13:49 -0600
Subject: [Buildroot] [PATCH] package/sg3_utils: ensure to build against
 librt when needed
In-Reply-To: <20190210135130.15117-1-thomas.petazzoni@bootlin.com>
References: <20190210135130.15117-1-thomas.petazzoni@bootlin.com>
Message-ID: <CANQCQpZY9291LsxiQfxqz5MS_jVSS-5OX3cOzmX_pekhRZsN+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Feb 10, 2019 at 7:51 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> The sg3_utils has provisions to build against librt when needed, but
> forgot to use that mechanism for the sg_turs program. This commit
> fixes that. The patch has been submitted upstream to the sg3_utils
> author.
>
> Fixes:
>
>   http://autobuild.buildroot.net/results/67b890a41d05497820ea4f44e187257dd6818b0b/
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Tested the working case on my build machine wasn't broken with this
update. (don't have test bed to reproduce failure case)

Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>

> ---
>  ...le.am-add-missing-RT_LIB-for-sg_turs.patch | 29 +++++++++++++++++++
>  package/sg3_utils/sg3_utils.mk                |  2 +-
>  2 files changed, 30 insertions(+), 1 deletion(-)
>  create mode 100644 package/sg3_utils/0002-src-Makefile.am-add-missing-RT_LIB-for-sg_turs.patch
>
> diff --git a/package/sg3_utils/0002-src-Makefile.am-add-missing-RT_LIB-for-sg_turs.patch b/package/sg3_utils/0002-src-Makefile.am-add-missing-RT_LIB-for-sg_turs.patch
> new file mode 100644
> index 0000000000..34a4e114ec
> --- /dev/null
> +++ b/package/sg3_utils/0002-src-Makefile.am-add-missing-RT_LIB-for-sg_turs.patch
> @@ -0,0 +1,29 @@
> +From 68b0591cf37760e09e358533bbcecf36eddfceed Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Sun, 10 Feb 2019 14:46:41 +0100
> +Subject: [PATCH] src/Makefile.am: add missing @RT_LIB@ for sg_turs
> +
> +The sg_turs program uses clock_gettime(), so it should link against
> +librt, as provided by @RT_LIB at .
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + src/Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 881cf29..0eba680 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -170,7 +170,7 @@ sg_test_rwbuf_LDADD = ../lib/libsgutils2.la
> +
> + sg_timestamp_LDADD = ../lib/libsgutils2.la
> +
> +-sg_turs_LDADD = ../lib/libsgutils2.la
> ++sg_turs_LDADD = ../lib/libsgutils2.la @RT_LIB@
> +
> + sg_unmap_LDADD = ../lib/libsgutils2.la
> +
> +--
> +2.20.1
> +
> diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
> index b3a79d68ee..79521fd06e 100644
> --- a/package/sg3_utils/sg3_utils.mk
> +++ b/package/sg3_utils/sg3_utils.mk
> @@ -14,7 +14,7 @@ SG3_UTILS_LICENSE := $(SG3_UTILS_LICENSE), GPL-2.0+ (programs), BSD-3-Clause (pr
>  endif
>  SG3_UTILS_LICENSE_FILES = COPYING BSD_LICENSE
>
> -# Patching configure.ac
> +# Patching configure.ac/Makefile.am
>  SG3_UTILS_AUTORECONF = YES
>
>  # install the libsgutils2 library
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 

Matthew Weber | Pr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
