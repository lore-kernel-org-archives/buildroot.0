From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 14 Dec 2015 12:30:55 +0100
Subject: [Buildroot] [PATCH v4] python: rework *.pyc files generation
In-Reply-To: <CAHXCMMJOKia1N9wxf3z5se3k=2WsNWBz9gNR26p1EpA3i8BCJQ@mail.gmail.com>
References: <1447948334-8440-1-git-send-email-yegorslists@googlemail.com>
 <CAHXCMM+fZO0q-wTzwHMGK9cB5NWOJrh5Q_YNMU=G+dHM9OoHAQ@mail.gmail.com>
 <20151211233242.50a12f09@free-electrons.com>
 <CAHXCMMJOKia1N9wxf3z5se3k=2WsNWBz9gNR26p1EpA3i8BCJQ@mail.gmail.com>
Message-ID: <CAGm1_kuTj1HTYSADE122ApXXqr75JU2v27Qp5EFYjZmKQCJ6bg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 11, 2015 at 11:58 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> On Fri, Dec 11, 2015 at 11:32 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Samuel,
>>
>> On Fri, 11 Dec 2015 23:22:52 +0100, Samuel Martin wrote:
>>
>>> AFAI have tested, this change works as expected, except for broken
>>> python modules.
>>> In such cases, 'compileall.compile_dir(...)' does not raise any
>>> exceptions when it failed to compile the *.py file, leading to the
>>> unfortunate consequence: the *.pyc file is not generated and the *.py
>>> file is lost if BR2_PACKAGE_PYTHON_PYC_ONLY is enabled.
>>
>> Do you have some specific examples that exhibit this behavior?
> Do you mean some case where this happens and the trace it does?
>
> Here is a log exhibiting the kind of issue aforementioned [1] (got
> with this defconfig [2] on top of master + this patch)
> In this case, /usr/lib/python2.7/site-packages/_xmlplus/xpath/ParsedAbbreviatedRelativeLocationPath.py
> and /usr/lib/python2.7/site-packages/_xmlplus/xpath/ParsedAbbreviatedAbsoluteLocationPath.py
> cannot be compiled due to syntax error, so only their corresponding
> *.pyc are missing in the final target fs.
>
> [1] http://code.bulix.org/k3brrc-89950?raw
> [2] http://code.bulix.org/idvog6-89952?raw

I could reproduce the syntax error issue for pyxml package:

Compiling /home/YegorYefremov/MyProjects/oss/buildroot/testing/target/usr/lib/python2.7/site-packages/_xmlplus/xpath/ParsedAbbreviatedAbsoluteLocationPath.py
...
  File "/home/YegorYefremov/MyProjects/oss/buildroot/testing/target/usr/lib/python2.7/site-packages/_xmlplus/xpath/ParsedAbbreviatedAbsoluteLocationPath.py",
line 27
    as = ParsedAxisSpecifier.ParsedAxisSpecifier('descendant-or-self')
     ^
SyntaxError: invalid syntax

Compiling /home/YegorYefremov/MyProjects/oss/buildroot/testing/target/usr/lib/python2.7/site-packages/_xmlplus/xpath/ParsedAbbreviatedRelativeLocationPath.py
...
  File "/home/YegorYefremov/MyProjects/oss/buildroot/testing/target/usr/lib/python2.7/site-packages/_xmlplus/xpath/ParsedAbbreviatedRelativeLocationPath.py",
line 31
    as = ParsedAxisSpecifier.ParsedAxisSpecifier('descendant-or-self')
     ^
SyntaxError: invalid syntax

What should we do next? I'd suggest to commit this patch as is, add
Samuel's compiling error detection patch and a syntax fix patch for
pyxml. I'll try to hack it.

What do you think about it?

Yegor
