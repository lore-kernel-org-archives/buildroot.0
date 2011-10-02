From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 3 Oct 2011 00:40:23 +0200
Subject: [Buildroot] [PATCH 8/9] external-toolchain: Slightly optimize
	toolchain extraction
In-Reply-To: <7ef0a28c84bb87a006b2f91419e91f2747835826.1317583191.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317583191.git.thomas.petazzoni@free-electrons.com>
 <7ef0a28c84bb87a006b2f91419e91f2747835826.1317583191.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201110030040.23245.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 02 October 2011 21:20:16 Thomas Petazzoni wrote:
> Some CodeSourcery toolchains contain a huge number of locales that are
> now useful, even though they account for 70-80% of the total toolchain
  ^^^
You meant 'not usefull', maybe?

> size. By skipping the extraction of those useless locales, we make the
> toolchain extraction process slightly faster, and also make the output
> directory size a lot smaller (host/opt/ is 213 MB instead of 1.5 GB
> with a 2010.09 ARM CodeSourcery toolchain).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-external/ext-tool.mk |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
> index 6e34e05..8ea2813 100644
> --- a/toolchain/toolchain-external/ext-tool.mk
> +++ b/toolchain/toolchain-external/ext-tool.mk
> @@ -250,7 +250,8 @@ $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE):
>  
>  $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE)
>  	mkdir -p $(@D)
> -	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $^ | $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
> +	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $^ | \
> +		$(TAR) $(TAR_STRIP_COMPONENTS)=1 --exclude=usr/lib/locale/* -C $(@D) $(TAR_OPTIONS) -

You should quote the asterisk, we do not want it to expand in the shell,
but in tar's pattern expansion.

>  	$(Q)touch $@
>  endif
>  

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
