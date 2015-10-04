From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 4 Oct 2015 19:15:10 +0100
Subject: [Buildroot] [PATCH v5 2/2] Patch to assembler to strip LOCK
 prefix.
In-Reply-To: <1443786554.3328.21.camel@intel.com>
References: <1443786554.3328.21.camel@intel.com>
Message-ID: <56116CAE.3070100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Ray,

On 02-10-15 12:49, Kinsella, Ray wrote:
> The lock prefix is usually stripped by passing to the compiler
> -Wa,momit-lock-prefix=yes via EXTRA_CFLAGS. However I couldn't find
> a way to get buildroot to pass CFLAGS/EXTRA_CFLAGS around.
> 
> I tried using BR2_TARGET_OPTIMIZATION, and creating a new processor type
> but the flag kept stripping it out. I found the most reliable way to 
> achieve the behavior was to make stripping the LOCK prefix the assembler's 
> default behavior, hence the patch

 We now have a toolchain wrapper both for internal and external toolchains. This
will allow you to reliably pass options to the compiler. So we'd preferably use
that approach.

 Also, we think it's worthwhile to add a new subarchitecture for the Quark in
arch/Config.in.x86. This should set the arch and tune options to i586, but the
toolchain wrapper can then carry an option that adds -Wa,-momit-lock-prefix=yes.
This also fixes the problem for external toolchains.

 So the proposal is that you create a first patch that adds BR2_x86_quark and
adds -Wa,-momit-lock-prefix=yes, and then a second patch that adds the Galileo2
defconfig.

 I have now marked both patches as Changes Requested in out patch tracking
system, so please resubmit a new version that fixes the above comments,
otherwise we'll forget about your contribution.


 Regards,
 Arnout


> Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> ---
>  .../galileo/patches/binutils/2.25/default-lock-prefix.patch   | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 board/intel/galileo/patches/binutils/2.25/default-lock-prefix.patch
> 
> diff --git a/board/intel/galileo/patches/binutils/2.25/default-lock-prefix.patch b/board/intel/galileo/patches/binutils/2.25/default-lock-prefix.patch
> new file mode 100644
> index 0000000..7814ae4
> --- /dev/null
> +++ b/board/intel/galileo/patches/binutils/2.25/default-lock-prefix.patch
> @@ -0,0 +1,11 @@
> +--- a/gas/config/tc-i386.orig	2015-07-24 15:54:51.359080778 +0100
> ++++ b/gas/config/tc-i386.c	2015-07-24 15:54:59.692192247 +0100
> +@@ -545,7 +545,7 @@ static int allow_index_reg = 0;
> + 
> + /* 1 if the assembler should ignore LOCK prefix, even if it was
> +    specified explicitly.  */
> +-static int omit_lock_prefix = 0;
> ++static int omit_lock_prefix = 1;
> + 
> + static enum check_kind
> +   {
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
