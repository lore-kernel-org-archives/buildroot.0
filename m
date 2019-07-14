From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jul 2019 12:04:56 +0200
Subject: [Buildroot] [PATCH v2 2/2] checkpackagelib/lib_config.py: check
 packages alphabetical order in {Config.in, Config.in.host}
In-Reply-To: <52067533-c74f-348b-450a-0504b71b0184@mind.be>
References: <20190611204946.3848-1-jerzy.m.grzegorek@gmail.com>
 <20190611204946.3848-2-jerzy.m.grzegorek@gmail.com>
 <52067533-c74f-348b-450a-0504b71b0184@mind.be>
Message-ID: <20190714100456.GA11082@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Jerzy, All,

On 2019-07-14 00:27 +0200, Arnout Vandecappelle spake thusly:
> On 11/06/2019 22:49, Jerzy Grzegorek wrote:
> > Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
> 
>  Applied both to master, thanks.
> 
>  I still made a lot of changes, though:
> 
>      - calculate level by counting - instead of with a static array;
>      - new_package is only used locally, so don't make it a class member;
>      - do indentation according to length of prefix;
>      - don't split string in the middle of a line;
>      - report first wrong package per menu;
>      - do replace() only once;
>      - add comment why we do replace().
> 
>  Please take a look at the end result, and if there's something you don't like,
> send a follow-up patch.

This breaks check-package, I'm afraid:

    $ LC_ALL=C make check-package
    find /home/ymorin/dev/buildroot/buildroot -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' \) \
            -exec ./utils/check-package {} +
    Traceback (most recent call last):
      File "./utils/check-package", line 190, in <module>
        __main__()
      File "./utils/check-package", line 173, in __main__
        nwarnings, nlines = check_file_using_lib(fname)
      File "./utils/check-package", line 142, in check_file_using_lib
        nwarnings += print_warnings(cf.check_line(lineno + 1, text))
      File "/home/ymorin/dev/buildroot/buildroot/utils/checkpackagelib/lib_config.py", line 90, in check_line
        self.package[level] = ""
    IndexError: list assignment index out of range
    36465 lines processed
    0 warnings generated
    package/kodi/Config.in:303: Packages in: menu "Audio decoder addons",
                                are not alphabetically ordered;
                                correct order: '-', '_', digits, capitals, lowercase;
                                first incorrect package: kodi-audiodecoder
    package/kodi/Config.in:315: Packages in: menu "Audio encoder addons",
                                are not alphabetically ordered;
                                correct order: '-', '_', digits, capitals, lowercase;
                                first incorrect package: kodi-audioencode
    package/kodi/Config.in:326: Packages in: menu "Inputstream addons",
                                are not alphabetically ordered;
                                correct order: '-', '_', digits, capitals, lowercase;
                                first incorrect package: kodi-inputstream
    package/kodi/Config.in:335: Packages in: menu "PVR addons",
                                are not alphabetically ordered;
                                correct order: '-', '_', digits, capitals, lowercase;
                                first incorrect package: kodi-pv
    package/kodi/Config.in:359: Packages in: menu "Screensavers",
                                are not alphabetically ordered;
                                correct order: '-', '_', digits, capitals, lowercase;
                                first incorrect package: kodi-screensaver
    package/kodi/Config.in:370: Packages in: menu "Visualisations",
                                are not alphabetically ordered;
                                correct order: '-', '_', digits, capitals, lowercase;
                                first incorrect package: kodi-visualisation
    Traceback (most recent call last):
      File "./utils/check-package", line 190, in <module>
        __main__()
      File "./utils/check-package", line 173, in __main__
        nwarnings, nlines = check_file_using_lib(fname)
      File "./utils/check-package", line 142, in check_file_using_lib
        nwarnings += print_warnings(cf.check_line(lineno + 1, text))
      File "/home/ymorin/dev/buildroot/buildroot/utils/checkpackagelib/lib_config.py", line 90, in check_line
        self.package[level] = ""
    IndexError: list assignment index out of range
    37453 lines processed
    0 warnings generated
    20138 lines processed
    0 warnings generated
    make[1]: *** [Makefile:1201: check-package] Error 1
    make: *** [Makefile:84: _all] Error 2

So, the kodi errors are all false positive: the ordering there is already
correct.

But most problematic, is the python traceback, now... :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
