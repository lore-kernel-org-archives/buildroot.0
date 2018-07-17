From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 17 Jul 2018 13:18:14 +0200 (CEST)
Subject: [Buildroot] [PATCH] rust: Modify Rust to be usable as host-tool
 only
In-Reply-To: <20180717042953.23648-1-sam.voss@gmail.com>
Message-ID: <2046565940.1039371796.1531826294693.JavaMail.root@zimbra32-e6.priv.proxad.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

> From: Sam Voss <sam.voss@gmail.com>
> 
> Modify host-rust virtual package to default to host-rust-bin when no
> other selection has been made, as long as the host supports rust. This
> allows host only tools to still use rust when the target architecture
> does not support it.
> 
> Add target-specific variable which is used to differentiate host and
> target arch requirements (BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS).
> 
> A target package shall depend on this variable where a host package will 
> use the previously defined BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS. The new 
> "target" version is selectable for the same set of architectures as
> before, but now depends on the host variant.
> 
> Signed-off-by: Sam Voss <sam.voss@gmail.com>

IIUC, the goal of this patch is to be able to build host packages which need 
rust, so host-rust-bin is set as default to avoid errors on empty variables
and only the compiler and the host standard library are installed (not the
target standard library). Only x86_64/x86 support is required, right?

I find it confusing that BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS and 
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS are quite similar and that in 
the end BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS is only used to install
the target standard library. Is that meant to cover the case where the host
and the target are the same (x86_64) or the librsvg-related issue?

Would this be solved by introducing a virtual package for the target 
standard library as previously discussed [1]?

[1] http://patchwork.ozlabs.org/comment/1830134/ 

Regards,

--
ELB
