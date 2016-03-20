From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 23:43:51 +0100
Subject: [Buildroot] [PATCH v2 1/1] protobuf: fix detection of
 __atomic_*() built-ins
In-Reply-To: <1455730981-6316-2-git-send-email-casantos@datacom.ind.br>
References: <1455204185-7124-1-git-send-email-casantos@datacom.ind.br>
 <1455730981-6316-1-git-send-email-casantos@datacom.ind.br>
 <1455730981-6316-2-git-send-email-casantos@datacom.ind.br>
Message-ID: <20160320234351.6fc38c1b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Feb 2016 15:43:01 -0200, Carlos Santos wrote:
> - Use the recently introduced BR2_TOOLCHAIN_HAS_ATOMIC boolean.
> 
> - Import an upstream patch to fix error handling when atomic operations
>   are not detected. Without this patch the build fails due to a syntax
>   error instead of showing the proper message.
> 
> - Add a patch to configure.ac to check if libatomic is needed and force
>   linking to it (we will attempt to submit this upstream).
> 
> - Disable build for SPARC64 because it fails due to a missing definition
>   of Atomic64.
> 
> On PowerPC, the __atomic_*() built-ins for 1-byte, 2-byte and 4-byte
> types are available built-in. The corresponding built-ins for 8-byte
> types, however, are implemented via libatomic, so requiring gcc >= 4.8.
> 
> In Buildroot, to simplify things, it was decided to require gcc 4.8 as
> soon as the architectures has at least one __atomic_*() built-in variant
> that requires libatomic.
> 
> Since protobuf most likely only uses the 1, 2 and 4-byte variants, it
> *could* technically build with gcc 4.7. This is probably not a big deal,
> and we can live with requiring gcc 4.8 on PowerPC to build protobuf. The
> same restriction applies to SPARC.
> 
> The build for SPARC64 breaks even using the master branch of protobuf
> due to undefined references to some NoBarrier_Atomic*() functions.
> 
> Signed-off-by: Henrique Marks <henrique.marks@datacom.ind.br>
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  ...GLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch | 61 ++++++++++++++++++++++
>  ...configure.ac-check-if-libatomic-is-needed.patch | 34 ++++++++++++
>  package/protobuf/Config.in                         | 21 +++++++-
>  3 files changed, 115 insertions(+), 1 deletion(-)
>  create mode 100644 package/protobuf/0001-Fix-GOOGLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch
>  create mode 100644 package/protobuf/0002-configure.ac-check-if-libatomic-is-needed.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
