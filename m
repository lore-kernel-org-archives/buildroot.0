From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 16 Dec 2017 22:14:16 +0100
Subject: [Buildroot] [PATCH 2/4] python-cffi: always install target
 python-pycparser
In-Reply-To: <20171216163707.13cb65db@windsurf>
References: <20171213090424.11172-1-yegorslists@googlemail.com>
 <20171213090424.11172-2-yegorslists@googlemail.com>
 <20171216163707.13cb65db@windsurf>
Message-ID: <CAGm1_kuCr5a2uJsaHXuEjRY3yfqSbV_2mZn-xf6+W8nsyyp2tA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Dec 16, 2017 at 4:37 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 13 Dec 2017 10:04:22 +0100, yegorslists at googlemail.com wrote:
>
>> Some packages like python-crossbar, python-keyring use scripts,
>> that check dependencies of all involved packages at runtime. And
>> though cffi needs pycparser only in host variant during the bindings
>> compilation, it still has pycparser in its setup.py as dependency.
>
> It is not entirely clear to me what is happening here. Could you expand
> a bit on this?

Let's take python-cryptography, the package using CFFI. But we don't
install target pycparser. We can use python-cryptography. But for
example keyring has a script named "keyring". And even if you just
invoke it with "--help" parameter, it will complain, that you don't
have pycparser, because in setuptools "database" cffi package has
pycaprser in its install_requires field in setup.py.

Actually pycparser is a runtime dependency of cffi [1] and though it
is not really needed on target, we have a full moral right to select
this package. So I could just change the patch title to "add missing
runtime dependency".

[1] https://bitbucket.org/cffi/cffi/src/9b653b9a1c876ac94951b980d8dc0ce63dfd0a72/setup.py?at=default&fileviewer=file-view-default#setup.py-214

Yegor

>> So always installing pycparser along with cffi would create rather
>> little overhead, but we won't have to check whether particular
>> package has such a runtime script, that checks for dependencies.
>
> I understand what you mean, but I find the wording confusing. It feels
> as if you're saying that you're not going to do the change... that
> you're doing in this commit.
>
> What about:
>
> "Since adding pycparser as a dependency to python-cffi adds only very
> little overhead, we chose this solution as it avoids having to ..."
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
