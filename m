From: Steven Noonan <steven@uplinklabs.net>
Date: Sun, 8 Nov 2015 08:59:07 -0800
Subject: [Buildroot] [PATCH] protobuf: bump to 2.6.1
In-Reply-To: <CAKbGBLj5_4nQw+j=AAXWLNx8+OGYGUCrZuhpV3EFTCqYxSZe3g@mail.gmail.com>
References: <1446626241-25745-1-git-send-email-steven@uplinklabs.net>
 <20151108164905.27d41c84@free-electrons.com>
 <CAKbGBLj5_4nQw+j=AAXWLNx8+OGYGUCrZuhpV3EFTCqYxSZe3g@mail.gmail.com>
Message-ID: <CAKbGBLgXpMNaSOGgGg5nmLLdub=R44pDMWJNRGbMyErRz7NSoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 8, 2015 at 8:57 AM, Steven Noonan <steven@uplinklabs.net> wrote:
> On Sun, Nov 8, 2015 at 7:49 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Steven Noonan,
>
> You can just call me "Steven"...
>
>>
>> On Wed,  4 Nov 2015 00:37:21 -0800, Steven Noonan wrote:
>>> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
>>> ---
>>>  package/protobuf/protobuf.hash | 2 ++
>>>  package/protobuf/protobuf.mk   | 2 +-
>>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>>  create mode 100644 package/protobuf/protobuf.hash
>>
>> This is breaking the build of python-protobuf:
>> http://autobuild.buildroot.net/results/16e/16e8c41f3b6627ecee96fcf5ab3b22f1b7513ba4/build-end.log.
>>
>> The problem is that python-protobuf now has some additional
>> dependencies, which setuptools tries to download automatically. You
>> probably haven't seen this on your machine because it automatically
>> downloads the needed dependencies. It appears on the autobuilders
>> because https:// downloads fail.
>
> I just looked at this. Nasty. These "dependencies" are only needed at
> 'setup.py build' time, and not runtime. I have trouble believing it
> really needs these at all. Might be able to simply gut the build-time
> dependencies.

Pffbbbt.

It looks like it's probably as simple as:

diff --git a/python/setup.py b/python/setup.py
index 2450a77..6f6bffb 100755
--- a/python/setup.py
+++ b/python/setup.py
@@ -189,7 +189,6 @@ if __name__ == '__main__':
           'google.protobuf.text_format'],
         cmdclass = { 'clean': clean, 'build_py': build_py },
         install_requires = ['setuptools'],
-        setup_requires = ['google-apputils'],
         ext_modules = ext_module_list,
         url = 'https://developers.google.com/protocol-buffers/',
         maintainer = maintainer_email,


>> This should be fixed by:
>>
>>  1/ Ensuring that setuptools does not download dependencies
>>     automatically
>>
>>  2/ Packaging the appropriate python-protobuf dependencies.
>>
>> Thanks,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
