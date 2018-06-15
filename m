From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 15 Jun 2018 14:30:27 +0200
Subject: [Buildroot] [PATCH] scanpypi: rework download_package error
 handling
In-Reply-To: <87muvw2qoo.fsf@dell.be.48ers.dk>
References: <20180613073710.5715-1-yegorslists@googlemail.com>
 <87muvw2qoo.fsf@dell.be.48ers.dk>
Message-ID: <CAGm1_ks11dzrm7_zwYwaJYTEgLqyZ48y6rtuZ1gNGzAjohdayw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 15, 2018 at 2:13 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:
>
>  > From: Yegor Yefremov <yegorslists@googlemail.com>
>  > Some packages don't provide source archive but only a wheel file. In
>  > this case download variable is not defined. So define this variable at
>  > the very beginning and check whether it is None after searching for
>  > source archives in the metadata.
>
>  > Bonus: fix PEP8 issue with wrong indentation.
>
>  > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>
> Committed, thanks.
>
> Out of interest, are you using python 2.x or 3.x? I just tried scanpypi
> for the validators module on my Debian (so python 2.7) laptop:
>
> ./utils/scanpypi validators
> spdx_lookup module is not installed. This can lead to an inaccurate licence detection. Please install it via
> pip install spdx_lookup
> buildroot package name for validators: python-validators
> Package: python-validators
> Fetching package validators
> Downloading package validators from https://files.pythonhosted.org/packages/45/7b/5b7b74208a3e0744d1a0efbfb1935fa46fa4cfe58d3d63f17c49c58c429c/validators-0.12.2.tar.gz...
> Added packages 'six, decorator' as dependencies of python-validators
> Checking if package ./package/python-validators already exists...
> Error: Package ./package/python-validators already exists
> Do you want to delete existing package ? [y/N]y
> Creating ./package/python-validators/python-validators.mk...
> Creating ./package/python-validators/python-validators.hash...
> Creating ./package/python-validators/Config.in...
> Traceback (most recent call last):
>   File "./utils/scanpypi", line 720, in <module>
>     main()
>   File "./utils/scanpypi", line 712, in main
>     package.create_config_in()
>   File "./utils/scanpypi", line 606, in create_config_in
>     config_file.writelines(lines)
> TypeError: writelines() argument must be a sequence of strings
>
> Printing out 'lines', it seems to be a mix of normal strings and unicode:
>
> lines: ['config BR2_PACKAGE_PYTHON_VALIDATORS\n', '\tbool "python-validators"\n', '\tselect BR2_PACKAGE_PYTHON_SIX # runtime\n', '\tselect BR2_PACKAGE_PYTHON_DECORATOR # runtime\n', '\thelp\n', u'\t  Python Data Validation for Humans\u2122.\n', '\n', u'\t  https://github.com/kvesteri/validators\n']

I'm still using Python 2 by default. In this case I think trademark
symbol is the problem. That's why it was important to use scanpypi
with Python 3.

Yegor
