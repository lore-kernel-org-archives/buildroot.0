From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Fri, 14 Aug 2020 01:11:31 +0200
Subject: [Buildroot] [PATCH v2 1/5]
 support/scripts/gen-bootlin-toolchains: add new script to support Bootlin
 toolchains
In-Reply-To: <20200813220601.GN13263@scaer>
References: <20200809193818.1139805-1-thomas.petazzoni@bootlin.com>
 <20200809193818.1139805-2-thomas.petazzoni@bootlin.com>
 <20200813220601.GN13263@scaer>
Message-ID: <df65227a-376d-18e6-e4fe-51664fee4aff@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, Thomas and all,

On 14/08/20 00:06, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2020-08-09 21:38 +0200, Thomas Petazzoni spake thusly:
>> https://toolchains.bootlin.com/ has been providing for a few years a
>> number of ready-to-use pre-built toolchains, for a wide range of
>> architectures (which it turns out, are all built using Buildroot).
> [--SNIP--]
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> [--SNIP--]
>> diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
>> new file mode 100755
>> index 0000000000..a991797903
>> --- /dev/null
>> +++ b/support/scripts/gen-bootlin-toolchains
>> @@ -0,0 +1,475 @@
>> +#!/usr/bin/env python3
>> +
>> +import htmllistparse
> 
>      Traceback (most recent call last):
>        File "support/scripts/gen-bootlin-toolchains", line 3, in <module>
>          import htmllistparse
>      ModuleNotFoundError: No module named 'htmllistparse'
> 
> htmllistparse is not available on my distro (Ubuntu 19.10), and it is
> not even available in the latest LTS either (https://packages.ubuntu.com/htmllistparse)
> 
> Sometimes, it is not possible to install from PyPi (enterprise-grade
> machines barred from accessing Pypi for example).

That's something I did never think of. On the contrary, I was about to 
suggest to have a virtualenv+requirements.txt workflow [1][2], but this 
does not seem like an option given those constraints. </offtopic>

Maybe a good old regexp could do the trick for such a simple listing, 
and avoid this external dependency ? htmllistparse is only used in 
function get_toolchains, and we could replace it with:

url = os.path.join(BASE_URL, arch, "available_toolchains")
page = requests.get(url).text
fnames = sorted(re.findall(r'<td><a href="(\w[^"]+)"', page))

Titouan

[1] 
https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/#creating-a-virtual-environment
[2] 
https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/#using-requirements-files

> 
> Regards,
> Yann E. MORIN.
