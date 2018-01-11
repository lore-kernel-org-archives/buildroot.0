From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 10 Jan 2018 23:54:43 -0200
Subject: [Buildroot] [PATCHv2 1/1] utils/checkpackagelib: add function
 to check of the default package source variable
References: <1515620175-11260-1-git-send-email-jerzy.m.grzegorek@gmail.com>
Message-ID: <5a56c3e3881e1_39321a452589094e@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Jan 10, 2018 at 07:36 PM, Jerzy Grzegorek wrote:

[snip]
> +class RemoveDefaultPackageSourceVariable(_CheckFunction):
> +    packages_that_may_contain_default_source = ["binutils","gcc","gdb"]

This line adds 2 style warnings (detected with flake8):
E231 missing whitespace after ','
Can you fix them?

Please ignore the other 4 warnings
F401 'lib.*' imported but unused
already present in the file. I will send a series to fix them and all other
style warnings detected by flake8 in the tree.

> +    PACKAGE_NAME = re.compile("/([^/]+)\.mk")
> +
> +    def before(self):
> +        package = self.PACKAGE_NAME.search(self.filename).group(1)
> +        package_upper = package.replace("-", "_").upper()
> +        self.package = package
> +        self.FIND_SOURCE = re.compile(
> +            "^{}_SOURCE\s*=\s*{}-\$\({}_VERSION\)\.tar\.gz"
> +            .format(package_upper, package, package_upper))
> +
> +    def check_line(self, lineno, text):
> +        if self.FIND_SOURCE.search(text):
> +
> +            if self.package in self.packages_that_may_contain_default_source:
> +                return ["{}:{}: this package may contain default value of "
> +                        "_SOURCE variable to remove ({}#generic-package-reference)"
> +                        .format(self.filename, lineno, self.url_to_manual),
> +                        text]

For the whitelist case we need to use just:
                return

Any value returned by a check function is counted as a warning, making the main
check-package script to exit with code 1 to the shell, that in turn makes the
job in gitlab to be marked as failed.


There is also the glibc.mk to remove the default value of _SOURCE variable
from, to be done in a separate patch. 'make printvars' can be helpful to test
it besides a build test.

Are you willing to work on this too?


Regards,
Ricardo
