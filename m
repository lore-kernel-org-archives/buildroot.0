From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 09 Jan 2018 00:06:48 -0200
Subject: [Buildroot] [PATCH 1/1] utils/checkpackagelib: add function to
 check of the default package source variable
References: <20180108234802.42d06229@windsurf>
Message-ID: <5a5423b8d08a0_5241d7ae4c960fb@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Jan 08, 2018 at 08:48 PM, Thomas Petazzoni wrote:

> Ricardo,
> 
> Do you think you could have a look at the below patch touching
> checkpackagelib ?

Thomas,
Thank you for adding me in CC.

> 
> It looks OK to me, so unless you complain in the next days, I'll apply.

Don't apply just yet. See at the end.

[snip]
> On Mon, 18 Dec 2017 13:14:26 +0100, Jerzy Grzegorek wrote:

Jerzy,
The code is almost good.
Below see some nits about the code.

And at the end see my main concerns. I think we will need a whitelist and some
patches fixing packages.

[snip]
>>  
>> +class RemoveDefaultPackageSourceVariable(_CheckFunction):
>> +    PACKAGE_NAME = re.compile("/([^/]+)\.mk")
>> +
>> +    def before(self):
>> +        package = self.PACKAGE_NAME.search(self.filename).group(1)
>> +        package_upper = package.replace("-", "_").upper()

>> +        self.package = package
>> +        self.package_upper = package_upper

These 2 lines are not needed because the variables are not used in other
methods of this class.

>> +        self.FIND_SOURCE = re.compile(
>> +            "^{}_SOURCE\s*=\s*{}-\$\({}_VERSION\)\.tar\.gz"
>> +            .format(package_upper, package, package_upper))
>> +
>> +    def check_line(self, lineno, text):
>> +        if self.FIND_SOURCE.search(text):
>> +            return ["{}:{}: remove default value of _SOURCE variable ({}#writing-rules-mk)"

Instead of #writing-rules-mk maybe a better url would be
#generic-package-reference
It contains this text for LIBFOO_SOURCE: "If none are specified, then the value
is assumed to be libfoo-$(LIBFOO_VERSION).tar.gz"

>> +                    .format(self.filename, lineno, self.url_to_manual),
>> +                    text]
>> +
>> +
>>  class SpaceBeforeBackslash(_CheckFunction):
>>      TAB_OR_MULTIPLE_SPACES_BEFORE_BACKSLASH = re.compile(r"^.*(  |\t)\\$")
>>  

Running the new check function in the tree we get warnings from 6 files.
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/47157096

Unrelated... but I see there are few more (other) warnings in the tree.


1) daq
A patch fixing this (removing the unneeded variable) ideally should be added to
the series because it is tested in gitlab.


2) glibc
It's a special package, but the removal of the variable seems fine to me (needs
testing of course).

3) python-networkmanager
I guess the variable can be removed. Could it interact with scanpypi? Do we
care if it does interact?
By 'interact' I mean: when someone uses scanpypi to create a package should
he/she use check-package after it?

For these 2 I am not sure which one is the best solution: fix or whitelist.


4) gdb
The variable is overwritten for ARC. Would removing the variable make the code
worst in this case? The 'if' would need to be negated, and the non-default
value be assigned for not-ARC, I guess.

5) binutils
It has '?=' later for the same variable. I am not sure the first assignment can
be removed.

6) gcc
Maybe we want it to be explicit to ease the maintenance? Not sure.

These 3 are good candidates for a whitelist.


Regards,
Ricardo
