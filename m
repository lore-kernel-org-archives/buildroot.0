From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Mar 2018 23:14:37 +0200
Subject: [Buildroot] [PATCH 1/1] get-developers: explicitly set devs
 document encoding
In-Reply-To: <BN6PR2001MB094879FCCDB0C266DE027DFFA0D90@BN6PR2001MB0948.namprd20.prod.outlook.com>
References: <BN6PR2001MB094879FCCDB0C266DE027DFFA0D90@BN6PR2001MB0948.namprd20.prod.outlook.com>
Message-ID: <20180331211437.GQ25161@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2018-03-06 02:39 +0000, James Knight spake thusly:
> Explicitly indicate the file encoding (to UTF-8) for the DEVELOPERS
> document. This prevents Unicode decoding errors where some systems
> assume an alternative default encoding (ex. 'CP1252').
> 
> This corrects the following observed error:
> 
>     $ ./utils/get-developers outgoing/*
>     Traceback (most recent call last):
>       File "./utils/get-developers", line 101, in <module>
>         __main__()
>       File "./utils/get-developers", line 25, in __main__
>         devs = getdeveloperlib.parse_developers()
>       File "...\buildroot\utils\getdeveloperlib.py", line 164, in parse_developers
>         for line in f:
>       File "...\Python36\lib\encodings\cp1252.py", line 23, in decode
>         return codecs.charmap_decode(input,self.errors,decoding_table)[0]
>     UnicodeDecodeError: 'charmap' codec can't decode byte 0x81 in position 7087: character maps to <undefined>
> 
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
>  utils/getdeveloperlib.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
> index 2c8d477583..30374d77f8 100644
> --- a/utils/getdeveloperlib.py
> +++ b/utils/getdeveloperlib.py
> @@ -158,7 +158,7 @@ def parse_developers(basepath=None):
>      linen = 0
>      if basepath is None:
>          basepath = os.getcwd()
> -    with open(os.path.join(basepath, "DEVELOPERS"), "r") as f:
> +    with open(os.path.join(basepath, "DEVELOPERS"), "r", encoding="utf8") as f:

This does not work with oython2:

    $ python2
    Python 2.7.14 (default, Sep 23 2017, 22:06:14)
    [GCC 7.2.0] on linux2
    Type "help", "copyright", "credits" or "license" for more information.
    >>> with open("DEVELOPPERS", "r", encoding="utf8") as f:
    ...     lines= f.readlines()
    ...
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: 'encoding' is an invalid keyword argument for this function

Recentyl, we had to do a similar encoding/decoding issue:

    5563a1c6a4 support/check-uniq-files: support weird locales and filenames

Do you think you could have a look at it and do a similar tweak to
get-developper instead, please?

Regards,
Yann E. MORIN.

>          files = []
>          name = None
>          for line in f:
> -- 
> 2.16.2.windows.1
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
