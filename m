From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Feb 2018 23:17:18 +0100
Subject: [Buildroot] [NEXT 06/26] boa: add CPE id
In-Reply-To: <1519697441-54194-7-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519697441-54194-7-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180227231718.090c22ef@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Feb 2018 20:10:21 -0600, Matt Weber wrote:
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/boa/boa.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/boa/boa.mk b/package/boa/boa.mk
> index d8bcaa1..1ded702 100644
> --- a/package/boa/boa.mk
> +++ b/package/boa/boa.mk
> @@ -8,7 +8,7 @@ BOA_VERSION = 0.94.14rc21
>  BOA_SITE = http://www.boa.org
>  BOA_LICENSE = GPL-2.0+
>  BOA_LICENSE_FILES = COPYING
> -
> +BOA_CPE_ID = $(BOE_NAME):$(BOE_NAME):$(BOE_VERSION)

Typo: BOE -> BOA

Also, please keep an empty line before BOA_INSTALL_TARGET_CMDS.

Now, a more general discussion about <pkg>_CPE_ID. Here is the list of
CPE_ID you have added:

BASH_CPE_ID = gnu:$(BASH_NAME):$(BASH_VERSION)
BOA_CPE_ID = $(BOE_NAME):$(BOE_NAME):$(BOE_VERSION)
BOOST_CPE_ID = $(BOOST_NAME):$(BOOST_NAME):$(BOOST_VERSION)
BUSYBOX_CPE_ID = $(BUSYBOX_NAME):$(BUSYBOX_NAME):$(BUSYBOX_VERSION)
BZIP2_CPE_ID=bzip:$(BZIP2_NAME):$(BZIP2_VERSION)
DHCP_CPE_ID = isc:$(DHCP_NAME):$(DHCP_VERSION)
E2FSPROGS_CPE_ID = e2fsprogs_project:$(E2FSPROGS_NAME):$(E2FSPROGS_VERSION)
GDB_CPE_ID = gnu:$(GDB_NAME):$(GDB_VERSION)
GLIBC_CPE_ID = gnu:$(GLIBC_NAME):$(GLIBC_VERSION)
GNUPG_CPE_ID = $(GNUPG_NAME):$(GNUPG_NAME):$(GNUPG_VERSION)
GZIP_CPE_ID = gnu:$(GZIP_NAME):$(GZIP_VERSION)
IPROUTE2_CPE_ID = iproute2_project:$(IPROUTE2_NAME):$(IPROUTE2_VERSION)
LIBGCRYPT_CPE_ID = gnupg:$(LIBGCRYPT_NAME):$(LIBGCRYPT_VERSION)
LIBOPENSSL_CPE_ID = openssl:openssl:$(LIBOPENSSL_VERSION)
LIBZLIB_CPE_ID = gnu:zlib:$(LIBZLIB_VERSION)
LINUX_CPE_ID = $(LINUX_NAME):$(LINUX_NAME)_kernel:$(LINUX_VERSION)
LINUX_HEADERS_CPE_ID = linux:linux_kernel:$(LINUX_HEADERS_VERSION)
OPENSSH_CPE_ID = openbsd:$(OPENSSH_NAME):$(OPENSSH_VERSION)
RSYSLOG_CPE_ID = $(RSYSLOG_NAME):$(RSYSLOG_NAME):$(RSYSLOG_VERSION)
TCPDUMP_CPE_ID = $(TCPDUMP_NAME):$(TCPDUMP_NAME):$(TCPDUMP_VERSION)
UTIL_LINUX_CPE_ID = util-linux_project:$(UTIL_LINUX_NAME):$(UTIL_LINUX_VERSION)
XERCES_CPE_ID = apache:$(XERCES_NAME)-c\+\+:$(XERCES_VERSION)

There is clearly a pattern, no?

Does it make sense to define in the infra:

$(2)_CPE_ID_VENDOR ?= $$($(2)_NAME)
$(2)_CPE_ID_NAME ?= $$($(2)_NAME)
$(2)_CPE_ID_VERSION ?= $$($(2)_VERSION)
$(2)_CPE_ID ?= $($(2)_CPE_ID_VENDOR):$($(2)_CPE_ID_NAME):$($(2)_CPE_ID_VERSION)

With this, in many packages, you can avoid <pkg>_CPE_ID completely. In
a few other packages you'll have to do:

LIBZLIB_CPE_ID_VENDOR = gnu
LIBZLIB_CPE_ID_NAME = zlib

The drawback is obviously that all packages will suddenly have a
<pkg>_CPE_ID value, even if this value may potentially be incorrect
because it hasn't been checked. And this may be a real problem, so
probably your solution is better, I just wanted to point out the
(admittedly limited) duplication.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
