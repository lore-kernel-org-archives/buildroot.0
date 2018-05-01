From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 May 2018 14:31:04 +0200
Subject: [Buildroot] [PATCH v3] core/pkg-generic: only save latest
 package list
In-Reply-To: <20180501122841.13818-1-john@metanate.com>
References: <20180501132629.4a4831bb.john@metanate.com>
 <20180501122841.13818-1-john@metanate.com>
Message-ID: <20180501123104.GB29082@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

John, All,

On 2018-05-01 13:28 +0100, John Keeping spake thusly:
> When rebuilding a package, simply appending the package's file list to
> the global list means that the package list grows for every rebuild, as
> does the time taken to check for files installed by multiple packages.
> Furthermore, we get false positives where a file is reported as being
> installed by multiple copies of the same package.
> 
> With this approach we may end up with orphaned files in the target
> filesystem if a package that has been updated and rebuilt no longer
> installs the same set of files, but we know that only a clean build will
> produce reliable results.  In fact it may be helpful to identify these
> orphaned files as evidence that the build is not clean.
> 
> Signed-off-by: John Keeping <john@metanate.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes in v3:
> - Use touch instead of redirect to avoid truncating the file
> 
>  package/pkg-generic.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index bd47ca1964..87c856407d 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -63,6 +63,8 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
>  # $(2): base directory to search in
>  # $(3): suffix of file  (optional)
>  define step_pkg_size_inner
> +	@touch $(BUILD_DIR)/packages-file-list$(3).txt
> +	$(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt
>  	cd $(2); \
>  	find . \( -type f -o -type l \) \
>  		-newer $($(PKG)_DIR)/.stamp_built \
> -- 
> 2.17.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
