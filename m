From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 6 Jun 2012 12:16:54 +0200
Subject: [Buildroot] [PATCH 2/3] debug: provide an option to copy the
 gdbserver to the target
In-Reply-To: <a3beb0b2963c6c7ba6ebf90643537380b117a2f4.1331765391.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331765391.git.thomas.petazzoni@free-electrons.com>
 <a3beb0b2963c6c7ba6ebf90643537380b117a2f4.1331765391.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LXCk=P8o--c9u8Usq4U6Gz9Rmnr9yzh20c3d-3LJj+g1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Mar 14, 2012 at 11:49 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> When an external toolchain is used, it is very likely that it contains
> a pre-built version of a gdbserver that has the same version as the
> cross-gdb included in the external toolchain. So, we now provide an
> option that allows to copy this pre-built gdbserver to the target.
>
> As the location of the gdbserver in the external toolchain is not
> standardized, we only support the CodeSourcery and Crosstool-NG
> layouts for the moment. Other locations can be added later.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> ?toolchain/gdb/Config.in ? ? ? ? ? ? ? ? ?| ? ?8 ++++++++
> ?toolchain/toolchain-external/ext-tool.mk | ? 14 ++++++++++++++
> ?2 files changed, 22 insertions(+), 0 deletions(-)
>
> diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
> index 8501983..980666b 100644
> --- a/toolchain/gdb/Config.in
> +++ b/toolchain/gdb/Config.in
> @@ -14,10 +14,18 @@ comment "Gdb debugger for the target needs WCHAR support in toolchain"
>
> ?config BR2_PACKAGE_GDB_SERVER
> ? ? ? ?bool "Build gdb server for the Target"
> + ? ? ? depends on !BR2_TOOLCHAIN_EXTERNAL
> ? ? ? ?help
> ? ? ? ? ? ?Build the gdbserver stub to run on the target.
> ? ? ? ? ? ?A full gdb is needed to debug the progam.

With this change, buildroot will no longer present the option of
building gdbserver itself. If you have an external toolchain, it is
now mandatory for it to contain gdbserver (if you want it of course).
I'm not sure if we can always expect this.

In my case, gdb was built by the toolchain, and gdbserver by
buildroot. For me it makes sense to follow your strategy and have
gdbserver built by crosstool-ng instead (and use that as custom
external toolchain).
But maybe there are cases where custom external toolchains do not
contain gdbserver already, and the user would like buildroot to build
it? In that case, we could consider changing the depend line to:
depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM || !BR2_TOOLCHAIN_EXTERNAL

What do you think? Should we cater for this?

Thanks,
Thomas
