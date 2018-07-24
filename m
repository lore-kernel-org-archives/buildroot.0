From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 24 Jul 2018 10:54:51 +0200
Subject: [Buildroot] [PATCH 1/1] check-package: fix Python3 support
In-Reply-To: <20180723004107.20985-1-ricardo.martincoski@gmail.com>
References: <20180723004107.20985-1-ricardo.martincoski@gmail.com>
Message-ID: <b80932b6-1dcb-e769-26cc-55e6ab148f1b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-07-18 02:41, Ricardo Martincoski wrote:
> This script currently uses "/usr/bin/env python" as shebang but it does
> not really support Python3. Instead of limiting the script to Python2,
> fix it to support both versions.
> 
> Do this by first using an automated tool:
> $ python -m modernize -w -p <files>

 In general (if it doesn't break things), I prefer to do the automatic stuff in
a separate patch from the manual stuff. That makes review easier (because for
the automatic stuff, you mainly review the automation itself rather than the
result).

> and then manually fixing what remains:
>  - keep the imports in alphabetical order;
>  - fix handling of files that cannot be decoded by 'utf-8' codec, such
>    as package/urg/0002-urg-gcc6-fix-narrowing-conversion.patch .
> 
> In order to avoid errors when decoding files, use
> errors="surrogateescape" when opening files, the docs for open() states:
> "This is useful for processing files in an unknown encoding.".
> This argument is not compatible with Python2 open() so import 'six' to
> use it only when running in Python3.

 I would prefer to open files with "rb" instead. However, that's a much bigger
change because all checks should then use bytes objects instead of strings.

> As a consequence the file handler becomes explicit, so use it to close()
> the file after it got processed.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Using the default docker (debian) image which uses Python2:
> before this patch:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/83454639
> after this patch:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/83542815
> 
> Using an arch docker image which uses Python3:
> before this patch:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/81892607
> after this patch:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/83543363
> The arch image for docker was generated using:
> http://patchwork.ozlabs.org/patch/943301/
> ---
>  utils/check-package                 |  9 ++++++++-
>  utils/checkpackagelib/lib.py        |  3 ++-
>  utils/checkpackagelib/lib_config.py | 13 +++++++------
>  utils/checkpackagelib/lib_hash.py   | 13 +++++++------
>  utils/checkpackagelib/lib_mk.py     | 11 ++++++-----
>  utils/checkpackagelib/lib_patch.py  |  5 +++--
>  6 files changed, 33 insertions(+), 21 deletions(-)
> 
> diff --git a/utils/check-package b/utils/check-package
> index 3dbc28b0a2..a8f5ce6157 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -1,11 +1,13 @@
>  #!/usr/bin/env python
>  # See utils/checkpackagelib/readme.txt before editing this file.
>  
> +from __future__ import absolute_import

 This doesn't make sense in a top-level script, does it?

>  from __future__ import print_function
>  import argparse
>  import inspect
>  import os
>  import re
> +import six
>  import sys
>  
>  import checkpackagelib.lib_config
> @@ -127,10 +129,15 @@ def check_file_using_lib(fname):
>  
>      for cf in objects:
>          nwarnings += print_warnings(cf.before())
> -    for lineno, text in enumerate(open(fname, "r").readlines()):
> +    if six.PY3:
> +        f = open(fname, "r", errors="surrogateescape")
> +    else:
> +        f = open(fname, "r")
> +    for lineno, text in enumerate(f.readlines()):
>          nlines += 1
>          for cf in objects:
>              nwarnings += print_warnings(cf.check_line(lineno + 1, text))
> +    f.close()
>      for cf in objects:
>          nwarnings += print_warnings(cf.after())
>  
> diff --git a/utils/checkpackagelib/lib.py b/utils/checkpackagelib/lib.py
> index 91f4ad49b7..61fa46125d 100644
> --- a/utils/checkpackagelib/lib.py
> +++ b/utils/checkpackagelib/lib.py
> @@ -1,6 +1,7 @@
>  # See utils/checkpackagelib/readme.txt before editing this file.
>  
> -from base import _CheckFunction
> +from __future__ import absolute_import
> +from .base import _CheckFunction

 Why is this changed? Will Python3 look for base anywhere else than in the
checkpackagelib directory?

 Same below.

>  
>  
>  class ConsecutiveEmptyLines(_CheckFunction):
> diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
> index 1d273f1c5f..5f316a6d5b 100644
> --- a/utils/checkpackagelib/lib_config.py
> +++ b/utils/checkpackagelib/lib_config.py
> @@ -3,13 +3,14 @@
>  # "bool", so below check functions don't need to check for things already
>  # checked by running "make menuconfig".
>  
> +from __future__ import absolute_import
>  import re
>  
> -from base import _CheckFunction
> -from lib import ConsecutiveEmptyLines  # noqa: F401
> -from lib import EmptyLastLine          # noqa: F401
> -from lib import NewlineAtEof           # noqa: F401
> -from lib import TrailingSpace          # noqa: F401
> +from .base import _CheckFunction
> +from .lib import ConsecutiveEmptyLines  # noqa: F401
> +from .lib import EmptyLastLine          # noqa: F401
> +from .lib import NewlineAtEof           # noqa: F401
> +from .lib import TrailingSpace          # noqa: F401
>  
>  
>  def _empty_or_comment(text):
> @@ -45,7 +46,7 @@ class AttributesOrder(_CheckFunction):
>          if attribute in entries_that_should_not_be_indented:
>              self.state = 0
>              return
> -        if attribute not in self.attributes_order_convention.keys():
> +        if attribute not in list(self.attributes_order_convention.keys()):

 Why is this needed? 'not in' works on an iterator, doesn't it?

 Same below.

 Bottom line: I don't think modernize does anything useful.

 Regards,
 Arnout


>              return
>          new_state = self.attributes_order_convention[attribute]
>          wrong_order = self.state > new_state
> diff --git a/utils/checkpackagelib/lib_hash.py b/utils/checkpackagelib/lib_hash.py
> index 6d4cc9fd62..8ca92a5a90 100644
> --- a/utils/checkpackagelib/lib_hash.py
> +++ b/utils/checkpackagelib/lib_hash.py
> @@ -3,13 +3,14 @@
>  # functions don't need to check for things already checked by running
>  # "make package-dirclean package-source".
>  
> +from __future__ import absolute_import
>  import re
>  
> -from base import _CheckFunction
> -from lib import ConsecutiveEmptyLines  # noqa: F401
> -from lib import EmptyLastLine          # noqa: F401
> -from lib import NewlineAtEof           # noqa: F401
> -from lib import TrailingSpace          # noqa: F401
> +from .base import _CheckFunction
> +from .lib import ConsecutiveEmptyLines  # noqa: F401
> +from .lib import EmptyLastLine          # noqa: F401
> +from .lib import NewlineAtEof           # noqa: F401
> +from .lib import TrailingSpace          # noqa: F401
>  
>  
>  def _empty_line_or_comment(text):
> @@ -43,7 +44,7 @@ class HashType(_CheckFunction):
>          htype, hexa = fields[:2]
>          if htype == "none":
>              return
> -        if htype not in self.len_of_hash.keys():
> +        if htype not in list(self.len_of_hash.keys()):
>              return ["{}:{}: unexpected type of hash ({}#adding-packages-hash)"
>                      .format(self.filename, lineno, self.url_to_manual),
>                      text]
> diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
> index 86e9aa2d97..9c17a3cfd2 100644
> --- a/utils/checkpackagelib/lib_mk.py
> +++ b/utils/checkpackagelib/lib_mk.py
> @@ -4,13 +4,14 @@
>  # menu options using "make menuconfig" and by running "make" with appropriate
>  # packages enabled.
>  
> +from __future__ import absolute_import
>  import re
>  
> -from base import _CheckFunction
> -from lib import ConsecutiveEmptyLines  # noqa: F401
> -from lib import EmptyLastLine          # noqa: F401
> -from lib import NewlineAtEof           # noqa: F401
> -from lib import TrailingSpace          # noqa: F401
> +from .base import _CheckFunction
> +from .lib import ConsecutiveEmptyLines  # noqa: F401
> +from .lib import EmptyLastLine          # noqa: F401
> +from .lib import NewlineAtEof           # noqa: F401
> +from .lib import TrailingSpace          # noqa: F401
>  
>  
>  class Indent(_CheckFunction):
> diff --git a/utils/checkpackagelib/lib_patch.py b/utils/checkpackagelib/lib_patch.py
> index 555621afa1..4b0d32268f 100644
> --- a/utils/checkpackagelib/lib_patch.py
> +++ b/utils/checkpackagelib/lib_patch.py
> @@ -3,10 +3,11 @@
>  # functions don't need to check for things already checked by running
>  # "make package-dirclean package-patch".
>  
> +from __future__ import absolute_import
>  import re
>  
> -from base import _CheckFunction
> -from lib import NewlineAtEof           # noqa: F401
> +from .base import _CheckFunction
> +from .lib import NewlineAtEof           # noqa: F401
>  
>  
>  class ApplyOrder(_CheckFunction):
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
