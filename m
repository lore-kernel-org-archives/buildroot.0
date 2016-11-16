From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Wed, 16 Nov 2016 09:53:56 +0100
Subject: [Buildroot] [PATCH 1/1] host-python: Fix building with OpenSSL
 1.1.0.
In-Reply-To: <20161115180049.558f3183@free-electrons.com>
References: <20161115160240.30234-1-nicolas.cavallari@green-communications.fr>
 <20161115180049.558f3183@free-electrons.com>
Message-ID: <43b2e7d1-6366-3d98-89f1-d2ab7ca3db2c@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/11/2016 18:00, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 15 Nov 2016 17:02:40 +0100, Nicolas Cavallari wrote:
>> OpenSSL 1.1.0 now hides some internal structures and deprecate some
>> methods and constants.  This breaks the compilation of host-python
>> since it uses the system's openssl.  See
>> https://bugs.python.org/issue26470 for details.
>>
>> Even if buildroot patches host-python to not compile the 'ssl' module,
>> the '_ssl' module is still compiled and fails.  Another module,
>> '_hashlib' also uses openssl's hash algorithms and is also broken by the
>> bump to OpenSSL 1.1.0.
>>
>> if both '_ssl' and '_hashlib' are disabled, host-python compiles
>> but other packages are now broken, like the crda packages which
>> uses the hash functions.
> 
> Are you sure? Many of the autobuilder instances don't have the OpenSSL
> development files installed on the host, which means that OpenSSL
> support is not enabled in host-python, and crda would fail to build.

Python seems to have a fallback for hash algorithms if openssl cannot
be used. I failed to notice it since using DISABLED_MODULES='_ssl
_hashlib' does not enable it.

> I think that a better fix for this problem is to really disable OpenSSL
> in Python. Indeed, we shouldn't rely on the system-provided OpenSSL:
> OpenSSL has never been part of the Buildroot "core dependencies".

Will do that, even if the patch will be a bit intrusive in setup.py
