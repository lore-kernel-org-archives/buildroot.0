From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 24 Jan 2017 22:18:21 +0100
Subject: [Buildroot] [PATCH 4/9] check-package: check *.hash files
In-Reply-To: <20161231032110.11573-5-ricardo.martincoski@gmail.com>
References: <20161231032110.11573-1-ricardo.martincoski@gmail.com>
 <20161231032110.11573-5-ricardo.martincoski@gmail.com>
Message-ID: <CAAXf6LVJgdMqDuUcfzDdW8Mw19ukfCRcaR8SdvhPyoiqhiGeFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Dec 31, 2016 at 4:21 AM, Ricardo Martincoski
<ricardo.martincoski@gmail.com> wrote:
> Check each hash entry (see [1]) and warn when:
> - it does not have three fields;
> - its type is unknown;
> - its length does not match its type;
> - the name of the file contains a directory component.
>
> [1] http://nightly.buildroot.org/#adding-packages-hash
>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
>
> Notes:
>     $ time support/scripts/check-package $(find package -type f) >/dev/null 2>/dev/null
>
>     real        0m0.837s
>     user        0m0.780s
>     sys 0m0.056s
>
>     CHECK_HASH_FILENAME:
>      support/scripts/check-package --include-only check_hash_filename \
>      $(find package -name '*.hash') 2>/dev/null | wc -l
>       0
>      (cd support/scripts/check-package-example && \
>      ../check-package --include-only check_hash_filename -vv package/*/*)
>       package/package1/package1.hash:5: use filename without directory component (http://nightly.buildroot.org/#adding-packages-hash)
>       sha256< tab  >12345678901234567890123456789012345678901234567890123456789012345< tab  >dl/package1-1.0.tar.gz
>       159 lines processed
>       1 warnings generated
>
>     CHECK_HASH_NUMBER_OF_FIELDS:
>      support/scripts/check-package --include-only check_hash_number_of_fields \
>      $(find package -name '*.hash') 2>/dev/null | wc -l
>       0
>      (cd support/scripts/check-package-example && \
>      ../check-package --include-only check_hash_number_of_fields -vv package/*/*)
>       package/package1/package1.hash:6: expected three fields (http://nightly.buildroot.org/#adding-packages-hash)
>       sha256 1234567890123456789012345678901234567890123456789012345678901234
>       159 lines processed
>       1 warnings generated
>
>     CHECK_HASH_TYPE:
>      support/scripts/check-package --include-only check_hash_type \
>      $(find package -name '*.hash') 2>/dev/null | wc -l
>       1
>      (cd support/scripts/check-package-example && \
>      ../check-package --include-only check_hash_type -vv package/*/*)
>       package/package1/package1.hash:3: hash size does not match type (http://nightly.buildroot.org/#adding-packages-hash)
>       sha256 123456789 package1-1.0.tar.gz
>       expected 64 hex digits
>       package/package1/package1.hash:4: unexpected type of hash (http://nightly.buildroot.org/#adding-packages-hash)
>       crc16< tab  >123456789< tab  >package1-1.0.tar.gz
>       package/package1/package1.hash:5: hash size does not match type (http://nightly.buildroot.org/#adding-packages-hash)
>       sha256< tab  >12345678901234567890123456789012345678901234567890123456789012345< tab  >dl/package1-1.0.tar.gz
>       expected 64 hex digits
>       159 lines processed
>       3 warnings generated
>
>  support/scripts/checkpackagelib_hash.py | 66 +++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>
> diff --git a/support/scripts/checkpackagelib_hash.py b/support/scripts/checkpackagelib_hash.py
> index d095f9255..646c6cc12 100644
> --- a/support/scripts/checkpackagelib_hash.py
> +++ b/support/scripts/checkpackagelib_hash.py
> @@ -3,8 +3,74 @@
>  # functions don't need to check for things already checked by running
>  # "make package-dirclean package-source".
>
> +import re
> +
>  # Notice: ignore 'imported but unused' from pyflakes for check functions.
>  from checkpackagelib import check_consecutive_empty_lines
>  from checkpackagelib import check_empty_last_line
>  from checkpackagelib import check_newline_at_eof
>  from checkpackagelib import check_trailing_space
> +
> +
> +def _empty_line_or_comment(text):
> +    return text.strip() == "" or text.startswith("#")
> +
> +
> +FILENAME_WITH_SLASH = re.compile("/")
> +
> +
> +def check_hash_filename(
> +        fname, args, lineno=0, text=None, start=False, end=False):
> +    if start or end or _empty_line_or_comment(text):
> +        return
> +
> +    fields = text.split()
> +    if len(fields) < 3:
> +        return
> +
> +    filename = fields[2]
> +    if FILENAME_WITH_SLASH.search(filename):

This is overkill. It is more simple and I expect more performant to just do:

    if '/' in filename:

Best regards,
Thomas
