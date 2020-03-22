From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 22:45:22 +0100
Subject: [Buildroot] [PATCHv2] package/libostree: enable introspection
In-Reply-To: <20200322092854.20421-1-yann.morin.1998@free.fr>
References: <20200322092854.20421-1-yann.morin.1998@free.fr>
Message-ID: <20200322224522.6d373638@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Mar 2020 10:28:54 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> libostree build fails when introspection is enabled:
> 
>     ./.libs/libostree-1.so: error adding symbols: File in wrong format
>     collect2: error: ld returned 1 exit status
>     src/libostree/ostree-repo-deprecated.h:28: Warning: OSTree: symbol='G_GNUC_DEPRECATED_FOR': Skipping foreign symbol from namespace Gio
>     linking of temporary binary failed: Command '['/bin/bash', './libtool', '--mode=link', '--tag=CC', '--silent', 'gcc', [...] ]' returned non-zero exit status 1.
> 
> This is because the build system fir libiostree hard-codes CC=gcc when
> calling the GOI scanner, which obviously causes build failures when in
> cross-compilation.
> 
> In d264351cfcca (package/libostree: disable introspection), we just
> papered over the problem by forcibly disabling introspection altogether.
> 
> Turns out the fix is realatively simple: we can just override the
> INTROSPECTION_SCANNER_ENV variable when calling make, which will revert
> to the behaviour we expect: to use the cross-compiler in the GOI scanner
> wrapper.
> 
> Thanks to Adam for pointing out at INTROSPECTION_SCANNER_ENV in the
> first place. :-)
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
> Cc: Adam Duskett <aduskett@gmail.com>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> ---
> Note: this is an alternate proposal to replace a previous series by
> Adam:
>     https://patchwork.ozlabs.org/project/buildroot/list/?series=165777
> ---
>  package/libostree/libostree.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
