From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Dec 2017 12:03:20 +0100
Subject: [Buildroot] [PATCH 1/1] check-package: avoid false warning of
 useless flag
In-Reply-To: <1512188904-31366-1-git-send-email-ricardo.martincoski@datacom.ind.br>
References: <d2844704851e4e8ff93c3007e9e67e2a339e11c7.1511996903.git.yann.morin.1998@free.fr>
 <1512188904-31366-1-git-send-email-ricardo.martincoski@datacom.ind.br>
Message-ID: <20171202110320.GA2988@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2017-12-02 02:28 -0200, Ricardo Martincoski spake thusly:
> Just AUTORECONF = NO is redundant.
> Just HOST_AUTORECONF = NO is redundant.
> But the combination of AUTORECONF = YES + HOST_AUTORECONF = NO is valid.
> 
> So basically for all variables that have inheritance between target and
> host, having the host variant of the variable set the variable value
> back to its default is correct if the target variable is set.
> 
> Instead of increasing complexity of the script to fully detect this
> case, ignore the host flag set to its default value as it can be
> overriding a non-default value inherited from the equivalent target
> flag.

But then we miss the cases where:
  - both are set to their default values,
  - the target one is not set and the host one is set to the default
    value.

But as you said, detecting the real false-positive would require
maintaining some state, which is currently not possible in the script.

Yet, htere is one issue I see: the script currently names issues mere
'warnings' but exits with a non-zero error code as soon as at least one
such 'warning' is seen.

However, what we so far detected were really 'errors', not 'warnings',
while the case we are speaking about now really is a warning: it should
be reported, biut should not exit in error.

So I must say I'm still not really fond of this change... :-(

Also I noticed that the comments do match the regexps:

    288: # We need HOST_ASTERISK_AUTORECONF = NO because the
    289: # target variant has _AUTORECONF = YES
    290: HOST_ASTERISK_AUTORECONF = NO

will report the issue twice (man URL removed):

    package/asterisk/asterisk.mk:288: useless default value [...]
    package/asterisk/asterisk.mk:290: useless default value [...]

Since this is the .mk parser, it could ignore the comments, I believe...

Regards,
Yann E. MORIN.

> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> ---
> Part of commit log copied from Thomas' e-mail. I hope you don't mind.
> ---
>  utils/checkpackagelib/lib_mk.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
> index 6ed6011..817e809 100644
> --- a/utils/checkpackagelib/lib_mk.py
> +++ b/utils/checkpackagelib/lib_mk.py
> @@ -216,7 +216,7 @@ class UselessFlag(_CheckFunction):
>                      .format(self.filename, lineno, self.url_to_manual),
>                      text]
>  
> -        if self.DEFAULT_AUTOTOOLS_FLAG.search(text):
> +        if self.DEFAULT_AUTOTOOLS_FLAG.search(text) and not text.lstrip().startswith("HOST_"):
>              return ["{}:{}: useless default value "
>                      "({}#_infrastructure_for_autotools_based_packages)"
>                      .format(self.filename, lineno, self.url_to_manual),
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
