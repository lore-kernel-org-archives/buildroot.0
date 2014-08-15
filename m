From: Paul Cercueil <paul@crapouillou.net>
Date: Sat, 16 Aug 2014 01:00:18 +0200
Subject: [Buildroot] [PATCH 05/11] dialog: Patch incorrect use of
	toupper()
In-Reply-To: <1396558881-29631-5-git-send-email-paul@crapouillou.net>
References: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
 <1396558881-29631-5-git-send-email-paul@crapouillou.net>
Message-ID: <53EE9102.7050707@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I remove that patch from patchwork. Dialog has been bumped to version 
1.2-20140219 which doesn't require this fix anymore.

Paul Cercueil

Le 03/04/2014 23:01, Paul Cercueil a ?crit :
> On some platforms (e.g. MIPS), the "char" type is signed by default.
> The problem is that toupper() takes an int as argument: a signed
> char then gets sign-extended to 32bit, which causes an assertion
> failure as toupper() verifies that its argument fits in 8 bits.
>
> Signed-Off-By: Paul Cercueil <paul@crapouillou.net>
> Acked-By: Maarten ter Huurne <maarten@treewalker.org>
> ---
>   package/dialog/dialog-toupper.patch | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>   create mode 100644 package/dialog/dialog-toupper.patch
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
>
