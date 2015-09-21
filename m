From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 21 Sep 2015 19:32:40 +0300
Subject: [Buildroot] [PATCH] sysvinit: arm64 build fix
In-Reply-To: <875368a848cb37f12c0c13638c987ce0f7783700.1442850883.git.jpinto@synopsys.com>
References: <875368a848cb37f12c0c13638c987ce0f7783700.1442850883.git.jpinto@synopsys.com>
Message-ID: <20150921163240.GB2242@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joao,

[Resend with the correct list address]

On Mon, Sep 21, 2015 at 05:10:15PM +0100, Joao Pinto wrote:
> sysvinit was not able to be built for arm64 architectures.
> The package patch was changed according to the suggestion of 
> Thomas Petazzoni.
> 
> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
> ---
>  package/sysvinit/0001-fix-libcrypt-test.patch | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sysvinit/0001-fix-libcrypt-test.patch b/package/sysvinit/0001-fix-libcrypt-test.patch
> index 207270d..3724110 100644
> --- a/package/sysvinit/0001-fix-libcrypt-test.patch
> +++ b/package/sysvinit/0001-fix-libcrypt-test.patch
> @@ -1,17 +1,21 @@
>  Make the libcrypt test somewhat cross-compilation compliant
>  
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Signed-off-by: Joao Pinto <jpinto@synopsys.com>
>  
>  Index: b/src/Makefile
>  ===================================================================
>  --- a/src/Makefile
>  +++ b/src/Makefile
> -@@ -78,7 +78,7 @@
> +@@ -78,8 +78,9 @@ else
>   endif
>   
>   # Additional libs for GNU libc.
>  -ifneq ($(wildcard /usr/lib*/libcrypt.a),)
> -+ifneq ($(wildcard $(SYSROOT)/usr/lib*/libcrypt.a),)
> -   SULOGINLIBS	+= -lcrypt
> +-  SULOGINLIBS	+= -lcrypt
> ++HAS_LIBCRYPT=$(shell f=`mktemp` && echo 'int main(void) {}' | $(CC) -o $$f -xc - -lcrypt >/dev/null 2>&1 && echo yes && rm -f $$f)

The last '&&' causes the 'rm' command to delete the temporary file only when 
the test succeeds. Should be ';' instead, I think.

baruch

> ++ifeq ($(HAS_LIBCRYPT),yes)
> ++  SULOGINLIBS += -lcrypt
>   endif
>   
> + all:		$(BIN) $(SBIN) $(USRBIN)

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
