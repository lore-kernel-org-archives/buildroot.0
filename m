From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Apr 2014 23:32:56 +0200
Subject: [Buildroot] [PATCH 05/11] dialog: Patch incorrect use of
 toupper()
In-Reply-To: <1396558881-29631-5-git-send-email-paul@crapouillou.net>
References: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
 <1396558881-29631-5-git-send-email-paul@crapouillou.net>
Message-ID: <20140403213256.GE17328@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul, All,

On 2014-04-03 23:01 +0200, Paul Cercueil spake thusly:
> On some platforms (e.g. MIPS), the "char" type is signed by default.
> The problem is that toupper() takes an int as argument: a signed
> char then gets sign-extended to 32bit, which causes an assertion
> failure as toupper() verifies that its argument fits in 8 bits.

I could not vefrify the assertion that MIPS has signed chars.

However, this change is still corect, since it makes it explicit that we
want an unsigned char.

> Signed-Off-By: Paul Cercueil <paul@crapouillou.net>
> Acked-By: Maarten ter Huurne <maarten@treewalker.org>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/dialog/dialog-toupper.patch | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 package/dialog/dialog-toupper.patch
> 
> diff --git a/package/dialog/dialog-toupper.patch b/package/dialog/dialog-toupper.patch
> new file mode 100644
> index 0000000..3fe0e19
> --- /dev/null
> +++ b/package/dialog/dialog-toupper.patch
> @@ -0,0 +1,13 @@
> +diff --git a/dlg_keys.h b/dlg_keys.h
> +index 6a96c0f..b7b42d9 100644
> +--- a/dlg_keys.h
> ++++ b/dlg_keys.h
> +@@ -31,7 +31,7 @@
> + #define dlg_toupper(ch) towupper((wint_t)ch)
> + #define dlg_isupper(ch) iswupper((wint_t)ch)
> + #else
> +-#define dlg_toupper(ch) toupper(ch)
> ++#define dlg_toupper(ch) toupper((unsigned char)(ch))
> + #define dlg_isupper(ch) (isalpha(ch) && isupper(ch))
> + #endif
> + 
> -- 
> 1.9.0
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
