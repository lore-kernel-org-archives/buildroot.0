From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 24 Sep 2019 23:19:53 -0300
Subject: [Buildroot] [PATCH 15/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: check the order of menu of menus
References: <20190903211341.10341-15-jerzy.m.grzegorek@gmail.com>
Message-ID: <5d8acec9deaba_9193fde200ab14c45114@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Sep 03, 2019 at 06:13 PM, Jerzy Grzegorek wrote:

[snip]
> +++ b/utils/checkpackagelib/lib_config.py
> @@ -65,6 +65,10 @@ class CommentsMenusPackagesOrder(_CheckFunction):
>      comments_order_checking = [False]
>      print_comment_warning = [True]
>  
> +    first_menu = [True, True]
> +    menu = [""]
> +    print_menu_warning = [True]

This is not good. Please use instance variables initialized in before().
before() is called... well... *before* every file is processed :-)
This will ensure the correct initial state for each file being processed.

Here an example of result to avoid:
With the whole series applied.
$ utils/check-package package/Config.in >/dev/null
2285 lines processed
2 warnings generated
$ utils/check-package package/Config.in.host >/dev/null
78 lines processed
0 warnings generated
$ utils/check-package package/Config.in package/Config.in.host >/dev/null
2363 lines processed
3 warnings generated

So we get a false warning for package/Config.in.host depending in other file(s)
being processed before it or not.
If you initialize all variables in before(), this error does not occur.


Regards,
Ricardo
