From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 11 Jan 2019 15:00:15 +0100
Subject: [Buildroot] [PATCH v2 1/1] check-package: fix Python3 support
In-Reply-To: <20180811034827.14504-1-ricardo.martincoski@gmail.com>
References: <20180723004107.20985-1-ricardo.martincoski@gmail.com>
 <20180811034827.14504-1-ricardo.martincoski@gmail.com>
Message-ID: <CAAXf6LXygz85p7LCfbrM-Yq3BCubxkSBE+x2MewxnJWzT3pQ-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El s?b., 11 ago. 2018 a las 5:49, Ricardo Martincoski
(<ricardo.martincoski@gmail.com>) escribi?:
>
> This script currently uses "/usr/bin/env python" as shebang but it does
> not really support Python3. Instead of limiting the script to Python2,
> fix it to support both versions.
>
> So change all imports to absolute imports because Python3 follows PEP328
> and dropped implicit relative imports.
>
> In order to avoid errors when decoding files with the default 'utf-8'
> codec, use errors="surrogateescape" when opening files, the docs for
> open() states: "This is useful for processing files in an unknown
> encoding.". This argument is not compatible with Python2 open() so
> import 'six' to use it only when running in Python3.
> As a consequence the file handler becomes explicit, so use it to close()
> the file after it got processed.
>
> This "surrogateescape" is a simple alternative to the complete solution
> of opening files with "rb" and changing all functions in the lib*.py
> files to use bytes objects instead of strings. The only case we can have
> non-ascii/non-utf-8 files being checked by the script are for patch
> files when the upstream file to be patched is not ascii or utf-8. There
> is currently one case in the tree:
> package/urg/0002-urg-gcc6-fix-narrowing-conversion.patch.
>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
> Changes v1 -> v2:
>   - do not use an automated tool (modernize);
>   - use absolute import;
>   - drop list() added to .keys(), it's not needed (Arnout);
>   - drop 'from __future__ import absolute_import' everywhere;
>   - list the (not used) approach of opening files in binary mode in the
>     commit message;
>
> Using the default docker (debian) image which uses Python2:
> before this patch:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/88548503
> after this patch:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/88561994
>
> Using an arch docker image which uses Python3:
> before this patch:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/88561488
> after this patch:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/88561704
> The arch image for docker was generated using:
> http://patchwork.ozlabs.org/patch/943301/
> ---
>  utils/check-package                 |  8 +++++++-
>  utils/checkpackagelib/lib.py        |  2 +-
>  utils/checkpackagelib/lib_config.py | 10 +++++-----
>  utils/checkpackagelib/lib_hash.py   | 10 +++++-----
>  utils/checkpackagelib/lib_mk.py     | 10 +++++-----
>  utils/checkpackagelib/lib_patch.py  |  4 ++--
>  6 files changed, 25 insertions(+), 19 deletions(-)
>

This patch looks good to me. I don't really know anything about
surrogateescape, but the script works on the urg package so seems ok.

Reviewed-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Tested-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
[Tested with Python 2.7.x and Python 3.5.x]
