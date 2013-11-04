From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 04 Nov 2013 22:26:59 +0100
Subject: [Buildroot] [PATCH] Config.in files: add missing dependencies
 to toolchain option comments
In-Reply-To: <8d0042dacf31b1e0dfa1.1383551780@argentina>
References: <8d0042dacf31b1e0dfa1.1383551780@argentina>
Message-ID: <52781123.9020601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/11/13 08:56, Thomas De Schampheleire wrote:
> When a package A depends on B and toolchain option C, then the comment that
> is given when C is not fulfilled should also depend on B. For example:
>
> config BR2_PACKAGE_A
> 	depends on BR2_PACKAGE_B
> 	depends on BR2_LARGEFILE
> 	depends on BR2_WCHAR
>
> comment "A needs a toolchain w/ largefile, wchar"
> 	depends on !BR2_LARGEFILE || !BR2_WCHAR
>
> This comment should actually be:
>
> comment "A needs a toolchain w/ largefile, wchar"
> 	depends on BR2_PACKAGE_B
> 	depends on !BR2_LARGEFILE || !BR2_WCHAR

  Actually, _most_ of the fixes you make here are for architecture 
options, not package dependencies. Not that that matters much... except 
that I don't really agree with making this change for package dependencies.

  For package dependencies, I much prefer to if...endif construct because 
this draws the attention to the fact that the whole Config.in is disabled 
when the dependent package isn't selected. But I guess it's mostly a 
matter of taste anyway. Hm, maybe even moving all the arch and package 
dependencies to a global if...endif would be a good idea.

>
> Otherwise, the comment would be visible even though the other dependencies
> are not met.
>
> This patch adds such missing dependencies, and changes existing such
> dependencies from
>    depends on BR2_BASE_DEP && !BR2_TOOLCHAIN_USES_GLIBC
> to
>    depends on BR2_BASE_DEP
>    depends on !BR2_TOOLCHAIN_USES_GLIBC
> so that (positive) base dependencies are separate from the (negative)
> toolchain dependencies. This strategy makes it easier to write such comments
> (because one can simply copy the base dependency from the actual package
> config option), but also avoids complex and long boolean expressions.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

  Even though I have a bunch of comments, the patch is good as it is (and 
also a bit fragile because of the large number of changes), so:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (untested)

>
> ---
> Note: this patch is written on top of my earlier patch:
> "Config.in files: add/update comments on (e)glibc dependencies"
> which is in ThomasP's for-peter branch.
>
>
> While browsing through the Config.in files, I noticed following problems
> that I am planning to fix in later patches:
> - missing comments for some dependencies on toolchain options
> - unification of dependency on Linux kernel
> - unification of dependency on udev /dev management
> - unification of dependency on python, libgtk2, xorg7 (with comment or not)
> - unification of dependency on locale support (and update manual)
> - spaces instead of tabs on some lines, and trailing whitespace

  Nice!

[snip]
> diff --git a/package/alsamixergui/Config.in b/package/alsamixergui/Config.in
> --- a/package/alsamixergui/Config.in
> +++ b/package/alsamixergui/Config.in
> @@ -14,4 +14,5 @@ config BR2_PACKAGE_ALSAMIXERGUI
>   	  http://www.iua.upf.es/~mdeboer/projects/alsamixergui/
>
>   comment "alsamixergui needs a toolchain w/ C++, threads"
> -	depends on (!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS) && BR2_PACKAGE_XORG7
> +	depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS

  I think there should be a 'depends on BR2_PACKAGE_XORG7' around all of 
the X libraries and applications. On the other hand, there are a few that 
don't actually depend on X (liberation fonts, xkeyboard-config), and 
there may be more in the future that can run on either X or wayland...

[snip]
> diff --git a/package/flex/Config.in b/package/flex/Config.in
> --- a/package/flex/Config.in
> +++ b/package/flex/Config.in
> @@ -19,4 +19,5 @@ config BR2_PACKAGE_FLEX_BINARY
>   	  Install the flex binary tool in the target filesystem.
>
>   comment "flex binary needs a toolchain w/ wchar"
> +	depends on BR2_USE_MMU && BR2_PACKAGE_FLEX

  This one should _definitely_ use an if...endif construct.

>   	depends on !BR2_USE_WCHAR
[snip]
> diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
> --- a/package/gstreamer/gst-ffmpeg/Config.in
> +++ b/package/gstreamer/gst-ffmpeg/Config.in
> @@ -14,4 +14,5 @@ config BR2_PACKAGE_GST_FFMPEG
>   	  http://gstreamer.freedesktop.org/
>
>   comment "gst-ffmpeg needs a toolchain w/ largefile, IPv6"
> +	depends on BR2_PACKAGE_GSTREAMER
>   	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)

  There are a few more in the gstreamer/ directory that could be 
rewritten. But here as well, I would prefer an if...endif in 
gstreamer/Config.in.

[snip]
> diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
> --- a/package/zmqpp/Config.in
> +++ b/package/zmqpp/Config.in
> @@ -16,6 +16,7 @@ config BR2_PACKAGE_ZMQPP
>   	  http://github.com/benjamg/zmqpp
>
>   comment "zmqpp needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
> +	depends on !BR2_avr32
>   	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
>   		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
>
> @@ -30,4 +31,5 @@ config BR2_PACKAGE_ZMQPP_CLIENT
>   	  used to listen or send to zeromq sockets.
>
>   comment "zmqpp client needs a toolchain w/ threads"
> -	depends on BR2_PACKAGE_ZMQPP && !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_PACKAGE_ZMQPP
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

  This one should also use an if...endif.


  Regards,
  Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
