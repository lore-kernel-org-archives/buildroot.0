From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 31 May 2020 14:28:09 +0200
Subject: [Buildroot] [PATCH 1/1] utils/check-package: add a check for
 the new spacing convention
In-Reply-To: <20200205212211.29720-1-heiko.thiery@gmail.com>
References: <20200205212211.29720-1-heiko.thiery@gmail.com>
Message-ID: <20200531122809.GB8737@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2020-02-05 22:22 +0100, Heiko Thiery spake thusly:
> The seperation of the fields in the hash file should be 2 spaces for
> consistency.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

I was thinking about this one recently, but we still have too many
issues with it:

    $ make check-package 2>&1 |grep warnings\ generated
    2166 warnings generated
    1692 warnings generated
    2538 warnings generated
    1551 warnings generated
    796 warnings generated

So, we need to either wiat for all the hash filers to be fixed one by
one, or we need a mass conversion effort...

I did that conversion way back then, and it is trivial I think:

    $ find . -type f -name '*.hash' -print0 \
    |xargs -0 sed -r -i -e 's/^(md5|sha(1|224|256|384|512))[[:space:]]+([^[:space:]]+)[[:space:]]+(.+)$/\1  \3  \4/'

    $ git diff --stat
    [...]
     1793 files changed, 6298 insertions(+), 6298 deletions(-)

So I'm keeping your patch on the side for now...

Regards,
Yann E. MORIN.

> ---
>  utils/checkpackagelib/lib_hash.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/checkpackagelib/lib_hash.py b/utils/checkpackagelib/lib_hash.py
> index 3e381119a5..87cc58a1bb 100644
> --- a/utils/checkpackagelib/lib_hash.py
> +++ b/utils/checkpackagelib/lib_hash.py
> @@ -40,7 +40,7 @@ class HashType(_CheckFunction):
>          if len(fields) < 2:
>              return
>  
> -        htype, hexa = fields[:2]
> +        htype, hexa, filename = fields[:3]
>          if htype == "none":
>              return
>          if htype not in self.len_of_hash.keys():
> @@ -53,3 +53,8 @@ class HashType(_CheckFunction):
>                      .format(self.filename, lineno, self.url_to_manual),
>                      text,
>                      "expected {} hex digits".format(self.len_of_hash[htype])]
> +        if not re.match(re.escape("^{}  {}  {}.*$".format(
> +                htype, hexa, filename)), text):
> +            return ["{}:{}: separation does not match expectation "
> +                    "({}#adding-packages-hash)"
> +                    .format(self.filename, lineno, self.url_to_manual), text]
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
