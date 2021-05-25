From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 May 2021 22:34:32 +0200
Subject: [Buildroot] [PATCHv3 02/15] core: introduce
 BR2_ENABLE_RUNTIME_DEBUG
In-Reply-To: <20210525122750.5022-3-patrickdepinguin@gmail.com>
References: <20210525122750.5022-1-patrickdepinguin@gmail.com>
 <20210525122750.5022-3-patrickdepinguin@gmail.com>
Message-ID: <5360781d-d225-68f6-e419-6744b8fa9c16@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/05/2021 14:27, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Some packages have optional runtime assertions, extra traces, or other
> elements that can help in debugging problems. However, such runtime elements
> can negatively influence performance.
> 
> In a test program performing 100K gRPC calls from a client to a local server
> and receiving the returned response, we see following execution time:
> 
>     - runtime debug enabled: 1065 seconds
>     - runtime debug disabled:  48 seconds
> 
> This is more than a factor 20 (!) difference. Analysis shows that the
> problem mostly stems from libabseil-cpp (a dependency of gRPC) which enables
> mutex deadlock analysis when the preprocessor flag 'NDEBUG' is not set,
> which adds a 'backtrace()' call on every lock/unlock.  Potentially worse,
> when libunwind is enabled and linked with the test program, 'backtrace()' is
> not provided by glibc but by libunwind itself.
> 
> For production systems, users expect good performance out-of-the-box. In the
> example above, the difference is huge and unless explicitly tested and
> analyzed, users may not realize that the performance could be much better.
> 
> Address this problem by introducing a new option BR2_ENABLE_RUNTIME_DEBUG,
> which can be used by packages or package infrastructures to set the
> necessary flags.
> 
> Note that BR2_ENABLE_RUNTIME_DEBUG is orthogonal to BR2_ENABLE_DEBUG: the
> former changes runtime behavior, while the latter is only expected to add
> debug symbols to the build. Today, the cmake build system does introduce a
> runtime impact when BR2_ENABLE_DEBUG is set, but that will be rectified in a
> subsequent commit.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  Config.in | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Config.in b/Config.in
> index c65e34bd5e..a008425688 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -412,6 +412,19 @@ config BR2_DEBUG_3
>  endchoice
>  endif
>  
> +config BR2_ENABLE_RUNTIME_DEBUG

 I'm still not convinced that RUNTIME_DEBUG is the best name, but I can't think
of anything better.

> +	bool "build packages with runtime debugging info"

 It's not debugging info (that is actually covered by BR2_ENABLE_DEBUG) - it's
debugging support. Or maybe just "debugging".

 Nitpick, of course, so:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> +	help
> +	  Some packages may have runtime assertions, extra traces, and
> +	  similar runtime elements that can help debugging. However,
> +	  these elements may negatively influence performance so should
> +	  normally not be enabled on production systems.
> +
> +	  Enable this option to enable such runtime debugging.
> +
> +	  Note: disabling this option is not a guarantee that all
> +	  packages effectively removed these runtime debugging elements.
> +
>  config BR2_STRIP_strip
>  	bool "strip target binaries"
>  	default y
> 
