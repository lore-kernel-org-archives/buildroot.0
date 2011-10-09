From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 9 Oct 2011 23:42:36 +0200
Subject: [Buildroot] [PATCH 8/9] external-toolchain: Slightly optimize
	toolchain extraction
In-Reply-To: <55714318d85fc16e3fa0e34144df2ccffe24c1a2.1318182187.git.thomas.petazzoni@free-electrons.com>
References: <cover.1318182187.git.thomas.petazzoni@free-electrons.com>
 <55714318d85fc16e3fa0e34144df2ccffe24c1a2.1318182187.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201110092342.36933.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 09 October 2011 19:44:31 Thomas Petazzoni wrote:
> Some CodeSourcery toolchains contain a huge number of locales that are
> not useful, even though they account for 70-80% of the total toolchain
> size. By skipping the extraction of those useless locales, we make the
> toolchain extraction process slightly faster, and also make the output
> directory size a lot smaller (host/opt/ is 213 MB instead of 1.5 GB
> with a 2010.09 ARM CodeSourcery toolchain).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Rewviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

> ---
>  toolchain/toolchain-external/ext-tool.mk |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
> index 6e34e05..8287916 100644
> --- a/toolchain/toolchain-external/ext-tool.mk
> +++ b/toolchain/toolchain-external/ext-tool.mk
> @@ -250,7 +250,8 @@ $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE):
>  
>  $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE)
>  	mkdir -p $(@D)
> -	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $^ | $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
> +	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $^ | \
> +		$(TAR) $(TAR_STRIP_COMPONENTS)=1 --exclude='usr/lib/locale/*' -C $(@D) $(TAR_OPTIONS) -
>  	$(Q)touch $@
>  endif
>  
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
