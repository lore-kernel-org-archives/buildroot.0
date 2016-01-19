From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 11:16:40 +0100
Subject: [Buildroot] [PATCH] zbar: Fix gcc5 logical-not-parentheses error
In-Reply-To: <569E07BA.2050106@inbox.ru>
References: <20160116073021.A4B95101BCC@stock.ovh.net>
 <20160117001117.569d43f2@free-electrons.com>
 <569E07BA.2050106@inbox.ru>
Message-ID: <20160119111640.066210e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Viacheslav,

Thanks for your patch!

On Tue, 19 Jan 2016 12:54:02 +0300, Viacheslav Volkov wrote:
> From b9dd5d73c19d2b7170f722dba61a99655487fe9c Mon Sep 17 00:00:00 2001
> From: Viacheslav Volkov <sv99@inbox.ru>
> Date: Tue, 19 Jan 2016 12:19:29 +0300
> Subject: [PATCH] zbar: Fix gcc5 logical-not-parentheses error
> 
> Fix error: logical not is only applied to the left hand side of comparison
> [-Werror=logical-not-parentheses]
> 
> Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>

Are you sure this is the correct fix? Yes, it fixes the build issue,
but is it what the code intended to do?

> ---
>  zbar/decoder/ean.c  | 4 ++--
>  zbar/qrcode/qrdec.c | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/zbar/decoder/ean.c b/zbar/decoder/ean.c
> index c20f538..fe38eaa 100644
> --- a/zbar/decoder/ean.c
> +++ b/zbar/decoder/ean.c
> @@ -294,7 +294,7 @@ static inline zbar_symbol_type_t ean_part_end4
> (ean_pass_t *pass,
>          /* invalid parity combination */
>          return(ZBAR_NONE);
>  
> -    if(!par == fwd) {
> +    if(!(par == fwd)) {

Then par != fwd would be a lot simpler (and ditto below).

But did you analyze the code to make sure that this is actually the
right change?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
