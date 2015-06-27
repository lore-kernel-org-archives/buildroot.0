From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Jun 2015 12:28:04 +0200
Subject: [Buildroot] [PATCH 2/4] toolchain: allow for stupid toolchains
In-Reply-To: <1435340002-20396-3-git-send-email-guido@vanguardiasur.com.ar>
References: <1435340002-20396-1-git-send-email-guido@vanguardiasur.com.ar>
 <1435340002-20396-3-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20150627102804.GC3565@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guido, All,

On 2015-06-26 14:33 -0300, Guido Mart?nez spake thusly:
> check_arm_abi builds a test C file to check that the toolchain is
> working correctly, with the output redirected to /dev/null.
> 
> However, some toolchains (OSELAS 2014.12.0, for instance) foolishly
> append ".gdb" to the output filename for an intermediate file, causing
> an attempt to write to /dev/null.gdb, which obviously fails.
> 
> Fix this by adding changing the output to a temporary file, which is
> later removed along with any other "suffixed" files.
> 
> Suggested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  toolchain/helpers.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 30eb065..0dc1864 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -308,12 +308,14 @@ check_arm_abi = \
>  		echo "External toolchain uses the unsuported OABI" ; \
>  		exit 1 ; \
>  	fi ; \
> -	if ! echo 'int main(void) {}' | $${__CROSS_CC} -x c -o /dev/null - ; then \
> +	if ! echo 'int main(void) {}' | $${__CROSS_CC} -x c -o $(BUILD_DIR)/.br-toolchain-test.tmp - ; then \
> +		rm -f $(BUILD_DIR)/.br-toolchain-test.tmp*; \
>  		abistr_$(BR2_ARM_EABI)='EABI'; \
>  		abistr_$(BR2_ARM_EABIHF)='EABIhf'; \
>  		echo "Incorrect ABI setting: $${abistr_y} selected, but toolchain is incompatible"; \
>  		exit 1 ; \
> -	fi
> +	fi ; \
> +	rm -f $(BUILD_DIR)/.br-toolchain-test.tmp*
>  
>  #
>  # Check that the external toolchain supports C++
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
