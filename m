From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Fri, 10 May 2019 10:10:51 +0200
Subject: [Buildroot] [PATCH v1] utils/check-package: warn about utf-8
 characters in .mk files
In-Reply-To: <20190508173427.8612-1-ps.report@gmx.net>
References: <20190508173427.8612-1-ps.report@gmx.net>
Message-ID: <597bf630-282b-c368-5b92-b292c115c56c@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Works as expected with both Py2 and Py3
On 5/8/19 7:34 PM, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Tested-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
> Note: is_ascii taken from one of the stackoverflow suggestions ([1])
> 
> [1] https://stackoverflow.com/questions/196345/how-to-check-if-a-string-in-python-is-in-ascii
> ---
>   utils/checkpackagelib/lib.py    | 13 +++++++++++++
>   utils/checkpackagelib/lib_mk.py |  1 +
>   2 files changed, 14 insertions(+)
> 
> diff --git a/utils/checkpackagelib/lib.py b/utils/checkpackagelib/lib.py
> index 6afe1aabce..c65a2ed939 100644
> --- a/utils/checkpackagelib/lib.py
> +++ b/utils/checkpackagelib/lib.py
> @@ -52,3 +52,16 @@ class TrailingSpace(_CheckFunction):
>               return ["{}:{}: line contains trailing whitespace"
>                       .format(self.filename, lineno),
>                       text]
> +
> +class Utf8Characters(_CheckFunction):
> +    def is_ascii(self, s):
> +        try:
> +            return all(ord(c) < 128 for c in s)
> +        except TypeError:
> +            return False
> +
> +    def check_line(self, lineno, text):
> +        if not self.is_ascii(text):
> +            return ["{}:{}: line contains UTF-8 characters"
> +                    .format(self.filename, lineno),
> +                    text]
> diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
> index 00efeb7fb2..9e9a045776 100644
> --- a/utils/checkpackagelib/lib_mk.py
> +++ b/utils/checkpackagelib/lib_mk.py
> @@ -11,6 +11,7 @@ from checkpackagelib.lib import ConsecutiveEmptyLines  # noqa: F401
>   from checkpackagelib.lib import EmptyLastLine          # noqa: F401
>   from checkpackagelib.lib import NewlineAtEof           # noqa: F401
>   from checkpackagelib.lib import TrailingSpace          # noqa: F401
> +from checkpackagelib.lib import Utf8Characters         # noqa: F401
> 
>   # used in more than one check
>   start_conditional = ["ifdef", "ifeq", "ifndef", "ifneq"]
> --
> 2.21.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
