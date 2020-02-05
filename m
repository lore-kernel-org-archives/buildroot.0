From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Feb 2020 18:07:29 +0100
Subject: [Buildroot] [PATCH] utils/check-package: add a check for the
 separation in the hash files
In-Reply-To: <20200204103836.7730-1-heiko.thiery@gmail.com>
References: <20200204103836.7730-1-heiko.thiery@gmail.com>
Message-ID: <20200205170729.GI3131@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2020-02-04 11:38 +0100, Heiko Thiery spake thusly:
> The seperation of the fields in the hash file should be 2 spaces for
> consitency.

The script now throwsa traceback:

    $ make check-package
    [lots of output...]
    Traceback (most recent call last):
      File "./utils/check-package", line 194, in <module>
        __main__()
      File "./utils/check-package", line 177, in __main__
        nwarnings, nlines = check_file_using_lib(fname)
      File "./utils/check-package", line 146, in check_file_using_lib
        nwarnings += print_warnings(cf.check_line(lineno + 1, text))
      File "/home/ymorin/dev/buildroot/buildroot/utils/checkpackagelib/lib_hash.py", line 57, in check_line
        if not re.match("^{}  {}  {}.*$".format(htype, hexa, filename), text):
      File "/usr/lib/python2.7/re.py", line 141, in match
        return _compile(pattern, flags).match(string)
      File "/usr/lib/python2.7/re.py", line 251, in _compile
        raise error, v # invalid expression
    sre_constants.error: multiple repeat
    make: *** [Makefile:1185: check-package] Error 1

Care to have a look at it?

In the meantime...

> Add some extra infos about that in the "adding-packages-directory" part
> of the manual.

I've reworded that manual part, updated the following example while at
it, and applied to master. Thanks! :-)

Regards,
Yann E. MORIN.

> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  docs/manual/adding-packages-directory.txt | 6 ++++--
>  utils/checkpackagelib/lib_hash.py         | 7 ++++++-
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index 1c8b9f96b5..2c1a7d8776 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -461,7 +461,8 @@ The hashes stored in that file are used to validate the integrity of the
>  downloaded files and of the license files.
>  
>  The format of this file is one line for each file for which to check the
> -hash, each line being space-separated, with these three fields:
> +hash. For every file to check the three fields (hash type, hash, filename)
> +has to be in that file separated by 2 spaces.
>  
>  * the type of hash, one of:
>  ** +md5+, +sha1+, +sha224+, +sha256+, +sha384+, +sha512+, +none+
> @@ -502,7 +503,8 @@ create the hash file in a subdirectory +<packageversion>+ of that package
>  
>  .Note
>  The number of spaces does not matter, so one can use spaces (or tabs) to
> -properly align the different fields.
> +properly align the different fields. Nethertheless new packages has to be
> +separated by 2 spaces.
>  
>  The +none+ hash type is reserved to those archives downloaded from a
>  repository, like a 'git clone', a 'subversion checkout'...
> diff --git a/utils/checkpackagelib/lib_hash.py b/utils/checkpackagelib/lib_hash.py
> index 3e381119a5..618ae5f679 100644
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
> +
> +        if not re.match("^{}  {}  {}.*$".format(htype, hexa, filename), text):
> +            return ["{}:{}: separation does not match expectation ({}#adding-packages-hash)"
> +                    .format(self.filename, lineno, self.url_to_manual),
> +                    text]
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
