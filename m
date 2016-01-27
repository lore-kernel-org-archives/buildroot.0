From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 27 Jan 2016 14:30:37 +0100
Subject: [Buildroot] [PATCH 1/2] scanpypi: new utility
In-Reply-To: <CAGm1_kskt8ME6ntMha8vn20LJDxLS2wF35uKiDcFN-u4jnpohg@mail.gmail.com>
References: <1438089330-18923-1-git-send-email-denis.thulin@openwide.fr>
 <20160110105950.GA3460@free.fr> <56927A92.50804@mind.be>
 <20160113162320.1c1dbbc3@free-electrons.com>
 <CAGm1_kskt8ME6ntMha8vn20LJDxLS2wF35uKiDcFN-u4jnpohg@mail.gmail.com>
Message-ID: <CAGm1_kuywkbBaNgg_u1XCxiP1Ax+ZV-04qgUZ+BSUQkw3sd=xQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 14, 2016 at 9:32 AM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Wed, Jan 13, 2016 at 4:23 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Arnout, Yann,
>>
>> On Sun, 10 Jan 2016 16:36:50 +0100, Arnout Vandecappelle wrote:
>>
>>> > So, we currently have scancpan to create perl packages. You are adding
>>> > scanpypi to create Python packages. There's also someone who submitted
>>> > a script to generate a 'generic' package (i.e. not perl/python) [0].
>>> > The scancpan is written in perl, yours and the generic one in Python.
>>> >
>>> > Besides Perl and Python, we also have nodejs which provides a similar
>>> > "package-store" and for which it would become interesting to provide a
>>> > helper script to generate packages [1].
>>> >
>>> > What I would love to see is that we have a single script to add
>>> > packages. Something like:
>>> >
>>> >     $ ./support/script/add-package -t TYPE [OPTS] PKG [PKG...]
>>> >
>>> > with TYPE being one of the package types we currently have (generic,
>>> > autotools... python, perl...) or an abstract type (nodejs...).
>>> >
>>> > Then, the cpan, pypi, nodejs... script would be just 'backends' that
>>> > would provide classes called by the main script, like;
>>> >
>>> >     pkg = new PythonPkg("foo")
>>> >     pkg.get_br_name()       returns the BR2_PACKAGE_ name
>>> >     pkg.get_version()       returns the _VERSION string
>>> >     pkg.get_source()        returns the _SOURCE string
>>> >     pkg.get_site()          returns the _SITE string
>>> >     pkg.get_method()        returns the _SITE_METHOD string
>>> >     pkg.get_dependencies()  returns the _DEPENDENCIES list
>>> >     ... and so on, you get the idea. ;-)
>>>
>>>  However, it is more natural for a CPAN-accessor to be written in perl. So I
>>> guess the backend scripts should be really independent scripts that report the
>>> package metadata in a specified format. Hm, you know what, let's use Config.in
>>> and pkg.mk as the specification!
>>>
>>>  In short, I'm not so convinced that having everything written in the same
>>> language is such an advantage.
>>>
>>>  But of course, if someone shows me the patches, I could change my mind.
>>
>> I also initially would have preferred to have the scancpan script
>> written in Python. But 1/ it's not very practical to query CPAN from
>> Python, and more importantly 2/ it's a bit weird to ask to a Perl
>> fan who maintains the Perl stuff in Buildroot to write something like
>> scancpan in Python.
>>
>> Bottom line, my opinion is that:
>>
>>  1/ We should keep scancpan in Perl
>>
>>  2/ We should keep scanpipy in Python, refine it and merge it.
>>
>>  3/ The script that generates just a generic package skeleton is a bit
>>     useless IMO and is not very useful to merge.
>>
>> Both scancpan and canpipy are really internal tools, for Buildroot
>> developers, so it's not super important if they don't look like /
>> behave the same.
>
> I gave scanpypi a try: http://patchwork.ozlabs.org/patch/567288/
>
> So far it was working as expected. Thanks for the very useful tool.

scanpypi has an issue with packages, that have a __main__ block like
this one https://github.com/hynek/characteristic

package.load_setup()

comes with

AttributeError: 'module' object has no attribute 'main'

@Denis: could you take a loot at it?

Thanks.

Yegor
